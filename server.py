from flask import Flask, render_template, redirect, url_for, request, session, flash
from mysqlLib import MySQL_Conn
from pprint import pprint
from helperLib import convertDay, User
import os
from flask_wtf import FlaskForm
from wtforms import Form, FieldList, FormField, IntegerField, StringField, SelectField, SubmitField


app = Flask(__name__)

connection = MySQL_Conn.getInstance('healthkart', 'root')

user = User()

@app.route('/login')
def home2():	#add
	if not session.get('logged_in'):
		return render_template('loginpage.html')
	else:
		uname = user.getName()

		if uname[0] == "P":
			if (connection.connect()):
				rec = connection.execute("select PatientName from patients where PatientID = '%s'" %(uname))
				user.updateusername(rec[0][0])
			return redirect(url_for('patient_home'))
			

		elif uname[0] == "E":
			if connection.connect():
				occp = connection.execute("select Name, Occupation from employees \
					where EmployeeID = '%s'" %uname);

				user.updateusername(occp[0][0])

				if occp[0][1] == "D":
					return doctor_home()

				elif occp[0][1] == "L":
					return redirect(url_for('labtech_home'))

				elif occp[0][1] == 'P':
					return pharmacist_show_meds()

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

	try:
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
	except:
		flash(f'All fields are mandatory. Put N/A if not applicable')
		return redirect(url_for('signup'))

	if datetime.datetime.strptime(dob, '%Y-%m-%d').date() > datetime.date.today():
		flash('Invalid DOB', 'error')
		return redirect(url_for('signup'))

	if len(pincode)!=6 or not pincode.isdigit():
		flash('Invalid Pincode', 'error')
		return redirect(url_for('signup'))

	if len(contactNo)!=10 or not contactNo.isdigit():
		flash('Invalid Phone Number', 'error')
		return redirect(url_for('signup'))

	if BloodGroup not in ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']:
		flash('Inavlid Blood Group', 'error')
		return redirect(url_for('signup'))

	if connection.connect():
		idCount = connection.execute("select Entries from metadata \
			where TableName = 'patients'");
		idCount = idCount[0][0]

	id_int = str(idCount+1)
	pid = "P" + "0"*(4-len(id_int)) + id_int

	if connection.connect(): 
		query1 = "insert into patients values('%s', '%s', '%s', '%s', '%s', '%s', '%s', \
		'%s', '%s', '%s', '%s', '%s', '%s')" %(pid, name, house, street, city, state, \
			district, pincode, contactNo, BloodGroup, dob, gender, ptype)
		query2 = "insert into logins value('%s', SHA2('%s', 256))" %(pid, "pass" + id_int)
		query3 = "update metadata set Entries = %d where TableName = 'patients'" %(idCount+1)
		connection.bulkModQueries([query1, query2, query3])
		flash(f'Signed up successfully! Patient ID is {pid}. Login to Continue', 'error')
		return redirect(url_for('home2'))

	return redirect(url_for('homepage'))



@app.route("/loginCheck", methods=['GET', 'POST'])
def login():

	username = request.form['username']
	password = request.form['password']
	# print(username, password)
	if connection.connect():
		rec = connection.execute("select count(1) from logins\
		 where UserID = '%s' and Password = SHA2(\""'%s'"\", 256)" %(username, password))

	if rec[0][0] == 1:
		user.update(username)
		# print(user.getName())
		session['logged_in'] = True
	else:
		flash('Invalid UserID or Password', 'error')
	return home2()

########################patients start ######################################################################################
@app.route("/patient")
def patient_home():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	import datetime
	patientID = user.getName()

	if connection.connect():

		rec = connection.execute("select visits.VisitDate, doctors.DoctorName, doctors.DepartmentName, \
		visits.DoctorRemarks, med.MedicineName, testsrecommended.Testname from visits \
		 join (select visitID, MedicineName from medrecommended) as med on visits.visitID = med.visitID \
		  join testsrecommended on visits.visitID = testsrecommended.visitID join doctors on \
		   visits.DoctorID = doctors.DoctorID  where PatientID = '%s' order by (VisitDate) desc" %(user.getName()))

	history = rec
	return render_template("patient_home.html", patientID = patientID, history = history, name = user.getusername())

@app.route("/patient/medicine_info")
def patient_med_info():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	patientID = user.getName()
	if connection.connect():
		meds = connection.execute("select MedicineName, SaltName, Cost from medicines join contains \
			on medicines.MedicineID = contains.MedicineID join salts on contains.SaltID = salts.SaltID \
			where ExpiryDate > curdate() and QuantityAvailable > 0")

	# meds = [['med name','salts','200'], ['med name','salts','200']] #name of med, salts, cost
	return render_template("medicine_info.html", patientID = patientID, medicines = meds, name = user.getusername())

@app.route("/patient/test_info")
def patient_test_info():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	patientID = user.getName()
	if connection.connect():
		tests = connection.execute("select TestName, TestDescription, TestCost from labtests")
	return render_template("test_info.html", patientID = patientID, tests = tests, name = user.getusername())

