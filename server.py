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
	doctor_id = []
	if connection.connect():
		docs = connection.execute("select DoctorID, DoctorName from doctors where DepartmentName = '%s'" %dept)
		for i in docs:
			doctors.append("Dr. " + i[1])
			doctor_id.append(i[0])
	return render_template("appointmentdoctor.html", doctors = doctors, dept = dept, dID = doctor_id)


@app.route("/patients/appointments/getschedule", methods = ['GET', 'POST'])
def getschedule():
	appointment_details = request.form['submit_button']
	appointment_details = appointment_details.split(' ')
	dept = appointment_details[0]
	doctor = " ".join(appointment_details[1:-1])
	did = appointment_details[-1]
	return render_template("bookschedule.html", dept = dept, doctor = doctor, dID = did)


if __name__ == "__main__":
    app.run(debug=True)