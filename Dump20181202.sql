-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: comicbookstore.clkbzgufuwb6.us-east-2.rds.amazonaws.com    Database: ComicBookShop_Sprint_3
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `Character`
--

DROP TABLE IF EXISTS `Character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Character` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `character_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Character`
--

LOCK TABLES `Character` WRITE;
/*!40000 ALTER TABLE `Character` DISABLE KEYS */;
INSERT INTO `Character` VALUES (1,'Batman'),(2,'The Joker'),(3,'Superman'),(4,'Doomsday'),(5,'Spiderman'),(6,'Swarm'),(7,'Robin'),(8,'Spectre'),(9,'Eclipso'),(10,'Hawkman'),(11,'Green Lantern'),(12,'Doctor Psycho'),(13,'Maxwell Lord');
/*!40000 ALTER TABLE `Character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Collection`
--

DROP TABLE IF EXISTS `Collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_omnibus` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`collection_id`),
  UNIQUE KEY `unique_key` (`collection_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Collection_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Collection`
--

LOCK TABLES `Collection` WRITE;
/*!40000 ALTER TABLE `Collection` DISABLE KEYS */;
INSERT INTO `Collection` VALUES (1,0,39),(2,1,46);
/*!40000 ALTER TABLE `Collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionIssue`
--

DROP TABLE IF EXISTS `CollectionIssue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CollectionIssue` (
  `issue_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  PRIMARY KEY (`collection_id`,`issue_id`),
  UNIQUE KEY `unique_key` (`collection_id`,`issue_id`),
  KEY `fk_issue` (`issue_id`),
  CONSTRAINT `CollectionIssue_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `Collection` (`collection_id`),
  CONSTRAINT `CollectionIssue_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionIssue`
--

LOCK TABLES `CollectionIssue` WRITE;
/*!40000 ALTER TABLE `CollectionIssue` DISABLE KEYS */;
INSERT INTO `CollectionIssue` VALUES (32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(53,2),(54,2),(55,2),(56,2),(57,2),(59,1),(59,2),(60,1),(60,2),(61,1),(61,2),(62,1),(62,2),(63,1),(63,2),(64,1),(64,2),(65,1),(65,2);
/*!40000 ALTER TABLE `CollectionIssue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colorist`
--

DROP TABLE IF EXISTS `Colorist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Colorist` (
  `colorist_id` int(11) NOT NULL AUTO_INCREMENT,
  `colorist_last_name` varchar(30) DEFAULT NULL,
  `colorist_first_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`colorist_id`),
  UNIQUE KEY `unique_key` (`colorist_id`),
  KEY `colorist_name` (`colorist_last_name`,`colorist_first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colorist`
--

LOCK TABLES `Colorist` WRITE;
/*!40000 ALTER TABLE `Colorist` DISABLE KEYS */;
INSERT INTO `Colorist` VALUES (1,'Bellaire','Jordie'),(2,'Kalisz','John'),(5,'Ottley','Ryan'),(4,'Quintana','Will'),(3,'Sanchez','Alejandro');
/*!40000 ALTER TABLE `Colorist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile_phone_number` varchar(13) DEFAULT NULL,
  `home_phone_number` varchar(13) DEFAULT NULL,
  `street_address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `is_manager` tinyint(1) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `unique_key` (`employee_id`),
  KEY `employee_name` (`last_name`,`first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Andrew','Dalton','adalton@comix.com','0017045692254','0018128728787','2972 Tryon Drive','Charlotte','NC','United States',1,'28269'),(2,'Kathryn','Watts','kwatts@comix.com','0013363683109','0012898212952','404 Elm Street','Apex','NC','United States',0,'27502'),(3,'Owen','Costa','ocosta@comix.com','0017045887741','0015124044374','7089 Dusty Cove','Cary','VA','United States',0,'27511'),(4,'Arabella','Valdez','avaldez@comix.com','0914025887988','0914782721480','402 Lynchburg Road','Nashville','TN','United States',0,'37011'),(5,'Lilah','Salas','lsalas@comix.com','0915026694412','0916465545073','44 Bogaram Lane','Hyderabad',NULL,'India',1,'00052'),(6,'Azaria','Hanna','ahanna@comix.com','013367104698','0016692239622','568 Green Ave','San Diego','CA','United States',0,'22434');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(30) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `unique_key` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Superhero'),(2,'Science Fiction'),(3,'Military'),(4,'Crime'),(5,'Drama'),(6,'Crime'),(7,'Crime');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inker`
--

DROP TABLE IF EXISTS `Inker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inker` (
  `inker_id` int(11) NOT NULL AUTO_INCREMENT,
  `inker_first_name` varchar(30) DEFAULT NULL,
  `inker_last_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`inker_id`),
  UNIQUE KEY `unique_key` (`inker_id`),
  KEY `inker_name` (`inker_last_name`,`inker_first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inker`
--

LOCK TABLES `Inker` WRITE;
/*!40000 ALTER TABLE `Inker` DISABLE KEYS */;
INSERT INTO `Inker` VALUES (19,'Marlo','Alquiza'),(8,'Michael','Bair'),(1,'Matt','Banning'),(9,'Ed','Benes'),(10,'Marc','Campos'),(30,'Kevin','Conrad'),(23,'Wayne','Faucher'),(25,'Drew','Geraci'),(4,'Mick','Gray'),(3,'Sandra','Hope'),(5,'Jorge','Jimenez'),(11,'Andy','Lanning'),(15,NULL,'Livesay'),(6,'Jaime','Mendoza'),(2,'Danny','Miki'),(24,'Albert','Oclair'),(20,'Jerry','Ordway'),(7,'Ryan','Ottley'),(12,'Jimmy','Palmiotti'),(29,'Sean','Parsons'),(21,'Norm','Rapmund'),(18,'Prentis','Rollins'),(27,'Prentis','Rollins'),(32,'Prentis','Rollins'),(22,'Lary','Stucker'),(28,'Art','Thibert'),(14,'Dexter','Vines'),(17,'Wade','von Grawbadger'),(26,'Wade','von Grawbadger'),(31,'Wade','von Grawbadger'),(13,'Walden','Wong');
/*!40000 ALTER TABLE `Inker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issue`
--

DROP TABLE IF EXISTS `Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Issue` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_number` varchar(4) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  UNIQUE KEY `unique_key` (`issue_id`),
  KEY `series_id` (`series_id`),
  KEY `fk_product` (`product_id`),
  CONSTRAINT `Issue_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `Series` (`series_id`),
  CONSTRAINT `Issue_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue`
--

LOCK TABLES `Issue` WRITE;
/*!40000 ALTER TABLE `Issue` DISABLE KEYS */;
INSERT INTO `Issue` VALUES (32,'1',4,1),(33,'1',7,2),(34,'2',7,3),(35,'3',7,4),(36,'4',7,5),(37,'5',7,6),(38,'6',7,7),(39,'1',8,9),(40,'2',8,10),(41,'3',8,11),(42,'4',8,12),(43,'5',8,13),(44,'6',8,14),(45,'1',9,15),(46,'2',9,16),(47,'3',9,17),(48,'4',9,18),(49,'5',9,19),(50,'6',9,20),(51,'1',10,8),(53,'2',10,21),(54,'3',10,22),(55,'4',10,23),(56,'5',10,24),(57,'6',10,25),(59,'1',11,26),(60,'2',11,27),(61,'3',11,28),(62,'4',11,29),(63,'5',11,30),(64,'6',11,31),(65,'7',11,32),(66,'1',1,47);
/*!40000 ALTER TABLE `Issue` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`comicbookadmin`@`%`*/ /*!50003 TRIGGER after_issue_insert
	AFTER INSERT ON Issue
    FOR EACH ROW
BEGIN
	DECLARE issuename VARCHAR(50);
    
    SELECT
		CONCAT(series_name, ' #', issue_number) INTO issuename
	FROM
		Issue
        INNER JOIN Series USING (series_id)
	WHERE issue_id = NEW.issue_id
    ;
    
	UPDATE Product
    SET product_name=issuename
    WHERE product_id=NEW.product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `IssueCharacter`
--

DROP TABLE IF EXISTS `IssueCharacter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssueCharacter` (
  `issue_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`character_id`),
  KEY `fk_character` (`character_id`),
  CONSTRAINT `IssueCharacter_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`),
  CONSTRAINT `IssueCharacter_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `Character` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssueCharacter`
--

LOCK TABLES `IssueCharacter` WRITE;
/*!40000 ALTER TABLE `IssueCharacter` DISABLE KEYS */;
INSERT INTO `IssueCharacter` VALUES (32,1),(56,1),(57,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(62,2),(32,3),(59,3),(60,3),(61,3),(62,3),(63,3),(64,3),(65,3),(33,8),(34,8),(35,8),(36,8),(37,8),(38,8),(33,9),(34,9),(35,9),(36,9),(37,9),(38,9),(39,10),(40,10),(41,10),(42,10),(43,10),(44,10),(51,10),(39,11),(40,11),(41,11),(42,11),(43,11),(44,11),(51,11),(45,12),(46,12),(47,12),(48,12),(49,12),(50,12),(53,13),(54,13),(55,13),(56,13),(57,13);
/*!40000 ALTER TABLE `IssueCharacter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssueColorist`
--

DROP TABLE IF EXISTS `IssueColorist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssueColorist` (
  `issue_id` int(11) NOT NULL,
  `colorist_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`colorist_id`),
  UNIQUE KEY `unique_key` (`issue_id`,`colorist_id`),
  KEY `colorist_id` (`colorist_id`),
  CONSTRAINT `IssueColorist_ibfk_1` FOREIGN KEY (`colorist_id`) REFERENCES `Colorist` (`colorist_id`),
  CONSTRAINT `IssueColorist_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssueColorist`
--

LOCK TABLES `IssueColorist` WRITE;
/*!40000 ALTER TABLE `IssueColorist` DISABLE KEYS */;
/*!40000 ALTER TABLE `IssueColorist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssueGenre`
--

DROP TABLE IF EXISTS `IssueGenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssueGenre` (
  `issue_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`genre_id`),
  UNIQUE KEY `unique_key` (`issue_id`,`genre_id`),
  KEY `fk_genre` (`genre_id`),
  CONSTRAINT `IssueGenre_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`),
  CONSTRAINT `IssueGenre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssueGenre`
--

LOCK TABLES `IssueGenre` WRITE;
/*!40000 ALTER TABLE `IssueGenre` DISABLE KEYS */;
INSERT INTO `IssueGenre` VALUES (32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(32,2),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,4),(46,4),(47,4),(48,4),(49,4),(50,4),(51,5),(53,5),(54,5),(55,5),(56,5),(57,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(65,5);
/*!40000 ALTER TABLE `IssueGenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssueInker`
--

DROP TABLE IF EXISTS `IssueInker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssueInker` (
  `issue_id` int(11) NOT NULL,
  `inker_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`inker_id`),
  UNIQUE KEY `unique_key` (`issue_id`,`inker_id`),
  KEY `fk_inker` (`inker_id`),
  CONSTRAINT `IssueInker_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`),
  CONSTRAINT `IssueInker_ibfk_2` FOREIGN KEY (`inker_id`) REFERENCES `Inker` (`inker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssueInker`
--

LOCK TABLES `IssueInker` WRITE;
/*!40000 ALTER TABLE `IssueInker` DISABLE KEYS */;
INSERT INTO `IssueInker` VALUES (32,8),(32,9),(32,10),(39,10),(40,10),(41,10),(42,10),(43,10),(44,10),(64,10),(32,11),(59,11),(60,11),(61,11),(62,11),(64,11),(65,11),(32,12),(62,12),(33,13),(34,13),(36,13),(37,13),(38,13),(35,14),(34,15),(45,17),(46,17),(48,17),(49,17),(50,17),(51,17),(53,17),(54,17),(55,17),(56,17),(57,17),(47,18),(60,19),(60,20),(65,20),(60,21),(61,21),(64,21),(60,22),(62,22),(61,23),(62,24),(64,24),(62,25),(64,25),(63,28),(64,28),(65,28),(65,29),(65,30);
/*!40000 ALTER TABLE `IssueInker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssuePencilist`
--

DROP TABLE IF EXISTS `IssuePencilist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssuePencilist` (
  `issue_id` int(11) NOT NULL,
  `pencilist_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`pencilist_id`),
  UNIQUE KEY `unique_key` (`issue_id`,`pencilist_id`),
  KEY `pencilist_id` (`pencilist_id`),
  CONSTRAINT `IssuePencilist_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`),
  CONSTRAINT `IssuePencilist_ibfk_2` FOREIGN KEY (`pencilist_id`) REFERENCES `Pencilist` (`pencilist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssuePencilist`
--

LOCK TABLES `IssuePencilist` WRITE;
/*!40000 ALTER TABLE `IssuePencilist` DISABLE KEYS */;
INSERT INTO `IssuePencilist` VALUES (51,3),(53,3),(54,3),(55,3),(56,3),(57,3),(32,6),(32,7),(59,7),(60,7),(61,7),(62,7),(63,7),(64,7),(65,7),(32,8),(32,9),(39,9),(40,9),(41,9),(42,9),(43,9),(44,9),(62,9),(63,9),(64,9),(65,9),(32,10),(33,11),(34,11),(36,11),(37,11),(38,11),(35,12),(45,13),(46,13),(48,13),(49,13),(50,13),(47,14),(60,15),(61,15),(62,15),(64,15),(65,15),(63,16),(63,17),(64,17),(65,18);
/*!40000 ALTER TABLE `IssuePencilist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IssueWriter`
--

DROP TABLE IF EXISTS `IssueWriter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IssueWriter` (
  `issue_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`writer_id`),
  UNIQUE KEY `unique_key` (`issue_id`,`writer_id`),
  KEY `fk_wrt_id` (`writer_id`),
  CONSTRAINT `IssueWriter_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`),
  CONSTRAINT `IssueWriter_ibfk_2` FOREIGN KEY (`writer_id`) REFERENCES `Writer` (`writer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IssueWriter`
--

LOCK TABLES `IssueWriter` WRITE;
/*!40000 ALTER TABLE `IssueWriter` DISABLE KEYS */;
INSERT INTO `IssueWriter` VALUES (51,2),(53,2),(54,2),(55,2),(56,2),(57,2),(32,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(65,5),(32,6),(32,7),(33,8),(34,8),(35,8),(36,8),(37,8),(38,8),(39,9),(40,9),(41,9),(42,9),(43,9),(44,9),(45,10),(46,10),(47,10),(48,10),(49,10),(50,10);
/*!40000 ALTER TABLE `IssueWriter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pencilist`
--

DROP TABLE IF EXISTS `Pencilist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pencilist` (
  `pencilist_id` int(11) NOT NULL AUTO_INCREMENT,
  `pencilist_last_name` varchar(30) DEFAULT NULL,
  `pencilist_first_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pencilist_id`),
  UNIQUE KEY `unique_key` (`pencilist_id`),
  KEY `pencilist_name` (`pencilist_last_name`,`pencilist_first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pencilist`
--

LOCK TABLES `Pencilist` WRITE;
/*!40000 ALTER TABLE `Pencilist` DISABLE KEYS */;
INSERT INTO `Pencilist` VALUES (6,'Benes','Ed'),(18,'Bennett','Joe'),(13,'Eaglesham','Dale'),(19,'Eaglesham','Dale'),(21,'Eaglesham','Dale'),(1,'Finch','David'),(2,'Gleason','Patrick'),(3,'Jimenez','Jorge'),(7,'Jimenez','Phil'),(11,'Justiniano',NULL),(16,'Lanning','Andy'),(4,'Mahnke','Doug'),(8,'Morales','Rags'),(17,'Ordway','Jerry'),(5,'Ottley','Ryan'),(15,'Perez','George'),(9,'Reis','Ivan'),(10,'Saiz','Jesus'),(14,'Semeiks','Val'),(20,'Semeiks','Val'),(22,'Semeiks','Val'),(12,'Wagner','Ron');
/*!40000 ALTER TABLE `Pencilist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `availability_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `unique_key` (`product_id`),
  KEY `product_name` (`product_name`),
  KEY `price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Countdown to Infinite Crisis #1',4.99,2,'2005-05-31'),(2,'Day of Vengeance #1',1.99,2,'2005-04-27'),(3,'Day of Vengeance #2',1.99,6,'2005-05-25'),(4,'Day of Vengeance #3',1.99,3,'2005-06-15'),(5,'Day of Vengeance #4',1.99,5,'2005-07-20'),(6,'Day of Vengeance #5',1.99,3,'2005-08-24'),(7,'Day of Vengeance #6',1.99,4,'2005-09-21'),(8,'The OMAC Project #1',1.99,4,'2005-04-20'),(9,'Rann/Thanagar War #1',1.99,3,'2005-04-20'),(10,'Rann/Thanagar War #2',1.99,2,'2005-06-08'),(11,'Rann/Thanagar War #3',1.99,1,'2005-07-13'),(12,'Rann/Thanagar War #4',1.99,4,'2005-08-05'),(13,'Rann/Thanagar War #5',1.99,2,'2005-09-14'),(14,'Rann/Thanagar War #6',1.99,1,'2005-10-05'),(15,'Villains United #1',1.99,5,'2005-05-04'),(16,'Villains United #2',1.99,6,'2005-06-01'),(17,'Villains United #3',1.99,4,'2005-06-30'),(18,'Villains United #4',1.99,8,'2005-08-10'),(19,'Villains United #5',1.99,6,'2005-09-07'),(20,'Villains United #6',1.99,7,'2005-10-12'),(21,'The OMAC Project #2',1.99,4,'2005-05-04'),(22,'The OMAC Project #3',1.99,6,'2005-06-09'),(23,'The OMAC Project #4',1.99,2,'2005-07-03'),(24,'The OMAC Project #5',1.99,2,'2005-08-19'),(25,'The OMAC Project #6 ',1.99,7,'2005-09-23'),(26,'Infinite Crisis #1',1.99,9,'2005-11-16'),(27,'Infinite Crisis #2',1.99,4,'2005-11-09'),(28,'Infinite Crisis #3',1.99,5,'2005-12-21'),(29,'Infinite Crisis #4',1.99,3,'2006-01-18'),(30,'Infinite Crisis #5',1.99,9,'2006-03-01'),(31,'Infinite Crisis #6',1.99,6,'2006-04-05'),(32,'Infinite Crisis #7',1.99,0,'2006-05-03'),(39,'Infinite Crisis',29.99,2,'2007-05-04'),(46,'Infinite Crisis Omnibus',79.99,1,'2008-06-14'),(47,'Batman #1',2.99,5,'2018-12-02');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `unique_key` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
INSERT INTO `Publisher` VALUES (1,'DC Comics'),(2,'Marvel Comics');
/*!40000 ALTER TABLE `Publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Series`
--

DROP TABLE IF EXISTS `Series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Series` (
  `series_id` int(11) NOT NULL AUTO_INCREMENT,
  `series_name` varchar(50) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `unique_key` (`series_id`),
  KEY `fk_publisher` (`publisher_id`),
  KEY `series_name` (`series_name`),
  CONSTRAINT `Series_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Series`
--

LOCK TABLES `Series` WRITE;
/*!40000 ALTER TABLE `Series` DISABLE KEYS */;
INSERT INTO `Series` VALUES (1,'Batman',1),(2,'Superman',1),(3,'Amazing Spider-Man',2),(4,'Countdown to Infinite Crisis',1),(7,'Day of Vengeance',1),(8,'Rann-Thanagar',1),(9,'Villains United',1),(10,'The OMAC Project',1),(11,'Infinite Crisis',1);
/*!40000 ALTER TABLE `Series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storyline`
--

DROP TABLE IF EXISTS `Storyline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Storyline` (
  `storyline_id` int(11) NOT NULL AUTO_INCREMENT,
  `storyline_name` varchar(50) NOT NULL,
  PRIMARY KEY (`storyline_id`),
  UNIQUE KEY `unique_key` (`storyline_id`),
  KEY `storyline_name` (`storyline_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storyline`
--

LOCK TABLES `Storyline` WRITE;
/*!40000 ALTER TABLE `Storyline` DISABLE KEYS */;
INSERT INTO `Storyline` VALUES (1,'Day of Vengeance'),(5,'Infinite Crisis'),(2,'Rann/Thanagar War'),(3,'The OMAC Project'),(4,'Villains United');
/*!40000 ALTER TABLE `Storyline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StorylineIssue`
--

DROP TABLE IF EXISTS `StorylineIssue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StorylineIssue` (
  `storyline_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`storyline_id`,`issue_id`),
  UNIQUE KEY `unique_key` (`storyline_id`,`issue_id`),
  KEY `fk_issue` (`issue_id`),
  CONSTRAINT `StorylineIssue_ibfk_1` FOREIGN KEY (`storyline_id`) REFERENCES `Storyline` (`storyline_id`),
  CONSTRAINT `StorylineIssue_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `Issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StorylineIssue`
--

LOCK TABLES `StorylineIssue` WRITE;
/*!40000 ALTER TABLE `StorylineIssue` DISABLE KEYS */;
INSERT INTO `StorylineIssue` VALUES (1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(3,51),(3,53),(3,54),(3,55),(3,56),(3,57),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65);
/*!40000 ALTER TABLE `StorylineIssue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscriber`
--

DROP TABLE IF EXISTS `Subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscriber` (
  `subscriber_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile_phone_number` varchar(13) DEFAULT NULL,
  `home_phone_number` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`subscriber_id`),
  UNIQUE KEY `unique_key` (`subscriber_id`),
  KEY `subscriber_name` (`last_name`,`first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscriber`
--

LOCK TABLES `Subscriber` WRITE;
/*!40000 ALTER TABLE `Subscriber` DISABLE KEYS */;
INSERT INTO `Subscriber` VALUES (1,'Sidoney','Gales','sgales0@indiegogo.com','0019521943593','0017449450818'),(2,'Douglass','Hadgkiss','dhadgkiss1@hao123.com','0017546548156','0017449450818'),(3,'Burch','McCandless','bmccandless2@wordpress.org','0012078269054','0013346113258'),(4,'Felipe','Drinnan','fdrinnan6@jimdo.com','0013754550614','0014047901046'),(5,'Lon','Iorizzo','liorizzo9@flavors.me','0019885059825','0016747081425'),(6,'Frederick','Ruffles','frufflesl@mapquest.com','0018704162973','0019824198731'),(7,'Geoffry','Tompkiss','gtompkiss14@utexas.edu','0019593680243','0019997160523'),(8,'Cos','Olin','colin2s@telegraph.co.uk','0013021402624','0019526665180'),(9,'Erin','Darko','edarko3c@berkeley.edu','0013322211804','0019441008490'),(10,'Reynold','McDarmid','rmcdarmid4i@oakley.com','0011891691025','0016647225692'),(11,'Jeannie','Tompkins','jtompkins96@fastcompany.com','0019564606767','0017762683927'),(12,'Dell','Knok','dknok9f@fastcompany.com','0016604114140','0011471445393'),(13,'Filippo','Gilhooley','fgilhooleyls@so-net.ne.jp','0017621421459','0011351115906'),(14,'Gus','Cornier','gcorniero1@cpanel.net','0016576845694','0014968117249');
/*!40000 ALTER TABLE `Subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscription`
--

DROP TABLE IF EXISTS `Subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `subscriber_id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  UNIQUE KEY `unique_key` (`subscription_id`),
  KEY `fk_subscriber` (`subscriber_id`),
  KEY `fk_series` (`series_id`),
  CONSTRAINT `Subscription_ibfk_1` FOREIGN KEY (`subscriber_id`) REFERENCES `Subscriber` (`subscriber_id`),
  CONSTRAINT `Subscription_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `Series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscription`
--

LOCK TABLES `Subscription` WRITE;
/*!40000 ALTER TABLE `Subscription` DISABLE KEYS */;
INSERT INTO `Subscription` VALUES (1,'2018-12-05','2018-12-10',12,1),(2,'2018-08-08','2018-08-10',14,3),(3,'2018-08-10','2018-08-15',1,2),(4,'2018-03-10','2018-03-30',11,3),(5,'2015-03-10','2015-03-30',10,1),(6,'2016-04-10','2016-04-30',10,3),(9,'2016-09-05','2016-09-20',9,2),(10,'2016-03-05','2016-06-08',13,2),(11,'2016-03-06','2016-06-08',8,1),(15,'2017-08-04','2018-09-10',8,2),(16,'2017-08-04','2018-09-10',6,3),(17,'2018-08-02','2018-10-10',6,1),(18,'2018-08-01','2018-10-10',2,1),(19,'2017-08-01','2018-02-16',5,2);
/*!40000 ALTER TABLE `Subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `unique_key` (`transaction_id`),
  KEY `fk_emp_id` (`employee_id`),
  KEY `fk_sub_id` (`subscriber_id`),
  CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`),
  CONSTRAINT `Transaction_ibfk_2` FOREIGN KEY (`subscriber_id`) REFERENCES `Subscriber` (`subscriber_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES (1,3,1,'2018-04-25 18:00:56'),(2,2,2,'2018-04-28 15:05:36'),(3,1,3,'2018-06-15 10:16:45'),(4,6,6,'2018-07-01 16:45:15'),(5,4,10,'2018-10-15 14:05:36'),(6,3,12,'2018-01-11 09:32:23'),(7,5,13,'2018-02-18 19:08:04'),(8,6,11,'2018-09-10 14:31:45'),(9,2,6,'2018-10-08 19:02:13'),(10,4,8,'2018-06-20 17:40:09'),(11,1,9,'2018-10-20 11:01:06'),(12,1,5,'2018-12-01 23:46:38');
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionItem`
--

DROP TABLE IF EXISTS `TransactionItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransactionItem` (
  `transaction_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_item_id`),
  UNIQUE KEY `unique_key` (`transaction_item_id`),
  KEY `fk_transaction` (`transaction_id`),
  KEY `fk_product` (`product_id`),
  CONSTRAINT `TransactionItem_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `Transaction` (`transaction_id`),
  CONSTRAINT `TransactionItem_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionItem`
--

LOCK TABLES `TransactionItem` WRITE;
/*!40000 ALTER TABLE `TransactionItem` DISABLE KEYS */;
INSERT INTO `TransactionItem` VALUES (1,1,11,4),(2,6,10,20),(3,4,9,3),(4,8,8,7),(5,2,7,8),(7,3,6,25),(8,3,5,30),(9,6,4,9),(10,6,5,39),(11,7,4,27),(12,1,3,39),(13,4,6,32),(14,4,6,31),(15,8,6,28),(16,8,2,26),(17,2,2,25),(18,2,1,23),(19,2,12,1),(20,3,12,5);
/*!40000 ALTER TABLE `TransactionItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Writer`
--

DROP TABLE IF EXISTS `Writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Writer` (
  `writer_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_last_name` varchar(30) DEFAULT NULL,
  `writer_first_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`writer_id`),
  UNIQUE KEY `unique_key` (`writer_id`),
  KEY `writer_name` (`writer_last_name`,`writer_first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Writer`
--

LOCK TABLES `Writer` WRITE;
/*!40000 ALTER TABLE `Writer` DISABLE KEYS */;
INSERT INTO `Writer` VALUES (9,'Gibbons','Dave'),(3,'Gleason','Patrick'),(5,'Johns','Geoff'),(1,'King','Tom'),(6,'Rucka','Greg'),(10,'Simone','Gail'),(11,'Simone','Gail'),(12,'Simone','Gail'),(4,'Spencer','Nick'),(2,'Tomasi','Peter'),(8,'Willingham','Bill'),(7,'Winick','Judd');
/*!40000 ALTER TABLE `Writer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_dccomics_subscribers`
--

DROP TABLE IF EXISTS `vw_dccomics_subscribers`;
/*!50001 DROP VIEW IF EXISTS `vw_dccomics_subscribers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_dccomics_subscribers` AS SELECT 
 1 AS `subscriber_id`,
 1 AS `SubscriberName`,
 1 AS `Subscriptions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_issue_information`
--

DROP TABLE IF EXISTS `vw_issue_information`;
/*!50001 DROP VIEW IF EXISTS `vw_issue_information`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_issue_information` AS SELECT 
 1 AS `issue_name`,
 1 AS `publisher_name`,
 1 AS `genres`,
 1 AS `writers`,
 1 AS `pencilists`,
 1 AS `inkers`,
 1 AS `colorists`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_omnibus_series`
--

DROP TABLE IF EXISTS `vw_omnibus_series`;
/*!50001 DROP VIEW IF EXISTS `vw_omnibus_series`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_omnibus_series` AS SELECT 
 1 AS `Omnibus`,
 1 AS `Series Involved`,
 1 AS `Price`,
 1 AS `Quantity`,
 1 AS `Availability Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_storyline_bundle`
--

DROP TABLE IF EXISTS `vw_storyline_bundle`;
/*!50001 DROP VIEW IF EXISTS `vw_storyline_bundle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_storyline_bundle` AS SELECT 
 1 AS `Storyline`,
 1 AS `Issue(s)`,
 1 AS `Regular Price`,
 1 AS `10% Off Storyline-Bundle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_storyline_num_issues`
--

DROP TABLE IF EXISTS `vw_storyline_num_issues`;
/*!50001 DROP VIEW IF EXISTS `vw_storyline_num_issues`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_storyline_num_issues` AS SELECT 
 1 AS `storyline_name`,
 1 AS `number_of_issues`,
 1 AS `Writers`,
 1 AS `Pencilists`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_transactions_report`
--

DROP TABLE IF EXISTS `vw_transactions_report`;
/*!50001 DROP VIEW IF EXISTS `vw_transactions_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_transactions_report` AS SELECT 
 1 AS `transaction_id`,
 1 AS `EmployeeName`,
 1 AS `SubscriberName`,
 1 AS `Number of Items`,
 1 AS `Transaction Description`,
 1 AS `Total Price`,
 1 AS `transaction_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'ComicBookShop_Sprint_3'
--

--
-- Dumping routines for database 'ComicBookShop_Sprint_3'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateTotalProductPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`comicbookadmin`@`%` FUNCTION `CalculateTotalProductPrice`(prod_id INT, quant INT) RETURNS double
    DETERMINISTIC
BEGIN
	DECLARE totalPrice FLOAT;
    
    SELECT
		(price * quant) INTO totalPrice
	FROM
		Product
	WHERE product_id=prod_id
    ;
    
    RETURN (totalPrice);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTransactionItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`comicbookadmin`@`%` PROCEDURE `AddTransactionItem`(IN trans_id INT, IN prod_id INT, IN quant INT)
BEGIN
	IF quant <= (SELECT quantity FROM Product WHERE product_id = prod_id) THEN
		INSERT INTO TransactionItem(quantity, transaction_id, product_id)
        VALUES
			(quant, trans_id, prod_id)
        ;
        
        UPDATE Product
        SET quantity = quantity - quant
        WHERE product_id = prod_id
        ;
	ELSE
		SELECT 'ERROR: There are not enough of that item' AS `Message`;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`comicbookadmin`@`%` PROCEDURE `CreateTransaction`(IN emp_id INT, IN sub_id INT)
BEGIN
	INSERT INTO Transaction(employee_id, subscriber_id, transaction_date)
    VALUES
		(emp_id, sub_id, NOW())
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_dccomics_subscribers`
--

/*!50001 DROP VIEW IF EXISTS `vw_dccomics_subscribers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`comicbookadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dccomics_subscribers` AS select `Subscriber`.`subscriber_id` AS `subscriber_id`,concat_ws(' ',`Subscriber`.`first_name`,`Subscriber`.`last_name`) AS `SubscriberName`,group_concat(`Series`.`series_name` separator ', ') AS `Subscriptions` from (((`Subscriber` join `Subscription` on((`Subscriber`.`subscriber_id` = `Subscription`.`subscriber_id`))) join `Series` on((`Subscription`.`series_id` = `Series`.`series_id`))) join `Publisher` on((`Series`.`publisher_id` = `Publisher`.`publisher_id`))) where (`Publisher`.`publisher_name` = 'DC Comics') group by `Subscriber`.`subscriber_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_issue_information`
--

/*!50001 DROP VIEW IF EXISTS `vw_issue_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`comicbookadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_issue_information` AS select `prod`.`product_name` AS `issue_name`,`pu`.`publisher_name` AS `publisher_name`,group_concat(distinct `g`.`genre_name` separator ', ') AS `genres`,group_concat(distinct concat_ws(' ',`w`.`writer_first_name`,`w`.`writer_last_name`) separator ', ') AS `writers`,group_concat(distinct concat_ws(' ',`p`.`pencilist_first_name`,`p`.`pencilist_last_name`) separator ', ') AS `pencilists`,group_concat(distinct concat_ws(' ',`ink`.`inker_first_name`,`ink`.`inker_last_name`) separator ', ') AS `inkers`,group_concat(distinct concat_ws(' ',`c`.`colorist_first_name`,`c`.`colorist_last_name`) separator ', ') AS `colorists` from (((((((((((((`Issue` `i` join `Product` `prod` on((`i`.`product_id` = `prod`.`product_id`))) left join `Series` `s` on((`i`.`series_id` = `s`.`series_id`))) left join `Publisher` `pu` on((`s`.`publisher_id` = `pu`.`publisher_id`))) left join `IssueColorist` `ic` on((`i`.`issue_id` = `ic`.`issue_id`))) left join `Colorist` `c` on((`ic`.`colorist_id` = `c`.`colorist_id`))) left join `IssueGenre` `ig` on((`i`.`issue_id` = `ig`.`issue_id`))) left join `Genre` `g` on((`ig`.`genre_id` = `g`.`genre_id`))) left join `IssueInker` `ii` on((`i`.`issue_id` = `ii`.`issue_id`))) left join `Inker` `ink` on((`ii`.`inker_id` = `ink`.`inker_id`))) left join `IssuePencilist` `ip` on((`i`.`issue_id` = `ip`.`issue_id`))) left join `Pencilist` `p` on((`ip`.`pencilist_id` = `p`.`pencilist_id`))) left join `IssueWriter` `iw` on((`i`.`issue_id` = `iw`.`issue_id`))) left join `Writer` `w` on((`iw`.`writer_id` = `w`.`writer_id`))) group by `i`.`issue_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_omnibus_series`
--

/*!50001 DROP VIEW IF EXISTS `vw_omnibus_series`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`comicbookadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_omnibus_series` AS select distinct `p`.`product_name` AS `Omnibus`,group_concat(distinct `s`.`series_name` separator ', ') AS `Series Involved`,`p`.`price` AS `Price`,`p`.`quantity` AS `Quantity`,`p`.`availability_date` AS `Availability Date` from ((((`Collection` `c` join `Product` `p` on((`p`.`product_id` = `c`.`product_id`))) join `CollectionIssue` `ci` on((`ci`.`collection_id` = `c`.`collection_id`))) join `Issue` `i` on((`ci`.`issue_id` = `i`.`issue_id`))) join `Series` `s` on((`s`.`series_id` = `i`.`series_id`))) where (`c`.`is_omnibus` = 1) group by `c`.`collection_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_storyline_bundle`
--

/*!50001 DROP VIEW IF EXISTS `vw_storyline_bundle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`comicbookadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_storyline_bundle` AS select `s`.`storyline_name` AS `Storyline`,group_concat(`i`.`issue_number` separator ', ') AS `Issue(s)`,format(sum(`p`.`price`),2) AS `Regular Price`,format(sum((`p`.`price` - (`p`.`price` * 0.10))),2) AS `10% Off Storyline-Bundle` from (((`Storyline` `s` join `StorylineIssue` `si` on((`s`.`storyline_id` = `si`.`storyline_id`))) join `Issue` `i` on((`si`.`issue_id` = `i`.`issue_id`))) join `Product` `p` on((`i`.`product_id` = `p`.`product_id`))) group by `s`.`storyline_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_storyline_num_issues`
--

/*!50001 DROP VIEW IF EXISTS `vw_storyline_num_issues`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`comicbookadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_storyline_num_issues` AS select `stl`.`storyline_name` AS `storyline_name`,count(`i`.`issue_id`) AS `number_of_issues`,group_concat(distinct concat_ws(' ',`w`.`writer_first_name`,`w`.`writer_last_name`) separator ', ') AS `Writers`,group_concat(distinct concat_ws(' ',`p`.`pencilist_first_name`,`p`.`pencilist_last_name`) separator ', ') AS `Pencilists` from ((((((`Storyline` `stl` join `StorylineIssue` `stli` on((`stl`.`storyline_id` = `stli`.`storyline_id`))) join `Issue` `i` on((`stli`.`issue_id` = `i`.`issue_id`))) join `IssueWriter` `iw` on((`i`.`issue_id` = `iw`.`issue_id`))) join `Writer` `w` on((`iw`.`writer_id` = `w`.`writer_id`))) join `IssuePencilist` `ip` on((`i`.`issue_id` = `ip`.`issue_id`))) join `Pencilist` `p` on((`ip`.`pencilist_id` = `p`.`pencilist_id`))) group by `i`.`series_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_transactions_report`
--

/*!50001 DROP VIEW IF EXISTS `vw_transactions_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`comicbookadmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_transactions_report` AS select `t`.`transaction_id` AS `transaction_id`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `EmployeeName`,ifnull(concat(`s`.`first_name`,' ',`s`.`last_name`),'Not a Subscriber') AS `SubscriberName`,sum(`tir`.`quantity`) AS `Number of Items`,group_concat(`tir`.`transaction_item_record` separator ', ') AS `Transaction Description`,sum(`tir`.`Price_Per_Item`) AS `Total Price`,`t`.`transaction_date` AS `transaction_date` from (((`ComicBookShop_Sprint_3`.`Transaction` `t` join `ComicBookShop_Sprint_3`.`Employee` `e` on((`t`.`employee_id` = `e`.`employee_id`))) join `ComicBookShop_Sprint_3`.`Subscriber` `s` on((`t`.`subscriber_id` = `s`.`subscriber_id`))) join (select concat(`ti`.`quantity`,' copies of ',`p`.`product_name`) AS `transaction_item_record`,`st`.`transaction_id` AS `transaction_id`,`ti`.`quantity` AS `quantity`,round((`ti`.`quantity` * `p`.`price`),2) AS `Price_Per_Item` from ((`ComicBookShop_Sprint_3`.`Transaction` `st` join `ComicBookShop_Sprint_3`.`TransactionItem` `ti` on((`st`.`transaction_id` = `ti`.`transaction_id`))) join `ComicBookShop_Sprint_3`.`Product` `p` on((`ti`.`product_id` = `p`.`product_id`)))) `tir` on((`t`.`transaction_id` = `tir`.`transaction_id`))) group by `t`.`transaction_id` order by `t`.`transaction_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 18:26:21
