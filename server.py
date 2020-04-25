from flask import Flask, render_template, redirect, url_for, request, session, flash
from mysqlLib import MySQL_Conn
from pprint import pprint
from helperLib import convertDay, User
import os


app = Flask(__name__)

connection = MySQL_Conn.getInstance('healthkart', 'raghav', 'some_pass')
user = User()

@app.route('/login')
def home2():	#add
	if not session.get('logged_in'):
		return render_template('loginpage.html')
	else:
		uname = user.getName()

		if uname[0] == "P":
			# return render_template("path to patient dashboard")
			return patient_home()
			

		elif uname[0] == "E":
			if connection.connect():
				occp = connection.execute("select Occupation from employees \
					where EmployeeID = '%s'" %uname);

				print(occp, occp[0][0])

				if occp[0][0] == "D":
					return doctor_home()
					# return render_template("path to patient dashboard")
					# return "Proceed to doctor login " + str(user.getName())

				else:
					return "Dashboard not Ready!"

@app.route("/")
def homePage():
	return render_template("homepage.html")

@app.route("/signup", methods = ['GET', 'POST'])
def signup():
	return render_template("signup_page.html")

@app.route("/signupEntry", methods=['GET', 'POST'])
def signupCheck():
	import datetime

	name = request.form['name']
	gender = request.form['gender']
	dob = request.form['DOB']
	house = request.form['HouseNo']
	street = request.form['Street']
	city = request.form['city']
	district = request.form['District']
	state = request.form['State']
	pincode = request.form['Pincode']
	contactNo = request.form['contactNo']
	BloodGroup = request.form['BloodGroup']
	ptype = request.form['type']

	if datetime.datetime.strptime(dob, '%Y-%m-%d').date() > datetime.date.today():
		flash(f'Invalid DOB')
		return redirect(url_for('signup'))

	if len(pincode)!=6 or not pincode.isdigit():
		flash(f'Invalid Pincode')
		return redirect(url_for('signup'))

	if len(contactNo)!=10 or not contactNo.isdigit():
		flash(f'Invalid Phone Number')
		return redirect(url_for('signup'))

	if BloodGroup not in ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']:
		flash(f'Inavlid Blood Group')
		return redirect(url_for('signup'))

	if connection.connect():
		idCount = connection.execute("select count(1) from patients");
		idCount = idCount[0][0]

	id_int = str(idCount+1)
	pid = "P" + "0"*(4-len(id_int)) + id_int

	if connection.connect(): 
		query = "insert into patients values('%s', '%s', '%s', '%s', '%s', '%s', '%s', \
		'%s', '%s', '%s', '%s', '%s', '%s')" %(pid, name, house, street, city, state, \
			district, pincode, contactNo, BloodGroup, dob, gender, ptype)
		connection.execute(query, -1)
		flash(f'Signed up successfully! Patient ID is {pid}. Login to Continue', 'success')
		return redirect(url_for('home2'))

	return redirect(url_for('homepage'))



@app.route("/loginCheck", methods=['GET', 'POST'])
def login():

	username = request.form['username']
	password = request.form['password']
	# print(username, password)
	if connection.connect():
		rec = connection.execute("select count(1) from Logins\
		 where UserID = '%s' and Password = SHA2(\""'%s'"\", 256)" %(username, password))

	if rec[0][0] == 1:
		user.update(username)
		print(user.getName())
		session['logged_in'] = True
	else:
		flash(f'Invalid UserID or Password')
	return home2()



@app.route("/patient", methods=['GET', 'POST'])
def patient_home():
	patientID = user.getName()
	#Medical history - date, doc dep, doc name, rerks, tests, medicines
	history = [["date", "doc", "dep", "rerks", "meds", "tests"], ["date", "doc", "dep", "rerks", "meds", "tests"]]
	return render_template("patient_home.html", patientID = patientID, history = history)

@app.route("/patient/medicine_info", methods=['GET', 'POST'])
def patient_med_info():
	patientID = user.getName()
	meds = [['med name','salts','200'], ['med name','salts','200']] #name of med, salts, cost
	return render_template("medicine_info.html", patientID = patientID, medicines = meds)

