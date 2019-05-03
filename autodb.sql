-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: autodb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `autodb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `autodb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `autodb`;

--
-- Table structure for table `carcases`
--

DROP TABLE IF EXISTS `carcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carcases` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carcases`
--

LOCK TABLES `carcases` WRITE;
/*!40000 ALTER TABLE `carcases` DISABLE KEYS */;
INSERT INTO `carcases` VALUES (1,'Седан'),(2,'Купе'),(3,'Лимузин'),(4,'Хэтчбек'),(5,'Универсал'),(6,'Кабриолет'),(7,'Минивэн'),(8,'Пикап'),(9,'Внедорожник'),(10,'Кроссовер');
/*!40000 ALTER TABLE `carcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cars` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MARK_ID` bigint(20) NOT NULL,
  `MODEL_ID` bigint(20) NOT NULL,
  `GENERATION_ID` bigint(20) NOT NULL,
  `TITLE` varchar(225) NOT NULL,
  `PRICE` double NOT NULL,
  `OWNER_ID` bigint(20) NOT NULL,
  `DATEADD` datetime NOT NULL,
  `REGION` varchar(45) NOT NULL,
  `YEAR_ISSUE` varchar(45) NOT NULL,
  `CARCASE_ID` bigint(20) NOT NULL,
  `FUEL_ID` bigint(20) NOT NULL,
  `TRANSMISSION_ID` bigint(20) NOT NULL,
  `ENGINE_CAPACITY_ID` bigint(20) NOT NULL,
  `MILEAGE` int(11) NOT NULL,
  `COLOR_ID` bigint(20) DEFAULT NULL,
  `DRIVE_UNIT_ID` bigint(20) NOT NULL,
  `POWER` int(11) NOT NULL,
  `WHEEL_DIAMETER` int(11) DEFAULT NULL,
  `CONDITION` varchar(45) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `car_fk_mark_idx` (`MARK_ID`),
  KEY `car_fk_model_idx` (`MODEL_ID`),
  KEY `car_fk_generation_idx` (`GENERATION_ID`),
  KEY `FKst5wx1ahrn6fuvmypf09cjcfi` (`CARCASE_ID`),
  KEY `FK4mv4ncm53ja4qtqmfqspxv7l` (`COLOR_ID`),
  KEY `FKtrjh2q83c5gmf4kgphpvfwpph` (`DRIVE_UNIT_ID`),
  KEY `FKsken61sdlwxjdxbnr39d81ysu` (`ENGINE_CAPACITY_ID`),
  KEY `FKsl0wrmmbnt8rd0y70kl21cc8q` (`FUEL_ID`),
  KEY `FKfgbwxwqrk4cooxx1tw40ha374` (`TRANSMISSION_ID`),
  CONSTRAINT `FK4mv4ncm53ja4qtqmfqspxv7l` FOREIGN KEY (`COLOR_ID`) REFERENCES `color` (`id`),
  CONSTRAINT `FK5um4kwk1ms8mhhrdk5diql2fi` FOREIGN KEY (`MARK_ID`) REFERENCES `marks` (`id`),
  CONSTRAINT `FKfgbwxwqrk4cooxx1tw40ha374` FOREIGN KEY (`TRANSMISSION_ID`) REFERENCES `transmission` (`id`),
  CONSTRAINT `FKg1qo6b481ypqbwglkuxdw6cmf` FOREIGN KEY (`GENERATION_ID`) REFERENCES `generations` (`id`),
  CONSTRAINT `FKrwe6b2vd08hb4gnst223xsna4` FOREIGN KEY (`MODEL_ID`) REFERENCES `models` (`id`),
  CONSTRAINT `FKsken61sdlwxjdxbnr39d81ysu` FOREIGN KEY (`ENGINE_CAPACITY_ID`) REFERENCES `engine_capacity` (`id`),
  CONSTRAINT `FKsl0wrmmbnt8rd0y70kl21cc8q` FOREIGN KEY (`FUEL_ID`) REFERENCES `fuel` (`id`),
  CONSTRAINT `FKst5wx1ahrn6fuvmypf09cjcfi` FOREIGN KEY (`CARCASE_ID`) REFERENCES `carcases` (`id`),
  CONSTRAINT `FKtrjh2q83c5gmf4kgphpvfwpph` FOREIGN KEY (`DRIVE_UNIT_ID`) REFERENCES `drive_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,10,9,13,'Audi в хорошем состоение',50000,1,'2019-02-18 00:00:00','Душанбе','2010',4,2,1,10,3000,1,1,266,19,'Требуется ремонп',NULL),(2,13,63,20,'BMW в отличтом состояние',100000,2,'2019-02-18 00:00:00','Куляб','2012',4,2,1,10,3265,2,2,325,19,'Требуется ремонп',NULL),(3,10,7,8,'Audi A1 2018г',150000,3,'2019-02-18 00:00:00','Дарвоз','2010',4,2,1,10,2356,1,3,265,19,'Не требуется ремонп',NULL),(4,10,9,12,'Audi A3 срочно продаю',80000,4,'2019-02-20 00:00:00','Хамадони','2011',4,2,1,10,23646,2,2,265,19,'Требуется ремонп',NULL),(5,13,63,20,'BMW M4 обмен',260000,5,'2019-01-14 00:00:00','Дангара','2017',4,2,1,10,235,3,1,265,19,'Не требуется ремонп',NULL),(6,13,63,20,'BMW M4  в отличном состояние',300000,6,'2019-02-02 00:00:00','Айни','2016',4,2,1,10,4654,1,3,265,19,'Требуется ремонп',NULL),(7,13,63,20,'BMW M4 на запчасти',20000,7,'2019-01-30 00:00:00','Худжанд','2015',4,2,1,10,5654,4,2,364,19,'Не требуется ремонп',NULL);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `color` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Белый'),(2,'Черный'),(3,'Зелёный'),(4,'Красный'),(5,'Желтый'),(6,'Оранжевый');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_unit`
--

DROP TABLE IF EXISTS `drive_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drive_unit` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_unit`
--

LOCK TABLES `drive_unit` WRITE;
/*!40000 ALTER TABLE `drive_unit` DISABLE KEYS */;
INSERT INTO `drive_unit` VALUES (1,'передный'),(2,'задный'),(3,'полный');
/*!40000 ALTER TABLE `drive_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_capacity`
--

DROP TABLE IF EXISTS `engine_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `engine_capacity` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CAPACITY` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_capacity`
--

