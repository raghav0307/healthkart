def convertDay(day):
	if day in ["Thu", "Sat", "Sun"]:
		return day[:2]
	return day[0]

class User():
	def __init__(self):
		self.user = None
		self.username = None

	def update(self, name):
		self.user = name

	def getName(self):
		return self.user

	def updateusername(self, name):
		self.username = name

	def getusername(self):
		return self.username