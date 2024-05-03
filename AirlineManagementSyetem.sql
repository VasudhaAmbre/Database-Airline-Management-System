CREATE DATABASE  IF NOT EXISTS `airlinems` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airlinems`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: airlinems
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraft_code` varchar(10) NOT NULL,
  `model` varchar(50) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  PRIMARY KEY (`aircraft_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('A320','Airbus A320','Airbus'),('A330','Airbus A330','Airbus'),('A350','Airbus A350','Airbus'),('A380','Airbus A380','Airbus'),('B747','Boeing 747','Boeing'),('B777','Boeing 777','Boeing'),('B787','Boeing 787','Boeing'),('CRJ900','Bombardier CRJ900','Bombardier'),('E190','Embraer E190','Embraer'),('MD90','McDonnell Douglas MD-90','McDonnell Douglas');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlines` (
  `airline_id` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
INSERT INTO `airlines` VALUES ('AF','Air France'),('AI','Air India'),('ANA','All Nippon Airways'),('BA','British Airways'),('DL','Delta Air Lines'),('EMI','Emirates'),('IND','Indian Airlines'),('QTR','Qatar Airways'),('SAA','South African Airways'),('UA','United Airlines');
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlinesinfo`
--

DROP TABLE IF EXISTS `airlinesinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlinesinfo` (
  `airline_id` varchar(3) NOT NULL,
  `founding_year` int DEFAULT NULL,
  `headquarters` varchar(100) DEFAULT NULL,
  `contact_information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`airline_id`),
  CONSTRAINT `airlinesinfo_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlinesinfo`
--

LOCK TABLES `airlinesinfo` WRITE;
/*!40000 ALTER TABLE `airlinesinfo` DISABLE KEYS */;
INSERT INTO `airlinesinfo` VALUES ('AF',1933,'Paris, France','info@airfrance.com'),('AI',1932,'New Delhi, India','info@airindia.in'),('ANA',1952,'Tokyo, Japan','info@ana.co.jp'),('BA',1974,'London, UK','info@ba.com'),('DL',1924,'Atlanta, USA','info@delta.com'),('EMI',1985,'Dubai, UAE','info@emirates.com'),('IND',1953,'New Delhi, India','info@indianairlines.com'),('QTR',1993,'Doha, Qatar','info@qatarairways.com'),('SAA',1934,'Johannesburg, South Africa','info@flysaa.com'),('UA',1926,'Chicago, USA','info@united.com');
/*!40000 ALTER TABLE `airlinesinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `airport_code` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`airport_code`),
  KEY `fk_city_airport` (`city`),
  CONSTRAINT `fk_city_airport` FOREIGN KEY (`city`) REFERENCES `cities` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES ('ATL','Hartsfield-Jackson Atlanta International Airport','Atlanta'),('CDG','Charles de Gaulle Airport','Paris'),('DEL','Indira Gandhi International Airport','New Delhi'),('DOH','Hamad International Airport','Doha'),('DXB','Dubai International Airport','Dubai'),('HND','Haneda Airport','Tokyo'),('JFK','John F. Kennedy International Airport','New York'),('JNB','O.R. Tambo International Airport','Johannesburg'),('LAX','Los Angeles International Airport','Los Angeles'),('LHR','Heathrow Airport','London'),('ORD','O Hare International Airport','Chicago');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingdetails`
--

DROP TABLE IF EXISTS `bookingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingdetails` (
  `booking_id` int NOT NULL,
  `passenger_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `booked_at` datetime NOT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_passenger_id_booking` (`passenger_id`),
  KEY `idx_flight_id_booking` (`flight_id`),
  CONSTRAINT `fk_flight_id_booking` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_passenger_id_booking` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingdetails`
--

LOCK TABLES `bookingdetails` WRITE;
/*!40000 ALTER TABLE `bookingdetails` DISABLE KEYS */;
INSERT INTO `bookingdetails` VALUES (1,1,1,'2023-12-01 10:00:00','Paid','Credit Card','confirmed'),(2,2,2,'2023-12-02 12:00:00','Paid','Cash','confirmed'),(3,3,3,'2023-12-03 14:00:00','Paid','Debit Card','confirmed'),(4,4,4,'2023-12-04 16:00:00','Pending','Credit Card','cancelled'),(5,5,5,'2023-12-05 18:00:00','Pending','Cash','cancelled'),(6,6,6,'2023-12-06 20:00:00','Pending','Debit Card','cancelled'),(7,7,7,'2023-12-07 22:00:00','Paid','Credit Card','confirmed'),(8,8,8,'2023-12-08 10:00:00','Pending','Cash','cancelled'),(9,9,9,'2023-12-09 12:00:00','Paid','Debit Card','confirmed'),(10,10,10,'2023-12-10 14:00:00','Pending','Credit Card','cancelled');
/*!40000 ALTER TABLE `bookingdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_booking_status_update` BEFORE UPDATE ON `bookingdetails` FOR EACH ROW BEGIN
    IF NEW.payment_status = 'Paid' THEN
        SET NEW.booking_status = 'confirmed';
    ELSE
        SET NEW.booking_status = 'cancelled';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `idx_city_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'New Delhi','India'),(2,'Dubai','United Arab Emirates'),(3,'Johannesburg','South Africa'),(4,'Tokyo','Japan'),(5,'Doha','Qatar'),(6,'London','United Kingdom'),(7,'Chicago','United States'),(8,'Paris','France'),(9,'Atlanta','United States'),(10,'Los Angeles','United States'),(11,'New York','United States');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `confirmedbookings`
--

DROP TABLE IF EXISTS `confirmedbookings`;
/*!50001 DROP VIEW IF EXISTS `confirmedbookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `confirmedbookings` AS SELECT 
 1 AS `booking_id`,
 1 AS `passenger_id`,
 1 AS `flight_id`,
 1 AS `booked_at`,
 1 AS `payment_status`,
 1 AS `payment_method`,
 1 AS `booking_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crewmembers`
--

DROP TABLE IF EXISTS `crewmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crewmembers` (
  `crew_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`crew_id`),
  KEY `idx_emp_id_crew` (`emp_id`),
  KEY `idx_flight_id_crew` (`flight_id`),
  CONSTRAINT `fk_emp_id_crew` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flight_id_crew` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crewmembers`
--

LOCK TABLES `crewmembers` WRITE;
/*!40000 ALTER TABLE `crewmembers` DISABLE KEYS */;
INSERT INTO `crewmembers` VALUES (1,1,1,'Pilot'),(2,2,2,'Flight Attendant'),(3,3,3,'Engineer'),(4,4,4,'Pilot'),(5,5,5,'Crew Manager'),(6,6,6,'Ground Staff'),(7,7,7,'Pilot'),(8,8,8,'Flight Attendant'),(9,9,9,'Engineer'),(10,10,10,'Crew Manager');
/*!40000 ALTER TABLE `crewmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `airline_id` varchar(3) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `fk_airline_id_emp` (`airline_id`),
  KEY `fk_manager_id_emp` (`manager_id`),
  KEY `idx_emp_phone` (`phone`),
  KEY `idx_user_id_emp` (`user_id`),
  CONSTRAINT `fk_airline_id_emp` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`airline_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_manager_id_emp` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id_emp` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `employees_chk_1` CHECK (regexp_like(`phone`,_utf8mb4'^\\+\\d{2}-\\d{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,101,'Ravi','Verma','Pilot','+91-9876543210','2020-01-15','IND',NULL),(2,102,'Anjali','Kapoor','Flight Attendant','+91-8765432109','2019-03-20','BA',1),(3,103,'Suresh','Gupta','Engineer','+91-7654321098','2021-05-25','SAA',2),(4,104,'Neha','Singh','Pilot','+91-6543210987','2018-09-20','EMI',NULL),(5,105,'Amit','Patil','Crew Manager','+91-5432109876','2017-12-15','UA',3),(6,106,'Priya','Sharma','Ground Staff','+91-4321098765','2016-03-28','IND',4),(7,107,'Vikram','Reddy','Pilot','+91-3210987654','2015-07-12','BA',NULL),(8,108,'Zoya','Bose','Flight Attendant','+91-2109876543','2014-09-25','SAA',5),(9,109,'Rahul','Kumar','Engineer','+91-1098765432','2022-04-18','EMI',6),(10,110,'Nina','Malik','Crew Manager','+91-9876543897','2013-11-01','UA',7);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_scheduling`
--

DROP TABLE IF EXISTS `flight_scheduling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_scheduling` (
  `flight_id` int NOT NULL,
  `aircraft_code` varchar(10) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  PRIMARY KEY (`flight_id`,`aircraft_code`),
  KEY `idx_flight_id_fs` (`flight_id`),
  KEY `idx_aircraft_code_fs` (`aircraft_code`),
  CONSTRAINT `fk_aircraft_code_fs` FOREIGN KEY (`aircraft_code`) REFERENCES `aircraft` (`aircraft_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_flight_id_fs` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_scheduling`
--

LOCK TABLES `flight_scheduling` WRITE;
/*!40000 ALTER TABLE `flight_scheduling` DISABLE KEYS */;
INSERT INTO `flight_scheduling` VALUES (1,'B777','2023-12-15 08:00:00','2023-12-15 10:00:00'),(2,'A380','2023-12-15 12:00:00','2023-12-15 16:00:00'),(3,'A330','2023-12-15 14:00:00','2023-12-15 18:00:00'),(4,'B787','2023-12-15 16:00:00','2023-12-15 20:00:00'),(5,'A350','2023-12-15 18:00:00','2023-12-15 22:00:00'),(6,'B747','2023-12-16 10:00:00','2023-12-16 14:00:00'),(7,'A320','2023-12-16 12:00:00','2023-12-16 16:00:00'),(8,'E190','2023-12-16 14:00:00','2023-12-16 18:00:00'),(9,'MD90','2023-12-16 16:00:00','2023-12-16 20:00:00'),(10,'CRJ900','2023-12-16 18:00:00','2023-12-16 22:00:00');
/*!40000 ALTER TABLE `flight_scheduling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightdetails`
--

DROP TABLE IF EXISTS `flightdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightdetails` (
  `flight_id` int NOT NULL,
  `aircraft_type` varchar(50) DEFAULT NULL,
  `departure_gate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  CONSTRAINT `flightdetails_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightdetails`
--

LOCK TABLES `flightdetails` WRITE;
/*!40000 ALTER TABLE `flightdetails` DISABLE KEYS */;
INSERT INTO `flightdetails` VALUES (1,'Boeing 777','Gate A1'),(2,'Airbus A380','Gate B2'),(3,'Airbus A330','Gate C3'),(4,'Boeing 787','Gate D4'),(5,'Airbus A350','Gate E5'),(6,'Boeing 747','Gate F6'),(7,'Airbus A320','Gate G7'),(8,'Embraer E190','Gate H8'),(9,'McDonnell Douglas MD-90','Gate I9'),(10,'Bombardier CRJ900','Gate J10');
/*!40000 ALTER TABLE `flightdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flight_id` int NOT NULL,
  `airline_id` varchar(3) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `class` varchar(20) NOT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `airline_id` (`airline_id`),
  KEY `idx_airline_id_flights` (`airline_id`),
  CONSTRAINT `fk_airline_id_flights` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`airline_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'IND','2023-12-15 08:00:00','2023-12-15 10:00:00','On Time',300.00,'Economy'),(2,'EMI','2023-12-15 12:00:00','2023-12-15 16:00:00','Delayed',800.50,'Business'),(3,'SAA','2023-12-15 14:00:00','2023-12-15 18:00:00','On Time',550.75,'Economy'),(4,'ANA','2023-12-15 16:00:00','2023-12-15 20:00:00','On Time',700.25,'Business'),(5,'QTR','2023-12-15 18:00:00','2023-12-15 22:00:00','Delayed',900.00,'Economy'),(6,'BA','2023-12-16 10:00:00','2023-12-16 14:00:00','On Time',600.50,'Economy'),(7,'AI','2023-12-16 12:00:00','2023-12-16 16:00:00','Delayed',750.25,'Business'),(8,'AF','2023-12-16 14:00:00','2023-12-16 18:00:00','On Time',500.00,'Economy'),(9,'DL','2023-12-16 16:00:00','2023-12-16 20:00:00','On Time',850.75,'Business'),(10,'UA','2023-12-16 18:00:00','2023-12-16 22:00:00','Delayed',700.25,'Economy');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `passenger_id` int NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `passport_number` varchar(10) DEFAULT NULL,
  `country_of_issue` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `passport_number` (`passport_number`),
  KEY `idx_passenger_phone` (`phone`),
  CONSTRAINT `passengers_chk_1` CHECK (regexp_like(`phone`,_utf8mb4'^\\+\\d{2}-\\d{10}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'Rahul Sharma','rahul@gmail.com','+91-9876543901','M',30,'AB1234567','India','2020-01-01','2030-01-01'),(2,'Priya Patel','priya@gmail.com','+91-8765432109','F',25,'CD9876543','India','2019-03-15','2029-03-15'),(3,'Aarav Singh','aarav@gmail.com','+91-7654321098','M',5,'EF1234567','India','2022-05-20','2032-05-20'),(4,'Anaya Reddy','anaya@gmail.com','+91-6543210987','F',28,'GH9876543','India','2018-09-10','2028-09-10'),(5,'Vikram Joshi','vikram@gmail.com','+91-5432109876','M',35,'IJ1234567','India','2017-12-05','2027-12-05'),(6,'Sofia Bhatia','sofia@gmail.com','+91-4321098765','F',22,'KL9876543','India','2016-02-28','2026-02-28'),(7,'Arjun Kapoor','arjun@gmail.com','+91-3210987654','M',40,'MN1234567','India','2015-06-15','2025-06-15'),(8,'Zara Khan','zara@gmail.com','+91-2109876543','F',32,'OP9876543','India','2014-08-20','2024-08-20'),(9,'Kabir Gupta','kabir@gmail.com','+91-1098765432','M',18,'QR1234567','India','2021-04-12','2031-04-12'),(10,'Neha Sharma','neha@gmail.com','+91-9876543210','F',26,'ST9876543','India','2013-10-25','2023-10-25');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `arrival_airport_code` varchar(3) DEFAULT NULL,
  `departure_airport_code` varchar(3) DEFAULT NULL,
  `airline_code` varchar(3) DEFAULT NULL,
  KEY `fk_arrival_airport_code_routes` (`arrival_airport_code`),
  CONSTRAINT `fk_arrival_airport_code_routes` FOREIGN KEY (`arrival_airport_code`) REFERENCES `airports` (`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),('DXB','DEL','IND'),('JNB','DXB','EMI'),('HND','JNB','SAA'),('DOH','HND','ANA'),('DEL','DOH','QTR'),('JNB','LHR','BA'),('LHR','DEL','AI'),('HND','CDG','AF'),('ORD','ATL','DL'),('DXB','LAX','UA');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketprices`
--

DROP TABLE IF EXISTS `ticketprices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketprices` (
  `date_of_booking` date NOT NULL,
  `source` varchar(3) NOT NULL,
  `destination` varchar(3) NOT NULL,
  `source_city` varchar(50) NOT NULL,
  `destination_city` varchar(50) NOT NULL,
  `class` varchar(15) NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`date_of_booking`,`source`,`destination`,`class`),
  KEY `fk_source_airport` (`source`),
  KEY `fk_destination_airport` (`destination`),
  CONSTRAINT `fk_destination_airport` FOREIGN KEY (`destination`) REFERENCES `airports` (`airport_code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_source_airport` FOREIGN KEY (`source`) REFERENCES `airports` (`airport_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketprices`
--

LOCK TABLES `ticketprices` WRITE;
/*!40000 ALTER TABLE `ticketprices` DISABLE KEYS */;
INSERT INTO `ticketprices` VALUES ('2023-12-01','LAX','LHR','New York','London','Economy',500),('2023-12-02','LHR','ATL','London','Atlanta','Business',800),('2023-12-03','ATL','DXB','Atlanta','Dubai','Economy',600),('2023-12-04','DXB','ORD','Dubai','Chicago','First Class',900),('2023-12-05','ORD','JFK','Chicago','New York','Economy',700),('2023-12-06','LAX','DXB','New York','Dubai','Business',550),('2023-12-07','LHR','ORD','London','Chicago','Economy',850),('2023-12-08','ATL','JFK','Atlanta','New York','First Class',620),('2023-12-09','DXB','LHR','Dubai','London','Economy',920),('2023-12-10','ORD','ATL','Chicago','Atlanta','Business',750);
/*!40000 ALTER TABLE `ticketprices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_user_id_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (101,'ravi_pilot','ravi@123','Pilot'),(102,'anjali_attendant','anjali@123','Flight Attendant'),(103,'suresh_engineer','suresh@123','Engineer'),(104,'neha_pilot','neha@123','Pilot'),(105,'amit_manager','amit@123','Crew Manager'),(106,'priya_staff','priya@123','Ground Staff'),(107,'vikram_pilot','vikram@123','Pilot'),(108,'zoya_attendant','zoya@123','Flight Attendant'),(109,'rahul_engineer','rahul@123','Engineer'),(110,'nina_manager','nina@123','Crew Manager');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'airlinems'
--

--
-- Dumping routines for database 'airlinems'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetFlightDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFlightDetails`(IN p_flight_id INT)
BEGIN
    SELECT * FROM Flights WHERE flight_id = p_flight_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPassenger` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPassenger`(
  IN p_full_name VARCHAR(50),
  IN p_email VARCHAR(50),
  IN p_phone VARCHAR(15),
  IN p_gender VARCHAR(1),
  IN p_age INT,
  IN p_passport_number VARCHAR(10),
  IN p_country_of_issue VARCHAR(50),
  IN p_issue_date DATE,
  IN p_expiration_date DATE
)
BEGIN
  INSERT INTO Passengers (
    full_name, email, phone, gender, age,
    passport_number, country_of_issue, issue_date, expiration_date
  ) VALUES (
    p_full_name, p_email, p_phone, p_gender, p_age,
    p_passport_number, p_country_of_issue, p_issue_date, p_expiration_date
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `confirmedbookings`
--

/*!50001 DROP VIEW IF EXISTS `confirmedbookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `confirmedbookings` AS select `bookingdetails`.`booking_id` AS `booking_id`,`bookingdetails`.`passenger_id` AS `passenger_id`,`bookingdetails`.`flight_id` AS `flight_id`,`bookingdetails`.`booked_at` AS `booked_at`,`bookingdetails`.`payment_status` AS `payment_status`,`bookingdetails`.`payment_method` AS `payment_method`,`bookingdetails`.`booking_status` AS `booking_status` from `bookingdetails` where (`bookingdetails`.`booking_status` = 'confirmed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-16 12:34:17