LOCK TABLES `engine_capacity` WRITE;
/*!40000 ALTER TABLE `engine_capacity` DISABLE KEYS */;
INSERT INTO `engine_capacity` VALUES (1,0.2),(2,0.4),(3,0.6),(4,0.8),(5,1),(6,1.2),(7,1.4),(8,1.6),(9,1.8),(10,2),(11,2.2),(12,2.4),(13,2.6),(14,2.8),(15,3),(16,3.5),(17,4),(18,4.5),(19,5),(20,5.5),(21,6),(22,7),(23,8),(24,9),(25,10);
/*!40000 ALTER TABLE `engine_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel`
--

DROP TABLE IF EXISTS `fuel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fuel` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel`
--

LOCK TABLES `fuel` WRITE;
/*!40000 ALTER TABLE `fuel` DISABLE KEYS */;
INSERT INTO `fuel` VALUES (1,'Дизель'),(2,'Бензин'),(3,'Гибрид'),(4,'Электро'),(5,'Турбированный'),(6,'Атмосферный');
/*!40000 ALTER TABLE `fuel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generations`
--

DROP TABLE IF EXISTS `generations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `generations` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `PERIOD` varchar(45) DEFAULT NULL,
  `MODEL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKg9wutt785gq16ygypbxiroiq9` (`MODEL_ID`),
  CONSTRAINT `FKg9wutt785gq16ygypbxiroiq9` FOREIGN KEY (`MODEL_ID`) REFERENCES `models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generations`
--

LOCK TABLES `generations` WRITE;
/*!40000 ALTER TABLE `generations` DISABLE KEYS */;
INSERT INTO `generations` VALUES (1,'IV(C4)','1990-1994',1),(2,'III(C3)','1988-1991',1),(3,'II(C3) Рестайлинг','1988-1991',2),(4,'II(C3)','1983-1988',2),(5,'I(C2) ','1979-1982',2),(6,'I','2010-2015',7),(7,'I  Рестайлинг','2014-2018',7),(8,'II','2018- н.в.',7),(9,'','2000-2007',8),(10,'I (8L)','1996-2000',9),(11,'I (8L) Рестайлинг','2000-2003',9),(12,'II (8P)','2003-2005',9),(13,'II (8P)  Рестайлинг 1','2004-2008',9),(14,'II (8P)  Рестайлинг 2','2008-2013',9),(15,'III (8V)','2012-2016',9),(16,'III (8V) Рестайлинг ','2016- н.в.',9),(17,'IV (E39)','1995-2000',55),(18,'IV (E39) Рестайлинг ','2000-2004',55),(19,'VII (G30/G31)','2016-н.в.',55),(20,'F82/F83','2016-н.в',63),(21,'I (E53)','1999-2003',72),(22,'I (E53) Рестайлинг ','2003-2006',72),(23,'III (F15)','2013-2018',72),(24,'IV (G05) ','2018- н.в.',72),(25,'IV','1992-1998',94),(26,'IV Рестайлинг ','1998-2002',94),(27,'V','2009-2013',94),(28,'V Рестайлинг ','2013-2015',94),(29,'','2004-2013',108),(30,'','2002-2009',176),(31,'I','1998-2000',181),(32,'I Рестайлинг ','2000-2015',181),(33,'I','1995-2008',184),(34,'I Рестайлинг ','2008-2016',184),(35,'II Рестайлинг ','2002-2005',454),(36,'III','2006-2011',454),(37,'IV','2010-2017',454),(38,'IV','2006-2010',456),(39,'V','2010-2015',456),(40,'VI','2015-н.в.',456),(41,'I','2010-2013',555),(42,'I Рестайлинг ','2013-2015',555),(43,'II','2015-н.в.',555),(44,'III','2010-2014',576),(45,'III Рестайлинг ','2014-2016',576),(46,'IV','2016-н.в.',576),(47,'IV Рестайлинг ','2018-н.в.',576),(48,'III','2002-2005',535),(49,'III Рестайлинг ','2005-2009',535),(50,'III Рестайлинг 2','2009-2012',535),(51,'IV','2012-2017',535),(52,'IV Рестайлинг ','2017-н.в.',535);
/*!40000 ALTER TABLE `generations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (7),(7);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marks` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `ICON` tinyblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,'AC',NULL),(2,'AMC',NULL),(3,'Acura',NULL),(4,'Adler',NULL),(5,'Alfa Romeo',NULL),(6,'Alpina',NULL),(7,'Aro',NULL),(8,'Asia',NULL),(9,'Aston Martin',NULL),(10,'Audi',NULL),(11,'Austin',NULL),(12,'Autobianchi',NULL),(13,'BMW',NULL),(14,'BYD',NULL),(15,'Bentley',NULL),(16,'Brilliance',NULL),(17,'Buick',NULL),(18,'Cadillac',NULL),(19,'ChangFeng',NULL),(20,'Changan',NULL),(21,'Changhe',NULL),(22,'Chery',NULL),(23,'Chevrolet',NULL),(24,'Chrysler',NULL),(25,'Citroen',NULL),(26,'DS',NULL),(27,'DW Hower',NULL),(28,'Dacia',NULL),(29,'Dadi',NULL),(30,'Daewoo',NULL),(31,'Daihatsu',NULL),(32,'Daimler',NULL),(33,'Datsun',NULL),(34,'Derways',NULL),(35,'Dodge',NULL),(36,'DongFeng',NULL),(37,'Doninvest',NULL),(38,'Eagle',NULL),(39,'Excalibur',NULL),(40,'FAW',NULL),(41,'FSO',NULL),(42,'Ferrari',NULL),(43,'Fiat',NULL),(44,'Ford',NULL),(45,'Foton',NULL),(46,'GMC',NULL),(47,'Geely',NULL),(48,'Genesis',NULL),(49,'Geo',NULL),(50,'Great Wall',NULL),(51,'Hafei',NULL),(52,'Haima',NULL),(53,'Haval',NULL),(54,'Hawtai',NULL),(55,'Hispano-Suiza',NULL),(56,'Honda',NULL),(57,'Horch',NULL),(58,'HuangHai',NULL),(59,'Hudson',NULL),(60,'Hummer',NULL),(61,'Hyundai',NULL),(62,'Infiniti',NULL),(63,'Iran Khodro',NULL),(64,'Isuzu',NULL),(65,'JAC',NULL),(66,'JMC',NULL),(67,'Jaguar',NULL),(68,'Jeep',NULL),(69,'Jinbei',NULL),(70,'Kia',NULL),(71,'LADA (ВАЗ)',NULL),(72,'Lamborghini',NULL),(73,'Lancia',NULL),(74,'Land Rover',NULL),(75,'Landwind',NULL),(76,'Lexus',NULL),(77,'Lifan',NULL),(78,'Lincoln',NULL),(79,'Lotus',NULL),(80,'Luxgen',NULL),(81,'MG',NULL),(82,'MINI',NULL),(83,'Mahindra',NULL),(84,'Marussia',NULL),(85,'Maruti',NULL),(86,'Maserati',NULL),(87,'Maybach',NULL),(88,'Mazda',NULL),(89,'McLaren',NULL),(90,'Mercedes-Benz',NULL),(91,'Mercury',NULL),(92,'Metrocab',NULL),(93,'Mitsubishi',NULL),(94,'Mitsuoka',NULL),(95,'Morgan',NULL),(96,'Morris',NULL),(97,'Nissan',NULL),(98,'Oldsmobile',NULL),(99,'Opel',NULL),(100,'PUCH',NULL),(101,'Packard',NULL),(102,'Peugeot',NULL),(103,'Plymouth',NULL),(104,'Pontiac',NULL),(105,'Porsche',NULL),(106,'Proton',NULL),(107,'Rambler',NULL),(108,'Ravon',NULL),(109,'Renault',NULL),(110,'Renault Samsung',NULL),(111,'Rimac',NULL),(112,'Rolls-Royce',NULL),(113,'Rover',NULL),(114,'SEAT',NULL),(115,'Saab',NULL),(116,'Saturn',NULL),(117,'Scion',NULL),(118,'Shanghai Maple',NULL),(119,'ShuangHuan',NULL),(120,'Skoda',NULL),(121,'Smart',NULL),(122,'SsangYong',NULL),(123,'Subaru',NULL),(124,'Suzuki',NULL),(125,'Tatra',NULL),(126,'Tesla',NULL),(127,'Tianma',NULL),(128,'Tianye',NULL),(129,'Toyota',NULL),(130,'Trabant',NULL),(131,'Triumph',NULL),(132,'Vauxhall',NULL),(133,'Volkswagen',NULL),(134,'Volvo',NULL),(135,'Vortex',NULL),(136,'Wartburg',NULL),(137,'Wiesmann',NULL),(138,'Willys',NULL),(139,'Xin Kai',NULL),(140,'ZX',NULL),(141,'Zibar',NULL),(142,'Zotye',NULL),(143,'Автокам',NULL),(144,'ГАЗ',NULL),(145,'ЗАЗ',NULL),(146,'ЗИЛ',NULL),(147,'ЗиС',NULL),(148,'ИЖ',NULL),(149,'Комбат',NULL),(150,'ЛуАЗ',NULL),(151,'Москвич',NULL),(152,'СМЗ',NULL),(153,'ТагАЗ',NULL),(154,'УАЗ',NULL);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `models` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `MARK_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKa3bx5wx21caor8ab44c5xt9ff` (`MARK_ID`),
  CONSTRAINT `FKa3bx5wx21caor8ab44c5xt9ff` FOREIGN KEY (`MARK_ID`) REFERENCES `marks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'100',10),(2,'200',10),(3,'50',10),(4,'80',10),(5,'90',10),(6,'920',10),(7,'A1',10),(8,'A2',10),(9,'A3',10),(10,'A4',10),(11,'A4 allroad',10),(12,'A5',10),(13,'A6',10),(14,'A6 allroaD',10),(15,'A7',10),(16,'A8',10),(17,'Cabriolet',10),(18,'Couple',10),(19,'Q2',10),(20,'Q3',10),(21,'Q5',10),(22,'Q7',10),(23,'Q8',10),(24,'R8',10),(25,'RS2',10),(26,'RS3',10),(27,'RS4',10),(28,'RS5',10),(29,'RS6',10),(30,'RS7',10),(31,'RS Q3',10),(32,'S1',10),(33,'S2',10),(34,'S3',10),(35,'S4',10),(36,'S5',10),(37,'S6',10),(38,'S7',10),(39,'S8',10),(40,'SQ2',10),(41,'SQ5',10),(42,'SQ7',10),(43,'TT',10),(44,'TT RS',10),(45,'TTS',10),(46,'Typ R',10),(47,'V8',10),(48,'1 СЃРµСЂРёСЏ',13),(49,'2 СЃРµСЂРёСЏ',13),(50,'2 СЃРµСЂРёСЏ Active Tourer',13),(51,'2 СЃРµСЂРёСЏ Grand Tourer',13),(52,'3 СЃРµСЂРёСЏ',13),(53,'340',13),(54,'4 СЃРµСЂРёСЏ',13),(55,'5 СЃРµСЂРёСЏ',13),(56,'6 СЃРµСЂРёСЏ',13),(57,'7 СЃРµСЂРёСЏ',13),(58,'8 СЃРµСЂРёСЏ',13),(59,'i3',13),(60,'i8',13),(61,'M2',13),(62,'M3',13),(63,'M4',13),(64,'M5',13),(65,'M6',13),(66,'X1',13),(67,'X2',13),(68,'X3',13),(69,'X3 M',13),(70,'X4',13),(71,'X4 M',13),(72,'X5',13),(73,'X5 M',13),(74,'X6',13),(75,'X6 M',13),(76,'X7',13),(77,'Z1',13),(78,'Z3',13),(79,'Z3 M',13),(80,'Z4',13),(81,'Z4M',13),(82,'Z8',13),(83,'Alero',23),(84,'Astro',23),(85,'Avalanche',23),(86,'Aveo',23),(87,'Bel Air',23),(88,'Beretta',23),(89,'Blazer',23),(90,'Blazer K5',23),(91,'Bolt',23),(92,'C-10',23),(93,'C/K',23),(94,'Camaro',23),(95,'Caprice',23),(96,'Captiva',23),(97,'Cavalier',23),(98,'Cobalt',23),(99,'Colorado',23),(100,'Corsica',23),(101,'Corvette',23),(102,'Cruze',23),(103,'Epica',23),(104,'Equinox',23),(105,'Evanda',23),(106,'Express',23),(107,'Impala',23),(108,'Lacetti',23),(109,'Lanos',23),(110,'Lumina',23),(111,'Malibu',23),(112,'Metro',23),(113,'Matiz',23),(114,'Niva',23),(115,'Nubira',23),(116,'Orlando',23),(117,'Rezzo',23),(118,'Silverado',23),(119,'Spark',23),(120,'Suburban',23),(121,'Tahoe',23),(122,'Tracker',23),(123,'TrailBlazer',23),(124,'Traverse',23),(125,'Volt',23),(126,'Viva',23),(127,'300C',24),(128,'300M',24),(129,'Cirrus',24),(130,'Concorde',24),(131,'Crossfire',24),(132,'Intrepid',24),(133,'LeBaron',24),(134,'LHS',24),(135,'Neon',24),(136,'New Yorker',24),(137,'Pacifica',24),(138,'PT Cruiser',24),(139,'Saratoga',24),(140,'Sebring',24),(141,'Stratus',24),(142,'Town & Country',24),(143,'Voyager',24),(144,'2 CV',25),(145,'Berlingo',25),(146,'BX',25),(147,'C-Crosser',25),(148,'C-Elysee',25),(149,'C1',25),(150,'C2',25),(151,'C3',25),(152,'C3 Aircross',25),(153,'C3 Picasso',25),(154,'C4',25),(155,'C4 Aircross',25),(156,'C4 Picasso',25),(157,'C4 SpaceTourer',25),(158,'C5',25),(159,'C6',25),(160,'C8',25),(161,'CX',25),(162,'DS3',25),(163,'DS4',25),(164,'DS5',25),(165,'Evasion',25),(166,'Jumpy',25),(167,'SpaceTourer',25),(168,'Xantia',25),(169,'Xsara',25),(170,'Xsara Picasso',25),(171,'Damas',30),(172,'Espero',30),(173,'Evanda',30),(174,'Gentra',30),(175,'Kalos',30),(176,'Lacetti',30),(177,'Lacetti Premiere',30),(178,'Lanos',30),(179,'Leganza',30),(180,'Magnus',30),(181,'Matiz',30),(182,'Matiz Creative',30),(183,'Musso',30),(184,'Nexia',30),(185,'Nubira',30),(186,'Racer',30),(187,'Rezzo',30),(188,'Sens',30),(189,'Tacuma',30),(190,'Tico',30),(191,'Winstorm',30),(308,'Aerostar',44),(309,'Bronco',44),(310,'Bronco-II',44),(311,'C-MAX',44),(312,'Capri',44),(313,'Contour',44),(314,'Cougar',44),(315,'Crown Victoria',44),(316,'Econoline',44),(317,'EcoSport',44),(318,'Edge',44),(319,'Escape',44),(320,'Escort',44),(321,'Excursion',44),(322,'Expedition',44),(323,'Explorer',44),(324,'F-150',44),(325,'Fiesta',44),(326,'Fiesta ST',44),(327,'Focus',44),(328,'Focus (North America)',44),(329,'Focus ST',44),(330,'Freestyle',44),(331,'Fusion',44),(332,'Fusion (North America)',44),(333,'Galaxie',44),(334,'Galaxy',44),(335,'Granada',44),(336,'GT',44),(337,'GT40',44),(338,'Ixion',44),(339,'KA',44),(340,'Kuga',44),(341,'Laser',44),(342,'LTD Crown Victoria',44),(343,'Maverick',44),(344,'Model A',44),(345,'Model T',44),(346,'Mondeo',44),(347,'Mondeo ST',44),(348,'Mustang',44),(349,'Orion',44),(350,'Probe',44),(351,'Puma',44),(352,'Ranchero',44),(353,'Ranger',44),(354,'Ranger (North America)',44),(355,'S-MAX',44),(356,'Scorpio',44),(357,'Sierra',44),(358,'Spectron',44),(359,'Taunus',44),(360,'Tempo',44),(361,'Telstar',44),(362,'Thunderbird',44),(363,'Tourneo Connect',44),(364,'Tourneo Custom',44),(365,'Windstar',44),(366,'Focus RS',44),(367,'500',43),(368,'500L',43),(369,'Albea',43),(370,'Brava',43),(371,'Bravo',43),(372,'Croma',43),(373,'Fiorino',43),(374,'Doblo',43),(375,'Fullback',43),(376,'Linea',43),(377,'Marea',43),(378,'Palio',43),(379,'Panda',43),(380,'Punto',43),(381,'Qubo',43),(382,'Scudo',43),(383,'Sedici',43),(384,'Stilo',43),(385,'Tempra',43),(386,'Tipo',43),(387,'Ulysse',43),(388,'Uno',43),(389,'Accord',56),(390,'Acty',56),(391,'Airwave',56),(392,'Ascot',56),(393,'Ascot Innova',56),(394,'Avancier',56),(395,'Beat',56),(396,'Capa',56),(397,'City',56),(398,'Civic',56),(399,'Civic Ferio',56),(400,'Civic Type R',56),(401,'Concerto',56),(402,'CR-V',56),(403,'CR-X',56),(404,'CR-Z',56),(405,'Crossroad',56),(406,'Crosstour',56),(407,'Domani',56),(408,'Edix',56),(409,'Element',56),(410,'Elysion',56),(411,'Fit',56),(412,'Fit Aria',56),(413,'Fit Shuttle',56),(414,'FR-V',56),(415,'Freed',56),(416,'Grace',56),(417,'HR-V',56),(418,'Insight',56),(419,'Inspire',56),(420,'Integra',56),(421,'Integra SJ',56),(422,'Jade',56),(423,'Jazz',56),(424,'Lagreat',56),(425,'Life',56),(426,'Logo',56),(427,'Mobilio',56),(428,'Mobilio Spike',56),(429,'N-BOX',56),(430,'N-One',56),(431,'N-WGN',56),(432,'NSX',56),(433,'Odyssey',56),(434,'Odyssey (North America)',56),(435,'Orthia',56),(436,'Partner',56),(437,'Passport',56),(438,'Pilot',56),(439,'Prelude',56),(440,'Rafaga',56),(441,'Ridgeline',56),(442,'S-MX',56),(443,'S2000',56),(444,'S660',56),(445,'Saber',56),(446,'Shuttle',56),(447,'Stepwgn',56),(448,'Stream',56),(449,'Torneo',56),(450,'Vamos',56),(451,'Vezel',56),(452,'Vigor',56),(453,'Zest',56),(454,'Accent',61),(455,'Atos',61),(456,'Avante',61),(457,'Centennial',61),(458,'Click',61),(459,'Coupe',61),(460,'Creta',61),(461,'Elantra',61),(462,'Equus',61),(463,'Excel',61),(464,'Galloper',61),(465,'Genesis',61),(466,'Genesis Coupe',61),(467,'Getz',61),(468,'Grace',61),(469,'Grand Starex',61),(470,'Grandeur',61),(471,'H-1',61),(472,'H200',61),(473,'i10',61),(474,'i20',61),(475,'i30',61),(476,'i40',61),(477,'ix35',61),(478,'ix55',61),(479,'Lantra',61),(480,'Lavita',61),(481,'Matrix',61),(482,'Maxcruz',61),(483,'Pony',61),(484,'Santa Fe',61),(485,'Santamo',61),(486,'Scoupe',61),(487,'Solaris',61),(488,'Sonata',61),(489,'Starex',61),(490,'Terracan',61),(491,'Tiburon',61),(492,'Trajet',61),(493,'Tucson',61),(494,'Tuscani',61),(495,'Veloster',61),(496,'Verna',61),(497,'XG',61),(498,'H1',60),(499,'H2',60),(500,'H3',60),(501,'EX',62),(502,'FX',62),(503,'G',62),(504,'I',62),(505,'J',62),(506,'JX',62),(507,'M',62),(508,'Q',62),(509,'Q30',62),(510,'Q40',62),(511,'Q50',62),(512,'Q60',62),(513,'Q70',62),(514,'QX30',62),(515,'QX4',62),(516,'QX50',62),(517,'QX56',62),(518,'QX60',62),(519,'QX70',62),(520,'QX80',62),(521,'Cherokee',68),(522,'CJ',68),(523,'Commander',68),(524,'Compass',68),(525,'Grand Cherokee',68),(526,'Grand Wagoneer',68),(527,'Liberty (North America)',68),(528,'Liberty (Patriot)',68),(529,'Renegade',68),(530,'Wrangler',68),(531,'Defender',74),(532,'Discovery',74),(533,'Discovery Sport',74),(534,'Freelander',74),(535,'Range Rover',74),(536,'Range Rover Evoque',74),(537,'Range Rover Sport',74),(538,'Range Rover Velar',74),(539,'Series I',74),(540,'Series II',74),(541,'Series III',74),(542,'Avella',70),(543,'Cadenza',70),(544,'Capital',70),(545,'Carens',70),(546,'Carnival',70),(547,'Carstar',70),(548,'Ceed',70),(549,'Ceed GT',70),(550,'Cerato',70),(551,'Clarus',70),(552,'Forte',70),(553,'Joice',70),(554,'K3',70),(555,'K5',70),(556,'K7',70),(557,'K9',70),(558,'K900',70),(559,'Magentis',70),(560,'Mohave (Borrego)',70),(561,'Morning',70),(562,'Opirus',70),(563,'Optima',70),(564,'Picanto',70),(565,'Pregio',70),(566,'Pride',70),(567,'Quoris',70),(568,'Retona',70),(569,'Rio',70),(570,'Sedona',70),(571,'Sephia',70),(572,'Shuma',70),(573,'Sorento',70),(574,'Soul',70),(575,'Spectra',70),(576,'Sportage',70),(577,'Stinger',70),(578,'Venga',70),(579,'X-Trek',70),(580,'Visto',70),(581,'1111 РћРєР°',71),(582,'2101',71),(583,'2102',71),(584,'2103',71),(585,'2104',71),(586,'2105',71),(587,'2106',71),(588,'2107',71),(589,'2108',71),(590,'2109',71),(591,'21099',71),(592,'2110',71),(593,'2111',71),(594,'2112',71),(595,'2113',71),(596,'2114',71),(597,'2115',71),(598,'2120 РќР°РґРµР¶РґР°',71),(599,'2121 (4x4)',71),(600,'2123',71),(601,'2129',71),(602,'2131 (4x4)',71),(603,'2328',71),(604,'2329',71),(605,'EL Lada',71),(606,'Granta',71),(607,'Kalina',71),(608,'Largus',71),(609,'Priora',71),(610,'Vesta',71),(611,'XRAY',71),(612,'121',88),(613,'1300',88),(614,'2',88),(615,'3',88),(616,'3 MPS',88),(617,'323',88),(618,'5',88),(619,'6',88),(620,'6 MPS',88),(621,'616',88),(622,'626',88),(623,'818',88),(624,'929',88),(625,'Atenza',88),(626,'Autozam AZ-3',88),(627,'Axela',88),(628,'AZ-1',88),(629,'AZ-Offroad',88),(630,'AZ-Wagon',88),(631,'B-series',88),(632,'Biante',88),(633,'Bongo',88),(634,'Bongo Friendee',88),(635,'BT-50',88),(636,'Capella',88),(637,'Carol',88),(638,'Cronos',88),(639,'CX-3',88),(640,'CX-5',88),(641,'CX-7',88),(642,'CX-9',88),(643,'CX-8',88),(644,'Demio',88),(645,'Efini MS-6',88),(646,'Efini MS-8',88),(647,'Efini MS-9',88),(648,'Eunos 100',88),(649,'Eunos 300',88),(650,'Eunos 800',88),(651,'Eunos 500',88),(652,'Eunos Cosmo',88),(653,'Familia',88),(654,'Flair',88),(655,'Flair Crossover',88),(656,'Lantis',88),(657,'Laputa',88),(658,'Luce',88),(659,'Millenia',88),(660,'MPV',88),(661,'MX-3',88),(662,'MX-5',88),(663,'MX-6',88),(664,'Navajo',88),(665,'Persona',88),(666,'Premacy',88),(667,'Proceed',88),(668,'Proceed Levante',88),(669,'Proceed Marvie',88),(670,'Protege',88),(671,'Roadster',88),(672,'RX-7',88),(673,'RX-8',88),(674,'Scrum',88),(675,'Sentia',88),(676,'Tribute',88),(677,'Verisa',88),(678,'Xedos 6',88),(679,'Xedos 9',88),(680,'CT',76),(681,'ES',76),(682,'GS',76),(683,'GS F',76),(684,'GX',76),(685,'HS',76),(686,'IS',76),(687,'IS F',76),(688,'LC',76),(689,'LS',76),(690,'LFA',76),(691,'LX',76),(692,'NX',76),(693,'RC',76),(694,'RC F',76),(695,'RX',76),(696,'SC',76),(697,'UX',76),(698,'190 (W201)',90),(699,'190 SL',90),(700,'A-klasse',90),(701,'A-klasse AMG',90),(702,'AMG GT',90),(703,'B-klasse',90),(704,'C-klasse',90),(705,'C-klasse AMG',90),(706,'Citan',90),(707,'CL-klasse',90),(708,'CL-klasse AMG',90),(709,'CLA-klasse',90),(710,'CLA-klasse AMG',90),(711,'CLC-klasse',90),(712,'CLK-klasse',90),(713,'CLK-klasse AMG',90),(714,'CLS-klasse',90),(715,'CLS-klasse AMG',90),(716,'E-klasse',90),(717,'E-klasse AMG',90),(718,'G-klasse',90),(719,'G-klasse AMG',90),(720,'G-klasse AMG 6x6',90),(721,'GL-klasse',90),(722,'GL-klasse AMG',90),(723,'GLA-klasse',90),(724,'GLA-klasse AMG',90),(725,'GLC',90),(726,'GLC AMG',90),(727,'GLC Coupe',90),(728,'GLC Coupe AMG',90),(729,'GLE',90),(730,'GLE AMG',90),(731,'GLE Coupe',90),(732,'GLE Coupe AMG',90),(733,'GLK-klasse',90),(734,'GLS-klasse',90),(735,'GLS-klasse AMG',90),(736,'M-klasse AMG',90),(737,'M-klasse',90),(738,'Maybach G 650 Landaulet',90),(739,'Maybach S-klasse',90),(740,'R-klasse',90),(741,'R-klasse AMG',90),(742,'S-klasse',90),(743,'S-klasse AMG',90),(744,'SL-klasse',90),(745,'SL-klasse AMG',90),(746,'SLC-klasse',90),(747,'SLC-klasse AMG',90),(748,'SLK-klasse',90),(749,'SLK-klasse AMG',90),(750,'SLR McLaren',90),(751,'SLS AMG',90),(752,'V-klasse',90),(753,'Vaneo',90),(754,'Viano',90),(755,'Vito',90),(756,'W100',90),(757,'W105',90),(758,'W111',90),(759,'W114',90),(760,'W115',90),(761,'W123',90),(762,'W124',90),(763,'W136',90),(764,'X-klasse',90),(765,'Agila',99),(766,'Ampera',99),(767,'Antara',99),(768,'Ascona',99),(769,'Astra',99),(770,'Astra OPC',99),(771,'Calibra',99),(772,'Campo',99),(773,'Combo',99),(774,'Commodore',99),(775,'Corsa',99),(776,'Corsa OPC',99),(777,'Frontera',99),(778,'Insignia',99),(779,'Insignia OPC',99),(780,'Kadett',99),(781,'Kapitan',99),(782,'Meriva',99),(783,'Meriva OPC',99),(784,'Mokka',99),(785,'Monterey',99),(786,'Olympia',99),(787,'Omega',99),(788,'P4',99),(789,'Rekord',99),(790,'Senator',99),(791,'Signum',99),(792,'Sintra',99),(793,'Super Six',99),(794,'Tigra',99),(795,'Vectra',99),(796,'Vectra OPC',99),(797,'Vita',99),(798,'Vivaro',99),(799,'Zafira',99),(800,'Zafira OPC',99),(801,'718 Boxster',105),(802,'718 Cayman',105),(803,'911',105),(804,'911 GT2',105),(805,'911 GT3',105),(806,'924',105),(807,'Boxster',105),(808,'Cayenne',105),(809,'Cayman',105),(810,'Macan',105),(811,'Cayman GT4',105),(812,'Panamera',105),(813,'120 Series',134),(814,'140 Series',134),(815,'164',134),(816,'260 Series',134),(817,'240 Series',134),(818,'260 Series',134),(819,'300 Series',134),(820,'440',134),(821,'460',134),(822,'480',134),(823,'740',134),(824,'780',134),(825,'850',134),(826,'940',134),(827,'960',134),(828,'C30',134),(829,'C70',134),(830,'Laplander',134),(831,'P1800',134),(832,'P1900',134),(833,'S40',134),(834,'S60',134),(835,'S60 Cross Country',134),(836,'S70',134),(837,'S80',134),(838,'S90',134),(839,'V40',134),(840,'V40 Cross Country',134),(841,'V50',134),(842,'V60',134),(843,'V60 Cross Country',134),(844,'V70',134),(845,'V90',134),(846,'V90 Cross Country',134),(847,'XC40',134),(848,'XC60',134),(849,'XC70',134),(850,'XC90',134),(851,'Amarok',133),(852,'Arteon',133),(853,'Beetle',133),(854,'Bora',133),(855,'Caddy',133),(856,'California',133),(857,'Caravelle',133),(858,'Corrado',133),(859,'Derby',133),(860,'Eos',133),(861,'EuroVan',133),(862,'Fox',133),(863,'Golf',133),(864,'Golf Country',133),(865,'Golf GTI',133),(866,'Golf Plus',133),(867,'Golf R',133),(868,'Golf R32',133),(869,'Golf Sportsvan',133),(870,'Jetta',133),(871,'Lupo',133),(872,'Karmann-Ghia',133),(873,'K70',133),(874,'Lupo GTI',133),(875,'Multivan',133),(876,'Parati',133),(877,'Passat',133),(878,'Passat (North America)',133),(879,'Passat CC',133),(880,'Phaeton',133),(881,'Pointer',133),(882,'Polo',133),(883,'Polo GTI',133),(884,'Polo R WRC',133),(885,'Quantum',133),(886,'Routan',133),(887,'Santana',133),(888,'Scirocco',133),(889,'Scirocco R',133),(890,'T-Roc',133),(891,'Taro',133),(892,'Teramont',133),(893,'Tiguan',133),(894,'Touareg',133),(895,'Touran',133),(896,'Transporter',133),(897,'Type 1',133),(898,'Type 2',133),(899,'Type 3',133),(900,'Type 4',133),(901,'up',133),(902,'Vento',133),(903,'XL1',133),(904,'4Runner',129),(905,'Allex',129),(906,'Allion',129),(907,'Alphard',129),(908,'Altezza',129),(909,'Aqua',129),(910,'Aristo',129),(911,'Aurion',129),(912,'Auris',129),(913,'Avalon',129),(914,'Avanza',129),(915,'Avensis',129),(916,'Avensis Verso',129),(917,'Aygo',129),(918,'Belta',129),(919,'Blade',129),(920,'Brevis',129),(921,'C-HR',129),(922,'Caldina',129),(923,'Cami',129),(924,'Camry',129),(925,'Camry Solara',129),(926,'Carina',129),(927,'Carina E',129),(928,'Carina ED',129),(929,'Cavalier',129),(930,'Celica',129),(931,'Celsior',129),(932,'Century',129),(933,'Chaser',129),(934,'Classic',129),(935,'Corolla',129),(936,'Corolla II',129),(937,'Corolla Rumion',129),(938,'Corolla Spacio',129),(939,'Corolla Verso',129),(940,'Corona',129),(941,'Corona EXiV',129),(942,'Corsa',129),(943,'Cresta',129),(944,'Crown',129),(945,'Crown Majesta',129),(946,'Curren',129),(947,'Cynos',129),(948,'Duet',129),(949,'Echo',129),(950,'Esquire',129),(951,'Estima',129),(952,'FJ Cruiser',129),(953,'Fortuner',129),(954,'FunCargo',129),(955,'Gaia',129),(956,'Grand HiAce',129),(957,'Granvia',129),(958,'GT86',129),(959,'Harrier',129),(960,'HiAce',129),(961,'Highlander',129),(962,'Hilux',129),(963,'Hilux Surf',129),(964,'Ipsum',129),(965,'iQ',129),(966,'ISis',129),(967,'Ist',129),(968,'Kluger',129),(969,'Land Cruiser',129),(970,'Land Cruiser Prado',129),(971,'Lite Ace',129),(972,'Mark II',129),(973,'Mark X',129),(974,'Mark X ZiO',129),(975,'MasterAce Surf',129),(976,'Matrix',129),(977,'Mega Cruiser',129),(978,'MR-S',129),(979,'MR2',129),(980,'Nadia',129),(981,'Noah',129),(982,'Opa',129),(983,'Paseo',129),(984,'Passo',129),(985,'Passo Sette',129),(986,'Picnic',129),(987,'Pixis Epoch',129),(988,'Pixis Mega',129),(989,'Pixis Space',129),(990,'Platz',129),(991,'Porte',129),(992,'Premio',129),(993,'Previa',129),(994,'Prius',129),(995,'Prius Alpha',129),(996,'Prius c',129),(997,'Prius v (+)',129),(998,'ProAce',129),(999,'Probox',129),(1000,'Progres',129),(1001,'Pronard',129),(1002,'Ractis',129),(1003,'Raum',129),(1004,'RAV 4',129),(1005,'Regius',129),(1006,'RegiusAce',129),(1007,'Rush',129),(1008,'Sai',129),(1009,'Scepter',129),(1010,'Sequoia',129),(1011,'Sera',129),(1012,'Sienna',129),(1013,'Sienta',129),(1014,'Soarer',129),(1015,'Soluna',129),(1016,'Spade',129),(1017,'Sparky',129),(1018,'Sprinter',129),(1019,'Sports 800',129),(1020,'Sprinter Carib',129),(1021,'Sprinter Marino',129),(1022,'Sprinter Trueno',129),(1023,'Starlet',129),(1024,'Succeed',129),(1025,'Supra',129),(1026,'Tacoma',129),(1027,'Tercel',129),(1028,'Touring HiAce',129),(1029,'Town Ace',129),(1030,'Tundra',129),(1031,'Urban Cruiser',129),(1032,'Vanguard',129),(1033,'Vellfire',129),(1034,'Venza',129),(1035,'Verossa',129),(1036,'Verso',129),(1037,'Verso-S',129),(1038,'Vios',129),(1039,'Vista',129),(1040,'Vitz',129),(1041,'Voltz',129),(1042,'Voxy',129),(1043,'WiLL',129),(1044,'WiLL Cypha',129),(1045,'Windom',129),(1046,'Wish',129),(1047,'Yaris',129),(1048,'Yaris Verso',129),(1049,'Aerio',124),(1050,'Alto',124),(1051,'Alto Lapin',124),(1052,'Baleno',124),(1053,'APV',124),(1054,'Cappuccino',124),(1055,'Carry',124),(1056,'Cara',124),(1057,'Celerio',124),(1058,'Cervo',124),(1059,'Cultus',124),(1060,'Equator',124),(1061,'Ertiga',124),(1062,'Escudo',124),(1063,'Esteem',124),(1064,'Every',124),(1065,'Forenza',124),(1066,'Grand Vitara',124),(1067,'Hustler',124),(1068,'Ignis',124),(1069,'Jimny',124),(1070,'Kei',124),(1071,'Kizashi',124),(1072,'Landy',124),(1073,'Liana',124),(1074,'MR Wagon',124),(1075,'Palette',124),(1076,'Reno',124),(1077,'Samurai',124),(1078,'Sidekick',124),(1079,'Solio',124),(1080,'Spacia',124),(1081,'Splash',124),(1082,'Swift',124),(1083,'SX4',124),(1084,'Twin',124),(1085,'Verona',124),(1086,'Vitara',124),(1087,'Wagon R',124),(1088,'Wagon R+',124),(1089,'X-90',124),(1090,'XL7',124),(1091,'1007',102),(1092,'104',102),(1093,'106',102),(1094,'107',102),(1095,'108',102),(1096,'2008',102),(1097,'201',102),(1098,'202',102),(1099,'203',102),(1100,'204',102),(1101,'205',102),(1102,'205 GTi',102),(1103,'206',102),(1104,'207',102),(1105,'208',102),(1106,'208 GTi',102),(1107,'3008',102),(1108,'301',102),(1109,'304',102),(1110,'305',102),(1111,'306',102),(1112,'307',102),(1113,'308',102),(1114,'308 GTi',102),(1115,'309',102),(1116,'4007',102),(1117,'4008',102),(1118,'402',102),(1119,'403',102),(1120,'404',102),(1121,'405',102),(1122,'406',102),(1123,'407',102),(1124,'408',102),(1125,'5008',102),(1126,'504',102),(1127,'505',102),(1128,'508',102),(1129,'604',102),(1130,'605',102),(1131,'607',102),(1132,'806',102),(1133,'807',102),(1134,'Bipper',102),(1135,'Expert',102),(1136,'iOn',102),(1137,'Partner',102),(1138,'RCZ',102),(1139,'Rifter',102),(1140,'Traveller',102),(1141,'100 Series',120),(1142,'105, 120',120),(1143,'1200',120),(1144,'Citigo',120),(1145,'Fabia',120),(1146,'Fabia RS',120),(1147,'Favorit',120),(1148,'Felicia',120),(1149,'Forman',120),(1150,'Karoq',120),(1151,'Kodiaq',120),(1152,'Kodiaq RS',120),(1153,'Octavia',120),(1154,'Octavia RS',120),(1155,'Popular',120),(1156,'Rapid',120),(1157,'Roomster',120),(1158,'Superb',120),(1159,'Yeti',120),(1160,'3000 GT',93),(1161,'500',93),(1162,'Airtrek',93),(1163,'Aspire',93),(1164,'ASX',93),(1165,'Attrage',93),(1166,'Carisma',93),(1167,'Celeste',93),(1168,'Challenger',93),(1169,'Chariot',93),(1170,'Colt',93),(1171,'Cordia',93),(1172,'Debonair',93),(1173,'Delica',93),(1174,'Delica D:2',93),(1175,'Delica D:3',93),(1176,'Delica D:5',93),(1177,'Diamante',93),(1178,'Dignity',93),(1179,'Dingo',93),(1180,'Dion',93),(1181,'Eclipse',93),(1182,'Eclipse Cross',93),(1183,'eK Active',93),(1184,'eK Classic',93),(1185,'eK Space',93),(1186,'eK Sport',93),(1187,'eK Custom',93),(1188,'eK Sport',93),(1189,'Emeraude',93),(1190,'eK Wagon',93),(1191,'Endeavor',93),(1192,'Eterna',93),(1193,'FTO',93),(1194,'Galant',93),(1195,'Galant Fortis',93),(1196,'Grandis',93),(1197,'GTO',93),(1198,'i',93),(1199,'i-MiEV',93),(1200,'Jeep J',93),(1201,'L200',93),(1202,'L300',93),(1203,'L400',93),(1204,'Lancer',93),(1205,'Lancer Cargo',93),(1206,'Lancer Evolution',93),(1207,'Lancer Ralliart',93),(1208,'Legnum',93),(1209,'Libero',93),(1210,'Minica',93),(1211,'Minicab',93),(1212,'Minicab',93),(1213,'Mirage',93),(1214,'Montero',93),(1215,'Montero Sport',93),(1216,'Outlander',93),(1217,'Pajero',93),(1218,'Pajero Junior',93),(1219,'Pajero Mini',93),(1220,'Pajero Pinin',93),(1221,'Pajero Sport',93),(1222,'Pistachio',93),(1223,'Proudia',93),(1224,'Raider',93),(1225,'RVR',93),(1226,'Sapporo',93),(1227,'Savrin',93),(1228,'Sigma',93),(1229,'Space Gear',93),(1230,'Space Runner',93),(1231,'Space Star',93),(1232,'Space Wagon',93),(1233,'Strada',93),(1234,'Toppo',93),(1235,'Town Box',93);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `owners` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `NUMBERPHONE` varchar(45) NOT NULL,
  `MAIL` varchar(45) NOT NULL,
  `PHOTO` tinyblob,
  `number_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Дилшод','915400323','dilshod.mizrobov@mail.ru',NULL,NULL),(2,'Диловар','+79312976919','mr.dilovar@mail.ru',NULL,NULL),(3,'Алишер','902323355','alisher@mail.ru',NULL,NULL),(4,'Джонибек','934202079','jonibek@mail.ru',NULL,NULL),(5,'Садам','988645637','sadam@mail.ru',NULL,NULL),(6,'Шухрат','+75692326543','shuhrat@mail.ru',NULL,NULL),(7,'Гулбахор','988427975','gulbahorsangova@mail.ru',NULL,NULL);
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` VALUES ('dbuser1','7hBWCr3Ln5/jJCSyDLLfBg==','zCCL6LS7dRAVhXOJGNJh+Q==','2019-04-11 09:05:47');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'ROLE_USER'),(4,'ROLE_USER'),(6,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transmission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmission`
--

LOCK TABLES `transmission` WRITE;
/*!40000 ALTER TABLE `transmission` DISABLE KEYS */;
INSERT INTO `transmission` VALUES (1,'Автомат'),(2,'Робот'),(3,'Вариатор'),(4,'Автоматическая '),(5,'Механическая');
/*!40000 ALTER TABLE `transmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dilshod.mizrobov@mail.ru','Dilshod','Mizrobov','$2a$10$IkhgzCMnJR8ujvxDGYhe.eG583kqx3bnxElBPrBwCr6Vh1YZvVinm'),(3,'mr.mizrobov@mail.ru','Dilshod','Mizrobov','$2a$10$qtlR.NQR4fIKZIODcDrtc.pcB5FXw62Uwjo00Nt5x28OxYlXkC0ca'),(5,'d.mizrobov@mail.ru','Dilovar','Mizrobov','$2a$10$3k2xHW7sbwcdVfD9HELemeHA5oKjXAMCmWCFeKiLhY3lIyHVmChMy');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,2),(3,4),(5,6);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-03 13:52:37
