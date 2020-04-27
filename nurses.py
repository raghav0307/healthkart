import server

@app.route("/nurses")
def nurses_home():
	if session['logged_in'] == False:
		return redirect(url_for('home2'))
	
	import datetime

	doctorID = user.getName()

	cur_date = datetime.date.today()
	cur_date = "2020-01-31"

	if connection.connect():

		schedule = connection.execute("select patients.PatientID, PatientName, SlotNumber from \
			appointments join patients on appointments.PatientID = patients.PatientID where VisitDate \
			= '%s' and DoctorID = '%s';" %(cur_date, doctorID)) 

	schedule.sort(key = lambda x: x[2])

	return render_template("doctor_home.html", doctorID = doctorID, schedule = schedule, name = user.getusername())
