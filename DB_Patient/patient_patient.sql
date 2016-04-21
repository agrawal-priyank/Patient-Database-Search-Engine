-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: patient
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_UPI` char(6) NOT NULL,
  `patient_fname` varchar(20) NOT NULL,
  `patient_lname` varchar(20) NOT NULL,
  `patient_dob` date NOT NULL,
  `gender` char(1) NOT NULL,
  `disability_status` char(1) NOT NULL,
  `cell_phone` char(10) NOT NULL,
  `emergency_contact_name` varchar(40) NOT NULL,
  `emergency_contact_number` char(10) NOT NULL,
  `emergency_contact_relationship` varchar(20) NOT NULL,
  `patient_mname` varchar(20) DEFAULT NULL,
  `blood_group` char(3) DEFAULT NULL,
  `home_phone` char(10) DEFAULT NULL,
  `marital_status` varchar(10) DEFAULT NULL,
  `patient_pcp_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`patient_UPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('089b1a','Ankur','Bag','1995-02-17','M','N','5487986532','Rohit','8754875487','Friend','A','AB+','5487986532','Single','Vince'),('6fdb24','Rohit','Singh','1992-02-15','M','N','8898655421','Priyank','8798653221','Brother','A','A+','8798655421','Single','Vince'),('c0bb51','Zalak','Shah','1990-02-02','M','Y','8798655421','Prachi','8798655421','Wife','Z','AB+','8798655421','Married','Vince');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-20 22:09:00
