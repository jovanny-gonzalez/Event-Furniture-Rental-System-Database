-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: furniture_rental_system
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bookingID` int NOT NULL,
  `Customer_customer_ID` int NOT NULL,
  `Event_EventID` int DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `fk_booking_Customer_idx` (`Customer_customer_ID`),
  KEY `fk_booking_Event1_idx` (`Event_EventID`),
  CONSTRAINT `fk_booking_Customer` FOREIGN KEY (`Customer_customer_ID`) REFERENCES `customer` (`customer_ID`),
  CONSTRAINT `fk_booking_Event1` FOREIGN KEY (`Event_EventID`) REFERENCES `event` (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,10,9,50),(2,5,8,20),(3,8,7,56),(4,9,10,100),(5,3,5,17),(6,2,3,26),(7,1,2,32),(8,7,7,49),(9,6,1,100),(10,4,4,70);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_has_furniture`
--

DROP TABLE IF EXISTS `booking_has_furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_has_furniture` (
  `bf_id` varchar(45) NOT NULL,
  `Furniture_furniture_ID` int NOT NULL,
  `booking_bookingID` int DEFAULT NULL,
  PRIMARY KEY (`bf_id`),
  KEY `fk_booking_has_Furniture_Furniture1_idx` (`Furniture_furniture_ID`),
  KEY `fk_booking_has_Furniture_booking1_idx` (`booking_bookingID`),
  CONSTRAINT `fk_booking_has_Furniture_booking1` FOREIGN KEY (`booking_bookingID`) REFERENCES `booking` (`bookingID`),
  CONSTRAINT `fk_booking_has_Furniture_Furniture1` FOREIGN KEY (`Furniture_furniture_ID`) REFERENCES `furniture` (`furniture_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_has_furniture`
--

LOCK TABLES `booking_has_furniture` WRITE;
/*!40000 ALTER TABLE `booking_has_furniture` DISABLE KEYS */;
INSERT INTO `booking_has_furniture` VALUES ('BF01',1,6),('BF02',3,7),('BF03',2,10),('BF04',4,8),('BF05',5,9),('BF06',6,1),('BF07',7,2),('BF08',8,3),('BF09',9,4),('BF10',10,5);
/*!40000 ALTER TABLE `booking_has_furniture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_ID` int NOT NULL,
  `customer_email` varchar(45) NOT NULL,
  `customer_phone` varchar(45) NOT NULL,
  `contract` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'thegreg@gregmail.com','777-359-7212','Day'),(2,'tomEnrich@gregmail.com','787-593-5555','Day'),(3,'timmytimmerson@yallow.com','895-895-8956','Month'),(4,'HughMann@yallow.com','123-456-7891','Week'),(5,'FinnMann@yallow.com','121-232-5598','Month'),(6,'fishEnriched@gorg.com','555-555-5554','Day'),(7,'cheesemanlives@gregmail.com','897-555-6698','Day'),(8,'Jenny2235@gorg.com','489-867-5309','Week'),(9,'horgborg59@grog.com','111-256-8989','Day'),(10,'johntbusiness@gregmail.com','512-468-7878','Week');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `EventID` int NOT NULL,
  `EventDate` varchar(45) NOT NULL,
  `EventType` varchar(45) NOT NULL,
  `EventLocation` varchar(45) NOT NULL,
  PRIMARY KEY (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'2025-09-14','Baptism','1345 S. Carson St.'),(2,'2025-10-11','Baptism','1345 S. Carson St.'),(3,'2025-10-12','Birthday','1345 S. Carson St.'),(4,'2025-10-13','Birthday','1203 S. Carson St.'),(5,'2025-10-15','Graduation','1345 S. Carson St.'),(6,'2025-10-16','Graduation','1345 S. Carson St.'),(7,'2025-10-20','Party','1203 S. Carson St.'),(8,'2025-10-21','Party','1203 S. Carson St.'),(9,'2025-10-21','Party','1203 S. Carson St.'),(10,'2025-10-22','Party','1345 S. Carson St.');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture` (
  `furniture_ID` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `rental_price` int NOT NULL,
  PRIMARY KEY (`furniture_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture`
--

LOCK TABLES `furniture` WRITE;
/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
INSERT INTO `furniture` VALUES (1,'Table',2,200),(2,'Table',1,100),(3,'Chair',3,75),(4,'Sofa',4,1000),(5,'Sofa',2,500),(6,'Cabinet',1,200),(7,'Table',3,300),(8,'Chair',4,100),(9,'Chair',8,200),(10,'Table',1,300);
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-29 11:44:00
