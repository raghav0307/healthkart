-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: healthkart
-- ------------------------------------------------------
-- Server version	10.3.20-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Logins`
--

DROP TABLE IF EXISTS `Logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Logins` (
  `UserID` char(5) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Logins`
--

LOCK TABLES `Logins` WRITE;
/*!40000 ALTER TABLE `Logins` DISABLE KEYS */;
INSERT INTO `Logins` VALUES ('P0001','e6c3da5b206634d7f3f3586d747ffdb36b5c675757b380c6a5fe5c570c714349'),('P0002','1ba3d16e9881959f8c9a9762854f72c6e6321cdd44358a10a4e939033117eab9'),('P0003','3acb59306ef6e660cf832d1d34c4fba3d88d616f0bb5c2a9e0f82d18ef6fc167'),('P0004','a417b5dc3d06d15d91c6687e27fc1705ebc56b3b2d813abe03066e5643fe4e74'),('P0005','0eeac8171768d0cdef3a20fee6db4362d019c91e10662a6b55186336e1a42778'),('P0006','5c4950c94a3461441c356afa783f76b83b38fd65f730f291403efbcc798acc1f'),('P0007','1526f5e0e31d42fe1c3664ce923ac22ac1333417a90b32043797ac454cd03112'),('P0008','c8fea5b0b76dc690feaf5544749f99b40e78e2a37c0e867a086696509416302a'),('P0009','2d4589473fb3f4581d7452cd25182159d68d2a50056a0cce35a529b010e32f2b'),('P0010','b35892cb8b089e03e4420b94df688122a2b76d4ad0f8b94ad20808bb029e48a5'),('P0011','8057f787ebd8b4f9d40f53d7fbbfcbdde7067c1a074435b68f525b3de0e2ac2b'),('P0012','fdac810d0c09f25c5ddcee9976ab1f1ae1973dba7c65152d95b0937bc2a6c883'),('P0013','1e53de2a2b4ab888cc24002ef8832d433b21956ab83ddeef989c8224b5c8f9f2'),('P0014','b78f24953963ac5ed773d6ec83120e3b1a65510201dc09ed2ed9e9781ba88870'),('P0015','b5a4ec869015095060b1171791334513f741177c4011e2c5c36e3e37a5ff8e5f'),('P0016','f0c28ba3fd9e0dcdcd0470acfcb98cc5a58d7d93422dbbefb930455ef714c87d'),('P0017','4a6b7fa040bcfc734a113fee84d3789c0a626d70d029afad0d1c3e7b6c562e14'),('P0018','b99ddd77e59c96b13b64b3abe1902db4c0a76dabf8622aa6c71f8f5670be6625'),('P0019','871431053023291d24b403f1f9d761c6f01b3050a0a83cd9d9759a970f8d4d92'),('P0020','51d11024031a8951b4722671adfc8587538f5e5417206e7862e60752758a5c35'),('E0001','e6c3da5b206634d7f3f3586d747ffdb36b5c675757b380c6a5fe5c570c714349'),('E0002','1ba3d16e9881959f8c9a9762854f72c6e6321cdd44358a10a4e939033117eab9'),('E0003','3acb59306ef6e660cf832d1d34c4fba3d88d616f0bb5c2a9e0f82d18ef6fc167'),('E0004','a417b5dc3d06d15d91c6687e27fc1705ebc56b3b2d813abe03066e5643fe4e74'),('E0005','0eeac8171768d0cdef3a20fee6db4362d019c91e10662a6b55186336e1a42778'),('E0006','5c4950c94a3461441c356afa783f76b83b38fd65f730f291403efbcc798acc1f'),('E0007','1526f5e0e31d42fe1c3664ce923ac22ac1333417a90b32043797ac454cd03112'),('E0008','c8fea5b0b76dc690feaf5544749f99b40e78e2a37c0e867a086696509416302a'),('E0009','2d4589473fb3f4581d7452cd25182159d68d2a50056a0cce35a529b010e32f2b'),('E0010','b35892cb8b089e03e4420b94df688122a2b76d4ad0f8b94ad20808bb029e48a5'),('E0011','8057f787ebd8b4f9d40f53d7fbbfcbdde7067c1a074435b68f525b3de0e2ac2b'),('E0012','fdac810d0c09f25c5ddcee9976ab1f1ae1973dba7c65152d95b0937bc2a6c883'),('E0013','1e53de2a2b4ab888cc24002ef8832d433b21956ab83ddeef989c8224b5c8f9f2'),('E0014','b78f24953963ac5ed773d6ec83120e3b1a65510201dc09ed2ed9e9781ba88870'),('E0015','b5a4ec869015095060b1171791334513f741177c4011e2c5c36e3e37a5ff8e5f'),('E0016','f0c28ba3fd9e0dcdcd0470acfcb98cc5a58d7d93422dbbefb930455ef714c87d'),('E0017','4a6b7fa040bcfc734a113fee84d3789c0a626d70d029afad0d1c3e7b6c562e14'),('E0018','b99ddd77e59c96b13b64b3abe1902db4c0a76dabf8622aa6c71f8f5670be6625'),('E0019','871431053023291d24b403f1f9d761c6f01b3050a0a83cd9d9759a970f8d4d92'),('E0020','51d11024031a8951b4722671adfc8587538f5e5417206e7862e60752758a5c35'),('E0021','2d6b3bb57cb9e22fa36516172ef096b30ae00d08eedc1499c599b6269975521d'),('E0022','d0f82756c4d40d20e1fdbc90cf4da4adff02fe23b355687525880514642f764e'),('E0023','8893186d24cce07e1c82f2e020d41177e699318b4be9535483fdf55edf58cd50');
/*!40000 ALTER TABLE `Logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `AppointmentID` char(7) NOT NULL,
  `PatientID` char(5) DEFAULT NULL,
  `DoctorID` char(5) DEFAULT NULL,
  `VisitDate` date NOT NULL,
  `VisitDay` varchar(2) DEFAULT NULL,
  `SlotNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `Appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `Appointments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES ('1','P0014','E0006','2020-02-08','Sa',3),('10','P0007','E0019','2020-01-11','Sa',4),('100','P0012','E0023','2020-01-31','F',2),('101','P0003','E0022','2020-01-22','W',9),('102','P0016','E0022','2020-01-21','T',5),('103','P0019','E0006','2020-01-15','W',1),('104','P0018','E0021','2020-01-27','M',4),('105','P0004','E0013','2020-02-09','Su',5),('106','P0006','E0014','2020-01-06','M',6),('107','P0006','E0006','2020-01-15','W',3),('108','P0014','E0023','2020-02-06','Th',2),('109','P0017','E0019','2020-01-10','F',2),('11','P0019','E0016','2020-02-04','T',6),('110','P0002','E0021','2020-01-20','M',1),('111','P0008','E0014','2020-01-28','T',1),('112','P0015','E0023','2020-01-05','Su',3),('113','P0008','E0005','2020-01-21','T',2),('114','P0012','E0022','2020-01-21','T',1),('115','P0009','E0021','2020-02-02','Su',2),('116','P0014','E0013','2020-01-05','Su',6),('117','P0013','E0004','2020-02-09','Su',4),('118','P0011','E0016','2020-02-04','T',6),('119','P0008','E0023','2020-01-09','Th',2),('12','P0015','E0016','2020-02-11','T',4),('120','P0001','E0021','2020-01-26','Su',4),('121','P0011','E0014','2020-01-27','M',5),('122','P0016','E0019','2020-02-01','Sa',5),('123','P0005','E0023','2020-01-31','F',3),('124','P0014','E0019','2020-01-31','F',1),('125','P0002','E0016','2020-01-21','T',10),('126','P0013','E0014','2020-01-29','W',6),('127','P0012','E0019','2020-01-31','F',8),('128','P0019','E0014','2020-02-11','T',9),('129','P0012','E0014','2020-02-06','Th',3),('13','P0004','E0022','2020-02-05','W',5),('130','P0010','E0023','2020-01-12','Su',2),('131','P0018','E0014','2020-01-30','Th',2),('132','P0010','E0013','2020-01-19','Su',1),('133','P0005','E0021','2020-01-20','M',5),('134','P0009','E0004','2020-01-08','W',4),('135','P0010','E0013','2020-02-09','Su',3),('136','P0003','E0006','2020-01-06','M',4),('137','P0005','E0005','2020-01-23','Th',3),('138','P0018','E0022','2020-01-21','T',2),('139','P0011','E0016','2020-02-04','T',11),('14','P0013','E0023','2020-02-06','Th',2),('140','P0017','E0022','2020-01-07','T',9),('141','P0012','E0023','2020-01-23','Th',3),('142','P0008','E0021','2020-01-19','Su',2),('143','P0018','E0013','2020-01-29','W',5),('144','P0006','E0021','2020-01-20','M',2),('145','P0004','E0005','2020-01-14','T',13),('146','P0001','E0016','2020-02-04','T',10),('147','P0012','E0016','2020-01-21','T',4),('148','P0019','E0019','2020-02-14','F',1),('149','P0007','E0005','2020-01-07','T',7),('15','P0009','E0014','2020-01-29','W',1),('150','P0005','E0014','2020-01-08','W',8),('151','P0005','E0005','2020-01-23','Th',10),('152','P0020','E0005','2020-01-09','Th',5),('153','P0013','E0006','2020-01-22','W',1),('154','P0014','E0022','2020-01-22','W',12),('155','P0008','E0013','2020-02-09','Su',2),('156','P0020','E0016','2020-01-07','T',5),('157','P0013','E0016','2020-01-28','T',10),('158','P0013','E0013','2020-01-19','Su',4),('159','P0005','E0021','2020-01-20','M',1),('16','P0006','E0016','2020-01-28','T',3),('160','P0014','E0004','2020-02-12','W',6),('161','P0003','E0022','2020-01-22','W',10),('162','P0006','E0006','2020-01-06','M',12),('163','P0005','E0023','2020-01-23','Th',1),('164','P0004','E0005','2020-01-21','T',13),('165','P0002','E0022','2020-02-04','T',4),('166','P0015','E0022','2020-01-08','W',11),('167','P0001','E0022','2020-02-05','W',11),('168','P0013','E0023','2020-01-31','F',6),('169','P0008','E0013','2020-01-15','W',1),('17','P0001','E0019','2020-01-17','F',8),('170','P0009','E0014','2020-02-04','T',8),('171','P0019','E0013','2020-02-09','Su',4),('172','P0002','E0016','2020-01-07','T',8),('173','P0011','E0019','2020-01-10','F',4),('174','P0017','E0016','2020-02-11','T',10),('175','P0001','E0006','2020-01-08','W',1),('176','P0008','E0006','2020-02-12','W',3),('177','P0014','E0006','2020-01-29','W',2),('178','P0005','E0023','2020-01-30','Th',1),('179','P0016','E0013','2020-01-01','W',4),('18','P0019','E0019','2020-01-03','F',11),('180','P0018','E0021','2020-02-10','M',2),('181','P0020','E0013','2020-01-12','Su',6),('182','P0007','E0023','2020-02-13','Th',1),('183','P0010','E0014','2020-02-12','W',11),('184','P0013','E0021','2020-01-27','M',2),('185','P0012','E0019','2020-01-24','F',4),('186','P0018','E0022','2020-02-12','W',5),('187','P0014','E0004','2020-02-14','F',6),('188','P0015','E0006','2020-01-20','M',2),('189','P0001','E0021','2020-01-12','Su',5),('19','P0010','E0013','2020-01-26','Su',4),('190','P0005','E0004','2020-01-24','F',8),('191','P0001','E0004','2020-01-31','F',6),('192','P0004','E0022','2020-01-15','W',9),('193','P0008','E0005','2020-01-09','Th',1),('194','P0019','E0019','2020-01-11','Sa',9),('195','P0006','E0023','2020-01-10','F',4),('196','P0008','E0005','2020-01-23','Th',4),('197','P0018','E0004','2020-01-03','F',4),('198','P0008','E0023','2020-01-31','F',2),('199','P0005','E0004','2020-02-12','W',7),('2','P0005','E0023','2020-02-09','Su',2),('20','P0009','E0013','2020-01-01','W',2),('200','P0018','E0021','2020-01-27','M',6),('201','P0019','E0006','2020-01-13','M',3),('202','P0016','E0019','2020-01-18','Sa',5),('203','P0001','E0016','2020-01-07','T',8),('204','P0003','E0004','2020-01-03','F',4),('205','P0002','E0005','2020-01-14','T',13),('206','P0009','E0014','2020-02-06','Th',3),('207','P0005','E0006','2020-01-11','Sa',6),('208','P0001','E0006','2020-02-08','Sa',2),('209','P0012','E0006','2020-01-25','Sa',3),('21','P0017','E0004','2020-02-10','M',2),('210','P0003','E0006','2020-01-13','M',1),('211','P0010','E0014','2020-02-05','W',9),('212','P0009','E0016','2020-02-04','T',1),('213','P0002','E0021','2020-01-12','Su',2),('214','P0002','E0005','2020-01-14','T',2),('215','P0019','E0005','2020-01-28','T',10),('216','P0005','E0006','2020-02-01','Sa',3),('217','P0012','E0013','2020-01-01','W',4),('218','P0010','E0013','2020-01-29','W',5),('219','P0014','E0021','2020-02-03','M',5),('22','P0002','E0013','2020-01-29','W',4),('220','P0010','E0023','2020-01-16','Th',1),('221','P0004','E0022','2020-01-15','W',8),('222','P0001','E0016','2020-01-21','T',9),('223','P0006','E0016','2020-01-28','T',6),('224','P0003','E0013','2020-01-12','Su',3),('225','P0002','E0019','2020-01-18','Sa',1),('226','P0017','E0021','2020-01-20','M',1),('227','P0014','E0013','2020-01-22','W',3),('228','P0008','E0019','2020-01-04','Sa',1),('229','P0011','E0004','2020-01-27','M',6),('23','P0020','E0006','2020-01-18','Sa',4),('230','P0020','E0016','2020-02-11','T',10),('231','P0019','E0006','2020-02-01','Sa',2),('232','P0003','E0014','2020-01-29','W',3),('233','P0020','E0023','2020-01-04','Sa',3),('234','P0020','E0006','2020-01-22','W',2),('235','P0010','E0013','2020-01-29','W',3),('236','P0002','E0014','2020-01-02','Th',1),('237','P0018','E0014','2020-01-09','Th',2),('238','P0020','E0005','2020-02-04','T',15),('239','P0008','E0022','2020-01-28','T',6),('24','P0008','E0004','2020-01-31','F',1),('240','P0010','E0021','2020-02-02','Su',1),('241','P0019','E0006','2020-01-01','W',3),('242','P0004','E0004','2020-01-24','F',8),('243','P0013','E0005','2020-02-11','T',15),('244','P0014','E0004','2020-02-07','F',8),('245','P0015','E0023','2020-01-17','F',6),('246','P0019','E0014','2020-01-07','T',5),('247','P0014','E0022','2020-01-08','W',8),('248','P0006','E0016','2020-01-14','T',2),('249','P0010','E0019','2020-01-03','F',1),('25','P0002','E0023','2020-01-04','Sa',1),('250','P0014','E0023','2020-01-23','Th',1),('26','P0002','E0021','2020-02-02','Su',6),('27','P0001','E0014','2020-02-12','W',4),('28','P0012','E0013','2020-01-19','Su',2),('29','P0016','E0006','2020-02-08','Sa',3),('3','P0020','E0022','2020-01-01','W',9),('30','P0001','E0014','2020-01-23','Th',2),('31','P0013','E0019','2020-01-11','Sa',8),('32','P0018','E0022','2020-02-05','W',6),('33','P0020','E0004','2020-01-26','Su',3),('34','P0002','E0005','2020-02-06','Th',9),('35','P0013','E0022','2020-01-08','W',12),('36','P0002','E0006','2020-01-13','M',12),('37','P0004','E0004','2020-01-12','Su',5),('38','P0014','E0023','2020-01-05','Su',2),('39','P0004','E0022','2020-01-14','T',2),('4','P0005','E0019','2020-01-04','Sa',4),('40','P0011','E0021','2020-01-27','M',1),('41','P0004','E0021','2020-01-26','Su',5),('42','P0003','E0016','2020-01-28','T',12),('43','P0014','E0016','2020-01-14','T',9),('44','P0018','E0005','2020-02-06','Th',8),('45','P0019','E0014','2020-01-23','Th',2),('46','P0018','E0004','2020-01-01','W',7),('47','P0009','E0006','2020-01-18','Sa',6),('48','P0014','E0022','2020-01-01','W',1),('49','P0004','E0016','2020-02-11','T',6),('5','P0005','E0014','2020-01-07','T',2),('50','P0005','E0013','2020-02-09','Su',3),('51','P0016','E0013','2020-02-09','Su',1),('52','P0020','E0006','2020-01-20','M',1),('53','P0017','E0005','2020-01-09','Th',3),('54','P0009','E0022','2020-02-11','T',8),('55','P0015','E0023','2020-01-09','Th',3),('56','P0017','E0022','2020-01-29','W',10),('57','P0013','E0022','2020-01-01','W',12),('58','P0006','E0004','2020-01-10','F',6),('59','P0014','E0005','2020-02-04','T',4),('6','P0012','E0005','2020-02-13','Th',1),('60','P0008','E0021','2020-02-10','M',1),('61','P0011','E0021','2020-02-02','Su',4),('62','P0005','E0005','2020-01-30','Th',9),('63','P0010','E0014','2020-01-16','Th',3),('64','P0008','E0022','2020-01-21','T',6),('65','P0006','E0013','2020-01-19','Su',1),('66','P0016','E0022','2020-02-11','T',6),('67','P0006','E0006','2020-01-25','Sa',1),('68','P0017','E0005','2020-01-02','Th',10),('69','P0004','E0023','2020-02-08','Sa',6),('7','P0017','E0013','2020-01-19','Su',4),('70','P0020','E0021','2020-01-26','Su',2),('71','P0002','E0022','2020-01-21','T',5),('72','P0012','E0016','2020-01-28','T',2),('73','P0012','E0016','2020-01-14','T',4),('74','P0002','E0006','2020-01-20','M',6),('75','P0008','E0019','2020-01-11','Sa',5),('76','P0019','E0014','2020-01-23','Th',1),('77','P0016','E0016','2020-02-04','T',2),('78','P0015','E0023','2020-02-14','F',2),('79','P0018','E0006','2020-02-03','M',3),('8','P0009','E0014','2020-01-08','W',12),('80','P0008','E0021','2020-01-27','M',6),('81','P0013','E0022','2020-02-11','T',9),('82','P0005','E0005','2020-01-30','Th',1),('83','P0011','E0021','2020-02-03','M',2),('84','P0009','E0016','2020-01-14','T',2),('85','P0008','E0019','2020-02-08','Sa',9),('86','P0017','E0005','2020-01-23','Th',1),('87','P0009','E0006','2020-02-10','M',6),('88','P0001','E0019','2020-01-03','F',7),('89','P0016','E0004','2020-01-06','M',2),('9','P0016','E0006','2020-02-12','W',1),('90','P0012','E0013','2020-01-05','Su',1),('91','P0009','E0023','2020-02-13','Th',2),('92','P0009','E0016','2020-01-07','T',7),('93','P0007','E0019','2020-01-31','F',3),('94','P0009','E0004','2020-02-05','W',7),('95','P0018','E0023','2020-01-17','F',4),('96','P0018','E0013','2020-02-09','Su',5),('97','P0009','E0019','2020-01-24','F',3),('98','P0018','E0019','2020-01-03','F',1),('99','P0013','E0016','2020-02-04','T',12);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_indents`
--

DROP TABLE IF EXISTS `auto_indents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_indents` (
  `PatientID` char(5) NOT NULL,
  `MedicineID` char(10) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `DateofDispersal` date DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`MedicineID`),
  KEY `MedicineID` (`MedicineID`),
  CONSTRAINT `Auto_Indents_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON DELETE CASCADE,
  CONSTRAINT `Auto_Indents_ibfk_2` FOREIGN KEY (`MedicineID`) REFERENCES `medicines` (`MedicineID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_indents`
--

LOCK TABLES `auto_indents` WRITE;
/*!40000 ALTER TABLE `auto_indents` DISABLE KEYS */;
INSERT INTO `auto_indents` VALUES ('P0001','M000000012',10,'2020-01-06'),('P0001','M000000091',5,'2020-01-03'),('P0002','M000000098',7,'2020-01-03'),('P0004','M000000059',10,'2020-01-08'),('P0004','M000000093',3,'2020-01-08'),('P0011','M000000024',1,'2020-01-03'),('P0012','M000000042',8,'2020-01-07'),('P0012','M000000110',7,'2020-01-05'),('P0014','M000000018',10,'2020-01-06'),('P0014','M000000051',3,'2020-01-09'),('P0014','M000000115',6,'2020-01-09'),('P0014','M000000134',6,'2020-01-08'),('P0016','M000000036',9,'2020-01-01'),('P0019','M000000088',9,'2020-01-05'),('P0020','M000000071',3,'2020-01-09');
/*!40000 ALTER TABLE `auto_indents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contains` (
  `MedicineID` char(10) NOT NULL,
  `SaltID` char(5) NOT NULL,
  `Composition` float DEFAULT NULL,
  PRIMARY KEY (`MedicineID`,`SaltID`),
  KEY `SaltID` (`SaltID`),
  CONSTRAINT `Contains_ibfk_1` FOREIGN KEY (`MedicineID`) REFERENCES `medicines` (`MedicineID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Contains_ibfk_2` FOREIGN KEY (`SaltID`) REFERENCES `salts` (`SaltID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Composition` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES ('M000000001','S0001',250),('M000000002','S0001',200),('M000000003','S0001',350),('M000000004','S0001',250),('M000000005','S0002',350),('M000000006','S0002',450),('M000000007','S0002',450),('M000000008','S0003',150),('M000000009','S0004',300),('M000000010','S0004',150),('M000000011','S0004',650),('M000000012','S0004',400),('M000000013','S0005',200),('M000000014','S0005',350),('M000000015','S0006',200),('M000000016','S0006',200),('M000000017','S0007',200),('M000000018','S0007',250),('M000000019','S0007',400),('M000000020','S0007',300),('M000000021','S0008',150),('M000000022','S0008',550),('M000000023','S0009',550),('M000000024','S0010',600),('M000000025','S0010',500),('M000000026','S0010',500),('M000000027','S0010',500),('M000000028','S0011',250),('M000000029','S0011',150),('M000000030','S0011',400),('M000000031','S0011',400),('M000000032','S0012',400),('M000000033','S0012',300),('M000000034','S0012',350),('M000000035','S0012',150),('M000000036','S0013',100),('M000000037','S0013',300),('M000000038','S0013',400),('M000000039','S0014',300),('M000000040','S0015',450),('M000000041','S0015',600),('M000000042','S0015',250),('M000000043','S0016',350),('M000000044','S0016',250),('M000000045','S0016',550),('M000000046','S0016',450),('M000000047','S0017',200),('M000000048','S0017',400),('M000000049','S0017',650),('M000000050','S0017',350),('M000000051','S0018',400),('M000000052','S0018',200),('M000000053','S0018',150),('M000000054','S0018',400),('M000000055','S0019',350),('M000000056','S0019',350),('M000000057','S0019',150),('M000000058','S0019',150),('M000000059','S0020',150),('M000000060','S0021',550),('M000000061','S0022',400),('M000000062','S0022',100),('M000000063','S0022',100),('M000000064','S0023',200),('M000000065','S0024',350),('M000000066','S0024',500),('M000000067','S0024',600),('M000000068','S0025',400),('M000000069','S0025',300),('M000000070','S0026',250),('M000000071','S0027',100),('M000000072','S0028',400),('M000000073','S0028',500),('M000000074','S0028',500),('M000000075','S0028',200),('M000000076','S0029',200),('M000000077','S0029',650),('M000000078','S0029',500),('M000000079','S0029',250),('M000000080','S0030',650),('M000000081','S0030',450),('M000000082','S0031',500),('M000000083','S0031',300),('M000000084','S0031',400),('M000000085','S0031',150),('M000000086','S0032',650),('M000000087','S0034',600),('M000000088','S0035',100),('M000000089','S0035',150),('M000000090','S0035',500),('M000000091','S0035',200),('M000000092','S0036',600),('M000000093','S0036',600),('M000000094','S0036',350),('M000000095','S0036',350),('M000000096','S0037',350),('M000000097','S0037',450),('M000000098','S0038',600),('M000000099','S0038',400),('M000000100','S0038',100),('M000000101','S0039',600),('M000000102','S0039',500),('M000000103','S0039',550),('M000000104','S0039',100),('M000000105','S0040',100),('M000000106','S0040',350),('M000000107','S0040',100),('M000000108','S0040',300),('M000000109','S0041',500),('M000000110','S0041',650),('M000000111','S0042',300),('M000000112','S0042',600),('M000000113','S0043',100),('M000000114','S0043',150),('M000000115','S0043',650),('M000000116','S0043',300),('M000000117','S0044',400),('M000000118','S0044',100),('M000000119','S0044',250),('M000000120','S0045',600),('M000000121','S0045',450),('M000000122','S0045',500),('M000000123','S0045',350),('M000000124','S0046',550),('M000000125','S0046',400),('M000000126','S0046',450),('M000000127','S0046',300),('M000000128','S0047',400),('M000000129','S0047',500),('M000000130','S0047',150),('M000000131','S0047',350),('M000000132','S0048',150),('M000000133','S0048',550),('M000000134','S0048',300),('M000000135','S0049',200),('M000000136','S0049',400),('M000000137','S0049',500),('M000000138','S0049',400),('M000000139','S0050',450),('M000000140','S0050',650),('M000000141','S0050',300),('M000000142','S0050',650);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `DepartmentName` varchar(50) NOT NULL,
  `Dept_Head` char(5) DEFAULT NULL,
  PRIMARY KEY (`DepartmentName`),
  KEY `Dept_Head` (`Dept_Head`),
  CONSTRAINT `Departments_ibfk_1` FOREIGN KEY (`Dept_Head`) REFERENCES `doctors` (`DoctorID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('Physician','E0004'),('Cardiology','E0006'),('Homeopathy','E0013'),('Gyanecology','E0016'),('Dentistry','E0019'),('Ophthalmology','E0021'),('Dermatology','E0022'),('ENT','E0023');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availability_chart`
--

DROP TABLE IF EXISTS `doctor_availability_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_availability_chart` (
  `DoctorID` char(5) NOT NULL,
  `Day` varchar(2) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  PRIMARY KEY (`DoctorID`,`Day`),
  CONSTRAINT `Doctor_Availability_Chart_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availability_chart`
--

LOCK TABLES `doctor_availability_chart` WRITE;
/*!40000 ALTER TABLE `doctor_availability_chart` DISABLE KEYS */;
INSERT INTO `doctor_availability_chart` VALUES ('E0004','F','13:00:00','16:00:00'),('E0004','M','08:00:00','11:00:00'),('E0004','Su','10:00:00','12:00:00'),('E0004','W','09:00:00','13:00:00'),('E0005','T','10:00:00','15:00:00'),('E0005','Th','12:00:00','16:00:00'),('E0006','M','10:00:00','14:00:00'),('E0006','Sa','14:00:00','16:00:00'),('E0006','W','15:00:00','16:00:00'),('E0013','Su','10:00:00','12:00:00'),('E0013','W','10:00:00','12:00:00'),('E0014','M','12:00:00','15:00:00'),('E0014','T','12:00:00','15:00:00'),('E0014','Th','09:00:00','10:00:00'),('E0014','W','12:00:00','16:00:00'),('E0016','T','12:00:00','16:00:00'),('E0019','F','10:00:00','14:00:00'),('E0019','Sa','09:00:00','12:00:00'),('E0021','M','14:00:00','16:00:00'),('E0021','Su','10:00:00','12:00:00'),('E0022','T','12:00:00','15:00:00'),('E0022','W','08:00:00','12:00:00'),('E0023','F','10:00:00','12:00:00'),('E0023','Sa','11:00:00','13:00:00'),('E0023','Su','09:00:00','10:00:00'),('E0023','Th','08:00:00','09:00:00');
/*!40000 ALTER TABLE `doctor_availability_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `DoctorID` char(5) NOT NULL,
  `DoctorName` varchar(25) DEFAULT NULL,
  `DepartmentName` varchar(50) NOT NULL,
  `RoomNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `DepartmentName` (`DepartmentName`),
  CONSTRAINT `Doctors_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Doctors_ibfk_2` FOREIGN KEY (`DepartmentName`) REFERENCES `departments` (`DepartmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('E0004','Rupali','Physician',405),('E0005','Twinkle Arora','ENT',401),('E0006','Anirudh Singh','Cardiology',305),('E0013','Neeraj Gupta','Homeopathy',308),('E0014','Abdul Rehman','Physician',407),('E0016','Indu Shah','Gyanecology',310),('E0019','G. Pal','Dentistry',312),('E0021','Naval Raj','Ophthalmology',202),('E0022','Ajay Krishnan','Dermatology',205),('E0023','Ankush','ENT',410);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EmployeeID` char(5) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Gender` enum('M','F','O') DEFAULT NULL,
  `Occupation` enum('D','N','L','F','P') DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `HouseNo` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(20) NOT NULL,
  `District` varchar(30) NOT NULL,
  `PinCode` char(6) NOT NULL,
  `ContactNumber` char(10) NOT NULL,
  `Salary` float NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('E0001','Aadya Garg','F','N','2019-10-10','A-34','Shayam Nagar','Guru Gobind Singh Marg','Delhi','Central Delhi','110005','9089868926',0),('E0002','Nihal Shah','M','N','2019-10-15','23','Rajni Bagh','Guru Gobind Singh Marg','Delhi','Central Delhi','110005','8934325453',35000),('E0003','Rishabh Gupta','M','L','2019-09-05','F/95/34','Sameura Towers','Saket','Delhi','South Delhi','110017','7347268992',50000),('E0004','Rupali','F','D','2019-10-03','3/2/q','New Heights','Ghaziabad','Uttar Pradesh','Ghaziabad','201001','6357823932',100000),('E0005','Twinkle Arora','F','D','2019-08-04','A-45','Angola Heights','Kailash Colony','Delhi','South Delhi','110048','9764328420',125000),('E0006','Anirudh Singh','M','D','2019-10-04','F-98','Zulip Road','Kailash Colony','Delhi','South Delhi','110048','7274237981',150000),('E0007','Deeksha Trivedi','F','','2019-11-25','56','Rakesh Marg','Nehru Place','Delhi','South Delhi','110019','6498304503',40000),('E0008','Tarun Mishra','M','N','2019-12-04','C-45','Ashok Nagar','Ghaziabad','Uttar Pradesh','Ghaziabad','201001','9875935452',30000),('E0009','Sisir Bansal','M','P','2019-10-08','20','Patel Nagar','Ghaziabad','Uttar Pradesh','Ghaziabad','201001','9764273528',50000),('E0010','Adit Amresh','M','L','2019-10-06','S-01','Vasundhra Enclave','Shivaji Park','Delhi','West Delhi','110026','8734628924',55000),('E0011','Lakshya Bhist','M','F','2019-10-04','R-78','Sector 52','Noida','Uttar Pradesh','Gautam Budh Nagar','201301','6334243242',20000),('E0012','Devansh Tyagi','M','F','2019-11-16','V/V/34','Sector 43','Noida','Uttar Pradesh','Gautam Budh Nagar','201301','9783422343',25000),('E0013','Neeraj Gupta','M','D','2019-02-20','T-89','ELF Rises','Darya Ganj','Delhi','Central Delhi','110002','8003803893',90000),('E0014','Abdul Rehman','M','D','2019-11-03','689','Sector 13','Nehru Place','Delhi','South Delhi','110019','9364283793',95000),('E0015','Ashya Sharma','F','F','2019-11-01','AD','Delta Zone','Darya Ganj','Delhi','Central Delhi','110002','9876545678',22000),('E0016','Indu Shah','F','D','2019-11-01','87','Olive County','DLF Phase 2','Haryana','Gurugram','122010','9097654689',92000),('E0017','Anuja Bhat','F','F','2019-11-07','45','Rosen Rises','DLF Phase 3','Haryana','Gurugram','122010','8253032432',20000),('E0018','Govind Rai','M','F','2019-10-04','23','Sector 2','Connaught Place','Delhi','Central Delhi','110001','6339204924',23000),('E0019','G. Pal','M','D','2019-10-30','H-56','Nehru Nagar','Shivaji Park','Delhi','West Delhi','110026','9034837234',96000),('E0020','Ram Singh','M','L','2019-10-31','F-56','Sector 6','DLF Phase 3','Haryana','Gurugram','122010','7934823042',55000),('E0021','Naval Raj','M','D','2019-08-03','Z/45','Grand Heights','Kailash Colony','Delhi','South Delhi','110048','9472347243',110000),('E0022','Ajay Krishnan','M','D','2019-12-02','F-432','Vistara Vykes','Connaught Place','Delhi','Central Delhi','110001','8903272834',120000),('E0023','Ankush','M','D','2019-08-02','B-098','Supertech Capetown','Nehru Place','Delhi','South Delhi','110019','9842397424',120000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labtests`
--

DROP TABLE IF EXISTS `labtests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labtests` (
  `TestName` varchar(50) NOT NULL,
  `TestDescription` varchar(800) DEFAULT NULL,
  `TestCost` float DEFAULT NULL,
  `TechnicianID` char(5) DEFAULT NULL,
  `TechnicianName` varchar(25) NOT NULL,
  PRIMARY KEY (`TestName`),
  KEY `TechnicianID` (`TechnicianID`),
  CONSTRAINT `LabTests_ibfk_1` FOREIGN KEY (`TechnicianID`) REFERENCES `employees` (`EmployeeID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labtests`
--

LOCK TABLES `labtests` WRITE;
/*!40000 ALTER TABLE `labtests` DISABLE KEYS */;
INSERT INTO `labtests` VALUES ('Anti Hepatitis B Core Antigen (AHBC)','The VITROSÂ Anti-HBcÂ testÂ can be used to detect antibodiesÂ against hepatitis B core antigenÂ (anti- HBc) in serum and plasma following exposure to infectiousÂ hepatitis BÂ virus (HBV).',1100,'E0020','Ram Singh'),('Anti Hepatitis B Core Antigen Total','Detection ofÂ hepatitis B surface antigenÂ (HBsAg) in blood is diagnostic forÂ hepatitis BÂ virus (HBV) infection.',1100,'E0020','Ram Singh'),('Calcium/Serum','A calcium blood test measures the amount of calcium in your blood.',160,'E0010','Adit Amresh'),('Complete Blood Count (CBC)','AÂ complete blood countÂ (CBC) is aÂ blood testÂ used to evaluate your overall health and detect a wide range of disorders, including anemia, infection and leukemia. AÂ complete blood count testÂ measures several components and features of yourÂ blood, including: RedÂ blood cells, which carry oxygen.',350,'E0020','Ram Singh'),('Cortisol','AÂ CortisolÂ levelÂ testÂ is conducted to find if there are any abnormalities associated with the Adrenal gland.',550,'E0010','Adit Amresh'),('Diabetic Profile','Is group ofÂ testsÂ that are used to diagnoseÂ diabetesÂ or its complications , it includes: Blood glucose 4 types: FBS, PPBS, RBS, OGGT',1,'E0010','Adit Amresh'),('Follicle Stimulating Hormone (FSH)','ThisÂ testÂ measures theÂ levelÂ ofÂ follicle-stimulating hormoneÂ (FSH) in your blood. FSH is made by your pituitary gland',530,'E0003','Rishabh Gupta'),('FSH-LH','TheÂ FSHÂ bloodÂ testÂ is used to help diagnose problems with sexual development, menstruation, and fertility',950,'E0010','Adit Amresh'),('FT3','TheÂ testÂ measures the amount of free triiodothyronine, orÂ FT3, in your blood. T3 is one of two major hormones produced by the thyroid gland (the other hormone is called thyroxine, or T4).',360,'E0020','Ram Singh'),('FT4','ThisÂ testÂ measures the amount of free thyroxine, orÂ FT4, in your blood. T4 is one of two major hormones produced by the thyroid gland',360,'E0010','Adit Amresh'),('Hba1c','TheÂ HbA1c test, also known as the haemoglobin A1c or glycated haemoglobinÂ test, is an important bloodÂ testÂ that gives a good indication of how well your diabetes is being controlled. Together with the fasting plasma glucoseÂ test, theÂ HbA1c testÂ is one of the main ways in which type 2 diabetes is diagnosed',440,'E0003','Rishabh Gupta'),('Iron Studies','Â Iron testsÂ evaluate the amount ofÂ ironÂ in the body by measuring several substances in the blood.Â ',500,'E0010','Adit Amresh'),('Kidpro (KFT)','There is a panel ofÂ testsÂ that check theÂ kidney functionÂ and measure levels of these build-ups to follow up with proper treatment aid and repeatÂ tests.Â ',780,'E0020','Ram Singh'),('Lipid Profile','Lipid profileÂ orÂ lipid panelÂ is aÂ panelÂ of blood tests that serves as an initial screening tool for abnormalities inÂ lipids, such as cholesterol and triglycerides.Â LipidÂ panels are ordered as part of a physical exam, along with other panels such as the complete blood count (CBC) and basic metabolicÂ panelÂ (BMP)',950,'E0003','Rishabh Gupta'),('Liver Function','Liver function testsÂ (LFTs or LFs), also referred to as aÂ hepaticÂ panel, are groups ofÂ blood testsÂ that provide information about the state of a patient\'sÂ liver. TheseÂ testsÂ include prothrombin time (PT/INR), activated Partial Thromboplastin Time (aPTT), albumin, bilirubin (direct and indirect), and others.',780,'E0003','Rishabh Gupta'),('Luteinizing Hormone (LH)','AnÂ LHÂ bloodÂ testÂ measures the amount ofÂ LHÂ in your bloodstream. If you\'re a woman, the amount of thisÂ hormoneÂ in your bloodstream varies with age and throughout the menstrual cycle.',530,'E0003','Rishabh Gupta'),('Sex Hormone Binding Globulin (SHBG)','ThisÂ testÂ measures theÂ levelÂ ofÂ sex hormone binding globulinÂ (SHBG) in your blood.Â SHBGÂ is a protein made by your liver. ItÂ bindsÂ tightly to threeÂ sex hormonesÂ found in both men and women. TheseÂ hormonesÂ are estrogen; dihydrotestosterone (DHT), and testosterone.',2350,'E0010','Adit Amresh'),('Thyroid Profile','ThyroidÂ function tests are a series of blood tests used to measure how well yourÂ thyroidÂ gland is working. Available tests include the T3, T3RU, T4, and TSH. TheÂ thyroidÂ is a small gland located in the lower-front part of your neck.',930,'E0020','Ram Singh'),('TSH','The thyroid stimulating hormone (TSH)Â testÂ measures the amount of TSH in the blood. The results convey how well the thyroid is functioning.',370,'E0003','Rishabh Gupta'),('Vitamin D Total (25 OH)','Â AÂ vitamin D testÂ measures the level ofÂ 25-hydroxyvitaminÂ D and/or 1 ... levels of both D2 and D3 and then add them together for aÂ totalÂ level.',1550,'E0003','Rishabh Gupta');
/*!40000 ALTER TABLE `labtests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `MedicineID` char(10) NOT NULL,
  `MedicineName` varchar(50) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `CompanyProviding` char(5) DEFAULT NULL,
  PRIMARY KEY (`MedicineID`),
  KEY `CompanyProviding` (`CompanyProviding`),
  CONSTRAINT `Medicines_ibfk_1` FOREIGN KEY (`CompanyProviding`) REFERENCES `pharmaceutical_companies` (`CompanyID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES ('M000000001','Synthroid',18,'0000-00-00',145,'C0001'),('M000000002','Levoxyl',6,'0000-00-00',162,'C0002'),('M000000003','Tirosint',12,'0000-00-00',295,'C0003'),('M000000004','Euthyrox',9,'0000-00-00',266,'C0004'),('M000000005','Zestril',15,'0000-00-00',268,'C0005'),('M000000006','Prinivil',13,'0000-00-00',298,'C0005'),('M000000007','Qbrelis',15,'0000-00-00',276,'C0006'),('M000000008','Lipitor',4,'0000-00-00',128,'C0007'),('M000000009','Glucophage',6,'0000-00-00',292,'C0004'),('M000000010','Glumetza',6,'0000-00-00',156,'C0007'),('M000000011','Glucophage XR',11,'0000-00-00',205,'C0002'),('M000000012','Riomet',8,'0000-00-00',130,'C0001'),('M000000013','Norvasc',12,'0000-00-00',152,'C0001'),('M000000014','Katerzia',15,'0000-00-00',194,'C0010'),('M000000015','Metoprolol Succinate ER',14,'0000-00-00',89,'C0008'),('M000000016','Metoprolol',6,'0000-00-00',122,'C0001'),('M000000017','Prilosec',18,'0000-00-00',105,'C0009'),('M000000018','Prilosec OTC',18,'0000-00-00',264,'C0008'),('M000000019','Omesec',7,'0000-00-00',242,'C0002'),('M000000020','Zegerid',19,'0000-00-00',75,'C0004'),('M000000021','Zocor',2,'0000-00-00',243,'C0002'),('M000000022','FloLipid',11,'0000-00-00',110,'C0008'),('M000000023','Cozaar',9,'0000-00-00',237,'C0010'),('M000000024','Ventolin',20,'0000-00-00',142,'C0005'),('M000000025','ProAir HFA',9,'0000-00-00',86,'C0009'),('M000000026','Ventolin HFA',4,'0000-00-00',166,'C0008'),('M000000027','Proventil',3,'0000-00-00',159,'C0003'),('M000000028','Neurontin',15,'0000-00-00',189,'C0003'),('M000000029','Gralise',20,'0000-00-00',152,'C0006'),('M000000030','Gabarone',18,'0000-00-00',227,'C0004'),('M000000031','Fanatrex',4,'0000-00-00',177,'C0003'),('M000000032','HydroDIURIL',16,'0000-00-00',94,'C0009'),('M000000033','Microzide',4,'0000-00-00',230,'C0005'),('M000000034','Esidrix',2,'0000-00-00',245,'C0001'),('M000000035','Oretic',16,'0000-00-00',82,'C0004'),('M000000036','Hysingla ER',13,'0000-00-00',182,'C0002'),('M000000037','Zohydro ER',13,'0000-00-00',232,'C0006'),('M000000038','Vantrela ER',13,'0000-00-00',219,'C0008'),('M000000039','Zoloft',5,'0000-00-00',188,'C0005'),('M000000040','Lasix',8,'0000-00-00',192,'C0008'),('M000000041','Diaqua-2',10,'0000-00-00',261,'C0006'),('M000000042','Lo-Aqua',11,'0000-00-00',103,'C0005'),('M000000043','Flovent',14,'0000-00-00',296,'C0009'),('M000000044','Flovent HFA',17,'0000-00-00',153,'C0008'),('M000000045','Arnuity Ellipta',8,'0000-00-00',58,'C0008'),('M000000046','Flovent Diskus',17,'0000-00-00',246,'C0009'),('M000000047','Tylenol',13,'0000-00-00',232,'C0009'),('M000000048','Paracetamol',19,'0000-00-00',76,'C0003'),('M000000049','Panadol',15,'0000-00-00',54,'C0008'),('M000000050','Aceta',4,'0000-00-00',130,'C0003'),('M000000051','Amoxil',7,'0000-00-00',206,'C0001'),('M000000052','Trimox',10,'0000-00-00',154,'C0005'),('M000000053','Apo-Amoxi',3,'0000-00-00',230,'C0009'),('M000000054','Moxilin',9,'0000-00-00',253,'C0009'),('M000000055','Xanax',7,'0000-00-00',154,'C0010'),('M000000056','Xanax XR',14,'0000-00-00',198,'C0004'),('M000000057','Alprazolam Intensol',11,'0000-00-00',214,'C0006'),('M000000058','Niravam',16,'0000-00-00',146,'C0005'),('M000000059','Tenormin',14,'0000-00-00',62,'C0001'),('M000000060','Celexa',9,'0000-00-00',174,'C0003'),('M000000061','Basaglar',17,'0000-00-00',203,'C0010'),('M000000062','Lantus',8,'0000-00-00',280,'C0005'),('M000000063','Toujeo',7,'0000-00-00',146,'C0006'),('M000000064','Singulair',12,'0000-00-00',177,'C0003'),('M000000065','Desyrel',20,'0000-00-00',239,'C0009'),('M000000066','Oleptro',10,'0000-00-00',286,'C0004'),('M000000067','Desyrel Dividose',3,'0000-00-00',163,'C0004'),('M000000068','Protonix',10,'0000-00-00',208,'C0004'),('M000000069','Protonix IV',8,'0000-00-00',269,'C0010'),('M000000070','Lexapro',4,'0000-00-00',211,'C0007'),('M000000071','Pravachol',6,'0000-00-00',258,'C0001'),('M000000072','Wellbutrin',19,'0000-00-00',294,'C0010'),('M000000073','Wellbutrin XL',10,'0000-00-00',204,'C0010'),('M000000074','Wellbutrin SR',7,'0000-00-00',87,'C0008'),('M000000075','Zyban',13,'0000-00-00',161,'C0009'),('M000000076','Prozac',13,'0000-00-00',287,'C0001'),('M000000077','Sarafem',3,'0000-00-00',86,'C0001'),('M000000078','Prozac Weekly',11,'0000-00-00',82,'C0006'),('M000000079','Rapiflux',12,'0000-00-00',123,'C0008'),('M000000080','Coreg',20,'0000-00-00',69,'C0001'),('M000000081','Coreg CR',5,'0000-00-00',174,'C0009'),('M000000082','Deltasone',15,'0000-00-00',212,'C0005'),('M000000083','Rayos',15,'0000-00-00',101,'C0006'),('M000000084','Sterapred',13,'0000-00-00',52,'C0003'),('M000000085','Meticorten',19,'0000-00-00',166,'C0003'),('M000000086','Flomax',19,'0000-00-00',78,'C0010'),('M000000087','Plavix',20,'0000-00-00',114,'C0003'),('M000000088','Advil',6,'0000-00-00',242,'C0002'),('M000000089','Motrin',20,'0000-00-00',157,'C0005'),('M000000090','IBU',17,'0000-00-00',173,'C0004'),('M000000091','Motrin IB',3,'0000-00-00',185,'C0010'),('M000000092','Mobic',11,'0000-00-00',292,'C0007'),('M000000093','Vivlodex',14,'0000-00-00',254,'C0001'),('M000000094','Anjeso',9,'0000-00-00',52,'C0004'),('M000000095','Qmiiz ODT',6,'0000-00-00',163,'C0005'),('M000000096','Crestor',17,'0000-00-00',162,'C0006'),('M000000097','Ezallor',5,'0000-00-00',142,'C0006'),('M000000098','Ecotrin',18,'0000-00-00',230,'C0010'),('M000000099','Aspir 81',9,'0000-00-00',295,'C0004'),('M000000100','C0004 Aspirin',15,'0000-00-00',162,'C0002'),('M000000101','Ultram',8,'0000-00-00',281,'C0005'),('M000000102','Tramadol Hydrochloride ER',6,'0000-00-00',114,'C0010'),('M000000103','Tramal',9,'0000-00-00',112,'C0004'),('M000000104','Ryzolt',2,'0000-00-00',218,'C0005'),('M000000105','Ambien',13,'0000-00-00',132,'C0010'),('M000000106','Ambien CR',5,'0000-00-00',93,'C0001'),('M000000107','Intermezzo',4,'0000-00-00',282,'C0004'),('M000000108','Edluar',13,'0000-00-00',246,'C0002'),('M000000109','Coumadin',14,'0000-00-00',297,'C0010'),('M000000110','Jantoven',2,'0000-00-00',179,'C0007'),('M000000111','Klonopin',20,'0000-00-00',215,'C0003'),('M000000112','Klonopin Wafer',16,'0000-00-00',76,'C0004'),('M000000113','Inderal',14,'0000-00-00',113,'C0002'),('M000000114','Inderal LA',4,'0000-00-00',145,'C0010'),('M000000115','Hemangeol',4,'0000-00-00',126,'C0008'),('M000000116','Inderal XL',3,'0000-00-00',217,'C0004'),('M000000117','Glucotrol',19,'0000-00-00',151,'C0010'),('M000000118','Glucotrol XL',15,'0000-00-00',263,'C0009'),('M000000119','GlipiZIDE XL',10,'0000-00-00',183,'C0001'),('M000000120','Dexedrine',20,'0000-00-00',52,'C0003'),('M000000121','Zenzedi',20,'0000-00-00',248,'C0001'),('M000000122','ProCentra',10,'0000-00-00',86,'C0006'),('M000000123','Dextrostat',5,'0000-00-00',132,'C0007'),('M000000124','Flexeril',13,'0000-00-00',223,'C0003'),('M000000125','Fexmid',6,'0000-00-00',68,'C0003'),('M000000126','Amrix',18,'0000-00-00',140,'C0003'),('M000000127','Comfort Pac with Cyclobenzaprine',14,'0000-00-00',167,'C0003'),('M000000128','Concerta',13,'0000-00-00',95,'C0010'),('M000000129','Ritalin',5,'0000-00-00',61,'C0007'),('M000000130','Daytrana',8,'0000-00-00',241,'C0008'),('M000000131','Quillivant XR',9,'0000-00-00',221,'C0010'),('M000000132','Cymbalta',2,'0000-00-00',227,'C0008'),('M000000133','Drizalma Sprinkle',19,'0000-00-00',91,'C0004'),('M000000134','Irenka',9,'0000-00-00',231,'C0001'),('M000000135','Zithromax',5,'0000-00-00',110,'C0006'),('M000000136','Azithromycin Dose Pack',11,'0000-00-00',293,'C0007'),('M000000137','Z-Pak',16,'0000-00-00',216,'C0004'),('M000000138','Zmax',4,'0000-00-00',204,'C0002'),('M000000139','Zantac',17,'0000-00-00',201,'C0003'),('M000000140','Zantac 150',20,'0000-00-00',139,'C0004'),('M000000141','Zantac Injection',3,'0000-00-00',230,'C0006'),('M000000142','Zantac 75',16,'0000-00-00',151,'C0007');
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medrecommended`
--

DROP TABLE IF EXISTS `medrecommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medrecommended` (
  `VisitID` char(5) NOT NULL,
  `MedicineID` char(10) NOT NULL,
  `MedicineName` varchar(50) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`VisitID`,`MedicineID`),
  KEY `MedicineID` (`MedicineID`),
  CONSTRAINT `MedRecommended_ibfk_1` FOREIGN KEY (`VisitID`) REFERENCES `visits` (`VisitID`) ON UPDATE CASCADE,
  CONSTRAINT `MedRecommended_ibfk_2` FOREIGN KEY (`MedicineID`) REFERENCES `medicines` (`MedicineID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medrecommended`
--

LOCK TABLES `medrecommended` WRITE;
/*!40000 ALTER TABLE `medrecommended` DISABLE KEYS */;
INSERT INTO `medrecommended` VALUES ('V0001','M000000140','Zantac 150',2),('V0005','M000000007','Qbrelis',1),('V0007','M000000033','Microzide',6),('V0010','M000000119','GlipiZIDE XL',10),('V0011','M000000074','Wellbutrin SR',7),('V0012','M000000005','Zestril',1),('V0013','M000000063','Toujeo',6),('V0015','M000000136','Azithromycin Dose Pack',2),('V0017','M000000052','Trimox',8),('V0018','M000000103','Tramal',10),('V0021','M000000032','HydroDIURIL',9),('V0023','M000000107','Intermezzo',9),('V0024','M000000093','Vivlodex',1),('V0025','M000000032','HydroDIURIL',1),('V0026','M000000007','Qbrelis',9),('V0030','M000000044','Flovent HFA',8),('V0031','M000000005','Zestril',3),('V0034','M000000060','Celexa',5),('V0035','M000000126','Amrix',2),('V0036','M000000127','Comfort Pac with Cyclobenzaprine',10),('V0037','M000000029','Gralise',6),('V0040','M000000046','Flovent Diskus',4),('V0043','M000000003','Tirosint',4),('V0044','M000000057','Alprazolam Intensol',5),('V0045','M000000003','Tirosint',9),('V0046','M000000092','Mobic',8),('V0047','M000000084','Sterapred',9),('V0048','M000000133','Drizalma Sprinkle',2),('V0049','M000000065','Desyrel',1),('V0051','M000000049','Panadol',5),('V0052','M000000020','Zegerid',7),('V0053','M000000076','Prozac',3),('V0054','M000000094','Anjeso',6),('V0055','M000000067','Desyrel Dividose',10),('V0058','M000000068','Protonix',10),('V0059','M000000095','Qmiiz ODT',2),('V0061','M000000006','Prinivil',6),('V0063','M000000079','Rapiflux',9),('V0064','M000000091','Motrin IB',10),('V0065','M000000130','Daytrana',3),('V0067','M000000021','Zocor',2),('V0068','M000000036','Hysingla ER',2),('V0069','M000000108','Edluar',1),('V0071','M000000116','Inderal XL',5),('V0072','M000000073','Wellbutrin XL',7),('V0073','M000000061','Basaglar',4),('V0074','M000000064','Singulair',7),('V0076','M000000106','Ambien CR',3),('V0077','M000000129','Ritalin',1),('V0078','M000000012','Riomet',7),('V0080','M000000126','Amrix',8),('V0082','M000000029','Gralise',8),('V0083','M000000003','Tirosint',9),('V0084','M000000070','Lexapro',3),('V0085','M000000048','Paracetamol',2),('V0086','M000000035','Oretic',3),('V0089','M000000109','Coumadin',1),('V0090','M000000004','Euthyrox',9),('V0091','M000000023','Cozaar',5),('V0092','M000000139','Zantac',8),('V0093','M000000135','Zithromax',6),('V0094','M000000051','Amoxil',9),('V0095','M000000024','Ventolin',3),('V0097','M000000095','Qmiiz ODT',3),('V0098','M000000045','Arnuity Ellipta',10),('V0100','M000000054','Moxilin',2),('V0101','M000000070','Lexapro',6),('V0103','M000000129','Ritalin',9),('V0104','M000000007','Qbrelis',9),('V0105','M000000019','Omesec',7),('V0108','M000000017','Prilosec',5),('V0110','M000000132','Cymbalta',8),('V0111','M000000006','Prinivil',2),('V0112','M000000133','Drizalma Sprinkle',9),('V0113','M000000066','Oleptro',4),('V0115','M000000025','ProAir HFA',1),('V0116','M000000077','Sarafem',6),('V0119','M000000001','Synthroid',7),('V0123','M000000077','Sarafem',5),('V0124','M000000102','Tramadol Hydrochloride ER',7),('V0125','M000000056','Xanax XR',9),('V0126','M000000135','Zithromax',2),('V0127','M000000104','Ryzolt',3),('V0128','M000000067','Desyrel Dividose',7),('V0130','M000000124','Flexeril',8),('V0131','M000000068','Protonix',10),('V0132','M000000098','Ecotrin',10),('V0133','M000000066','Oleptro',5),('V0134','M000000051','Amoxil',3),('V0137','M000000040','Lasix',10),('V0138','M000000104','Ryzolt',6),('V0143','M000000113','Inderal',10),('V0147','M000000142','Zantac 75',4),('V0148','M000000083','Rayos',4),('V0149','M000000015','Metoprolol Succinate ER',10),('V0150','M000000069','Protonix IV',3),('V0151','M000000082','Deltasone',1),('V0152','M000000046','Flovent Diskus',4),('V0153','M000000122','ProCentra',3),('V0154','M000000124','Flexeril',3),('V0156','M000000079','Rapiflux',3),('V0157','M000000116','Inderal XL',5),('V0163','M000000131','Quillivant XR',9),('V0164','M000000044','Flovent HFA',5),('V0166','M000000055','Xanax',5),('V0167','M000000066','Oleptro',6),('V0169','M000000036','Hysingla ER',10),('V0170','M000000021','Zocor',6),('V0171','M000000025','ProAir HFA',7),('V0177','M000000079','Rapiflux',9),('V0179','M000000067','Desyrel Dividose',8),('V0181','M000000045','Arnuity Ellipta',2),('V0183','M000000103','Tramal',5),('V0184','M000000075','Zyban',7),('V0185','M000000116','Inderal XL',4),('V0186','M000000123','Dextrostat',7),('V0187','M000000069','Protonix IV',3),('V0188','M000000027','Proventil',8),('V0189','M000000053','Apo-Amoxi',10),('V0190','M000000121','Zenzedi',5),('V0192','M000000112','Klonopin Wafer',4),('V0193','M000000011','Glucophage XR',10),('V0194','M000000120','Dexedrine',10),('V0196','M000000002','Levoxyl',6),('V0198','M000000126','Amrix',10);
/*!40000 ALTER TABLE `medrecommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurses` (
  `NurseID` char(5) NOT NULL,
  `NurseName` varchar(25) NOT NULL,
  `Departments` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NurseID`),
  KEY `Departments` (`Departments`),
  CONSTRAINT `Nurses_ibfk_1` FOREIGN KEY (`NurseID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Nurses_ibfk_2` FOREIGN KEY (`Departments`) REFERENCES `departments` (`DepartmentName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES ('E0001','Aadya Garg','Dentistry'),('E0002','Nihal Shah','Cardiology'),('E0008','Tarun Mishra','Gyanecology');
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `PatientID` char(5) NOT NULL,
  `PatientName` varchar(25) NOT NULL,
  `HouseNo` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(20) NOT NULL,
  `District` varchar(30) NOT NULL,
  `PinCode` char(6) NOT NULL,
  `ContactNumber` char(10) NOT NULL,
  `BloodGroup` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') DEFAULT NULL,
  `DOB` date NOT NULL,
  `Gender` enum('M','F','O') DEFAULT NULL,
  `Type` enum('V','B') DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('P0001','Akash Sharma','J-908','Amrapali Zodiac','Ghaziabad','Uttar Pradesh','Ghaziabad','201001','9876897645','','1994-02-15','M','B'),('P0002','Vinod Jain','H-111-F','Prateek Laurel','Amarpur','Haryana','Faridabad','121004','6789954327','B-','1974-05-25','M','B'),('P0003','Sania Verma','N/34','RG Residency','Nauroji Nagar','Delhi','New Delhi','110029','8456634745','A+','1985-01-01','F','V'),('P0004','Drishti Dhyani','P-501','Sector 25','Nauroji Nagar','Delhi','New Delhi','110029','7895674564','O+','2000-03-09','F','B'),('P0005','Kabir Ahuja','D-343','Sector Beta','DLF Phase 3','Haryana','Gurugram','122010','6795846666','O-','1989-12-08','F','B'),('P0006','Karan ','S-90','Gamma Square','Saket','Delhi','South Delhi','110017','8990756774','A+','1960-03-17','M','V'),('P0007','Jay Chattarjee','W098','Kaiman Town','Kalkaji','Delhi','South Delhi','110019','7890456324','B+','1988-01-01','M','V'),('P0008','Nirav Prakash','E-564','Saroj Vihar','Nehru Place','Delhi','South Delhi','110019','6798655365','AB+','1990-10-24','M','V'),('P0009','Rishit Patel','34','Sector 92','Nehru Place','Delhi','South Delhi','110019','7754338523','AB-','2005-08-12','M','B'),('P0010','Rohan Chaudhary','B-58','Gaur Grandeur','Noida','Uttar Pradesh','Gautam Budh Nagar','201301','6795745555','O+','1993-04-28','M','B'),('P0011','Yug','55','Prateek Vistaria','Noida','Uttar Pradesh','Gautam Budh Nagar','201301','8654363245','O+','1972-11-21','M','B'),('P0012','Yash Khatri','21','Colonel Road','Darya Ganj','Delhi','Central Delhi','110002','9998886865','B-','1984-11-25','M','B'),('P0013','Zara','78','Rama Chowk','Guru Gobind Singh Marg','Delhi','Central Delhi','110005','9090454745','A-','1996-09-10','F','V'),('P0014','Sneha Chaubey','H/234','Olive County','Kailash Colony','Delhi','South Delhi','110048','6795646454','O+','1955-06-27','F','B'),('P0015','Tanvi Kaushik','N-09','Cleo County','Kalkaji','Delhi','South Delhi','110019','7896784563','O-','2012-11-28','F','B'),('P0016','Anushka Sehgal','F-96','Jalvayu Nagar','DLF Phase 3','Haryana','Gurugram','122010','7867532356','B+','1980-03-26','F','B'),('P0017','Alisha Bakshi','Z-555','Aravali Aisle','Ghaziabad','Uttar Pradesh','Ghaziabad','201001','9897654357','B+','2000-06-11','F','V'),('P0018','Navya Bajaj','3/11/K','Samaypur Badli','Shivaji Park','Delhi','West Delhi','110026','8888654320','A-','1999-12-30','F','V'),('P0019','Nimit Arora','h-56','Seelanchal','Rajouri Market','Delhi','West Delhi','110027','9099995674','AB+','1969-09-17','M','B'),('P0020','Nirav Arya','N-987','Aero City','Connaught Place','Delhi','Central Delhi','110001','8906784374','O+','1983-06-19','M','B');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutical_companies`
--

DROP TABLE IF EXISTS `pharmaceutical_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutical_companies` (
  `CompanyID` char(5) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Contact_Number` char(10) NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutical_companies`
--

LOCK TABLES `pharmaceutical_companies` WRITE;
/*!40000 ALTER TABLE `pharmaceutical_companies` DISABLE KEYS */;
INSERT INTO `pharmaceutical_companies` VALUES ('C0001','Merck','9456394039'),('C0002','Pfizer','8728394034'),('C0003','Sanofi','9829432344'),('C0004','Bayer','8932479234'),('C0005','GSK','9118998387'),('C0006','AstraZeneca','9071927776'),('C0007','Johnson & Johnson','9024857166'),('C0008','Novartis','8977786555'),('C0009','Roche','8930715945'),('C0010','Gilead Sciences','8883645334');
/*!40000 ALTER TABLE `pharmaceutical_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salts`
--

DROP TABLE IF EXISTS `salts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salts` (
  `SaltID` char(5) NOT NULL,
  `SaltName` varchar(50) NOT NULL,
  PRIMARY KEY (`SaltID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salts`
--

LOCK TABLES `salts` WRITE;
/*!40000 ALTER TABLE `salts` DISABLE KEYS */;
INSERT INTO `salts` VALUES ('S0001','Levothyroxine'),('S0002','Lisinopril'),('S0003','Atorvastatin'),('S0004','Metformin'),('S0005','Amlodipine'),('S0006','Metoprolol'),('S0007','Omeprazole'),('S0008','Simvastatin'),('S0009','Losartan'),('S0010','Albuterol'),('S0011','Gabapentin '),('S0012','Hydrochlorothiazide '),('S0013','Hydrocodone/acetaminophen '),('S0014','Sertraline '),('S0015','Furosemide '),('S0016','Fluticasone '),('S0017','Acetaminophen '),('S0018','Amoxicillin '),('S0019','Alprazolam '),('S0020','Atenolol '),('S0021','Citalopram '),('S0022','Insulin glargine '),('S0023','Montelukast '),('S0024','Trazodone '),('S0025','Pantoprazole '),('S0026','Escitalopram '),('S0027','Pravastatin '),('S0028','Bupropion '),('S0029','Fluoxetine '),('S0030','Carvedilol '),('S0031','Prednisone '),('S0032','Tamsulosin '),('S0033','Potassium '),('S0034','Clopidogrel '),('S0035','Ibuprofen '),('S0036','Meloxicam '),('S0037','Rosuvastatin '),('S0038','Aspirin '),('S0039','Tramadol '),('S0040','Zolpidem '),('S0041','Warfarin '),('S0042','Clonazepam '),('S0043','Propranolol '),('S0044','Glipizide '),('S0045','Dextroamphetamine/amphetamine salts '),('S0046','Cyclobenzaprine '),('S0047','Methylphenidate '),('S0048','Duloxetine '),('S0049','Azithromycin '),('S0050','Ranitidine ');
/*!40000 ALTER TABLE `salts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_reports`
--

DROP TABLE IF EXISTS `test_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_reports` (
  `VisitID` char(5) NOT NULL,
  `TestName` varchar(25) NOT NULL,
  `TestResult` float DEFAULT NULL,
  PRIMARY KEY (`VisitID`,`TestName`),
  KEY `TestName` (`TestName`),
  CONSTRAINT `Test_Reports_ibfk_1` FOREIGN KEY (`VisitID`) REFERENCES `visits` (`VisitID`) ON UPDATE CASCADE,
  CONSTRAINT `Test_Reports_ibfk_2` FOREIGN KEY (`TestName`) REFERENCES `labtests` (`TestName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_reports`
--

LOCK TABLES `test_reports` WRITE;
/*!40000 ALTER TABLE `test_reports` DISABLE KEYS */;
INSERT INTO `test_reports` VALUES ('V0001','Lipid Profile',4.07621),('V0002','Liver Function',1.32583),('V0003','Thyroid Profile',0.762199),('V0005','Diabetic Profile',0.816249),('V0006','Hba1c',4.58239),('V0007','FT4',2.66047),('V0008','FT3',3.26201),('V0009','TSH',3.96288),('V0010','Cortisol',2.55423),('V0011','Diabetic Profile',1.75172),('V0012','Calcium/Serum',2.04816),('V0013','Iron Studies',2.5355),('V0014','Kidpro (KFT)',4.97686),('V0015','FSH-LH',3.90722),('V0016','Luteinizing Hormone (LH)',1.51364),('V0021','Vitamin D Total (25 OH)',3.75781),('V0022','Lipid Profile',2.15622),('V0023','Liver Function',0.968144),('V0024','Thyroid Profile',1.57107),('V0026','Diabetic Profile',2.86945),('V0027','Hba1c',1.48904),('V0030','TSH',1.08362),('V0031','Cortisol',3.22232),('V0032','Diabetic Profile',4.86323),('V0033','Calcium/Serum',2.77642),('V0034','Iron Studies',1.15364),('V0035','Kidpro (KFT)',3.67366),('V0036','FSH-LH',2.78295),('V0037','Luteinizing Hormone (LH)',2.40113),('V0042','Vitamin D Total (25 OH)',2.48085),('V0043','Lipid Profile',2.19253),('V0044','Liver Function',3.32653),('V0045','Thyroid Profile',0.989584),('V0047','Diabetic Profile',2.24877),('V0048','Hba1c',3.32431),('V0051','TSH',2.96885),('V0052','Cortisol',3.81963),('V0053','Diabetic Profile',4.75262),('V0054','Calcium/Serum',1.49965),('V0055','Iron Studies',4.92151),('V0056','Kidpro (KFT)',1.53819),('V0057','FSH-LH',1.29087),('V0058','Luteinizing Hormone (LH)',1.63664),('V0063','Vitamin D Total (25 OH)',3.84278),('V0064','Lipid Profile',3.51119),('V0065','Liver Function',4.453),('V0066','Thyroid Profile',3.94757),('V0068','Diabetic Profile',3.74607),('V0069','Hba1c',1.13426),('V0071','FT3',2.71939),('V0072','TSH',1.41632),('V0073','Cortisol',4.00376),('V0074','Diabetic Profile',1.91458),('V0075','Calcium/Serum',1.68509),('V0076','Iron Studies',1.51464),('V0077','Kidpro (KFT)',2.12768),('V0078','FSH-LH',4.21191),('V0079','Luteinizing Hormone (LH)',3.67807),('V0084','Vitamin D Total (25 OH)',1.88124),('V0085','Lipid Profile',0.64701),('V0086','Liver Function',4.34601),('V0087','Thyroid Profile',2.83377),('V0089','Diabetic Profile',4.59624),('V0090','Hba1c',3.72631),('V0091','FT4',4.27009),('V0093','TSH',1.42568),('V0094','Cortisol',2.3467),('V0095','Diabetic Profile',3.70058),('V0096','Calcium/Serum',2.23446),('V0097','Iron Studies',3.89126),('V0098','Kidpro (KFT)',0.954355),('V0099','FSH-LH',2.68504),('V0100','Luteinizing Hormone (LH)',2.8522),('V0105','Vitamin D Total (25 OH)',4.6835),('V0106','Lipid Profile',1.09136),('V0107','Liver Function',3.16045),('V0108','Thyroid Profile',3.89431),('V0110','Diabetic Profile',1.0106),('V0111','Hba1c',1.58458),('V0114','TSH',1.28957),('V0115','Cortisol',2.70113),('V0116','Diabetic Profile',2.38908),('V0117','Calcium/Serum',3.35902),('V0118','Iron Studies',4.91518),('V0119','Kidpro (KFT)',3.19102),('V0120','FSH-LH',4.01042),('V0121','Luteinizing Hormone (LH)',1.1317),('V0126','Vitamin D Total (25 OH)',3.43565),('V0127','Lipid Profile',1.14152),('V0128','Liver Function',1.24024),('V0129','Thyroid Profile',3.44985),('V0131','Diabetic Profile',4.31112),('V0132','Hba1c',3.04996),('V0135','TSH',4.75903),('V0136','Cortisol',1.37342),('V0137','Diabetic Profile',2.64894),('V0138','Calcium/Serum',1.10136),('V0139','Iron Studies',4.64256),('V0140','Kidpro (KFT)',4.17939),('V0141','FSH-LH',3.01959),('V0142','Luteinizing Hormone (LH)',4.98025),('V0147','Vitamin D Total (25 OH)',4.77598),('V0148','Lipid Profile',1.89282),('V0149','Liver Function',1.07417),('V0150','Thyroid Profile',2.09343),('V0152','Diabetic Profile',1.71562),('V0153','Hba1c',4.79244),('V0156','TSH',4.525),('V0157','Cortisol',4.21106),('V0158','Diabetic Profile',2.92431),('V0159','Calcium/Serum',4.32897),('V0160','Iron Studies',2.77279),('V0161','Kidpro (KFT)',1.50196),('V0162','FSH-LH',0.547552),('V0163','Luteinizing Hormone (LH)',1.44843),('V0168','Vitamin D Total (25 OH)',2.05086),('V0169','Lipid Profile',2.37775),('V0170','Liver Function',0.942736),('V0171','Thyroid Profile',1.96933),('V0173','Diabetic Profile',4.051),('V0174','Hba1c',0.841025),('V0177','TSH',0.849283),('V0178','Cortisol',1.24027),('V0179','Diabetic Profile',0.785666),('V0180','Calcium/Serum',4.94771),('V0181','Iron Studies',2.43925),('V0182','Kidpro (KFT)',1.60696),('V0183','FSH-LH',2.08377),('V0184','Luteinizing Hormone (LH)',1.2632),('V0189','Vitamin D Total (25 OH)',1.40933),('V0190','Lipid Profile',4.88507),('V0191','Liver Function',1.55014),('V0192','Thyroid Profile',0.812924),('V0194','Diabetic Profile',1.31722),('V0195','Hba1c',1.22765),('V0198','TSH',4.84909),('V0199','Cortisol',1.09864),('V0200','Diabetic Profile',1.08571);
/*!40000 ALTER TABLE `test_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testnormalresults`
--

DROP TABLE IF EXISTS `testnormalresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testnormalresults` (
  `TestName` varchar(50) NOT NULL,
  `Gender` enum('M','F','B') NOT NULL,
  `AgeLow` int(11) NOT NULL,
  `AgeHigh` int(11) NOT NULL,
  `RangeLow` int(11) NOT NULL,
  `RangeHigh` int(11) NOT NULL,
  PRIMARY KEY (`TestName`,`Gender`,`AgeLow`),
  CONSTRAINT `TestNormalResults_ibfk_1` FOREIGN KEY (`TestName`) REFERENCES `labtests` (`TestName`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testnormalresults`
--

LOCK TABLES `testnormalresults` WRITE;
/*!40000 ALTER TABLE `testnormalresults` DISABLE KEYS */;
INSERT INTO `testnormalresults` VALUES ('Anti Hepatitis B Core Antigen (AHBC)','M',5,16,3,4),('Anti Hepatitis B Core Antigen (AHBC)','M',17,40,2,4),('Anti Hepatitis B Core Antigen (AHBC)','M',41,80,3,4),('Anti Hepatitis B Core Antigen (AHBC)','F',5,16,2,5),('Anti Hepatitis B Core Antigen (AHBC)','F',17,40,2,4),('Anti Hepatitis B Core Antigen (AHBC)','F',41,80,1,4),('Anti Hepatitis B Core Antigen Total','M',5,16,2,5),('Anti Hepatitis B Core Antigen Total','M',17,40,3,4),('Anti Hepatitis B Core Antigen Total','M',41,80,2,5),('Anti Hepatitis B Core Antigen Total','F',5,16,1,4),('Anti Hepatitis B Core Antigen Total','F',17,40,1,4),('Anti Hepatitis B Core Antigen Total','F',41,80,3,4),('Calcium/Serum','M',5,16,3,5),('Calcium/Serum','M',17,40,2,5),('Calcium/Serum','M',41,80,2,4),('Complete Blood Count (CBC)','M',5,16,2,4),('Complete Blood Count (CBC)','M',17,40,1,5),('Complete Blood Count (CBC)','M',41,80,1,4),('Complete Blood Count (CBC)','F',5,16,1,4),('Complete Blood Count (CBC)','F',17,40,2,5),('Complete Blood Count (CBC)','F',41,80,2,5),('Cortisol','M',5,16,2,5),('Cortisol','M',17,40,1,5),('Cortisol','M',41,80,1,4),('Diabetic Profile','M',5,16,2,5),('Diabetic Profile','M',17,40,2,5),('Diabetic Profile','M',41,80,3,5),('Follicle Stimulating Hormone (FSH)','M',5,16,3,4),('Follicle Stimulating Hormone (FSH)','M',17,40,2,5),('Follicle Stimulating Hormone (FSH)','M',41,80,3,5),('Follicle Stimulating Hormone (FSH)','F',5,16,2,5),('Follicle Stimulating Hormone (FSH)','F',17,40,3,5),('Follicle Stimulating Hormone (FSH)','F',41,80,2,5),('FSH-LH','M',5,16,1,4),('FSH-LH','M',17,40,1,4),('FSH-LH','M',41,80,2,5),('FT3','M',5,16,3,5),('FT3','M',17,40,1,5),('FT3','M',41,80,1,4),('FT4','M',5,16,1,5),('FT4','M',17,40,2,4),('FT4','M',41,80,1,5),('Hba1c','M',5,16,1,4),('Hba1c','M',17,40,2,4),('Hba1c','M',41,80,3,4),('Iron Studies','M',5,16,1,4),('Iron Studies','M',17,40,3,5),('Iron Studies','M',41,80,3,4),('Kidpro (KFT)','M',5,16,2,5),('Kidpro (KFT)','M',17,40,3,4),('Kidpro (KFT)','M',41,80,1,4),('Lipid Profile','M',5,16,2,5),('Lipid Profile','M',17,40,2,4),('Lipid Profile','M',41,80,2,4),('Liver Function','M',5,16,2,5),('Liver Function','M',17,40,2,4),('Liver Function','M',41,80,2,5),('Luteinizing Hormone (LH)','M',5,16,2,4),('Luteinizing Hormone (LH)','M',17,40,2,4),('Luteinizing Hormone (LH)','M',41,80,3,5),('Sex Hormone Binding Globulin (SHBG)','M',5,16,3,5),('Sex Hormone Binding Globulin (SHBG)','M',17,40,2,4),('Sex Hormone Binding Globulin (SHBG)','M',41,80,2,4),('Sex Hormone Binding Globulin (SHBG)','F',5,16,1,4),('Sex Hormone Binding Globulin (SHBG)','F',17,40,1,4),('Sex Hormone Binding Globulin (SHBG)','F',41,80,1,5),('Thyroid Profile','M',5,16,2,5),('Thyroid Profile','M',17,40,2,4),('Thyroid Profile','M',41,80,2,4),('TSH','M',5,16,2,5),('TSH','M',17,40,3,5),('TSH','M',41,80,2,5),('Vitamin D Total (25 OH)','M',5,16,2,5),('Vitamin D Total (25 OH)','M',17,40,1,4),('Vitamin D Total (25 OH)','M',41,80,2,4);
/*!40000 ALTER TABLE `testnormalresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsrecommended`
--

DROP TABLE IF EXISTS `testsrecommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testsrecommended` (
  `VisitID` char(5) NOT NULL,
  `Testname` varchar(50) NOT NULL,
  PRIMARY KEY (`VisitID`,`Testname`),
  KEY `Testname` (`Testname`),
  CONSTRAINT `TestsRecommended_ibfk_1` FOREIGN KEY (`VisitID`) REFERENCES `visits` (`VisitID`) ON UPDATE CASCADE,
  CONSTRAINT `TestsRecommended_ibfk_2` FOREIGN KEY (`Testname`) REFERENCES `labtests` (`TestName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsrecommended`
--

LOCK TABLES `testsrecommended` WRITE;
/*!40000 ALTER TABLE `testsrecommended` DISABLE KEYS */;
INSERT INTO `testsrecommended` VALUES ('V0001','TSH'),('V0002','Liver Function'),('V0003','Diabetic Profile'),('V0004','Luteinizing Hormone (LH)'),('V0005','Calcium/Serum'),('V0006','Cortisol'),('V0007','Sex Hormone Binding Globulin (SHBG)'),('V0008','FT4'),('V0009','Complete Blood Count (CBC)'),('V0010','Calcium/Serum'),('V0011','Vitamin D Total (25 OH)'),('V0012','Calcium/Serum'),('V0013','Iron Studies'),('V0014','Anti Hepatitis B Core Antigen (AHBC)'),('V0015','Vitamin D Total (25 OH)'),('V0016','Thyroid Profile'),('V0017','Liver Function'),('V0018','FT4'),('V0019','Cortisol'),('V0020','Anti Hepatitis B Core Antigen Total'),('V0021','Sex Hormone Binding Globulin (SHBG)'),('V0022','Luteinizing Hormone (LH)'),('V0023','Liver Function'),('V0024','FT4'),('V0025','Lipid Profile'),('V0026','Thyroid Profile'),('V0027','Kidpro (KFT)'),('V0028','Thyroid Profile'),('V0029','Diabetic Profile'),('V0030','Liver Function'),('V0031','FSH-LH'),('V0032','Hba1c'),('V0033','Vitamin D Total (25 OH)'),('V0034','Follicle Stimulating Hormone (FSH)'),('V0035','FT4'),('V0036','Diabetic Profile'),('V0037','Iron Studies'),('V0038','Anti Hepatitis B Core Antigen Total'),('V0039','Anti Hepatitis B Core Antigen (AHBC)'),('V0040','Follicle Stimulating Hormone (FSH)'),('V0041','FT4'),('V0042','Complete Blood Count (CBC)'),('V0043','Kidpro (KFT)'),('V0044','Diabetic Profile'),('V0045','Hba1c'),('V0046','FSH-LH'),('V0047','Vitamin D Total (25 OH)'),('V0048','Calcium/Serum'),('V0049','Liver Function'),('V0050','Diabetic Profile'),('V0051','Diabetic Profile'),('V0052','Liver Function'),('V0053','Liver Function'),('V0054','Lipid Profile'),('V0055','FT4'),('V0056','Liver Function'),('V0057','FSH-LH'),('V0058','Sex Hormone Binding Globulin (SHBG)'),('V0059','Diabetic Profile'),('V0060','Follicle Stimulating Hormone (FSH)'),('V0061','Complete Blood Count (CBC)'),('V0062','Diabetic Profile'),('V0063','FT3'),('V0064','Luteinizing Hormone (LH)'),('V0065','FSH-LH'),('V0066','Hba1c'),('V0067','Sex Hormone Binding Globulin (SHBG)'),('V0068','Hba1c'),('V0069','Anti Hepatitis B Core Antigen (AHBC)'),('V0070','Vitamin D Total (25 OH)'),('V0071','FT4'),('V0072','Vitamin D Total (25 OH)'),('V0073','FSH-LH'),('V0074','Cortisol'),('V0075','Diabetic Profile'),('V0076','Diabetic Profile'),('V0077','Diabetic Profile'),('V0078','Kidpro (KFT)'),('V0079','Sex Hormone Binding Globulin (SHBG)'),('V0080','Vitamin D Total (25 OH)'),('V0081','Anti Hepatitis B Core Antigen Total'),('V0082','Liver Function'),('V0083','Thyroid Profile'),('V0084','Diabetic Profile'),('V0085','Thyroid Profile'),('V0086','Kidpro (KFT)'),('V0087','Vitamin D Total (25 OH)'),('V0088','Hba1c'),('V0089','Calcium/Serum'),('V0090','Diabetic Profile'),('V0091','Liver Function'),('V0092','Liver Function'),('V0093','Luteinizing Hormone (LH)'),('V0094','Luteinizing Hormone (LH)'),('V0095','Anti Hepatitis B Core Antigen Total'),('V0096','Vitamin D Total (25 OH)'),('V0097','Follicle Stimulating Hormone (FSH)'),('V0098','Cortisol'),('V0099','Vitamin D Total (25 OH)'),('V0100','TSH'),('V0101','Diabetic Profile'),('V0102','Diabetic Profile'),('V0103','FSH-LH'),('V0104','Anti Hepatitis B Core Antigen (AHBC)'),('V0105','Hba1c'),('V0106','FT3'),('V0107','Iron Studies'),('V0108','Anti Hepatitis B Core Antigen Total'),('V0109','Calcium/Serum'),('V0110','Sex Hormone Binding Globulin (SHBG)'),('V0111','Hba1c'),('V0112','FT3'),('V0113','Luteinizing Hormone (LH)'),('V0114','Anti Hepatitis B Core Antigen Total'),('V0115','Sex Hormone Binding Globulin (SHBG)'),('V0116','Anti Hepatitis B Core Antigen (AHBC)'),('V0117','Sex Hormone Binding Globulin (SHBG)'),('V0118','FT4'),('V0119','Kidpro (KFT)'),('V0120','Luteinizing Hormone (LH)'),('V0121','Hba1c'),('V0122','Thyroid Profile'),('V0123','Thyroid Profile'),('V0124','Lipid Profile'),('V0125','Sex Hormone Binding Globulin (SHBG)'),('V0126','Cortisol'),('V0127','Calcium/Serum'),('V0128','Liver Function'),('V0129','Follicle Stimulating Hormone (FSH)'),('V0130','Cortisol'),('V0131','Lipid Profile'),('V0132','FT3'),('V0133','Lipid Profile'),('V0134','Diabetic Profile'),('V0135','Vitamin D Total (25 OH)'),('V0136','Lipid Profile'),('V0137','Anti Hepatitis B Core Antigen Total'),('V0138','Anti Hepatitis B Core Antigen (AHBC)'),('V0139','Liver Function'),('V0140','Follicle Stimulating Hormone (FSH)'),('V0141','Lipid Profile'),('V0142','Diabetic Profile'),('V0143','Cortisol'),('V0144','Liver Function'),('V0145','Anti Hepatitis B Core Antigen Total'),('V0146','FSH-LH'),('V0147','Iron Studies'),('V0148','Follicle Stimulating Hormone (FSH)'),('V0149','Luteinizing Hormone (LH)'),('V0150','Cortisol'),('V0151','FT3'),('V0152','Cortisol'),('V0153','Iron Studies'),('V0154','Diabetic Profile'),('V0155','FT3'),('V0156','Sex Hormone Binding Globulin (SHBG)'),('V0157','Anti Hepatitis B Core Antigen Total'),('V0158','Vitamin D Total (25 OH)'),('V0159','Cortisol'),('V0160','Luteinizing Hormone (LH)'),('V0161','Complete Blood Count (CBC)'),('V0162','FSH-LH'),('V0163','Anti Hepatitis B Core Antigen Total'),('V0164','Hba1c'),('V0165','FSH-LH'),('V0166','Lipid Profile'),('V0167','Diabetic Profile'),('V0168','FT3'),('V0169','Anti Hepatitis B Core Antigen Total'),('V0170','Liver Function'),('V0171','Kidpro (KFT)'),('V0172','Iron Studies'),('V0173','Thyroid Profile'),('V0174','FT4'),('V0175','FSH-LH'),('V0176','Vitamin D Total (25 OH)'),('V0177','Sex Hormone Binding Globulin (SHBG)'),('V0178','Luteinizing Hormone (LH)'),('V0179','Hba1c'),('V0180','Kidpro (KFT)'),('V0181','Anti Hepatitis B Core Antigen (AHBC)'),('V0182','Luteinizing Hormone (LH)'),('V0183','FSH-LH'),('V0184','FT3'),('V0185','Diabetic Profile'),('V0186','TSH'),('V0187','Anti Hepatitis B Core Antigen (AHBC)'),('V0188','Liver Function'),('V0189','FT4'),('V0190','TSH'),('V0191','FT4'),('V0192','Thyroid Profile'),('V0193','Liver Function'),('V0194','Luteinizing Hormone (LH)'),('V0195','Iron Studies'),('V0196','Vitamin D Total (25 OH)'),('V0197','Lipid Profile'),('V0198','Kidpro (KFT)'),('V0199','Cortisol'),('V0200','Kidpro (KFT)');
/*!40000 ALTER TABLE `testsrecommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `VisitID` char(5) NOT NULL,
  `PatientID` char(5) DEFAULT NULL,
  `DoctorID` char(5) DEFAULT NULL,
  `VisitDate` date DEFAULT NULL,
  `DoctorRemarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VisitID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `Visits_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `Visits_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES ('V0001','P0019','E0006','2020-01-01','Bypass surgery need to be done'),('V0002','P0018','E0004','2020-01-01','Low on Calcium. Take calicum diets and tablets.'),('V0003','P0014','E0022','2020-01-01','Rashes on skin. Apply lotion daily.'),('V0004','P0009','E0013','2020-01-01','Mild headaches. Zeta-4 daily'),('V0005','P0016','E0013','2020-01-01','Mild headaches. Zeta-4 daily'),('V0006','P0013','E0022','2020-01-01','Skin itching. Use medical soap'),('V0007','P0012','E0013','2020-01-01','Constant sneezes'),('V0008','P0020','E0022','2020-01-01','Symptoms of allergy from coconut oil.'),('V0009','P0017','E0005','2020-01-02','Cough in throat. Gargle daily'),('V0010','P0010','E0019','2020-01-03','Tongue unclean. Rotting molar'),('V0011','P0001','E0019','2020-01-03','Tongue unclean. Rotting molar'),('V0012','P0018','E0019','2020-01-03','Teeth badly damaged in accident'),('V0013','P0018','E0004','2020-01-03','Undernourished.'),('V0014','P0008','E0019','2020-01-04','2 teeth need to be removed'),('V0015','P0005','E0019','2020-01-04','Teeth badly damaged in accident'),('V0016','P0002','E0023','2020-01-04','Refer dentist'),('V0017','P0015','E0023','2020-01-05','Blocked nose. Take Otrivin'),('V0018','P0012','E0013','2020-01-05','Constant sneezes'),('V0019','P0014','E0013','2020-01-05','Mild headaches. Zeta-4 daily'),('V0020','P0014','E0023','2020-01-05','Blocked nose. Take Otrivin'),('V0021','P0016','E0004','2020-01-06','Iron deficit'),('V0022','P0003','E0006','2020-01-06','ECG performed'),('V0023','P0006','E0006','2020-01-06','BP low. Take Telma 40 twice daily'),('V0024','P0006','E0014','2020-01-06','Minor wound on ankle. Dressing daily.'),('V0025','P0005','E0014','2020-01-07','Mild fever and cough. Take paracetamol.'),('V0026','P0019','E0014','2020-01-07','High fever. Take 3 dose of Sumo daily.'),('V0027','P0009','E0016','2020-01-07','Disturbances in growth. Operation reqd.'),('V0028','P0017','E0022','2020-01-07','Symptoms of allergy from coconut oil.'),('V0029','P0020','E0016','2020-01-07','Reguar visit. Embryo growth proper'),('V0030','P0001','E0016','2020-01-07','Utlrasound reqd.'),('V0031','P0007','E0005','2020-01-07','Ear dirty. Get cleaned.'),('V0032','P0013','E0022','2020-01-08','Rashes on skin. Apply lotion daily.'),('V0033','P0015','E0022','2020-01-08','Symptoms of cancer'),('V0034','P0001','E0006','2020-01-08','ECG performed'),('V0035','P0009','E0004','2020-01-08','Iron deficit'),('V0036','P0018','E0014','2020-01-09','Minor wound on ankle. Dressing daily.'),('V0037','P0008','E0005','2020-01-09','Cough in throat. Gargle daily'),('V0038','P0017','E0005','2020-01-09','Cough in throat. Gargle daily'),('V0039','P0008','E0023','2020-01-09','Blocked nose. Take Otrivin'),('V0040','P0020','E0005','2020-01-09','Get eyes tested'),('V0041','P0006','E0023','2020-01-10','Refer dentist'),('V0042','P0011','E0019','2020-01-10','Teeth badly damaged in accident'),('V0043','P0007','E0019','2020-01-11','Use mouth wash daily'),('V0044','P0019','E0019','2020-01-11','Tongue unclean. Rotting molar'),('V0045','P0005','E0006','2020-01-11','High BP.  Take Telma 80 twice daily'),('V0046','P0013','E0019','2020-01-11','Teeth badly damaged in accident'),('V0047','P0001','E0021','2020-01-12','Dirt in eyes. Wash daily with chilled water'),('V0048','P0004','E0004','2020-01-12','Low on Calcium. Take calicum diets and tablets.'),('V0049','P0002','E0021','2020-01-12','Weak eyes. Take vitamin A diet'),('V0050','P0020','E0013','2020-01-12','Constant sneezes'),('V0051','P0010','E0023','2020-01-12','Get eyes tested'),('V0052','P0002','E0006','2020-01-13','Bypass surgery need to be done'),('V0053','P0019','E0006','2020-01-13','ECG performed'),('V0054','P0003','E0006','2020-01-13','Bypass surgery need to be done'),('V0055','P0009','E0016','2020-01-14','Disturbances in growth. Operation reqd.'),('V0056','P0004','E0022','2020-01-14','Rashes on skin. Apply lotion daily.'),('V0057','P0004','E0005','2020-01-14','Cough in throat. Gargle daily'),('V0058','P0012','E0016','2020-01-14','Reguar visit. Embryo growth proper'),('V0059','P0014','E0016','2020-01-14','Utlrasound reqd.'),('V0060','P0002','E0005','2020-01-14','Get eyes tested'),('V0061','P0006','E0016','2020-01-14','Disturbances in growth. Operation reqd.'),('V0062','P0002','E0005','2020-01-14','Cough in throat. Gargle daily'),('V0063','P0008','E0013','2020-01-15','Mild headaches. Zeta-4 daily'),('V0064','P0004','E0022','2020-01-15','Symptoms of cancer'),('V0065','P0006','E0006','2020-01-15','BP low. Take Telma 40 twice daily'),('V0066','P0019','E0006','2020-01-15','High BP.  Take Telma 80 twice daily'),('V0067','P0004','E0022','2020-01-15','Rashes on skin. Apply lotion daily.'),('V0068','P0001','E0019','2020-01-17','Tongue unclean. Rotting molar'),('V0069','P0015','E0023','2020-01-17','Cough in throat. Gargle daily'),('V0070','P0016','E0019','2020-01-18','Use mouth wash daily'),('V0071','P0002','E0019','2020-01-18','Tongue unclean. Rotting molar'),('V0072','P0020','E0006','2020-01-18','ECG performed'),('V0073','P0013','E0013','2020-01-19','Mild headaches. Zeta-4 daily'),('V0074','P0008','E0021','2020-01-19','Glaucoma. Surgery reqd.'),('V0075','P0020','E0006','2020-01-20','Bypass surgery need to be done'),('V0076','P0002','E0021','2020-01-20','Weak eyes. Take vitamin A diet'),('V0077','P0002','E0006','2020-01-20','angioplasty suggested'),('V0078','P0005','E0021','2020-01-20','Eyes weak. Specs reqd.'),('V0079','P0006','E0021','2020-01-20','Glaucoma. Surgery reqd.'),('V0080','P0015','E0006','2020-01-20','angioplasty suggested'),('V0081','P0017','E0021','2020-01-20','Dry eyes. Use tube daily'),('V0082','P0005','E0021','2020-01-20','Dry eyes. Use tube daily'),('V0083','P0002','E0022','2020-01-21','Rashes on skin. Apply lotion daily.'),('V0084','P0012','E0016','2020-01-21','Symptoms of cancer. Visit in 7 days'),('V0085','P0012','E0022','2020-01-21','Skin itching. Use medical soap'),('V0086','P0016','E0022','2020-01-21','Rashes on skin. Apply lotion daily.'),('V0087','P0008','E0005','2020-01-21','Blocked nose. Take Otrivin'),('V0088','P0004','E0005','2020-01-21','Cough in throat. Gargle daily'),('V0089','P0018','E0022','2020-01-21','Symptoms of cancer'),('V0090','P0003','E0022','2020-01-22','Symptoms of allergy from coconut oil.'),('V0091','P0014','E0013','2020-01-22','Constant sneezes'),('V0092','P0020','E0006','2020-01-22','ECG performed'),('V0093','P0013','E0006','2020-01-22','BP low. Take Telma 40 twice daily'),('V0094','P0003','E0022','2020-01-22','Symptoms of cancer'),('V0095','P0014','E0023','2020-01-23','Blocked nose. Take Otrivin'),('V0096','P0012','E0023','2020-01-23','Refer dentist'),('V0097','P0001','E0014','2020-01-23','Undernourished.'),('V0098','P0005','E0023','2020-01-23','Blocked nose. Take Otrivin'),('V0099','P0019','E0014','2020-01-23','Swelling on hands'),('V0100','P0017','E0005','2020-01-23','Refer dentist'),('V0101','P0005','E0005','2020-01-23','Cough in throat. Gargle daily'),('V0102','P0005','E0004','2020-01-24','Iron deficit'),('V0103','P0012','E0019','2020-01-24','2 teeth need to be removed'),('V0104','P0009','E0019','2020-01-24','Use mouth wash daily'),('V0105','P0004','E0004','2020-01-24','Mild fever and cough. Take paracetamol.'),('V0106','P0012','E0006','2020-01-25','angioplasty suggested'),('V0107','P0006','E0006','2020-01-25','Bypass surgery need to be done'),('V0108','P0020','E0021','2020-01-26','Weak eyes. Take vitamin A diet'),('V0109','P0004','E0021','2020-01-26','Cataract. Surgery required'),('V0110','P0010','E0013','2020-01-26','Mild headaches. Zeta-4 daily'),('V0111','P0001','E0021','2020-01-26','Dirt in eyes. Wash daily with chilled water'),('V0112','P0020','E0004','2020-01-26','Low on Calcium. Take calicum diets and tablets.'),('V0113','P0018','E0021','2020-01-27','Eyes weak. Specs reqd.'),('V0114','P0013','E0021','2020-01-27','Cataract. Surgery required'),('V0115','P0008','E0021','2020-01-27','Cataract. Surgery required'),('V0116','P0018','E0021','2020-01-27','Dry eyes. Use tube daily'),('V0117','P0006','E0016','2020-01-28','Utlrasound reqd.'),('V0118','P0003','E0016','2020-01-28','Utlrasound reqd.'),('V0119','P0013','E0016','2020-01-28','Disturbances in growth. Operation reqd.'),('V0120','P0008','E0022','2020-01-28','Rashes on skin. Apply lotion daily.'),('V0121','P0006','E0016','2020-01-28','Disturbances in growth. Operation reqd.'),('V0122','P0019','E0005','2020-01-28','Ear dirty. Get cleaned.'),('V0123','P0013','E0014','2020-01-29','High fever. Take 3 dose of Sumo daily.'),('V0124','P0002','E0013','2020-01-29','Mild headaches. Zeta-4 daily'),('V0125','P0010','E0013','2020-01-29','Mild headaches. Zeta-4 daily'),('V0126','P0003','E0014','2020-01-29','Undernourished.'),('V0127','P0017','E0022','2020-01-29','Rashes on skin. Apply lotion daily.'),('V0128','P0014','E0006','2020-01-29','BP low. Take Telma 40 twice daily'),('V0129','P0018','E0013','2020-01-29','Constant sneezes'),('V0130','P0010','E0013','2020-01-29','Constant sneezes'),('V0131','P0009','E0014','2020-01-29','Low on Calcium. Take calicum diets and tablets.'),('V0132','P0005','E0005','2020-01-30','Ear dirty. Get cleaned.'),('V0133','P0005','E0023','2020-01-30','Blocked nose. Take Otrivin'),('V0134','P0018','E0014','2020-01-30','Iron deficit'),('V0135','P0012','E0023','2020-01-31','Cough in throat. Gargle daily'),('V0136','P0014','E0019','2020-01-31','Teeth badly damaged in accident'),('V0137','P0008','E0004','2020-01-31','Minor wound on ankle. Dressing daily.'),('V0138','P0001','E0004','2020-01-31','Swelling on hands'),('V0139','P0005','E0023','2020-01-31','Cough in throat. Gargle daily'),('V0140','P0007','E0019','2020-01-31','2 teeth need to be removed'),('V0141','P0008','E0023','2020-01-31','Refer dentist'),('V0142','P0012','E0019','2020-01-31','Use mouth wash daily'),('V0143','P0013','E0023','2020-01-31','Ear dirty. Get cleaned.'),('V0144','P0019','E0006','2020-02-01','ECG performed'),('V0145','P0005','E0006','2020-02-01','ECG performed'),('V0146','P0009','E0021','2020-02-02','Cataract. Surgery required'),('V0147','P0002','E0021','2020-02-02','Glaucoma. Surgery reqd.'),('V0148','P0010','E0021','2020-02-02','Cataract. Surgery required'),('V0149','P0011','E0021','2020-02-02','Eyes weak. Specs reqd.'),('V0150','P0018','E0006','2020-02-03','angioplasty suggested'),('V0151','P0011','E0021','2020-02-03','Dry eyes. Use tube daily'),('V0152','P0013','E0016','2020-02-04','Utlrasound reqd.'),('V0153','P0002','E0022','2020-02-04','Symptoms of allergy from coconut oil.'),('V0154','P0001','E0016','2020-02-04','Disturbances in growth. Operation reqd.'),('V0155','P0009','E0014','2020-02-04','Undernourished.'),('V0156','P0009','E0016','2020-02-04','Utlrasound reqd.'),('V0157','P0016','E0016','2020-02-04','Symptoms of cancer. Visit in 7 days'),('V0158','P0011','E0016','2020-02-04','Symptoms of cancer. Visit in 7 days'),('V0159','P0011','E0016','2020-02-04','Utlrasound reqd.'),('V0160','P0014','E0005','2020-02-04','Blocked nose. Take Otrivin'),('V0161','P0019','E0016','2020-02-04','Reguar visit. Embryo growth proper'),('V0162','P0001','E0022','2020-02-05','Symptoms of cancer'),('V0163','P0018','E0022','2020-02-05','Symptoms of allergy from coconut oil.'),('V0164','P0004','E0022','2020-02-05','Symptoms of allergy from coconut oil.'),('V0165','P0009','E0014','2020-02-06','Mild fever and cough. Take paracetamol.'),('V0166','P0018','E0005','2020-02-06','Blocked nose. Take Otrivin'),('V0167','P0012','E0014','2020-02-06','Mild fever and cough. Take paracetamol.'),('V0168','P0002','E0005','2020-02-06','Refer dentist'),('V0169','P0013','E0023','2020-02-06','Refer dentist'),('V0170','P0014','E0004','2020-02-07','Swelling on hands'),('V0171','P0004','E0023','2020-02-08','Refer dentist'),('V0172','P0008','E0019','2020-02-08','Use mouth wash daily'),('V0173','P0016','E0006','2020-02-08','angioplasty suggested'),('V0174','P0001','E0006','2020-02-08','Bypass surgery need to be done'),('V0175','P0013','E0004','2020-02-09','Low on Calcium. Take calicum diets and tablets.'),('V0176','P0019','E0013','2020-02-09','Mild headaches. Zeta-4 daily'),('V0177','P0005','E0023','2020-02-09','Refer dentist'),('V0178','P0008','E0013','2020-02-09','Constant sneezes'),('V0179','P0010','E0013','2020-02-09','Mild headaches. Zeta-4 daily'),('V0180','P0018','E0013','2020-02-09','Mild headaches. Zeta-4 daily'),('V0181','P0005','E0013','2020-02-09','Mild headaches. Zeta-4 daily'),('V0182','P0009','E0006','2020-02-10','Bypass surgery need to be done'),('V0183','P0017','E0004','2020-02-10','Minor wound on ankle. Dressing daily.'),('V0184','P0018','E0021','2020-02-10','Eyes weak. Specs reqd.'),('V0185','P0017','E0016','2020-02-11','Utlrasound reqd.'),('V0186','P0019','E0014','2020-02-11','Iron deficit'),('V0187','P0020','E0016','2020-02-11','Utlrasound reqd.'),('V0188','P0009','E0022','2020-02-11','Rashes on skin. Apply lotion daily.'),('V0189','P0013','E0005','2020-02-11','Get eyes tested'),('V0190','P0016','E0022','2020-02-11','Rashes on skin. Apply lotion daily.'),('V0191','P0015','E0016','2020-02-11','Reguar visit. Embryo growth proper'),('V0192','P0004','E0016','2020-02-11','Symptoms of cancer. Visit in 7 days'),('V0193','P0008','E0006','2020-02-12','BP low. Take Telma 40 twice daily'),('V0194','P0010','E0014','2020-02-12','High fever. Take 3 dose of Sumo daily.'),('V0195','P0016','E0006','2020-02-12','High BP.  Take Telma 80 twice daily'),('V0196','P0014','E0004','2020-02-12','High fever. Take 3 dose of Sumo daily.'),('V0197','P0007','E0023','2020-02-13','Cough in throat. Gargle daily'),('V0198','P0009','E0023','2020-02-13','Cough in throat. Gargle daily'),('V0199','P0012','E0005','2020-02-13','Ear dirty. Get cleaned.'),('V0200','P0014','E0004','2020-02-14','Mild fever and cough. Take paracetamol.');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 19:15:28
