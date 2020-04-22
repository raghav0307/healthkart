def convertDay(day):
	if day in ["Thu", "Sat", "Sun"]:
		return day[:2]
	return day[0]

class User():

	def __init__(self):
		self.user = None

	def update(self, name):
		self.user = name

	def getName(self):
		return self.user