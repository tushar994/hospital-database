-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `hospital`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospital`;

--
-- Table structure for table `AMBULANCE`
--

DROP TABLE IF EXISTS `AMBULANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AMBULANCE` (
  `AMBULANCE_MODEL` varchar(64) NOT NULL,
  `REGISTRATION_STATE` varchar(64) NOT NULL,
  `REGISTRATION_NUMBER` int unsigned NOT NULL,
  `OWNER_ID` int unsigned NOT NULL,
  PRIMARY KEY (`REGISTRATION_STATE`,`REGISTRATION_NUMBER`),
  KEY `OWNER_ID` (`OWNER_ID`),
  CONSTRAINT `AMBULANCE_ibfk_1` FOREIGN KEY (`OWNER_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AMBULANCE`
--

LOCK TABLES `AMBULANCE` WRITE;
/*!40000 ALTER TABLE `AMBULANCE` DISABLE KEYS */;
INSERT INTO `AMBULANCE` VALUES ('Amb_model 1','AP',4352,2),('Amb_model 1','AP',7132,2),('Amb_model 2','AP',9022,2),('Amb_model 1','TS',2134,1),('Amb_model 2','TS',4352,1);
/*!40000 ALTER TABLE `AMBULANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH`
--

DROP TABLE IF EXISTS `BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCH` (
  `BRANCH_NAME` varchar(1024) NOT NULL,
  `BRANCH_PHONE_NO` varchar(64) NOT NULL,
  `BRANCH_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `BRANCH_ADDRESS` varchar(4096) NOT NULL,
  PRIMARY KEY (`BRANCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH`
--

LOCK TABLES `BRANCH` WRITE;
/*!40000 ALTER TABLE `BRANCH` DISABLE KEYS */;
INSERT INTO `BRANCH` VALUES ('Kondapur Branch','1122334455',1,'Some Road, Kondapur, Hyd-500011'),('Gachibowli Branch','6677889900',2,'Some Road, Gachibowli, Hyd-500032');
/*!40000 ALTER TABLE `BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH_HEAD`
--

DROP TABLE IF EXISTS `BRANCH_HEAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCH_HEAD` (
  `BRANCH_ID` int unsigned NOT NULL,
  `MANAGER_ID` int unsigned NOT NULL,
  PRIMARY KEY (`BRANCH_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  CONSTRAINT `BRANCH_HEAD_ibfk_1` FOREIGN KEY (`MANAGER_ID`) REFERENCES `MANAGER` (`STAFF_ID`),
  CONSTRAINT `BRANCH_HEAD_ibfk_2` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH_HEAD`
--

LOCK TABLES `BRANCH_HEAD` WRITE;
/*!40000 ALTER TABLE `BRANCH_HEAD` DISABLE KEYS */;
INSERT INTO `BRANCH_HEAD` VALUES (1,26),(2,27);
/*!40000 ALTER TABLE `BRANCH_HEAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLEANING_STAFF`
--

DROP TABLE IF EXISTS `CLEANING_STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLEANING_STAFF` (
  `STAFF_ID` int unsigned NOT NULL,
  `MANAGER_ID` int unsigned NOT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  CONSTRAINT `CLEANING_STAFF_ibfk_1` FOREIGN KEY (`MANAGER_ID`) REFERENCES `MANAGER` (`STAFF_ID`),
  CONSTRAINT `CLEANING_STAFF_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `EMPLOYEES` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLEANING_STAFF`
--

LOCK TABLES `CLEANING_STAFF` WRITE;
/*!40000 ALTER TABLE `CLEANING_STAFF` DISABLE KEYS */;
INSERT INTO `CLEANING_STAFF` VALUES (18,23),(19,25),(20,25),(31,25);
/*!40000 ALTER TABLE `CLEANING_STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPLAINED`
--

DROP TABLE IF EXISTS `COMPLAINED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPLAINED` (
  `COMPLAINT_NO` int unsigned NOT NULL,
  `PATIENT_AADHAR` varchar(32) NOT NULL,
  `BRANCH_ID` int unsigned NOT NULL,
  PRIMARY KEY (`COMPLAINT_NO`),
  KEY `PATIENT_AADHAR` (`PATIENT_AADHAR`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  CONSTRAINT `COMPLAINED_ibfk_1` FOREIGN KEY (`COMPLAINT_NO`) REFERENCES `COMPLAINTS` (`COMPLAINT_NO`),
  CONSTRAINT `COMPLAINED_ibfk_2` FOREIGN KEY (`PATIENT_AADHAR`) REFERENCES `PATIENT` (`AADHAR_NO`),
  CONSTRAINT `COMPLAINED_ibfk_3` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPLAINED`
--

LOCK TABLES `COMPLAINED` WRITE;
/*!40000 ALTER TABLE `COMPLAINED` DISABLE KEYS */;
INSERT INTO `COMPLAINED` VALUES (1,'aaaa bbbb ccc1',1),(2,'aaaa bbbb ccc1',2),(3,'aaaa bbbb ccc6',2),(4,'aaaa bbbb ccc3',2);
/*!40000 ALTER TABLE `COMPLAINED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPLAINTS`
--

DROP TABLE IF EXISTS `COMPLAINTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPLAINTS` (
  `COMPLAINT_NO` int unsigned NOT NULL AUTO_INCREMENT,
  `COMPLAINT_TEXT` varchar(4096) NOT NULL,
  PRIMARY KEY (`COMPLAINT_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPLAINTS`
--

LOCK TABLES `COMPLAINTS` WRITE;
/*!40000 ALTER TABLE `COMPLAINTS` DISABLE KEYS */;
INSERT INTO `COMPLAINTS` VALUES (1,'Emergency Exit not accessible for handicapped patients.'),(2,'Cleaning staff was not wearing proper uniform.'),(3,'Elevator is out of service.'),(4,'Unhygienic food in the canteen.');
/*!40000 ALTER TABLE `COMPLAINTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT`
--

DROP TABLE IF EXISTS `DEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPT` (
  `BRANCH_ID` int unsigned NOT NULL,
  `DEPARTMENT_NAME` varchar(256) NOT NULL,
  PRIMARY KEY (`BRANCH_ID`,`DEPARTMENT_NAME`),
  CONSTRAINT `DEPT_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT`
--

LOCK TABLES `DEPT` WRITE;
/*!40000 ALTER TABLE `DEPT` DISABLE KEYS */;
INSERT INTO `DEPT` VALUES (1,'Neurology'),(1,'Radiology'),(2,'Cardiology'),(2,'Radiology');
/*!40000 ALTER TABLE `DEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIAGNOSIS`
--

DROP TABLE IF EXISTS `DIAGNOSIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIAGNOSIS` (
  `DIAGNOSIS_TEXT` varchar(512) NOT NULL,
  `REPORT_ID` int unsigned NOT NULL,
  PRIMARY KEY (`DIAGNOSIS_TEXT`,`REPORT_ID`),
  KEY `REPORT_ID` (`REPORT_ID`),
  CONSTRAINT `DIAGNOSIS_ibfk_1` FOREIGN KEY (`REPORT_ID`) REFERENCES `DOCTORS_REPORT` (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIAGNOSIS`
--

LOCK TABLES `DIAGNOSIS` WRITE;
/*!40000 ALTER TABLE `DIAGNOSIS` DISABLE KEYS */;
INSERT INTO `DIAGNOSIS` VALUES ('Patient in vegetative state.',1),('Positive for COVID-19',2),('Brain tumor',3),('Negative for COVID-19',4),('Haemoglobin level low',5),('Vitamin-D levels insufficient',6);
/*!40000 ALTER TABLE `DIAGNOSIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTORS`
--

DROP TABLE IF EXISTS `DOCTORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTORS` (
  `STAFF_ID` int unsigned NOT NULL,
  `MEDICAL_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`STAFF_ID`),
  CONSTRAINT `DOCTORS_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `EMPLOYEES` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTORS`
--

LOCK TABLES `DOCTORS` WRITE;
/*!40000 ALTER TABLE `DOCTORS` DISABLE KEYS */;
INSERT INTO `DOCTORS` VALUES (1,'med_id 1'),(2,'med_id 2'),(3,'med_id 3'),(4,'med_id 4'),(5,'med_id 5'),(6,'med_id 6'),(7,'med_id 7'),(29,'med_id fired');
/*!40000 ALTER TABLE `DOCTORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTORS_REPORT`
--

DROP TABLE IF EXISTS `DOCTORS_REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTORS_REPORT` (
  `REPORT_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `COST_OF_TREATMENT` int unsigned DEFAULT NULL,
  `DATE_OF_REPORT` date NOT NULL,
  PRIMARY KEY (`REPORT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTORS_REPORT`
--

LOCK TABLES `DOCTORS_REPORT` WRITE;
/*!40000 ALTER TABLE `DOCTORS_REPORT` DISABLE KEYS */;
INSERT INTO `DOCTORS_REPORT` VALUES (1,100000,'2018-02-21'),(2,150000,'2020-02-01'),(3,125000,'2020-10-05'),(4,10000,'2020-10-07'),(5,7500,'2020-10-07'),(6,9000,'2020-10-07');
/*!40000 ALTER TABLE `DOCTORS_REPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEES` (
  `STAFF_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `JOB_TYPE` set('DOCTORS','MANAGER','NURSES','TECHNICIAN','CLEANING_STAFF','PHARMACIST') NOT NULL,
  `SALARY` int unsigned NOT NULL,
  `START_DATE` date NOT NULL,
  `TERMINATION_DATE` date DEFAULT NULL,
  `AADHAR_NO` varchar(32) NOT NULL,
  `BRANCH_ID` int unsigned NOT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  KEY `AADHAR_NO` (`AADHAR_NO`),
  CONSTRAINT `EMPLOYEES_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_2` FOREIGN KEY (`AADHAR_NO`) REFERENCES `PERSON_INFO` (`AADHAR_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'DOCTORS',1000000,'2014-07-01',NULL,'0000 0000 0001',1),(2,'DOCTORS',1000000,'2014-07-02',NULL,'0000 0000 0002',1),(3,'DOCTORS',300000,'2014-07-03',NULL,'0000 0000 0003',1),(4,'DOCTORS',500000,'2014-07-04',NULL,'0000 0000 0004',1),(5,'DOCTORS',800000,'2014-07-05',NULL,'0000 0000 0005',2),(6,'DOCTORS',1500000,'2020-11-06',NULL,'jenn ylec ture',2),(7,'DOCTORS',1400000,'2009-08-15',NULL,'1xxx yyyy zzzz',2),(8,'NURSES',10000,'2014-07-06',NULL,'0000 0000 0006',1),(9,'NURSES',10000,'2014-07-07',NULL,'0000 0000 0007',2),(10,'NURSES',20000,'2020-05-02',NULL,'xxx2 yyy2 zzz2',2),(11,'TECHNICIAN',140000,'2014-07-08',NULL,'0000 0000 0008',1),(12,'TECHNICIAN',120000,'2014-07-09',NULL,'0000 0000 0009',1),(13,'TECHNICIAN',77000,'2014-07-10',NULL,'0000 0000 0010',1),(14,'TECHNICIAN',80000,'2014-07-11',NULL,'0000 0000 0011',2),(15,'TECHNICIAN',130000,'2014-07-12',NULL,'1000 0000 0001',1),(16,'TECHNICIAN',100000,'2020-07-13',NULL,'1000 0000 0002',2),(17,'TECHNICIAN',100000,'2009-08-15',NULL,'xxxx yyyy zzzz',2),(18,'CLEANING_STAFF',10000,'2014-07-16',NULL,'1000 0000 0003',1),(19,'CLEANING_STAFF',10000,'2014-07-17',NULL,'1000 0000 0004',2),(20,'CLEANING_STAFF',15000,'2020-05-02',NULL,'3333 3333 3333',2),(21,'PHARMACIST',25000,'2014-07-18',NULL,'1000 0000 0005',1),(22,'PHARMACIST',30000,'2020-07-19',NULL,'1000 0000 0006',2),(23,'MANAGER',700000,'2014-07-22',NULL,'1000 0000 0007',1),(24,'MANAGER',700000,'2014-07-22',NULL,'1000 0000 0008',2),(25,'MANAGER',600000,'2014-07-22',NULL,'1000 0000 0009',2),(26,'MANAGER',1500000,'2014-07-23',NULL,'1000 0000 0010',1),(27,'MANAGER',7777777,'2020-10-06',NULL,'luck ylil girl',2),(28,'PHARMACIST',1500000,'2014-07-23','2020-07-18','1000 0000 0010',2),(29,'DOCTORS',1500000,'2014-07-23','2019-10-31','1000 0000 0010',1),(30,'MANAGER',1500000,'2014-07-23','2020-10-05','1000 0000 0010',2),(31,'CLEANING_STAFF',7000,'2015-07-19','2020-07-18','1000 0000 0006',2),(32,'NURSES',7777,'2020-10-04','2020-10-05','luck ylil girl',2);
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT`
--

DROP TABLE IF EXISTS `EQUIPMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIPMENT` (
  `EQUIPMENT_COMPANY` varchar(64) NOT NULL,
  `EQUIPMENT_MODEL` varchar(64) NOT NULL,
  `EQUIPMENT_ID` varchar(64) NOT NULL,
  `OWNER_ID` int unsigned NOT NULL,
  PRIMARY KEY (`EQUIPMENT_COMPANY`,`EQUIPMENT_MODEL`,`EQUIPMENT_ID`),
  KEY `OWNER_ID` (`OWNER_ID`),
  CONSTRAINT `EQUIPMENT_ibfk_1` FOREIGN KEY (`OWNER_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT`
--

LOCK TABLES `EQUIPMENT` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT` DISABLE KEYS */;
INSERT INTO `EQUIPMENT` VALUES ('Company 1','Model 1-1','a1b2',1),('Company 1','Model 1-1','a2d5',1),('Company 1','Model 1-2','a1C2',1),('Company 2','Model 2-2','p1r8',1),('Company 2','Model 2-3','x1r7',1),('Company 1','Model 1-1','e9f5',2),('Company 2','Model 2-1','e8r0',2),('Company 2','Model 2-3','x1r8',2);
/*!40000 ALTER TABLE `EQUIPMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INPATIENT`
--

DROP TABLE IF EXISTS `INPATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INPATIENT` (
  `EMERGENCY_CONTACT` varchar(64) DEFAULT NULL,
  `DATE_OF_ADMISSION` date NOT NULL,
  `DATE_OF_DISCHARGE` date DEFAULT NULL,
  `AADHAR_NO` varchar(32) NOT NULL,
  PRIMARY KEY (`AADHAR_NO`),
  CONSTRAINT `INPATIENT_ibfk_1` FOREIGN KEY (`AADHAR_NO`) REFERENCES `PATIENT` (`AADHAR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INPATIENT`
--

LOCK TABLES `INPATIENT` WRITE;
/*!40000 ALTER TABLE `INPATIENT` DISABLE KEYS */;
INSERT INTO `INPATIENT` VALUES ('343-435-3457','2015-11-01',NULL,'aaaa bbbb ccc1'),('343-435-3454','2017-11-01',NULL,'aaaa bbbb ccc2'),('343-435-3455','2019-10-30',NULL,'aaaa bbbb ccc3');
/*!40000 ALTER TABLE `INPATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INPATIENT_DIAGNOSIS`
--

DROP TABLE IF EXISTS `INPATIENT_DIAGNOSIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INPATIENT_DIAGNOSIS` (
  `REPORT_ID` int unsigned NOT NULL,
  `DOCTOR_ID` int unsigned NOT NULL,
  `PATIENT_AADHAR_NO` varchar(32) NOT NULL,
  `BRANCH_ID` int unsigned NOT NULL,
  `ROOM_NO` int unsigned NOT NULL,
  PRIMARY KEY (`REPORT_ID`),
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `PATIENT_AADHAR_NO` (`PATIENT_AADHAR_NO`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  KEY `ROOM_NO` (`ROOM_NO`),
  KEY `BRANCH_ID_2` (`BRANCH_ID`,`ROOM_NO`),
  CONSTRAINT `INPATIENT_DIAGNOSIS_ibfk_1` FOREIGN KEY (`REPORT_ID`) REFERENCES `DOCTORS_REPORT` (`REPORT_ID`),
  CONSTRAINT `INPATIENT_DIAGNOSIS_ibfk_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTORS` (`STAFF_ID`),
  CONSTRAINT `INPATIENT_DIAGNOSIS_ibfk_3` FOREIGN KEY (`PATIENT_AADHAR_NO`) REFERENCES `INPATIENT` (`AADHAR_NO`),
  CONSTRAINT `INPATIENT_DIAGNOSIS_ibfk_4` FOREIGN KEY (`BRANCH_ID`, `ROOM_NO`) REFERENCES `ROOM` (`BRANCH_ID`, `ROOM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INPATIENT_DIAGNOSIS`
--

LOCK TABLES `INPATIENT_DIAGNOSIS` WRITE;
/*!40000 ALTER TABLE `INPATIENT_DIAGNOSIS` DISABLE KEYS */;
INSERT INTO `INPATIENT_DIAGNOSIS` VALUES (1,2,'aaaa bbbb ccc1',1,203),(2,4,'aaaa bbbb ccc2',1,201),(3,6,'aaaa bbbb ccc3',2,301);
/*!40000 ALTER TABLE `INPATIENT_DIAGNOSIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANAGER` (
  `STAFF_ID` int unsigned NOT NULL,
  PRIMARY KEY (`STAFF_ID`),
  CONSTRAINT `MANAGER_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `EMPLOYEES` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES (23),(24),(25),(26),(27),(30);
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICINE`
--

DROP TABLE IF EXISTS `MEDICINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEDICINE` (
  `MEDICINE_NAME` varchar(256) NOT NULL,
  `STOCK` int unsigned NOT NULL,
  `BRANCH_ID` int unsigned NOT NULL,
  PRIMARY KEY (`MEDICINE_NAME`,`BRANCH_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  CONSTRAINT `MEDICINE_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICINE`
--

LOCK TABLES `MEDICINE` WRITE;
/*!40000 ALTER TABLE `MEDICINE` DISABLE KEYS */;
INSERT INTO `MEDICINE` VALUES ('AtoZ',10,2),('Cetrizine',42,1),('Cetrizine',40,2),('Paracetamol',15,1),('Paracetamol',23,2);
/*!40000 ALTER TABLE `MEDICINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NURSES`
--

DROP TABLE IF EXISTS `NURSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NURSES` (
  `STAFF_ID` int unsigned NOT NULL,
  `MANAGER_ID` int unsigned NOT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  CONSTRAINT `NURSES_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `EMPLOYEES` (`STAFF_ID`),
  CONSTRAINT `NURSES_ibfk_2` FOREIGN KEY (`MANAGER_ID`) REFERENCES `MANAGER` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NURSES`
--

LOCK TABLES `NURSES` WRITE;
/*!40000 ALTER TABLE `NURSES` DISABLE KEYS */;
INSERT INTO `NURSES` VALUES (8,23),(9,24),(10,24),(32,24);
/*!40000 ALTER TABLE `NURSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPERATES`
--

DROP TABLE IF EXISTS `OPERATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPERATES` (
  `EQUIPMENT_COMPANY` varchar(64) NOT NULL,
  `EQUIPMENT_MODEL` varchar(64) NOT NULL,
  `EQUIPMENT_ID` varchar(64) NOT NULL,
  `STAFF_ID` int unsigned NOT NULL,
  PRIMARY KEY (`EQUIPMENT_COMPANY`,`EQUIPMENT_MODEL`,`EQUIPMENT_ID`,`STAFF_ID`),
  KEY `STAFF_ID` (`STAFF_ID`),
  CONSTRAINT `OPERATES_ibfk_1` FOREIGN KEY (`EQUIPMENT_COMPANY`, `EQUIPMENT_MODEL`, `EQUIPMENT_ID`) REFERENCES `EQUIPMENT` (`EQUIPMENT_COMPANY`, `EQUIPMENT_MODEL`, `EQUIPMENT_ID`),
  CONSTRAINT `OPERATES_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `TECHNICIAN` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPERATES`
--

LOCK TABLES `OPERATES` WRITE;
/*!40000 ALTER TABLE `OPERATES` DISABLE KEYS */;
INSERT INTO `OPERATES` VALUES ('Company 1','Model 1-2','a1C2',11),('Company 2','Model 2-2','p1r8',12),('Company 1','Model 1-1','a1b2',13),('Company 1','Model 1-1','a2d5',13),('Company 1','Model 1-1','e9f5',14),('Company 2','Model 2-3','x1r7',15),('Company 2','Model 2-1','e8r0',16),('Company 2','Model 2-3','x1r8',17);
/*!40000 ALTER TABLE `OPERATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OUTPATIENT`
--

DROP TABLE IF EXISTS `OUTPATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OUTPATIENT` (
  `DATE_OF_CONSULTANCY` date NOT NULL,
  `AADHAR_NO` varchar(32) NOT NULL,
  PRIMARY KEY (`AADHAR_NO`),
  CONSTRAINT `OUTPATIENT_ibfk_1` FOREIGN KEY (`AADHAR_NO`) REFERENCES `PATIENT` (`AADHAR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OUTPATIENT`
--

LOCK TABLES `OUTPATIENT` WRITE;
/*!40000 ALTER TABLE `OUTPATIENT` DISABLE KEYS */;
INSERT INTO `OUTPATIENT` VALUES ('2020-10-07','aaaa bbbb ccc6'),('2020-10-07','aaaa bbbb ccc7'),('2020-10-07','aaaa bbbb ccc8');
/*!40000 ALTER TABLE `OUTPATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OUTPATIENT_DIAGNOSIS`
--

DROP TABLE IF EXISTS `OUTPATIENT_DIAGNOSIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OUTPATIENT_DIAGNOSIS` (
  `REPORT_ID` int unsigned NOT NULL,
  `DOCTOR_ID` int unsigned NOT NULL,
  `PATIENT_AADHAR_NO` varchar(32) NOT NULL,
  PRIMARY KEY (`REPORT_ID`),
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `PATIENT_AADHAR_NO` (`PATIENT_AADHAR_NO`),
  CONSTRAINT `OUTPATIENT_DIAGNOSIS_ibfk_1` FOREIGN KEY (`REPORT_ID`) REFERENCES `DOCTORS_REPORT` (`REPORT_ID`),
  CONSTRAINT `OUTPATIENT_DIAGNOSIS_ibfk_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTORS` (`STAFF_ID`),
  CONSTRAINT `OUTPATIENT_DIAGNOSIS_ibfk_3` FOREIGN KEY (`PATIENT_AADHAR_NO`) REFERENCES `OUTPATIENT` (`AADHAR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OUTPATIENT_DIAGNOSIS`
--

LOCK TABLES `OUTPATIENT_DIAGNOSIS` WRITE;
/*!40000 ALTER TABLE `OUTPATIENT_DIAGNOSIS` DISABLE KEYS */;
INSERT INTO `OUTPATIENT_DIAGNOSIS` VALUES (4,1,'aaaa bbbb ccc6'),(5,5,'aaaa bbbb ccc7'),(6,7,'aaaa bbbb ccc8');
/*!40000 ALTER TABLE `OUTPATIENT_DIAGNOSIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAST_TREATMENT_1`
--

DROP TABLE IF EXISTS `PAST_TREATMENT_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAST_TREATMENT_1` (
  `AADHAR_NO` varchar(32) NOT NULL,
  `DIAGNOSIS` varchar(256) NOT NULL,
  `DATE_OF_DIAGNOSIS` date NOT NULL,
  `TREATMENT` varchar(256) NOT NULL,
  `IN_OUT_PATIENT` set('IN','OUT') NOT NULL,
  PRIMARY KEY (`AADHAR_NO`,`DIAGNOSIS`,`DATE_OF_DIAGNOSIS`,`TREATMENT`),
  KEY `DATE_OF_DIAGNOSIS` (`DATE_OF_DIAGNOSIS`,`TREATMENT`),
  CONSTRAINT `PAST_TREATMENT_1_ibfk_1` FOREIGN KEY (`AADHAR_NO`) REFERENCES `PATIENT` (`AADHAR_NO`),
  CONSTRAINT `PAST_TREATMENT_1_ibfk_2` FOREIGN KEY (`DATE_OF_DIAGNOSIS`, `TREATMENT`) REFERENCES `PAST_TREATMENT_2` (`DATE_OF_DIAGNOSIS`, `TREATMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAST_TREATMENT_1`
--

LOCK TABLES `PAST_TREATMENT_1` WRITE;
/*!40000 ALTER TABLE `PAST_TREATMENT_1` DISABLE KEYS */;
INSERT INTO `PAST_TREATMENT_1` VALUES ('aaaa bbbb ccc1','Sprained ankle','2015-10-30','Bandaging','OUT'),('aaaa bbbb ccc4','Kidney stone','2016-01-01','Kidney stone removal surgery.','IN'),('aaaa bbbb ccc5','Multiple broken bones','2014-06-07','Three casts','IN'),('aaaa bbbb ccc9','Hairline wrist fracture.','2018-06-21','Wrist cast','OUT');
/*!40000 ALTER TABLE `PAST_TREATMENT_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAST_TREATMENT_2`
--

DROP TABLE IF EXISTS `PAST_TREATMENT_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAST_TREATMENT_2` (
  `DATE_OF_DIAGNOSIS` date NOT NULL,
  `TREATMENT` varchar(256) NOT NULL,
  `COST_OF_TREATMENT` int unsigned NOT NULL,
  PRIMARY KEY (`DATE_OF_DIAGNOSIS`,`TREATMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAST_TREATMENT_2`
--

LOCK TABLES `PAST_TREATMENT_2` WRITE;
/*!40000 ALTER TABLE `PAST_TREATMENT_2` DISABLE KEYS */;
INSERT INTO `PAST_TREATMENT_2` VALUES ('2014-06-07','Three casts',12000),('2015-10-30','Bandaging',800),('2016-01-01','Kidney stone removal surgery.',100000),('2018-06-21','Wrist cast',1200);
/*!40000 ALTER TABLE `PAST_TREATMENT_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT`
--

DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT` (
  `AADHAR_NO` varchar(32) NOT NULL,
  `NAME` varchar(256) NOT NULL,
  `DOB` date NOT NULL,
  `PHONE_NO` varchar(32) NOT NULL,
  `GENDER` set('Male','Female','Transgender') NOT NULL,
  `HEIGHT` float unsigned DEFAULT NULL,
  `WEIGHT` float unsigned DEFAULT NULL,
  PRIMARY KEY (`AADHAR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT`
--

LOCK TABLES `PATIENT` WRITE;
/*!40000 ALTER TABLE `PATIENT` DISABLE KEYS */;
INSERT INTO `PATIENT` VALUES ('aaaa bbbb ccc1','Patient01','2000-09-11','110-000-0001','Male',180,79),('aaaa bbbb ccc2','Patient02','2000-09-30','110-000-0002','Male',160,69),('aaaa bbbb ccc3','Patient03','2000-09-12','110-000-0003','Female',173,74),('aaaa bbbb ccc4','Patient04','2000-07-15','110-000-0004','Transgender',169,75),('aaaa bbbb ccc5','Patient05','2000-04-14','110-000-0005','Male',184,109),('aaaa bbbb ccc6','Patient06','2000-08-16','110-000-0006','Male',177,60),('aaaa bbbb ccc7','Patient07','2000-09-19','110-000-0007','Male',159,65),('aaaa bbbb ccc8','Patient08','2000-10-01','110-000-0008','Female',159,68),('aaaa bbbb ccc9','Patient09','2000-12-25','110-000-0009','Female',180,89);
/*!40000 ALTER TABLE `PATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSON_INFO`
--

DROP TABLE IF EXISTS `PERSON_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSON_INFO` (
  `AADHAR_NO` varchar(32) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `PHONE_NO` varchar(32) NOT NULL,
  `DOB` date NOT NULL,
  `GENDER` set('Male','Female','Other') NOT NULL,
  PRIMARY KEY (`AADHAR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSON_INFO`
--

LOCK TABLES `PERSON_INFO` WRITE;
/*!40000 ALTER TABLE `PERSON_INFO` DISABLE KEYS */;
INSERT INTO `PERSON_INFO` VALUES ('0000 0000 0001','Mannequin 1','000-000-0001','1984-06-01','Male'),('0000 0000 0002','Mannequin 2','000-000-0002','1984-06-02','Male'),('0000 0000 0003','Mannequin 3','000-000-0003','1984-06-03','Male'),('0000 0000 0004','Mannequin 4','000-000-0004','1984-06-04','Male'),('0000 0000 0005','Mannequin 5','000-000-0005','1984-06-05','Male'),('0000 0000 0006','Mannequin 6','000-000-0006','1984-06-06','Male'),('0000 0000 0007','Mannequin 7','000-000-0007','1984-06-07','Male'),('0000 0000 0008','Mannequin 8','000-000-0008','1984-06-08','Male'),('0000 0000 0009','Mannequin 9','000-000-0009','1984-06-09','Male'),('0000 0000 0010','Mannequin 10','000-000-0010','1984-06-10','Male'),('0000 0000 0011','Mannequin 11','000-000-0011','1984-06-11','Male'),('1000 0000 0001','Mannequin 12','100-000-0001','1984-06-01','Female'),('1000 0000 0002','Mannequin 13','100-000-0002','1984-06-02','Female'),('1000 0000 0003','Mannequin 14','100-000-0003','1984-06-03','Female'),('1000 0000 0004','Mannequin 15','100-000-0004','1984-06-04','Female'),('1000 0000 0005','Mannequin 16','100-000-0005','1984-06-05','Female'),('1000 0000 0006','Mannequin 17','100-000-0006','1984-06-06','Female'),('1000 0000 0007','Mannequin 18','100-000-0007','1984-06-07','Female'),('1000 0000 0008','Mannequin 19','100-000-0008','1984-06-08','Female'),('1000 0000 0009','Mannequin 20','100-000-0009','1984-06-09','Other'),('1000 0000 0010','Mannequin 21','100-000-0010','1984-06-10','Other'),('1000 0000 0011','Mannequin 22','100-000-0011','1984-06-11','Other'),('1xxx yyyy zzzz','Alex Hamilton','321-456-9999','1972-01-05','Other'),('2xxx yyyy zzzz','Alex Hamilton','321-567-8888','1972-02-06','Male'),('3333 3333 3333','William Butcher','321-456-9999','1982-04-01','Male'),('jenn ylec ture','Jayanti Khatri Lamba','219-213-0843','1995-05-12','Female'),('luck ylil girl','Margaret Marvel','777-777-7777','1992-10-20','Female'),('xxx1 yyy1 zzz1','Gaurav Kumar','907-710-2122','1985-12-30','Male'),('xxx2 yyy2 zzz2','Sonakshi Sinha','909-940-7464','1991-12-03','Female'),('xxxx yyyy zzzz','Bharat Sinha','909-940-7463','1990-11-14','Male');
/*!40000 ALTER TABLE `PERSON_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHARMACIST`
--

DROP TABLE IF EXISTS `PHARMACIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PHARMACIST` (
  `STAFF_ID` int unsigned NOT NULL,
  `MANAGER_ID` int unsigned NOT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  CONSTRAINT `PHARMACIST_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `EMPLOYEES` (`STAFF_ID`),
  CONSTRAINT `PHARMACIST_ibfk_2` FOREIGN KEY (`MANAGER_ID`) REFERENCES `MANAGER` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHARMACIST`
--

LOCK TABLES `PHARMACIST` WRITE;
/*!40000 ALTER TABLE `PHARMACIST` DISABLE KEYS */;
INSERT INTO `PHARMACIST` VALUES (21,23),(22,25),(28,25);
/*!40000 ALTER TABLE `PHARMACIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESCRIPTION`
--

DROP TABLE IF EXISTS `PRESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIPTION` (
  `PRESCRIPTION_TEXT` varchar(512) NOT NULL,
  `REPORT_ID` int unsigned NOT NULL,
  PRIMARY KEY (`PRESCRIPTION_TEXT`,`REPORT_ID`),
  KEY `REPORT_ID` (`REPORT_ID`),
  CONSTRAINT `PRESCRIPTION_ibfk_1` FOREIGN KEY (`REPORT_ID`) REFERENCES `DOCTORS_REPORT` (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESCRIPTION`
--

LOCK TABLES `PRESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRESCRIPTION` DISABLE KEYS */;
INSERT INTO `PRESCRIPTION` VALUES ('Prescription 1',1),('Prescription 2',2),('Prescription 3',3),('Prescription 4',4),('Prescription 5',5),('Prescription 6',6);
/*!40000 ALTER TABLE `PRESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RELEVANT_MEDICAL_HISTORY`
--

DROP TABLE IF EXISTS `RELEVANT_MEDICAL_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RELEVANT_MEDICAL_HISTORY` (
  `TEXT` varchar(512) NOT NULL,
  `REPORT_ID` int unsigned NOT NULL,
  PRIMARY KEY (`TEXT`,`REPORT_ID`),
  KEY `REPORT_ID` (`REPORT_ID`),
  CONSTRAINT `RELEVANT_MEDICAL_HISTORY_ibfk_1` FOREIGN KEY (`REPORT_ID`) REFERENCES `DOCTORS_REPORT` (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RELEVANT_MEDICAL_HISTORY`
--

LOCK TABLES `RELEVANT_MEDICAL_HISTORY` WRITE;
/*!40000 ALTER TABLE `RELEVANT_MEDICAL_HISTORY` DISABLE KEYS */;
INSERT INTO `RELEVANT_MEDICAL_HISTORY` VALUES ('Relevant history 1',1),('Relevant history 2',2),('Relevant history 3',3),('Relevant history 4',4),('Relevant history 5',5),('Relevant history 6',6);
/*!40000 ALTER TABLE `RELEVANT_MEDICAL_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOM`
--

DROP TABLE IF EXISTS `ROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROOM` (
  `ROOM_NO` int unsigned NOT NULL,
  `BRANCH_ID` int unsigned NOT NULL,
  PRIMARY KEY (`ROOM_NO`,`BRANCH_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  CONSTRAINT `ROOM_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `BRANCH` (`BRANCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOM`
--

LOCK TABLES `ROOM` WRITE;
/*!40000 ALTER TABLE `ROOM` DISABLE KEYS */;
INSERT INTO `ROOM` VALUES (201,1),(203,1),(204,1),(301,1),(203,2),(204,2),(301,2),(302,2),(303,2);
/*!40000 ALTER TABLE `ROOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TECHNICIAN`
--

DROP TABLE IF EXISTS `TECHNICIAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TECHNICIAN` (
  `STAFF_ID` int unsigned NOT NULL,
  `SENIOR_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `SENIOR_ID` (`SENIOR_ID`),
  CONSTRAINT `TECHNICIAN_ibfk_1` FOREIGN KEY (`STAFF_ID`) REFERENCES `EMPLOYEES` (`STAFF_ID`),
  CONSTRAINT `TECHNICIAN_ibfk_2` FOREIGN KEY (`SENIOR_ID`) REFERENCES `TECHNICIAN` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TECHNICIAN`
--

LOCK TABLES `TECHNICIAN` WRITE;
/*!40000 ALTER TABLE `TECHNICIAN` DISABLE KEYS */;
INSERT INTO `TECHNICIAN` VALUES (11,NULL),(15,NULL),(16,NULL),(17,NULL),(12,11),(13,12),(14,16);
/*!40000 ALTER TABLE `TECHNICIAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST`
--

DROP TABLE IF EXISTS `TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEST` (
  `REPORT_ID` int unsigned NOT NULL,
  `TEST_CONDUCTED` varchar(128) NOT NULL,
  `TEST_DATE_AND_TIME` datetime NOT NULL,
  `TEST_RESULT` varchar(256) NOT NULL,
  PRIMARY KEY (`REPORT_ID`,`TEST_CONDUCTED`,`TEST_DATE_AND_TIME`,`TEST_RESULT`),
  CONSTRAINT `TEST_ibfk_1` FOREIGN KEY (`REPORT_ID`) REFERENCES `DOCTORS_REPORT` (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST`
--

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
INSERT INTO `TEST` VALUES (1,'Brain wave activity measurement.','2018-02-21 13:46:00','Inactive'),(2,'COVID-19','2020-02-01 03:21:00','Positive'),(3,'CAT scan','2020-09-30 17:55:00','Diminished brain tumor'),(4,'COVID-19','2020-10-07 12:07:00','Negative'),(5,'Blood Profiling','2020-10-07 14:00:00','Iron low'),(6,'Vitamin-D and hormone testing','2020-10-07 20:35:00','Vitamin-D low');
/*!40000 ALTER TABLE `TEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_UNDER`
--

DROP TABLE IF EXISTS `WORKS_UNDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKS_UNDER` (
  `BRANCH_ID` int unsigned NOT NULL,
  `DEPARTMENT_NAME` varchar(256) NOT NULL,
  `DOCTOR_ID` int unsigned NOT NULL,
  PRIMARY KEY (`DOCTOR_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`,`DEPARTMENT_NAME`),
  CONSTRAINT `WORKS_UNDER_ibfk_1` FOREIGN KEY (`BRANCH_ID`, `DEPARTMENT_NAME`) REFERENCES `DEPT` (`BRANCH_ID`, `DEPARTMENT_NAME`),
  CONSTRAINT `WORKS_UNDER_ibfk_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTORS` (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_UNDER`
--

LOCK TABLES `WORKS_UNDER` WRITE;
/*!40000 ALTER TABLE `WORKS_UNDER` DISABLE KEYS */;
INSERT INTO `WORKS_UNDER` VALUES (1,'Neurology',1),(1,'Neurology',2),(1,'Radiology',3),(1,'Radiology',4),(1,'Radiology',29),(2,'Cardiology',5),(2,'Cardiology',6),(2,'Radiology',7);
/*!40000 ALTER TABLE `WORKS_UNDER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-06  5:40:59
