def convertDay(day):
	if day in ["Thu", "Sat", "Sun"]:
		return day[:2]
	return day[0]