@app.route("/patient/test_reports")
def patient_test_reports():
	#Medical history - date, doc dep, doc name, rerks, tests, medicines
	#date, test_name, results, normal_result, normal/abnormal
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	patientID = user.getName()
	if connection.connect():
		test_rep = connection.execute("select v.VisitDate, test_reports.TestName, test_reports.TestResult,  \
		testnormalresults.RangeLow,testnormalresults.RangeHigh from test_reports join \
		(select visits.VisitID, visits.VisitDate,  visits.PatientID from visits) as v on \
		test_reports.VisitID = v.VisitID join testnormalresults  on test_reports.TestName = testnormalresults.TestName\
 		where  v.PatientID = '%s' and  testnormalresults.AgeLow <= (select age from patientage where \
 		patientage.PatientID = '%s') and  testnormalresults.AgeHigh >= (select age from patientage \
 		where patientage.PatientID = '%s') and  (testnormalresults.Gender = (select Gender from patients \
 		where patients.PatientID = '%s')  or testnormalresults.Gender = 'B') ORDER BY (v.VisitDate) DESC;" \
 		%(patientID, patientID, patientID, patientID))
		# print("quey")

	# print("hello!!")
	test_reports = []
	for i in range(len(test_rep)):
		temp = []
		for j in test_rep[i]:
			temp.append(j)
		test_reports.append(temp)
		if test_rep[i][-3]<=test_rep[i][-1] and test_rep[i][-3]>=test_rep[i][-2]:
			res = "Normal"
		else:
			res = "Abnormal"

		test_reports[i][-2] = str(test_rep[i][-2]) + "-" + str(test_rep[i][-1])
		test_reports[i][-1] = res
		
	return render_template("test_reports.html", patientID = patientID, test_reports = test_reports, name = user.getusername())


@app.route("/patient/edit_profile", methods=['GET', 'POST'])
def patient_edit_profile(message = None):
	
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	patientID = user.getName()
	profile_info = connection.execute("select * from patients where patientid = '" + patientID + "';")
	profile_info = profile_info[0]

	profile_info_ = []

	for i in profile_info:
		profile_info_.append(i)

	return render_template("patient_edit.html", patientID = patientID, \
		profile_info = profile_info_, name = user.getusername(), message = message)


@app.route("/patient/edit_profile/submit", methods = ['GET', 'POST'])
def patient_submit_edit_profile():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	patientID = user.getName()
	houseno = request.form['House No']
	street = request.form['Street']
	city = request.form['City']
	state = request.form['State']
	district = request.form['District']
	pincode = request.form['Pin Code']
	contactno = request.form['Contact Number']

	if connection.connect():
		connection.execute("UPDATE patients \
			SET houseno = '" + houseno + "', \
				street = '" + street + "', \
				city = '" + city + "', \
				state = '" + state + "', \
				district = '" + district + "', \
				pincode = '" + pincode + "', \
				contactnumber = '" + contactno + "' \
			WHERE patientid = '" + patientID + "' ;", -1)


	return patient_edit_profile("Changes saved")



@app.route("/patient/book_appointment", methods=['GET', 'POST'])
def patient_book_appointment():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	patientID = user.getName()
	all_depts = []
	if connection.connect():
		depts = connection.execute("select DepartmentName from departments")
		for i in depts:
			all_depts.append(i[0])
	return render_template("book_appointment.html", patientID = patientID, depts = all_depts, name = user.getusername())

@app.route("/patient/book_appointment_doctor", methods = ['GET', 'POST'])
def choosedoctor():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	if request.method != 'POST':
		return patient_book_appointment()
	dept = request.form['Department']
	doctors = []
	if connection.connect():
		docs = connection.execute("select DoctorID, DoctorName from doctors where DepartmentName = '%s'" %dept)
		for i in docs:
			doctors.append(("Dr. " + i[1], i[0]))
	return render_template("book_appointment_doctor.html", patientID = user.getName(), doctors = doctors, dept = dept, name = user.getusername())


@app.route("/patient/book_appointment_slot", methods = ['GET', 'POST'])
def book_slot():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	if request.method != 'POST':
		return patient_book_appointment()

	import datetime

	appointment_details = request.form['Doctor']
	# print(appointment_details)
	appointment_details = appointment_details.split(';')
	dept = appointment_details[1]
	doctor = appointment_details[0]
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

	# print(slots)
	for i in slots:
		startT = (i[2].seconds)//60
		endT = (i[3].seconds)//60
		if i[1] in slot_dict:
			slot_dict[i[1]].append(tuple((startT, endT)))

		else:
			slot_dict[i[1]] = [tuple((startT, endT))]

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

				# print(appointments)

				sttime = start_time
				for i in range(slots):
					# print(i+1, appointments, (i+1) not in appointments)
					if ( i + 1 ) not in appointments:
						sttimeh = sttime//60
						sttimem = sttime%60
						amPm = "AM"
						sttimem = str(sttimem)
						if len(sttimem) < 2:
							sttimem += "0"
						if sttimeh > 12:
							sttimeh -= 12
							amPm = "PM"
						if sttimeh == 12:
							amPm = "PM"
						button.append(str(sttimeh) + ":" + sttimem + " " + amPm)
					sttime = start_time + 20*(i + 1)

				available_slots.append(button)

		iter_date += one_day
		iter_day = iter_date.weekday()
		count += 1

	return render_template("book_appointment_slot.html", dept = dept, doctor = doctor, 
							dID = did, available_slots = available_slots, patientID = user.getName(), name = user.getusername())



