-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: my_project
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `car_class`
--

DROP TABLE IF EXISTS `car_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_var` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_UNIQUE` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_class`
--

LOCK TABLES `car_class` WRITE;
/*!40000 ALTER TABLE `car_class` DISABLE KEYS */;
INSERT INTO `car_class` VALUES (1,'эконом',1),(2,'стандарт',2),(3,'бизнес',4);
/*!40000 ALTER TABLE `car_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `car_drive_trips`
--

DROP TABLE IF EXISTS `car_drive_trips`;
/*!50001 DROP VIEW IF EXISTS `car_drive_trips`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `car_drive_trips` AS SELECT 
 1 AS `Автомобиль`,
 1 AS `Имя водителя`,
 1 AS `Количество поездок`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxi_company_id` int unsigned NOT NULL,
  `car_class_id` int NOT NULL,
  `number` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cars_taxi_company1_idx` (`taxi_company_id`),
  KEY `fk_cars_car_class1_idx` (`car_class_id`),
  CONSTRAINT `fk_cars_car_class1` FOREIGN KEY (`car_class_id`) REFERENCES `car_class` (`id`),
  CONSTRAINT `fk_cars_taxi_company1` FOREIGN KEY (`taxi_company_id`) REFERENCES `taxi_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,2,1,'к314кс','Ford','Focus'),(2,3,1,'к785рр','VW','Polo'),(3,1,1,'е895аа','Hyundai','Solaris'),(4,3,1,'а925ку','Chevrolet','Cruze'),(5,3,1,'н896ке','Opel','Astra'),(6,2,2,'к586аа','Audi','A3'),(7,2,2,'н100уу','Audi','A6'),(8,1,3,'а001аа','BMW','7'),(9,1,2,'а895вв','Skoda','Octavia'),(10,4,3,'н777ну','Mercedes','S');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_profiles`
--

DROP TABLE IF EXISTS `driver_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_profiles` (
  `drivers_id` int unsigned NOT NULL,
  `cars_id` int NOT NULL,
  `license` bigint unsigned NOT NULL,
  `firstname` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `burthday` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`drivers_id`),
  UNIQUE KEY `driver_license_UNIQUE` (`license`),
  KEY `fk_driver_profiles_drivers1_idx` (`drivers_id`),
  KEY `fk_driver_profiles_cars1_idx` (`cars_id`),
  CONSTRAINT `fk_driver_profiles_cars1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `fk_driver_profiles_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_profiles`
--

LOCK TABLES `driver_profiles` WRITE;
/*!40000 ALTER TABLE `driver_profiles` DISABLE KEYS */;
INSERT INTO `driver_profiles` VALUES (1,7,444987,'Cameron','Ullrich','m','1985-06-17','2010-01-01 00:00:00',NULL),(2,1,189412,'Gregoria','Sawayn','m','1982-06-01','2010-01-01 00:00:00',NULL),(3,9,451280,'Hal','Bernhard','f','1977-04-10','2010-01-01 00:00:00',NULL),(4,7,120630,'Earnest','Kiehn','f','1979-01-26','2010-01-01 00:00:00',NULL),(5,1,979720,'Delmer','Hoeger','m','1998-07-10','2010-01-01 00:00:00',NULL),(6,1,439490,'Moses','Hoppe','m','1989-05-06','2010-01-01 00:00:00',NULL),(7,6,245120,'Leonel','Rogahn','f','1993-08-24','2010-01-01 00:00:00',NULL),(8,5,637304,'Marcelo','Kertzmann','m','1993-01-20','2010-01-01 00:00:00',NULL),(9,6,358284,'Felipa','Rohan','m','1977-10-13','2010-01-01 00:00:00',NULL),(10,7,855986,'Urban','Ortiz','m','1974-03-18','2010-01-01 00:00:00',NULL),(11,4,103581,'Lauriane','Walsh','f','1979-04-16','2010-01-01 00:00:00',NULL),(12,8,318413,'Kenyatta','Rice','f','1986-09-11','2010-01-01 00:00:00',NULL),(13,9,483317,'Travon','Goodwin','m','1991-06-22','2010-01-01 00:00:00',NULL),(14,6,347110,'Aryanna','Hammes','m','1977-06-15','2010-01-01 00:00:00',NULL),(15,5,601840,'Maybell','Romaguera','m','1980-01-04','2010-01-01 00:00:00',NULL),(16,10,112197,'Earnestine','Bradtke','f','1976-12-09','2010-01-01 00:00:00',NULL),(17,8,366416,'Tamara','Jast','m','1978-11-02','2010-01-01 00:00:00',NULL),(18,3,485294,'Billie','Schiller','m','1988-11-02','2010-01-01 00:00:00',NULL),(19,9,228305,'Niko','McKenzie','m','1971-02-09','2010-01-01 00:00:00',NULL),(20,8,401352,'Freeda','Pouros','m','1971-12-01','2010-01-01 00:00:00',NULL);
/*!40000 ALTER TABLE `driver_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `password_hash` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'tabitha.kirlin@example.com',89121802896,'15cd58d7432e94ecfc0b018b04824659f9ca9da1'),(2,'trever.littel@example.com',89875137392,'ff8051e8303d87ca6bd6c49d2384b72d7b67a9d9'),(3,'doyle76@example.org',89018422873,'8874bdc80e6a7d6d84c7ad42da63eafb3253596a'),(4,'jalyn13@example.net',89594542253,'5c23f07b787c2c630fcaed5b9fdb67e114a79c75'),(5,'kautzer.julian@example.net',89959080617,'17b937c33946ce4a6ee79fdabdd001b2c6773694'),(6,'rodriguez.theresa@example.com',89624294518,'14a291e965e9b16b77fce65bb472d42d3a0b90ae'),(7,'dlang@example.com',89872759327,'aeabd5d8d93659a1dc8f75c58f029058979610cb'),(8,'aliyah.veum@example.net',89136657469,'421085d91c46973cb450c3c2bf8331ef7667c331'),(9,'jsteuber@example.org',89639970046,'254b1d3df4714bdc66755ad3192196525cf5796b'),(10,'rudy67@example.org',89584590247,'a67d085fce5b2afd552f51192a48545b50e02d84'),(11,'breanne57@example.net',89788596522,'dd6f33e921c63229cb1bbd73f6d48e9290ffdb1b'),(12,'albertha.rutherford@example.net',89639521285,'499188817e4b2902f82f6ca15b684dbe794e60a9'),(13,'kwisoky@example.org',89729598491,'78ad4531fed2da2e511dc5d6b60c1e426d972b83'),(14,'jodie76@example.org',89715045880,'5698adc1ccf0fd72324619b08edaf2a0a7dbafdd'),(15,'langosh.weston@example.org',89734010347,'9058bc3b596bbee26db6dfd1f0ce79b3d5d45fda'),(16,'o\'kon.adrain@example.org',89341273921,'1187e645413f3b99c15b5f6aba4347ee81ce4d94'),(17,'quigley.velma@example.net',89580564159,'a87dc7c067f05d037857600fc829e4d2a3e802a4'),(18,'prunolfsson@example.com',89091910751,'baff7607691096fd98d9dee2a5bc2f0a136cf56d'),(19,'pacocha.asia@example.org',89582418735,'2dd856f9f8697b7028c3dca1a64e80488c44fb0c'),(20,'fcrooks@example.net',89901664646,'c52e91980d862057bd9d29589b486462d90a2af4');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `earnings`
--

DROP TABLE IF EXISTS `earnings`;
/*!50001 DROP VIEW IF EXISTS `earnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `earnings` AS SELECT 
 1 AS `ID водителя`,
 1 AS `Имя водителя`,
 1 AS `earning`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `like_type`
--

DROP TABLE IF EXISTS `like_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_like` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_type`
--

LOCK TABLES `like_type` WRITE;
/*!40000 ALTER TABLE `like_type` DISABLE KEYS */;
INSERT INTO `like_type` VALUES (1,'чистота'),(2,'аккуратность'),(3,'вежливость'),(4,'пунктуальность'),(5,'опрятность');
/*!40000 ALTER TABLE `like_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `trip_id` int NOT NULL,
  `like_type_id` int NOT NULL,
  `like_value` tinyint NOT NULL,
  KEY `fk_likes_like_type1_idx` (`like_type_id`),
  KEY `fk_likes_trip_request1_idx` (`trip_id`),
  CONSTRAINT `fk_likes_like_type1` FOREIGN KEY (`like_type_id`) REFERENCES `like_type` (`id`),
  CONSTRAINT `fk_likes_trip_request1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,2,4),(1,3,3),(1,4,6),(2,2,2),(2,3,1),(2,4,2),(3,1,3),(3,2,4),(3,3,5),(3,4,2),(4,2,3),(4,3,5),(4,4,5),(4,5,5),(5,1,4),(5,3,4),(5,4,5),(6,2,3),(7,4,1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `like_value_test` BEFORE INSERT ON `likes` FOR EACH ROW BEGIN
	IF NEW.`like_value` IS NULL OR NEW.`like_value` > 5 OR NEW.`like_value` < 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'ERROR! Like value out of range!';
		END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `like_trip_test` BEFORE INSERT ON `likes` FOR EACH ROW BEGIN
	SET @current_trip_status = (SELECT `status` FROM trip WHERE `trip`.`id` = NEW.`trip_id`);
    IF @current_trip_status = 'Canceled' THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'ERROR! Trip was canceled!';
		END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `passenger_profiles`
--

DROP TABLE IF EXISTS `passenger_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_profiles` (
  `passengers_id` int unsigned NOT NULL,
  `firstname` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `burthday` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`passengers_id`),
  KEY `fk_passenger_profiles_passengers_idx` (`passengers_id`),
  CONSTRAINT `fk_passenger_profiles_passengers` FOREIGN KEY (`passengers_id`) REFERENCES `passengers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_profiles`
--

LOCK TABLES `passenger_profiles` WRITE;
/*!40000 ALTER TABLE `passenger_profiles` DISABLE KEYS */;
INSERT INTO `passenger_profiles` VALUES (1,'Hallie','Kerluke','m','2005-03-20','1996-12-25 09:24:02','1992-12-13 23:11:54'),(2,'Mariano','Paucek','f','1997-07-06','1991-02-21 20:02:58','1988-12-03 09:07:12'),(3,'Lea','Hintz','f','1980-06-06','1972-02-29 20:29:34','2017-06-23 11:41:49'),(4,'Mittie','Windler','f','1974-03-28','2014-01-28 03:13:53','2017-10-21 17:10:01'),(5,'Jana','Franecki','m','1973-12-16','2000-03-17 18:33:12','2002-01-17 20:13:52'),(6,'Enos','Rohan','f','1986-06-30','2013-11-28 22:56:45','2015-05-07 10:39:40'),(7,'Elroy','Mohr','f','2015-02-20','2019-07-20 18:28:51','1987-03-11 17:56:08'),(8,'Joelle','Little','m','1983-10-22','1981-01-21 22:03:38','1985-06-04 14:40:57'),(9,'Jeffrey','Bayer','f','1979-12-28','2009-04-10 02:54:33','2018-06-19 23:35:56'),(10,'Jeramy','Littel','m','1974-06-14','2010-04-30 11:10:52','2001-07-13 08:03:58'),(11,'Gloria','Buckridge','f','2002-05-28','2016-10-15 15:03:38','1993-07-12 10:25:41'),(12,'Sam','Schamberger','f','2007-03-19','1999-05-27 12:39:23','1987-09-04 02:49:38'),(13,'Shawn','Satterfield','m','2017-05-04','1986-08-08 01:04:14','1970-12-26 04:19:22'),(14,'Rodrick','Dibbert','f','1980-11-15','2008-10-21 11:28:15','2010-03-24 05:10:04'),(15,'Ivory','Flatley','m','1981-01-31','1996-11-24 23:59:51','2016-12-01 06:40:02'),(16,'Una','Herman','m','1977-05-12','1998-01-07 13:29:25','1983-03-14 15:05:12'),(17,'Garrison','Dickens','f','1995-12-12','1977-07-14 17:17:07','1976-09-27 19:59:56'),(18,'Berniece','Mosciski','f','1972-11-23','2010-03-02 13:34:38','1989-02-02 04:29:30'),(19,'Raven','Schiller','m','2005-08-02','1985-08-25 15:56:56','1985-06-11 18:01:33'),(20,'Elody','Kessler','m','1976-06-26','1989-04-17 05:09:37','1987-08-12 00:08:57'),(21,'Soledad','Steuber','m','2016-10-20','1992-01-01 05:58:52','1987-08-11 22:55:08'),(22,'Aurore','Jacobi','m','1999-08-20','1999-03-01 16:06:32','2004-12-29 03:58:24'),(23,'Coralie','Spencer','f','1992-06-08','1997-01-20 23:00:12','2014-06-27 13:38:30'),(24,'Jevon','Batz','f','2013-11-27','1993-04-10 21:45:49','1995-07-03 17:18:56'),(25,'Jameson','Kreiger','m','2019-01-04','1997-11-22 09:57:26','1976-01-07 08:40:16'),(26,'Xander','Collins','m','1989-05-04','1990-06-22 14:07:30','1993-01-26 00:37:22'),(27,'Carroll','Barrows','m','2016-08-31','1995-10-08 00:03:46','1989-10-04 03:23:20'),(28,'Jada','Baumbach','m','1991-12-04','2007-08-15 18:55:24','2017-04-03 12:05:28'),(29,'Mortimer','Bernhard','m','1978-01-27','1971-06-29 14:06:47','1998-09-29 11:58:05'),(30,'Adolfo','Schaefer','m','2013-10-10','1997-11-09 05:43:38','2019-08-13 21:00:32'),(31,'Rhea','Kshlerin','m','2009-05-29','1978-09-13 04:02:06','2013-06-14 19:45:25'),(32,'Maddison','Brakus','m','1980-10-11','2018-04-09 22:06:39','1977-09-07 07:20:22'),(33,'Casey','Spinka','m','1988-10-13','1989-01-23 10:34:09','2018-07-12 12:47:48'),(34,'Kirk','Roob','f','1987-12-26','2000-08-20 07:05:54','1974-10-21 22:44:34'),(35,'Rosemarie','Christiansen','f','1979-01-01','1993-01-09 07:52:54','2002-05-14 23:39:34'),(36,'Vivian','Walter','m','2010-03-04','1999-02-26 10:08:37','2020-05-12 16:38:30'),(37,'Jett','Labadie','f','2019-07-07','2012-01-25 13:15:09','2012-11-26 16:14:13'),(38,'Candida','Osinski','f','1989-09-10','1979-03-15 21:48:34','2010-10-13 11:49:24'),(39,'Maximus','Leffler','m','2015-12-15','2012-04-05 14:23:59','1983-03-22 16:20:20'),(40,'Luigi','Schinner','f','2018-12-23','1977-07-18 05:05:57','1981-11-07 16:34:59');
/*!40000 ALTER TABLE `passenger_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `password_hash` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'jnicolas@example.net',89661501308,'34316fab006628c6f28c72938d493b3a1f446e12'),(2,'o\'kon.rylan@example.net',89036029650,'039c0d9f2d3858c2cc1d715fee87025595ded0b2'),(3,'yasmeen88@example.net',89212762767,'dbe6c3f513d85fb675727a04385e48b5a60154cf'),(4,'lowell.bernier@example.com',89036572515,'cbfff550363a75fd001cf3935554a6b0939c1544'),(5,'towne.florine@example.org',89426120285,'21d02fb9421c905af0316fdb9d9a8477c40e269c'),(6,'jillian.kautzer@example.com',89981223048,'7cb1bd0bc97519e8d1b3f9e74f3d7f4b3cf4edc4'),(7,'bernadine.abbott@example.net',89048620909,'a01f997bf0b14a22e51458124795db1ecc6648a7'),(8,'arthur54@example.org',89775483442,'471df166e226ba50c7778ab1a00673d8235ac4f9'),(9,'qheidenreich@example.org',89267672323,'42fad92da69f002636829d46b982751cd2040c28'),(10,'pweber@example.org',89566141900,'ea1d44e454a42aa624bd783931f5cd18c42b0fc8'),(11,'abshire.katlyn@example.com',89137651157,'b5b34765a07a07e65965eb284842bdd0888a337b'),(12,'cedrick.kuhlman@example.org',89912126849,'3c0beb746f2f00055e2059e0baaf8a81a372fb7c'),(13,'emile63@example.org',89946567513,'6382856346f1959ca70bda1855fe061dc41eea29'),(14,'yconroy@example.net',89809497762,'25adad3a67a4ff68a5bab29d30d37cef875dc4c0'),(15,'jesse.tromp@example.net',89138739540,'6191cee24ee8b5c43a2e23e3140067ef52775e4a'),(16,'stark.jada@example.net',89505061575,'b369b36f6261f42767bccbd08be4fb4662e24f4b'),(17,'gorczany.selmer@example.net',89898088908,'39166c910fe53b29bad5961efb6b326ad914d2af'),(18,'bflatley@example.com',89277158411,'8c71b2ac137322563e481327f212a22d70be89a4'),(19,'abshire.lavern@example.org',89269483002,'a8d8dfdeb992057f820d6cf68ade5eab9f14b62f'),(20,'landen09@example.org',89333790851,'5046bff08f77fa11bc1cbb98bc2aaebf4a69fa65'),(21,'kjohns@example.net',89157696067,'f52a183b60992f9474ecf3ad103f69baac1bc4ae'),(22,'thompson.zora@example.net',89018276569,'67a4cfc45da691c6b5f6c791b8396c1daea54925'),(23,'lucious95@example.org',89546619789,'fcc11dfb279f056f0217502c565021436e2a083a'),(24,'orion87@example.org',89289788532,'5699cc021a01f9b11b2ae661a8e1dcd0ffb68198'),(25,'egutkowski@example.org',89839206500,'7218e212f19c55fcbeb2606b112fed346fdd2327'),(26,'raphaelle.hills@example.org',89827076383,'b504578e9b71ef1576e9c0f060ef52b56a8c667c'),(27,'lcrona@example.net',89616703274,'0a6364d2e5ed16eb3f7a9de17993ee7616dbfe0d'),(28,'daugherty.levi@example.net',89513556720,'24ab1385cbd74561d0d2976d9ecbb0abf9a5d5aa'),(29,'zgreen@example.org',89443684285,'963e963b7bf3c21abcafe348cad1af5d2e5fae0a'),(30,'pcasper@example.com',89307244139,'81161e1df054116472fea13caa98194485ba22a0'),(31,'zemlak.brenna@example.org',89446001485,'99e621a905266d50b0a1202d92fb633a04ae59a0'),(32,'mertz.hester@example.org',89040258012,'8a80000ccd32d14c84da6805700ecd93d5f21cf7'),(33,'bauch.chester@example.com',89378417030,'9e9ae4cb6b74aeef993dec80569f421f9a885f9b'),(34,'emiliano.robel@example.com',89976190707,'935614d5a4f8e149ae7381bb1b40a8feb90356e6'),(35,'rath.carolyn@example.com',89977795409,'4fcbe5c470a5d97f60faac322b2601ee68bf67e8'),(36,'cormier.tanya@example.com',89936883310,'19d86cc93f657b7a73e684bb14d880ada48438f5'),(37,'bahringer.madelyn@example.org',89515167636,'d75c0de72eb7cbf5f6e4d3ca0928fe9435a64cb2'),(38,'ariel61@example.org',89851149007,'23954145025cd90fb374c53c6f120a1e98e1f4fd'),(39,'bergnaum.keira@example.org',89042662361,'e8693aa92bab30ac2735d0169cf9d559af084403'),(40,'xkohler@example.org',89224405292,'86dd67a2f8a1437e50519d7b77887ee513b7e3ac');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_company`
--

DROP TABLE IF EXISTS `taxi_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxi_company` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_company`
--

LOCK TABLES `taxi_company` WRITE;
/*!40000 ALTER TABLE `taxi_company` DISABLE KEYS */;
INSERT INTO `taxi_company` VALUES (1,'Таксопарк №1','395 Hane Loaf Suite 256\nPort Enola, DC 36498-2992'),(2,'Таксо','2463 Parker Manor Suite 654\nNorth Rylee, PA 13055'),(3,'Таксопарк №2','71656 Nicklaus Freeway\nSouth Abbystad, WI 73274-9082'),(4,'Таксимастер','3981 Jasper Inlet\nWest Elinor, OR 20315-6849');
/*!40000 ALTER TABLE `taxi_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passengers_id` int unsigned NOT NULL,
  `drivers_id` int unsigned NOT NULL,
  `status` enum('Confirmed','Canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `started_at` datetime DEFAULT NULL,
  `trip_time` time DEFAULT NULL,
  `from_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trip_request_passenger_profiles1_idx` (`passengers_id`),
  KEY `fk_trip_request_driver_profiles1_idx` (`drivers_id`),
  CONSTRAINT `fk_trip_request_driver_profiles1` FOREIGN KEY (`drivers_id`) REFERENCES `driver_profiles` (`drivers_id`),
  CONSTRAINT `fk_trip_request_passenger_profiles1` FOREIGN KEY (`passengers_id`) REFERENCES `passenger_profiles` (`passengers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,1,8,'Confirmed','1992-12-30 22:27:10','1998-09-18 14:27:09','00:16:56','26447 Langosh Vista Apt. 135\nWest Daisybury, ','919 O\'Conner Stream\nMikaylachester, GA 30288-'),(2,1,6,'Confirmed','1974-03-16 10:59:47','1992-05-30 05:57:55','00:23:24','061 Abshire Cove\nWest Bonita, FL 74368','125 Herminio Mountains\nSpinkachester, IN 4765'),(3,2,12,'Confirmed','1982-05-05 08:15:27','1988-06-18 21:21:28','00:43:43','827 Nader Skyway Apt. 472\nHicklebury, AR 4282','13846 Gloria Alley\nBartellchester, KY 44455'),(4,2,9,'Canceled','1986-12-29 13:48:35','2020-02-21 22:31:25','00:34:13','8800 Konopelski Street\nHomenickville, IL 0029','815 Miller Expressway Apt. 228\nNew Tyresemout'),(5,2,18,'Canceled','2004-12-14 13:13:34','1974-08-10 17:12:51','00:34:46','6603 Kovacek Heights\nLake Kavonberg, MD 95459','97173 Gilberto Trail\nMaximiliantown, MO 06384'),(6,7,5,'Canceled','1970-04-29 09:37:16','1999-11-13 16:13:35','01:55:19','916 Mayert Tunnel\nNew Lelia, VA 94849-8785','70038 Emmanuelle Plains Apt. 984\nHeathcotesta'),(7,2,18,'Confirmed','2010-08-01 12:26:18','1971-05-06 14:16:21','02:15:27','8992 Jenkins Trafficway Apt. 314\nPaulfurt, WA','0501 Sylvan Villages Suite 932\nLake Helena, M'),(8,1,19,'Confirmed','1981-07-29 04:28:51','1997-05-29 22:42:19','00:44:00','8595 Rhianna Locks\nSouth Odie, NC 69949','3855 Abbie Course Suite 574\nLake Callie, TX 3'),(9,3,16,'Confirmed','2002-12-18 10:12:41','1997-01-20 15:22:26','00:26:37','875 Eldridge Gardens\nHoseaborough, UT 06339-8','394 Dereck Neck\nMckaylaport, TN 18003'),(10,3,7,'Confirmed','2000-07-08 09:44:31','2008-07-30 16:06:11','05:00:55','6089 Pansy Mission\nSengermouth, ME 34971-7158','805 Tromp Turnpike Suite 288\nNorth Abdiel, AR'),(11,3,8,'Canceled','1983-08-04 17:46:51','2015-09-14 21:28:17','00:03:00','529 Ferry Alley Suite 980\nD\'Amorefurt, FL 861','5480 Flossie Knoll\nEast Alejandrinhaven, WY 5'),(12,2,6,'Confirmed','1987-03-07 14:09:40','1989-03-13 09:12:42','00:46:20','73941 Strosin Islands\nMarvinburgh, MD 63311','09444 Callie Forest\nFarrellville, MS 53586'),(13,1,9,'Canceled','2007-12-29 05:34:38','1973-01-27 21:53:34','01:30:50','2736 Antonietta Fields Apt. 421\nSouth Adahton','304 Ledner Walks\nUrbanbury, MA 50359'),(14,8,17,'Canceled','1980-12-14 14:39:53','1987-08-21 11:09:14','00:51:11','0073 Chad Estates\nLake Ruthe, DE 37392-1553','764 Ethyl Dale Suite 844\nSchimmelmouth, NM 70'),(15,39,8,'Canceled','1997-07-24 12:43:18','1996-10-23 21:33:33','00:01:34','275 Reynolds Stream\nJuwanberg, MN 73546-1759','077 Jessy Estates\nCitlallifurt, MI 72732'),(16,2,10,'Confirmed','1999-11-16 06:24:13','2005-07-06 05:59:05','00:42:35','6529 Veum Glen Apt. 423\nCummeratachester, UT ','8291 Farrell Pike Suite 081\nMaciebury, ME 384'),(17,30,4,'Confirmed','1998-05-30 07:30:38','1995-01-08 10:57:59','00:29:11','60901 Camylle Squares Suite 534\nJakobburgh, I','8337 Leannon Orchard\nAnnabellton, WI 98706'),(18,30,1,'Canceled','1981-02-25 23:47:25','1981-08-19 13:15:36','00:59:07','281 Runte Mill Suite 896\nEast Arlo, KY 77992','5422 Antonio Village Suite 984\nPort Kobemouth'),(19,31,1,'Canceled','1991-07-10 02:55:56','1991-01-10 01:35:11','00:42:17','27820 Rey Haven Suite 744\nCooperbury, MT 2030','83935 Amber Forest Apt. 172\nWest Royalburgh, '),(20,19,4,'Confirmed','1981-06-23 16:08:45','2016-05-26 12:04:46','00:11:17','0780 Yundt Manor\nMaggiobury, NY 43255','803 Hills Lodge Suite 016\nPort Winona, MS 212'),(21,36,13,'Confirmed','2014-07-21 23:48:15','2012-08-24 05:50:31','05:33:44','46796 Hoppe Court Apt. 701\nNew Davidview, WA ','33566 Johns Bypass\nNew Malachistad, HI 67911-'),(22,17,9,'Canceled','2019-10-18 02:56:47','1976-10-28 10:12:00','02:26:17','829 Runolfsdottir Villages\nSalvadormouth, LA ','609 Annette Plains\nKuvalistown, KS 85369-6131'),(23,22,3,'Confirmed','1973-06-12 22:53:46','2009-02-25 09:45:18','01:05:00','035 Ida Lodge Apt. 836\nLake Willis, SC 56781-','4783 Isac Dale\nNew Johnathon, IN 72952-3820'),(24,14,2,'Canceled','2021-01-11 00:18:27','1989-04-17 06:01:08','00:36:14','8041 Amina Coves Suite 825\nSouth Germaine, IN','97594 Lionel Orchard\nSouth Orphaside, WI 9465'),(25,37,15,'Canceled','2001-12-30 12:40:40','1970-01-22 02:16:34','00:33:13','517 Dixie Heights\nLake Chazfort, VT 20267','8609 Christiansen Shores Suite 816\nSouth Dana'),(26,17,15,'Canceled','1983-02-01 03:11:38','2010-01-08 21:39:12','00:06:44','02461 Lisa Landing\nWest Laney, WV 33963','287 Stoltenberg Mountains\nWest Laisha, ID 144'),(27,4,19,'Canceled','1996-02-08 16:26:42','2010-03-10 00:08:47','04:26:21','537 Anabel Estates\nCornellstad, HI 32120-9688','312 Nolan Route\nSouth Cory, DC 90988-0112'),(28,40,8,'Canceled','2014-09-06 09:34:17','2018-07-08 05:02:59','01:27:52','6883 Lilly Neck Apt. 096\nPort Chesterview, KS','7900 Vandervort Extensions\nPort Caleb, OH 574'),(29,15,4,'Confirmed','2018-03-23 16:06:06','2008-02-12 23:01:32','00:07:49','65331 Greenholt Track\nWest Vadaside, GA 65200','8901 King Inlet Suite 046\nNew Solonview, AL 8'),(30,10,7,'Confirmed','1982-09-24 00:40:44','1998-05-01 14:04:29','03:58:10','0137 Denesik Heights Suite 319\nEast Arvillavi','66552 Amani Lane\nNew Terry, KY 51406-6024'),(31,22,6,'Canceled','1972-11-15 15:43:35','2009-06-20 14:27:27','06:36:25','606 Hildegard Place Suite 315\nPort Eleazar, N','87400 Dudley Curve\nLake Gladys, GA 08100-0773'),(32,32,6,'Confirmed','1995-02-28 20:43:22','1982-07-24 00:04:45','00:57:25','480 Sallie Radial Apt. 429\nNorth Angeloview, ','06829 Koepp Estates\nEast Jarrell, AK 42655'),(33,19,11,'Confirmed','1977-04-05 23:15:36','2014-05-15 19:28:24','00:06:30','723 Walter Mountains Apt. 909\nKuhnport, MD 02','75110 Boyle Road Apt. 864\nNorth Emmanuellemou'),(34,13,5,'Confirmed','2020-01-18 22:35:41','1979-11-25 15:16:03','00:46:53','0623 Price Mall Suite 956\nTorpberg, OR 90844','9526 Waters Terrace\nRoobshire, IL 98996-3258'),(35,22,16,'Canceled','1995-02-07 20:49:03','1981-01-01 10:02:06','14:27:05','561 Lauretta Corners\nJacobsonton, NY 77229','883 Raina Circles\nWest Arnoldport, OH 20195'),(36,17,9,'Canceled','1997-03-31 03:26:17','2020-04-13 17:39:21','04:34:30','62018 Kasandra Pike Suite 433\nJakubowskiport,','21493 Gino Rest\nRossieside, SC 12963-3880'),(37,17,17,'Confirmed','2011-10-11 23:18:46','1972-03-06 23:49:15','02:13:15','4471 Janice Orchard Apt. 272\nEast Sanfordshir','7900 Brittany Avenue\nAbshireburgh, TX 08336'),(38,34,19,'Canceled','1995-04-13 23:46:54','2014-04-04 08:26:41','00:38:39','278 Bins Square Apt. 567\nErnsermouth, MI 0199','3114 Kessler Bridge Apt. 745\nSouth Arne, AK 8'),(39,39,4,'Canceled','1984-08-20 16:21:45','2006-08-24 14:05:59','01:15:15','69021 Koss Mills Suite 368\nNew Donnyhaven, OR','32391 Heidenreich Road\nWest Domenico, IA 3739'),(40,2,18,'Canceled','2012-07-05 05:17:24','1982-04-25 07:53:00','00:54:49','1143 Botsford Valley\nHueltown, MO 71015-9001','68645 Isabella Knolls Suite 369\nO\'Konberg, OH');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'my_project'
--

--
-- Dumping routines for database 'my_project'
--
/*!50003 DROP FUNCTION IF EXISTS `trip_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `trip_price`(id_of_trip INT) RETURNS bigint
    DETERMINISTIC
BEGIN
	DECLARE _i INT;
	DECLARE _trip_price INT;
    SET _i = (SELECT `price_var` FROM `car_class` WHERE `car_class`.`id` = (
		SELECT `car_class_id` FROM `cars` WHERE `cars`.`id` = (
		SELECT `cars_id` FROM `driver_profiles` WHERE `driver_profiles`.`drivers_id` = (
        SELECT `drivers_id` FROM `trip` WHERE `trip`.`id` = id_of_trip))));
	 
    SET _trip_price = _i * ((SELECT HOUR(trip_time) FROM trip WHERE `trip`.`id` = id_of_trip) * 1000 + 
    (SELECT MINUTE(trip_time) FROM trip WHERE `trip`.`id` = id_of_trip) * 10);
    
    RETURN _trip_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `car_drive_trips`
--

/*!50001 DROP VIEW IF EXISTS `car_drive_trips`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `car_drive_trips` AS select concat(`cars`.`manufacturer`,' ',`cars`.`model`) AS `Автомобиль`,concat(`driver_profiles`.`firstname`,' ',`driver_profiles`.`lastname`) AS `Имя водителя`,(select count(`trip`.`id`) from `trip` where (`trip`.`drivers_id` = `driver_profiles`.`drivers_id`)) AS `Количество поездок` from (`cars` join `driver_profiles` on((`driver_profiles`.`cars_id` = `cars`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `earnings`
--

/*!50001 DROP VIEW IF EXISTS `earnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `earnings` AS select `driver_profiles`.`drivers_id` AS `ID водителя`,concat(`driver_profiles`.`firstname`,' ',`driver_profiles`.`lastname`) AS `Имя водителя`,(select sum(`TRIP_PRICE`(`trip`.`id`)) from `trip` where (`trip`.`drivers_id` = `driver_profiles`.`drivers_id`)) AS `earning` from `driver_profiles` order by (select sum(`TRIP_PRICE`(`trip`.`id`)) from `trip` where (`trip`.`drivers_id` = `driver_profiles`.`drivers_id`)) */;
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

-- Dump completed on 2021-04-07  0:17:54
