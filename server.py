from flask import Flask, render_template, request
from mysqlLib import MySQL_Conn

app = Flask(__name__)

connection = MySQL_Conn.getInstance('healthkart', 'root')

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
	appointment_details = request.form['submit_button']
	appointment_details = appointment_details.split(' ')
	dept = appointment_details[0]
	doctor = " ".join(appointment_details[1:-1])
	did = appointment_details[-1]
	# print(appointment_details)
	if connection.connect():
		slots = connection.execute("select * from doctor_availability_chart where DoctorID = '%s'" %did)
		
	print(slots)

	return render_template("bookschedule.html", dept = dept, doctor = doctor, dID = did)
# def getschedule():
# 	appointment_details = request.form['submit_button']
# 	appointment_details = appointment_details.split(' ')
# 	dept=appointment_details[0]
# 	doctor=appointment_details[1]
# 	available_slots = []
# 	import datetime
# 	cur_date = datetime.date.today()
# 	cur_day = cur_date.weekday()
# 	iter_date = cur_date
# 	iter_day = cur_day
# 	one_day = datetime.timedelta(days=1)
# 	count = cur_day
# 	days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
# 	while count <= 13:
# 		button = []
# 		button.append(str(iter_date)+" "+days[iter_day])
# 		start_date = 0	#start and end dates get from sql
# 		end_date = 0
# 		slots = 4		#calculate from start and end dates
# 		appointments = []	#find from database
# 		for i in range(slots):
# 			if i not in appointments:
# 				button.append("start_time + 20*(i + 1)");
# 		available_slots.append(button)
# 		iter_date += one_day
# 		iter_day = iter_date.weekday()
# 		count += 1					
# 	return render_template("bookschedule.html", dept = dept, doctor = doctor, available_slots = available_slots)


if __name__ == "__main__":
    app.run(debug=True)
