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
-- Table structure for table `bed_assignment`
--

DROP TABLE IF EXISTS `bed_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_assignment` (
  `bed_assignment_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_till` date NOT NULL,
  `ward_type` varchar(20) NOT NULL,
  `patient_UPI` char(6) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  PRIMARY KEY (`bed_assignment_id`),
  KEY `IX_Rel_pat_bedassigned` (`patient_UPI`,`doctor_id`,`event_date`),
  CONSTRAINT `in_patient_has_bedassigned` FOREIGN KEY (`patient_UPI`, `doctor_id`, `event_date`) REFERENCES `patient_event` (`patient_UPI`, `doctor_id`, `event_date`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_assignment`
--

LOCK TABLES `bed_assignment` WRITE;
/*!40000 ALTER TABLE `bed_assignment` DISABLE KEYS */;
INSERT INTO `bed_assignment` VALUES (101,'2001-11-05','2001-11-08','General','089b1a',116079,'2001-11-02'),(102,'2001-11-09','2001-11-10','ICU','089b1a',116079,'2001-11-02'),(103,'2010-12-15','2001-12-16','ICU','6fdb24',116078,'2010-12-15'),(104,'2010-12-17','2001-12-18','General','6fdb24',116078,'2010-12-15');
/*!40000 ALTER TABLE `bed_assignment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-20 22:09:02