@app.route("/patient/slot_booked", methods = ['GET', 'POST'])
def slot_booked():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	import datetime

	if request.method != 'POST':
		return patient_book_appointment()

	doc_day_slot = (request.form["slot_booked"]).split(';')
	dID = doc_day_slot[0]
	doctor = doc_day_slot[1]
	day = doc_day_slot[2].split(" ")
	date = day[0]
	day = day[-1]
	convDay = convertDay(day)
	slot = doc_day_slot[3]

	if connection.connect():
		start_time = connection.execute("select StartTime from doctor_availability_chart where\
		 DoctorID = '%s' and Day = '%s'" %(dID, convDay))
		start_time = start_time[0][0].seconds

		start_time_m = start_time//60
		temp_time = slot.split(" ")
		temp_time_t = temp_time[0].split(":")
		time_h = int(temp_time_t[0])
		time_min = int(temp_time_t[1])

		total = time_h*60 + time_min

		# print(start_time_m, total)
		if temp_time[-1] == "PM" and time_h != 12:
			total += 720

		slot_num = (total-start_time_m)//20 + 1

		cnt = connection.execute("select entries from metadata where TableName ='appointments'")
		cnt = cnt[0][0]
		cnt += 1
		cnt_ = cnt
		cnt = str(cnt)

		query1 = "insert into appointments values ('%s', '%s', '%s', '%s', '%s', %d)" \
			%(cnt, user.getName(), dID, date, convDay, slot_num)

		query2 = "update metadata set Entries = %d where TableName = 'appointments'" %(cnt_)
		connection.bulkModQueries([query1, query2])


	return render_template("slot_booked.html", doctor = doctor, day = doc_day_slot[2],\
	 slot = slot, patientID = user.getName(), name = user.getusername())



@app.route("/patient/confirmed_appointment")
def confirmed_appointment():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	import datetime

	cur_date = datetime.date.today()

	if (connection.connect()):

		appointments = connection.execute("select VisitDate, d.DoctorName, SlotNumber from appointments join \
			 (select DoctorID, DoctorName from doctors) as d on d.doctorID = appointments.DoctorID where \
			  PatientID = '%s' and VisitDate >= '%s' order by \
			VisitDate" %(user.getName(), cur_date))

	return render_template("confirmed_appointments.html", appointments = appointments, \
		patientID = user.getName(), name = user.getusername())

#Change html for appointments
#check booked appoints - booked appointment list with cancel

#later = indented medicine tab

########################patients start ######################################################################################

########################doctors start ######################################################################################

@app.route("/doctors")
def doctor_home():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	import datetime

	doctorID = user.getName()

	cur_date = datetime.date.today()
	# cur_date = "2020-01-31"

	if connection.connect():

		schedule = connection.execute("select p.PatientID, p.PatientName, SlotNumber from \
			appointments join (select PatientID, PatientName from patients) as p \
			 on appointments.PatientID = p.PatientID where VisitDate \
			= '%s' and DoctorID = '%s';" %(cur_date, doctorID)) 

	schedule.sort(key = lambda x: x[2])

	return render_template("doctor_home.html", doctorID = doctorID, schedule = schedule, name = user.getusername())

@app.route("/doctors/week_schedule")
def doctor_schedule():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	import datetime

	doctorID = user.getName()

	cur_date = datetime.date.today()
	# cur_date = "2020-01-31"

	if connection.connect():

		schedule = connection.execute("select VisitDate, patients.PatientID, PatientName, SlotNumber from \
			appointments join patients on appointments.PatientID = patients.PatientID where VisitDate \
			>= '%s' and DoctorID = '%s';" %(cur_date, doctorID)) 
	
	schedule.sort(key = lambda x: (x[0], x[3]))

	return render_template("doctor_schedule.html", doctorID = doctorID, schedule = schedule, name = user.getusername())
	# week

@app.route("/doctors/medicine_info")
def doc_med_info():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	doctorID = user.getName()

	if connection.connect():
		medicines = connection.execute("select MedicineID, MedicineName from medicines")
		salts = connection.execute("select SaltID, SaltName from salts")

	medicines.sort(key = lambda x: x[1])

	medicines = [(0, "None")] + medicines

	salts = [(0, "None")] + salts

	return render_template("doctor_med_info.html", doctorID = doctorID, med = medicines, salts = salts, name = user.getusername())

