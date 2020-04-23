import mysql.connector
from mysql.connector import Error


class MySQL_Conn():

	_instance = None

	@staticmethod
	def getInstance(database, user, password=None, host='localhost'):
		if MySQL_Conn._instance == None:
			MySQL_Conn(database, user, password, host)

		return MySQL_Conn._instance


	def __init__(self, database, user, password=None, host='localhost'):
		
		if MySQL_Conn._instance == None:
			self.connection = None
			self.cursor =  None
			self.database = database
			self.user = user
			self.password = password
			self.host = host
			MySQL_Conn._instance = self
		

	def connect(self):
		if self.connection == None:
			try:
				self.connection = mysql.connector.connect(host = self.host,
													 database = self.database, 
													 user = self.user,
													 password = self.password)
				if self.connection.is_connected():
					self.cursor = self.connection.cursor(buffered = True)
					return True

			except Error as e:
				print("Error while connecting to MySQL", e)
				return False
		else:
			return True

	def close(self):
		if (self.connection != None):
			self.cursor.close()
			self.connection.close()
			MySQL_Conn._instance = None

	def execute(self, pstmt, rec = 0):
		self.cursor.execute(pstmt)

		if rec == 0:
			return self.cursor.fetchall()

		elif rec == 1:
			return self.cursor.fetchone()
		else:
			self.connection.commit()




if __name__ == "__main__":
	from pprint import pprint
	connection = MySQL_Conn.getInstance('healthkart', 'root')

	if connection.connect():
		appointments = connection.execute("select SlotNumber from appointments \
					where DoctorID = '%s' and VisitDate = '%s'" %("E0016", "2020-01-07"))

		appointments = [i[0] for i in appointments]
		for i in appointments:
			print(i)
		pprint(appointments)
		# rec = conn.execute("insert into Patients values ('P0021', 'Nam', 'A-50', '', '', 'Delhi', 'Central Delhi', '110001', '9765456789', 'O-', '1988-07-09', 'M', 'B')", -1)
		# pprint(rec)
		# rec = conn.execute("select * from Patients")
		# pprint(rec)
		connection.close()