@app.route("/patient/test_info", methods=['GET', 'POST'])
def patient_test_info():
	patientID = user.getName()
	tests = [['test name','desc','200'], ['test name','desc','200']] #name, desc, cost
	return render_template("test_info.html", patientID = patientID, tests = tests)

@app.route("/patient/test_reports")
def patient_test_reports():
	#Medical history - date, doc dep, doc name, rerks, tests, medicines
	#date, test_name, results, normal_result, normal/abnormal
	patientID = user.getName()
	test_reports = [['date', 'test_name', '1.3', '0.7-2.2', 'normal'], ['date', 'test_name', '1.3', '0.7-2.2', 'normal']]
	return render_template("test_reports.html", patientID = patientID, test_reports = test_reports)


@app.route("/patient/edit_profile", methods=['GET', 'POST'])
def patient_edit_profile():
	return render_template("index.html", patientID = patientID, patient_name = patient_name)

@app.route("/patient/book_appointment", methods=['GET', 'POST'])
def patient_book_appointment():
	patientID = user.getName()
	depts = ['dep1', 'dep2', 'dep3']
	return render_template("book_appointment.html", patientID = patientID, depts = depts)



#Change html for appointments
#check booked appoints - booked appointment list with cancel
@app.route("/patients/appointments/selectdept")
def selectdept():
	all_depts = []
	if connection.connect():
		depts = connection.execute("select DepartmentName from departments")
		for i in depts:
			all_depts.append(i[0])
	return render_template("appointmentdept.html", depts = all_depts)


@app.route("/patients/appointments/selectdoctor", methods = ['GET', 'POST'])
def selectdoctor():
	dept = request.form['submit_button']
	doctors = []
	if connection.connect():
		docs = connection.execute("select DoctorID, DoctorName from doctors where DepartmentName = '%s'" %dept)
		for i in docs:
			doctors.append(("Dr. " + i[1], i[0]))

	# print(doctors)
	return render_template("appointmentdoctor.html", doctors = doctors, dept = dept)


@app.route("/patients/appointments/getschedule", methods = ['GET', 'POST'])
def getschedule():
	import datetime
	appointment_details = request.form['submit_button']
	appointment_details = appointment_details.split(' ')
	dept = appointment_details[0]
	doctor = " ".join(appointment_details[1:-1])
	did = appointment_details[-1]

	cur_date = datetime.date.today()
	cur_day = cur_date.weekday()
	iter_date = cur_date
	iter_day = cur_day
	one_day = datetime.timedelta(days=1)
	count = cur_day
	days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]

	available_slots = []

	slot_dict = dict()

	if connection.connect():
		slots = connection.execute("select * from doctor_availability_chart where DoctorID = '%s'" %did)


	for i in slots:
		startT = (i[2].seconds)//60
		endT = (i[3].seconds)//60
		if i[1] in slot_dict:
			slot_dict[i[1]].append(tuple((startT, endT)))

		else:
			slot_dict[i[1]] = [tuple((startT, endT))]


	# pprint(slot_dict)

	while count <= 13:
		day_conv = convertDay(days[iter_day])

		if day_conv in slot_dict:
			button = []
			button.append(str(iter_date)+" "+days[iter_day])

			for t in slot_dict[day_conv]:
				# print(t)
				start_time = t[0]
				end_time = t[1]
				slots = (end_time - start_time)//20	#calculate from start and end dates

				appointments = connection.execute("select SlotNumber from appointments \
					where DoctorID = '%s' and VisitDate = '%s'" %(did, iter_date))
				appointments = [i[0] for i in appointments]
				
				for i in range(slots):
					if i not in appointments:
						sttime = start_time + 20*(i + 1)
						sttimeh = sttime//60
						sttimem = sttime%60
						amPm = "AM"
						sttimem = str(sttimem)
						if len(sttimem)<2:
							sttimem += "0"
						if sttimeh>12:
							sttimeh -= 12
							amPm = "PM"
						if sttimeh == 12:
							amPm = "PM"
						button.append(str(sttimeh) + ":" + sttimem + " " + amPm)
						
				available_slots.append(button)
		iter_date += one_day
		iter_day = iter_date.weekday()
		count += 1

	# print("SLOTS")
	# pprint(available_slots)

	return render_template("bookschedule.html", dept = dept, doctor = doctor, 
							dID = did, available_slots = available_slots)


