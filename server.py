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

				print(occp)

				user.updateusername(occp[0][0])

				if occp[0][1] == "D":
					return doctor_home()

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
		flash(f'Signed up successfully! Patient ID is {pid}. Login to Continue', 'success')
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
		flash(f'Invalid UserID or Password')
	return home2()


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
	# Type = request.form['Type']

	# salary = request.form['Salary']

	# print("UPDATE patients \
	# 		SET houseno = '" + houseno + "', \
	# 			street = '" + street + "', \
	# 			city = '" + city + "', \
	# 			state = '" + state + "', \
	# 			district = '" + district + "', \
	# 			pincode = '" + pincode + "', \
	# 			contactnumber = '" + contactno + "' \
	# 		WHERE patientid = '" + patientID + "' ;")

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
	# salary = request.form['Salary']

	# print("UPDATE employees \
	# 		SET occupation = '" + occupation + "', \
	# 			houseno = '" + houseno + "', \
	# 			street = '" + street + "', \
	# 			city = '" + city + "', \
	# 			state = '" + state + "', \
	# 			district = '" + district + "', \
	# 			pincode = '" + pincode + "', \
	# 			contactnumber = '" + contactno + "' \
	# 		WHERE employeeid = '" + doctorid + "' ;")

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
		idCount = connection.execute("select entries from metadata where TableName ='employees' ");
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

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=True)