@app.route("/doctors/showMed", methods = ['GET', 'POST'])
def doc_show_med():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	doctorID = user.getName()

	submitVal = request.form['submit']

	if submitVal == "Search":
		meds = request.form['MedicineName1']
		meds = meds.split(";")
		mid = meds[0]
		mname = meds[1]

		if connection.connect():
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where medicines.MedicineID = '%s' and \
				ExpiryDate > curdate() and QuantityAvailable > 0" %(mid))

	elif submitVal == "Search Similar":
		medicineName = request.form['MedicineName']

		if (connection.connect()):
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where medicines.MedicineName like ('%%%s%%') \
				and ExpiryDate > curdate() and QuantityAvailable > 0" %(medicineName))

	elif submitVal == "Search Salt":
		salts = request.form['Salt1'].split(";")

		sid = salts[0]
		sname = salts[1]

		if (connection.connect()):
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where salts.SaltID = '%s' and ExpiryDate > curdate() \
				and QuantityAvailable > 0"
				 %(sid))



	elif submitVal == "Search Similar Salts":
		sname = request.form['SaltName']

		meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where salts.SaltName like ('%%%s%%') and \
				 ExpiryDate > curdate() and QuantityAvailable > 0" %(sname))

	meds.sort()

	return render_template("doctor_show_med.html", doctorID = doctorID, medicines = meds, name = user.getusername())


@app.route("/doctors/test_info")
def doc_test_info():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	doctorID = user.getName()
	tests = connection.execute("select * from labtests")
	for test in tests:
		test = list(test)
	return render_template("doctors_test_info.html", doctorID = doctorID, tests = tests, name = user.getusername())


@app.route("/doctors/check_patient_record")
def doc_check_record():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	doctorID = user.getName()
	return render_template("doctor_check_record.html", doctorID = doctorID, name = user.getusername())

@app.route("/doctors/show_patient", methods = ['GET', 'POST'])
def doc_show_record():

	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	doctorID = user.getName()

	submitVal = request.form['Submit']

	if (connection.connect()):
		patientName = request.form['PatientID']
		reports = connection.execute("select doctors.DoctorName, doctors.DepartmentName, \
		 visits.visitdate, visits.doctorremarks, medrecommended.medicinename,\
		 medrecommended.quantity  from visits inner join medrecommended on \
		 visits.visitid = medrecommended.visitid  join doctors on \
		 visits.doctorID = doctors.doctorID where visits.patientid = '" + patientName + "' \
		 order by (visits.visitdate)")

	return render_template("doctor_show_patient.html", doctorID = doctorID, reports = reports, name = user.getusername())

@app.route("/doctors/patient_diagnose", methods = ['GET', 'POST'])
def doc_patient_diagnose():
	medlist = [('mid1','zantc'), ('mid2','ranitidine')] #has to be input from sql database
	testlist = [('tid1','test1'), ('tid2','test2')]
	# if session['logged_in'] == False:
	# 	return redirect(url_for('home2'))

	class MedForm(Form):
		medicine_name = SelectField(u'Medicine', choices=medlist)
		quantity = IntegerField('Quantity')

	class TestForm(Form):
		test_name = SelectField(u'Test', choices = testlist)
		quantity = IntegerField('Quantity')


	class MainForm(FlaskForm):
		meds_test = FieldList(
			FormField(MedForm),
			FormField(TestForm),
			min_entries=1,
			max_entries=30
		)

	form = MainForm()
	if form.validate_on_submit():
		inp = []
		entry = [request.form['Patient Name'], request.form['Remarks']]
		print(entry)
		print(form.meds.data)
		for med in form.meds.data:
			# print(med)
			newinp = med

	doctorID = user.getName()
	return render_template("doctor_diagnose.html", doctorID = doctorID, name = user.getusername(), form = form, medlist = medlist)

