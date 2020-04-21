from flask import Flask, render_template, request
from mysqlLib import MySQL_Conn
from pprint import pprint
from helperLib import convertDay

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
						button.append(str(sttimeh) + ":" + sttimem + " " + amPm);
				available_slots.append(button)
		iter_date += one_day
		iter_day = iter_date.weekday()
		count += 1

	# print("SLOTS")
	# pprint(available_slots)

	return render_template("bookschedule.html", dept = dept, doctor = doctor, 
							dID = did, available_slots = available_slots)


if __name__ == "__main__":
    app.run(debug=True)
