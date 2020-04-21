from flask import Flask, render_template, request
app = Flask(__name__)

@app.route("/patients/appointments/selectdept")
def selectdept():
	depts = ['dep1', 'dep2', 'dept3', 'dept4', 'dept5']		# make the list from swql table
	return render_template("appointmentdept.html", depts = depts)


@app.route("/patients/appointments/selectdoctor", methods = ['GET', 'POST'])
def selectdoctor():
	dept = request.form['submit_button']
	doctors = ["d1", "d2", "d3"]	#fill according to dept
	return render_template("appointmentdoctor.html", doctors = doctors, dept = dept)


@app.route("/patients/appointments/getschedule", methods = ['GET', 'POST'])
def getschedule():
	appointment_details = request.form['submit_button']
	appointment_details = appointment_details.split(' ')
	dept=appointment_details[0]
	doctor=appointment_details[1]
	return render_template("bookschedule.html", dept = dept, doctor = doctor)


if __name__ == "__main__":
    app.run(debug=True)