@app.route("/doctors/patient_diagnose/submit", methods = ['GET', 'POST'])
def doc_submit_patient_diagnose():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
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
def edit_profile(message = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	doctorID = user.getName()
	profile_info = connection.execute("select * from employees where employeeid = '" + doctorID + "';")
	profile_info = profile_info[0]
	return render_template("doctor_edit.html", doctorID = doctorID, profile_info = profile_info, name = user.getusername(), message = message)

@app.route("/doctors/edit_profile/submit", methods = ['GET', 'POST'])
def submit_edit_profile():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	doctorid = user.getName()

	occupation = request.form['Occupation']
	houseno = request.form['House No']
	street = request.form['Street']
	city = request.form['City']
	state = request.form['State']
	district = request.form['District']
	pincode = request.form['Pin Code']
	contactno = request.form['Contact Number']

	if connection.connect():
		connection.execute("UPDATE employees \
			SET occupation = '" + occupation + "', \
				houseno = '" + houseno + "', \
				street = '" + street + "', \
				city = '" + city + "', \
				state = '" + state + "', \
				district = '" + district + "', \
				pincode = '" + pincode + "', \
				contactnumber = '" + contactno + "' \
			WHERE employeeid = '" + doctorid + "' ;", -1)

	return edit_profile("Changes saved")

@app.route("/signout")
def signout():
	session['logged_in'] = False
	return redirect(url_for('homePage'))

########################doctor ends ######################################################################################

##############################################################		ADMIN STARTS #########################################################

@app.route("/admin")
def admin_home(): #dispensary analysis
	#Medicine recommended quantity wise bar chart
	#Most recommended test bar chart
	#appointments made with different doctors bar chart
	#datawise window
	return render_template("admin_home.html")

@app.route("/admin/add_employee", methods = ['GET', 'POST'])
def signup_employee(message = None):
	if message != None:
		flash(f"Signed up successfully!")
	return render_template("signup_employee.html")

@app.route("/admin/add_employee_check", methods=['GET', 'POST'])
def signupCheck_employee():
	import datetime

	name = request.form['name']
	gender = request.form['gender']
	occupation = request.form['occupation']
	joiningdate = request.form['Joining_date']
	house = request.form['HouseNo']
	street = request.form['Street']
	city = request.form['city']
	district = request.form['District']
	state = request.form['State']
	pincode = request.form['Pincode']
	contactNo = request.form['contactNo']
	salary = request.form['Salary']

	if datetime.datetime.strptime(joiningdate, '%Y-%m-%d').date() > datetime.date.today():
		flash(f'Invalid Date of joining')
		return redirect(url_for('signup_employee'))

	if len(pincode)!=6 or not pincode.isdigit():
		flash(f'Invalid Pincode')
		return redirect(url_for('signup_employee'))

	if len(contactNo)!=10 or not contactNo.isdigit():
		flash(f'Invalid Phone Number')
		return redirect(url_for('signup_employee'))

	if connection.connect():
		idCount = connection.execute("select entries from metadata where TableName ='employees' ")
		idCount = idCount[0][0]

	id_int = str(idCount+1)
	pid = "E" + "0"*(4-len(id_int)) + id_int
	print(id_int)

	if connection.connect():
		query = "update metadata set entries = '%d' where TableName = '%s' " %(idCount + 1, 'employees')
		connection.execute(query, -1) 
		query = "insert into employees values('%s', '%s', '%s', '%s', '%s', '%s', '%s', \
		'%s', '%s', '%s', '%s', '%s', '%s')" %(pid, name, gender, occupation, joiningdate, house, street, city, state, \
			district, pincode, contactNo, salary)
		connection.execute(query, -1)
		connection.execute("insert into logins value('%s', SHA2('%s', 256))" %(pid, "pass" + id_int), -1)
		flash(f'Signed up successfully! Employee ID is {pid}. Login to Continue', 'success')
		# if occupation == 'N':
		# 	all_depts = []
		# 	if connection.connect():
		# 		depts = connection.execute("select DepartmentName from departments")
		# 		for i in depts:
		# 			all_depts.append(i[0])
		# 	return render_template("signup_employee_doctor.html", eid = pid, name = name, depts = depts)
		if occupation == 'D':
			all_depts = []
			if connection.connect():
				depts = connection.execute("select DepartmentName from departments")
				for i in depts:
					all_depts.append(i[0])
			return render_template("signup_employee_doctor.html", eid = pid, name = name, depts = all_depts)

		return redirect(url_for('home2'))

	return redirect(url_for('homepage'))

@app.route("/admin/signup_employee_doctor", methods = ['GET', 'POST'])
def signup_employee_doctor():
	eid = request.form['eid']
	print("Eid is ", eid)
	name = request.form['name']
	dept_name = request.form['Department']
	room_no = int(request.form['room_no'])
	if connection.connect():
		query = "insert into doctors values('%s', '%s', '%s', '%d')" %(eid, name, dept_name, room_no)
		connection.execute(query, -1)
	return signup_employee("Doctor signed up successfully")

@app.route("/admin/signup_employee_nurse", methods = ['GET', 'POST'])
def signup_employee_nurse():
	eid = request.form['eid']
	name = request.form['name']
	dept_name = request.form['dept_name']
	if connection.connect():
		query = "insert into nurses values('%s', '%s', '%s')" %(eid, name, dept_name)
		connection.execute(query, -1)
	return signup_employee("Nurse signed up successfully")


#############################################################	ADMIN ENDS ############################################################################


@app.route("/labtech")
def labtech_home():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	if connection.connect():
		tests = connection.execute("select TestName, TestDescription, TestCost from \
			labtests where TechnicianID = '%s'" %(user.getName()))
	
	return render_template("labtech_home.html", labtechID = user.getName(), \
		name = user.getusername(), tests = tests)

@app.route("/labtech/test_report")
def labtech_test_report():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	if connection.connect():
		tests = connection.execute("select VisitDate, p.PatientName, \
		patientage.age, test_reports.TestName, TestResult from test_reports join (select Testname, TechnicianID from \
			labtests where TechnicianID = '%s') as lt on\
		 test_reports.TestName = lt.TestName join (select VisitID, PatientID, VisitDate from visits) as v \
		  on v.VisitID = test_reports.VisitID \
		 join (select PatientID, PatientName from patients) as p on p.PatientID = v.PatientID join patientage on \
		 p.PatientID = patientage.PatientID order by (VisitDate) desc" %(user.getName()))

	return render_template("labtech_test_report.html", labtechID = user.getName(), name = user.getusername(), tests = tests)

@app.route("/labtech/test_info")
def labtech_test_info():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	if connection.connect():
		tests = connection.execute('select testname from labtests')
	
	return render_template("labtech_test_info.html", labtechID = user.getName(), name = user.getusername(), tests = tests)

@app.route("/labtech/show_test", methods = ['GET', 'POST'])
def labtech_show_test():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	testname = request.form['TestName']

	if connection.connect():
		test_info = connection.execute("select * from labtests where testname = '" + testname + "';")
		test_results = connection.execute("select * from testnormalresults where testname = '" + testname + "'")
	
	return render_template("labtech_show_test.html", labtechID = user.getName(), name = user.getusername(), test_info = test_info[0], test_results = test_results)


@app.route("/labtech/patient_record")
def labtech_patient_record():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	return render_template("labtech_patient_record.html", labtechID = user.getName(), name = user.getusername())

@app.route("/labtech/show_patient", methods = ['GET', 'POST'])
def labtech_show_patient():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	if (connection.connect()):
		patientName = request.form['PatientID']
		reports = connection.execute("select doctors.DoctorName, doctors.DepartmentName, \
		 visits.visitdate, visits.doctorremarks, medrecommended.medicinename,\
		 medrecommended.quantity  from visits inner join medrecommended on \
		 visits.visitid = medrecommended.visitid  join doctors on \
		 visits.doctorID = doctors.doctorID where visits.patientid = '" + patientName + "' \
		 order by (visits.visitdate) desc")

	return render_template("labtech_show_patient.html", labtechID = user.getName(), name = user.getusername(), reports = reports)


@app.route("/labtech/publish_report")
def labtech_publish_report(message = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	if connection.connect():
		labtechID = user.getName()
		tests = connection.execute("select testname from labtests where technicianid ='" + labtechID + "'")

	return render_template("labtech_publish_report.html", labtechID = user.getName(), name = user.getusername(), tests = tests, message = message)

@app.route("/labtech/submit_report", methods = ['GET', 'POST'])
def labtech_submit_report():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	if connection.connect():
		visitid = request.form['visitid']
		test = request.form['test']
		result = request.form['testresult']
		connection.execute("insert into test_reports values ('" + visitid + "', '" + test + "', '" + result + "')", -1)

	return labtech_publish_report(message="Report Submitted")


@app.route("/labtech/edit_profile")
def labtech_edit_profile(message = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	labtechID = user.getName()
	profile_info = connection.execute("select * from employees where employeeid = '" + labtechID + "';")
	profile_info = profile_info[0]

	return render_template("labtech_edit_profile.html", labtechID = user.getName(), name = user.getusername(), profile_info = profile_info, message = message)

@app.route("/labtech/edit_profile/submit", methods = ['GET', 'POST'])
def labtech_submit_edit_profile():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	labtechid = user.getName()

	occupation = request.form['Occupation']
	houseno = request.form['House No']
	street = request.form['Street']
	city = request.form['City']
	state = request.form['State']
	district = request.form['District']
	pincode = request.form['Pin Code']
	contactno = request.form['Contact Number']
	
	if connection.connect():
		connection.execute("UPDATE employees \
			SET occupation = '" + occupation + "', \
				houseno = '" + houseno + "', \
				street = '" + street + "', \
				city = '" + city + "', \
				state = '" + state + "', \
				district = '" + district + "', \
				pincode = '" + pincode + "', \
				contactnumber = '" + contactno + "' \
			WHERE employeeid = '" + labtechid + "' ;", -1)

	return edit_profile("Changes saved")


##################################################################	Pharmacist #########################################a#######################################




@app.route("/pharmacist/show_med")
def pharmacist_show_meds():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	eid = user.getName()

	import datetime
	cur_date = datetime.date.today()
	if connection.connect():
		med_rec = connection.execute("select MedicineName, SaltName, Composition, \
			QuantityAvailable, ExpiryDate, Cost from medicines join contains on medicines.MedicineID \
			= contains.MedicineID join salts on salts.SaltID = contains.SaltID")

	meds = []
	for i in med_rec:
		temp = []
		for j in i:
			temp.append(j)

		if temp[4] <= cur_date:
			temp.append("Expired")
		else:
			temp.append("Not Expired")
		meds.append(temp)

	return render_template("/pharmacist/all_meds.html", eid = eid, medicines = meds, name = user.getusername())


@app.route("/pharmacist/medicine_info")
def pharmacist_med_info(message = []):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	eid = user.getName()

	if connection.connect():
		medicines = connection.execute("select MedicineID, MedicineName from medicines")
		salts = connection.execute("select SaltID, SaltName from salts")

	medicines.sort(key = lambda x: x[1])

	medicines = [(0, "None")] + medicines

	salts = [(0, "None")] + salts

	return render_template("/pharmacist/med_info.html", eid = eid, med = medicines, salts = salts, name = user.getusername(), message = message)


@app.route("/pharmacist/showMed", methods = ['GET', 'POST'])
def pharmacist_search_meds():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	import datetime
	cur_date = datetime.date.today()
	
	eid = user.getName()

	submitVal = request.form['submit']

	if submitVal == "Search":
		meds = request.form['MedicineName1']
		meds = meds.split(";")
		mid = meds[0]
		mname = meds[1]

		if connection.connect():
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where medicines.MedicineID = '%s'" %(mid))

	elif submitVal == "Search Similar":
		medicineName = request.form['MedicineName']

		if (connection.connect()):
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where medicines.MedicineName like ('%%%s%%')" %(medicineName))

	elif submitVal == "Search Salt":
		salts = request.form['Salt1'].split(";")

		sid = salts[0]
		sname = salts[1]

		if (connection.connect()):
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where salts.SaltID = '%s'" %(sid))



	elif submitVal == "Search Similar Salts":
		sname = request.form['SaltName']

		meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where salts.SaltName like ('%%%s%%')" %(sname))

	expired_med = []
	not_expired = []

	for i in meds:
		if i[3] < cur_date:
			expired_med.append(i)
		else:
			not_expired.append(i)

	# expired_med = [['medname', 'saltname', 'quantity', 'expiry', 'cost', 'Composition', 'medid'], ['medname', 'saltname', 'quantity', 'expiry', 'cost', 'Composition', 'medid2']]		#Get this explicitly
	return render_template("/pharmacist/show_med.html", eid = eid, expired_med = expired_med, \
		not_expired = not_expired, name = user.getusername())

@app.route("/pharmacist/deleted_med", methods = ['GET', 'POST'])
def deleted_med():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	deleted =  request.form.getlist('deleted')		#delete the medicines, Medicine Id's will be returned

	if connection.connect():
		queries = []
		for i in deleted:
			queries.append("delete from contains where MedicineID = '%s'" %(i))
			queries.append("delete from medicines where MedicineID = '%s'" %(i))

		connection.bulkModQueries(queries)

	return pharmacist_med_info(deleted)

@app.route("/pharmacist/select_dispatch")
def select_dispatch(message = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	eid = user.getName()

	if connection.connect():
		medicines = connection.execute("select MedicineID, MedicineName from medicines")
		salts = connection.execute("select SaltID, SaltName from salts")

	medicines.sort(key = lambda x: x[1])

	medicines = [(0, "None")] + medicines

	salts = [(0, "None")] + salts

	return render_template("/pharmacist/select_dispatch.html", eid = eid, med = medicines, salts = salts, name = user.getusername(), message = message)

@app.route("/pharmacist/dispatch_med", methods = ['GET', 'POST'])
def dispatch_med():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	eid = user.getName()

	submitVal = request.form['submit']

	if submitVal == "Search":
		meds = request.form['MedicineName1']
		meds = meds.split(";")
		mid = meds[0]
		mname = meds[1]

		if connection.connect():
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where medicines.MedicineID = '%s' and \
				ExpiryDate > curdate()" %(mid))

	elif submitVal == "Search Similar":
		medicineName = request.form['MedicineName']

		if (connection.connect()):
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where medicines.MedicineName like ('%%%s%%') \
				and ExpiryDate > curdate()" %(medicineName))

	elif submitVal == "Search Salt":
		salts = request.form['Salt1'].split(";")

		sid = salts[0]
		sname = salts[1]

		if (connection.connect()):
			meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where salts.SaltID = '%s' and ExpiryDate > curdate()"
				 %(sid))



	elif submitVal == "Search Similar Salts":
		sname = request.form['SaltName']

		meds = connection.execute("select MedicineName, SaltName, QuantityAvailable, ExpiryDate, Cost, \
				Composition, medicines.MedicineID  from medicines join contains on medicines.MedicineID = contains.MedicineID \
				join salts on salts.SaltID = contains.SaltID where salts.SaltName like ('%%%s%%') and \
				 ExpiryDate > curdate()" %(sname))

	meds.sort()
	return render_template("/pharmacist/dispatch_med.html", eid = eid, meds = meds, name = user.getusername())

@app.route("/pharmacist/dispatched", methods = ['GET', 'POST'])
def dispatched():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	patientID = request.form.get('patientID')			
	indented = request.form.getlist('Quantity')
	dispach = {}
	for x in indented:
		y = x.split(';')
		if int(y[1]) != 0:
			dispach[y[0]] = [int(y[1]), int(y[2])]
	# print(dispach)					#remove the deleted messages from database

	if connection.connect():
		queries = []

		for i in dispach:
			new = dispach[i][1] - dispach[i][0]
			dispach[i][1] = new
			queries.append("update medicines set QuantityAvailable = %d where MedicineID = '%s'" %(new, i))

		connection.bulkModQueries(queries)

	message = [patientID, dispach]
	return select_dispatch(message);

@app.route("/pharmacist/add_medicine")
def add_medicine(message = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	if connection.connect():
		companies = connection.execute("select CompanyID, Name from pharmaceutical_companies")

	return render_template("/pharmacist/add_medicines.html",  eid = user.getName(), name = user.getusername(), companies = companies, message = message)

@app.route("/pharmacist/added_medicine", methods = ['GET', 'POST'])
def added_medicine():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	name = request.form.get('name')
	salts = request.form.get('Saltname').split(";")
	salt_quant = list(map(int, request.form.get('Saltquantity').split(";")))
	quantity = int(request.form.get('quantity'))
	expiry_date = request.form.get('expiry')
	company = request.form.get('company').split(";")[0]
	cost = int(request.form.get('cost'))
	added_med = [name] + salts +  [str(quantity), str(expiry_date), str(company)]

	if connection.connect():
		not_found = []
		for i in salts:
			res = connection.execute("select * from salts where SaltName = '%s'" %(i))
			if len(res) == 0:
				not_found.append(i)

		if len(not_found)!=0:
			saltID = connection.execute("select Entries from metadata where TableName = 'salts'")
			saltID = saltID[0][0]

			queries = []

			for i in not_found:
				saltID += 1
				sid = "S" + "0"*(4 - len(str(saltID))) + str(saltID)
				queries.append("insert into salts values ('%s','%s')" %(sid, i))
				

			queries.append("update metadata set Entries = %d where TableName = 'salts'" %(saltID))

			connection.bulkModQueries(queries)

		mid = connection.execute("select Entries from metadata where TableName = 'medicines'")

		mid = mid[0][0] + 1

		mid_ = "M" + "0"*(9 - len(str(mid))) + str(mid)

		query_1 = "insert into medicines values ('%s', '%s', %d, '%s', %d, '%s')" %(mid_, name, quantity, \
			expiry_date, cost, company)
		query_2 = "update metadata set Entries = %d where TableName = 'medicines'" %(mid)

		connection.bulkModQueries([query_1, query_2])

		query_set = []

		res = connection.execute("select * from salts")
		salt_dict = {}

		for i in res:
			salt_dict[i[1]] = i[0]
		print(salt_dict)

		for i in range(len(salts)):
			query_set.append("insert into contains values ('%s', '%s', %d)" %(mid_, salt_dict[salts[i]], salt_quant[i]))

		connection.bulkModQueries(query_set)


	return add_medicine(added_med)


@app.route("/pharmacist/all_companies")
def all_companies(message1 = None, message2 = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	if connection.connect():
		companies = connection.execute("select * from pharmaceutical_companies")

	return render_template("/pharmacist/all_companies.html", eid = user.getName(), name = user.getusername(), companies = companies, message1 = message1, message2 = message2)

@app.route("/pharmacist/added_company", methods = ['GET', 'POST'])
def add_company():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	name = request.form.get("name")
	phone = request.form.get("phone").split("-")
	phone = "".join(phone)

	if connection.connect():
		companyId = connection.execute("select count(1) from pharmaceutical_companies")
		companyId = companyId[0][0] + 1

		companyId = "C" + "0" * (4 - len(str(companyId))) + str(companyId)
		added = [companyId, name, phone] 	#add to sql

		connection.execute("insert into pharmaceutical_companies values ('%s', '%s', '%s')" %(companyId, name, phone), -1)

	return all_companies(added, None)

@app.route("/pharmacist/edited_company", methods = ['GET', 'POST'])
def edit_company():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
		
	id_name = request.form.get("name").split(';')
	companyId = id_name[0]
	name = id_name[1]
	phone = request.form.get("phone").split("-")
	phone = "".join(phone)
	edited = [companyId, name, phone]

	if connection.connect():
		connection.execute("update pharmaceutical_companies set Contact_Number = '%s'\
		 where CompanyID = '%s'" %(phone, companyId), -1)

	return all_companies(None, edited)

@app.route("/pharmacist/edit_profile")
def pharma_edit_profile(message = None):
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	eid = user.getName()
	if connection.connect():
		profile_info = connection.execute("select * from employees where employeeid = '" + str(eid) + "';")
		profile_info = profile_info[0]
	return render_template("/pharmacist/pharma_edit.html", eid = eid, profile_info = profile_info, name = user.getusername(), message = message)

@app.route("/pharmacist/pharma_edit_profile/submit", methods = ['GET', 'POST'])
def pharma_submit_edit_profile():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))

	eid = user.getName()

	# employeeId = request.form['Employee ID']
	# name = request.form['Name']
	# gender = request.form['Gender']
	occupation = request.form['Occupation']
	# jdate = request.form['Joining Date']
	houseno = request.form['House No']
	street = request.form['Street']
	city = request.form['City']
	state = request.form['State']
	district = request.form['District']
	pincode = request.form['Pin Code']
	contactno = request.form['Contact Number']
	# salary = request.form['Salary']

	print("UPDATE employees \
			SET occupation = '" + occupation + "', \
				houseno = '" + houseno + "', \
				street = '" + street + "', \
				city = '" + city + "', \
				state = '" + state + "', \
				district = '" + district + "', \
				pincode = '" + pincode + "', \
				contactnumber = '" + contactno + "' \
			WHERE employeeid = '" + eid + "' ;")

	if connection.connect():
		connection.execute("UPDATE employees \
			SET occupation = '" + occupation + "', \
				houseno = '" + houseno + "', \
				street = '" + street + "', \
				city = '" + city + "', \
				state = '" + state + "', \
				district = '" + district + "', \
				pincode = '" + pincode + "', \
				contactnumber = '" + contactno + "' \
			WHERE employeeid = '" + eid + "' ;", -1)

	return pharma_edit_profile("Changes saved")

####################################################################	Pharmacist Ends ##############################################################################



if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=True)