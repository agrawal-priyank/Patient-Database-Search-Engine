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
-- Table structure for table `health_care_proxy`
--

DROP TABLE IF EXISTS `health_care_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `health_care_proxy` (
  `patient_UPI` char(6) NOT NULL,
  `primary_agent_name` varchar(40) NOT NULL,
  `primary_phone_number` char(10) NOT NULL,
  `primary_privileges` varchar(20) NOT NULL,
  `primary_start_date` date DEFAULT NULL,
  `primary_end_date` date DEFAULT NULL,
  `secondary_agent_name` varchar(40) DEFAULT NULL,
  `secondary_phone_number` char(10) DEFAULT NULL,
  `secondary_privileges` varchar(20) DEFAULT NULL,
  `secondary_start_date` date DEFAULT NULL,
  `secondary_end_date` date DEFAULT NULL,
  PRIMARY KEY (`patient_UPI`),
  CONSTRAINT `patient_has_healthproxy` FOREIGN KEY (`patient_UPI`) REFERENCES `patient` (`patient_UPI`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_care_proxy`
--

LOCK TABLES `health_care_proxy` WRITE;
/*!40000 ALTER TABLE `health_care_proxy` DISABLE KEYS */;
INSERT INTO `health_care_proxy` VALUES ('089b1a','Priyank','8754875487','Platinum','2016-02-02','2017-02-02','Sabrish','2154986532','Silver','2017-02-02','2018-02-02'),('6fdb24','Ankur','8798655487','Silver','2015-05-05','2017-05-05','Sabrish','8798655421','Platinum','2014-06-06','2017-06-06'),('c0bb51','Rohit','8754998655','Silver','2015-02-02','2014-12-12','Raj','8787878787','Platinum','2015-08-08','2017-05-06');
/*!40000 ALTER TABLE `health_care_proxy` ENABLE KEYS */;
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