#later = indented medicine tab


@app.route("/doctors")
def doctor_home():
	doctorID = user.getName()
	schedule = connection.execute("""select * from appointments where DoctorID = '""" + doctorID + """';""")
	for l in schedule:
		l = list(l)
		del l[2]
	return render_template("doctor_home.html", doctorID = doctorID, schedule = schedule)

@app.route("/doctors/week_schedule")
def doctor_schedule():
	doctorID = user.getName()
	schedule = connection.execute("""select * from appointments where DoctorID = '""" + doctorID + """';""")
	for l in schedule:
		l = list(l)
		del l[2]
	return render_template("doctor_schedule.html", doctorID = doctorID, schedule = schedule)
	# week

@app.route("/doctors/medicine_info")
def doc_med_info():
	doctorID = user.getName()
	return render_template("doctor_med_info.html", doctorID = doctorID)

@app.route("/doctors/showMed", methods = ['GET', 'POST'])
def doc_show_med():
	doctorID = user.getName()
	medicineName = request.form['MedicineName']
	meds = connection.execute("select * from medicines where medicinename = '" + medicineName + "';")
	for l in meds:
		l = [l[1], l[2], l[3], l[4]] #Name, Quantity Available, Expiry Date, Cost
	return render_template("doctor_show_med.html", doctorID = doctorID, medicines = meds)


@app.route("/doctors/test_info")
def doc_test_info():
	doctorID = user.getName()
	tests = connection.execute("select * from labtests;")
	for test in tests:
		test = list(test)
	return render_template("doctors_test_info.html", doctorID = doctorID, tests = tests)


@app.route("/doctors/check_patient_record")
def doc_check_record():
	doctorID = user.getName()
	return render_template("doctor_check_record.html", doctorID = doctorID)

@app.route("/doctors/show_patient", methods = ['GET', 'POST'])
def doc_show_record():
	"""
	patient name
	date
	doc name
	doc dept
	doc remarks
	"""
	doctorID = user.getName()
	patientName = request.form['PatientName']
	reports = connection.execute("select visits.visitid, visits.patientid,  visits.doctorid, visits.visitdate, visits.doctorremarks, medrecommended.medicinename, medrecommended.quantity  from visits inner join medrecommended on visits.visitid = medrecommended.visitid where visits.patientid = '" + patientName + "';")
	for report in reports:
		report = list(report)
	return render_template("doctor_show_patient.html", doctorID = doctorID, reports = reports)

@app.route("/doctors/patient_diagnose")
def doc_patient_diagnose():
	#form to fill in patient diagnose
	doctorID = user.getName()
	return render_template("doctor_diagnose.html", doctorID = doctorID)

@app.route("/doctors/patient_diagnose/submit", methods = ['GET', 'POST'])
def doc_submit_patient_diagnose():
	#form to fill in patient diagnose
	"""
	FLASK FORM Expiry date everyting etc etc
	patient id
	remarks
	meds
	tests
	"""
	entry = [request.form['Patient Name'], request.form['Remarks'], request.form['Medicine'], request.form['Test']]
	print(entry)
	#Store the entry in db
	return doc_patient_diagnose()

@app.route("/doctors/edit_profile")
def edit_profile():
	"""
	update address
	contact number
	change password
	"""
	doctorID = user.getName()
	return render_template("doctor_edit.html", doctorID = doctorID)

@app.route("/doctors/edit_profile/submit", methods = ['GET', 'POST'])
def submit_edit_profile():
	"""
	update address
	contact number
	change password
	"""
	entry = [request.form['Address'], request.form['PhoneNumber'], request.form['Password']]
	print(entry)
	return edit_profile()


# @app.route("/patients/bookedappointments/", methods = ['GET', 'POST'])
# def showAppointments():
# 	patientID = "P0001" #need to get from other page
# 	if (connection.connect()):
# 		rec = connection.execute("select DoctorID, VisitDate, VisitDay, SlotNumber ")
# 	return render_template("bookedAppointments.html", dept = dept, doctor = doctor, 
# 							dID = did, available_slots = available_slots)

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=True)

# PatientID | DoctorID | VisitDate  | VisitDay | SlotNumber