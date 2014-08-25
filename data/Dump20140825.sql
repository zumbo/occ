CREATE DATABASE  IF NOT EXISTS `occ` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `occ`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: occ
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `coindate`
--

DROP TABLE IF EXISTS `coindate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coindate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `cointype` int(11) NOT NULL,
  `mintmark` int(11) DEFAULT NULL,
  `mintage` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datemintmark_idx` (`mintmark`),
  KEY `dateyear_idx` (`year`),
  KEY `datetype_idx` (`cointype`),
  CONSTRAINT `datemintmark` FOREIGN KEY (`mintmark`) REFERENCES `mintmark` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `datetype` FOREIGN KEY (`cointype`) REFERENCES `cointype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dateyear` FOREIGN KEY (`year`) REFERENCES `year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coindate`
--

LOCK TABLES `coindate` WRITE;
/*!40000 ALTER TABLE `coindate` DISABLE KEYS */;
INSERT INTO `coindate` VALUES (1,1974,1,NULL,NULL),(2,1999,2,NULL,NULL),(3,1798,3,NULL,NULL),(4,1955,4,NULL,NULL),(5,1956,4,NULL,NULL);
/*!40000 ALTER TABLE `coindate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coinquality`
--

DROP TABLE IF EXISTS `coinquality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coinquality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quality` int(11) NOT NULL,
  `mintage` int(10) DEFAULT NULL,
  `coindate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qualitydate_idx` (`coindate`),
  KEY `coinquality_idx` (`quality`),
  CONSTRAINT `coinquality` FOREIGN KEY (`quality`) REFERENCES `quality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `qualitydate` FOREIGN KEY (`coindate`) REFERENCES `coindate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coinquality`
--

LOCK TABLES `coinquality` WRITE;
/*!40000 ALTER TABLE `coinquality` DISABLE KEYS */;
/*!40000 ALTER TABLE `coinquality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cointype`
--

DROP TABLE IF EXISTS `cointype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cointype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `epoch` int(11) NOT NULL,
  `denomination` int(11) NOT NULL,
  `parenttype` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `diameter` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `fineness` int(11) DEFAULT NULL,
  `metal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coinepoch_idx` (`epoch`),
  KEY `metail_idx` (`metal`),
  CONSTRAINT `coinepoch` FOREIGN KEY (`epoch`) REFERENCES `epoch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `metal` FOREIGN KEY (`metal`) REFERENCES `metal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cointype`
--

LOCK TABLES `cointype` WRITE;
/*!40000 ALTER TABLE `cointype` DISABLE KEYS */;
INSERT INTO `cointype` VALUES (1,'Fünfliber',1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'1 Mark',2,2,NULL,NULL,NULL,NULL,NULL,NULL),(3,'1 Batzen',15,3,NULL,NULL,NULL,NULL,NULL,NULL),(4,'1 Schilling',4,4,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cointype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coinvariety`
--

DROP TABLE IF EXISTS `coinvariety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coinvariety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `coindate` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `varietydate_idx` (`coindate`),
  CONSTRAINT `varietydate` FOREIGN KEY (`coindate`) REFERENCES `coindate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coinvariety`
--

LOCK TABLES `coinvariety` WRITE;
/*!40000 ALTER TABLE `coinvariety` DISABLE KEYS */;
/*!40000 ALTER TABLE `coinvariety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES (4,'Africa'),(7,'Antarctica'),(5,'Asia'),(1,'Europe'),(2,'North America'),(6,'Oceania'),(3,'South America');
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denomination`
--

DROP TABLE IF EXISTS `denomination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denomination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monetaryunit` int(11) NOT NULL,
  `value` int(8) NOT NULL DEFAULT '1',
  `isinverse` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `monetaryunit_idx` (`monetaryunit`),
  CONSTRAINT `monetaryunit` FOREIGN KEY (`monetaryunit`) REFERENCES `monetaryunit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denomination`
--

LOCK TABLES `denomination` WRITE;
/*!40000 ALTER TABLE `denomination` DISABLE KEYS */;
INSERT INTO `denomination` VALUES (1,1,5,0),(3,6,1,0),(4,8,1,0);
/*!40000 ALTER TABLE `denomination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epoch`
--

DROP TABLE IF EXISTS `epoch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epoch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startYear` int(4) NOT NULL,
  `endYear` int(4) DEFAULT NULL,
  `territory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `territory_idx` (`territory`),
  CONSTRAINT `territory` FOREIGN KEY (`territory`) REFERENCES `territory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epoch`
--

LOCK TABLES `epoch` WRITE;
/*!40000 ALTER TABLE `epoch` DISABLE KEYS */;
INSERT INTO `epoch` VALUES (1,1848,NULL,1),(2,1949,NULL,2),(3,1918,1938,4),(4,1945,NULL,4),(5,1946,1958,6),(6,1958,NULL,6),(7,1870,1940,6),(8,1940,1944,6),(9,1852,1870,6),(10,1848,1852,6),(11,1814,1848,6),(12,1804,1815,6),(13,1792,1804,6),(15,1353,1848,3),(16,1351,1848,9);
/*!40000 ALTER TABLE `epoch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epochl10n`
--

DROP TABLE IF EXISTS `epochl10n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epochl10n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `language` varchar(2) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `epochnameepoch_idx` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epochl10n`
--

LOCK TABLES `epochl10n` WRITE;
/*!40000 ALTER TABLE `epochl10n` DISABLE KEYS */;
INSERT INTO `epochl10n` VALUES (1,'Swiss Confederation','en',1),(2,'Federal Republic of Germany','en',2),(3,'First Republic','en',3),(4,'Second Republic','en',4),(5,'Fourth Republic','en',5),(6,'Fifth Republic','en',6),(7,'Third Republic','en',7),(8,'French State (Vichy)','en',8),(9,'Second Empire','en',9),(10,'Second Republic','en',10),(11,'Kingdom','en',11),(12,'First Empire','en',12),(13,'First Republic','en',13),(14,'Canton','en',15),(15,'Canton','en',16),(16,'Bundesstaat','de',1),(17,'Bundesrepublik','de',2),(18,'Erste Republik','de',3),(19,'Zweite Republik','de',4),(20,'Vierte Republik','de',5),(21,'Fünfte Republik','de',6),(22,'Dritte Republik','de',7),(23,'Vichy-Regime','de',8),(24,'Zweites Kaiserreich','de',9),(25,'Zweite Republik','de',10),(26,'Königreich','de',11),(27,'Erstes Kaiserreich','de',12),(28,'Erste Republik','de',13),(29,'Kanton','de',15),(30,'Kanton','de',16),(32,'Fourth Republic','en',23);
/*!40000 ALTER TABLE `epochl10n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `epochview`
--

DROP TABLE IF EXISTS `epochview`;
/*!50001 DROP VIEW IF EXISTS `epochview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `epochview` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `startYear` tinyint NOT NULL,
  `endYear` tinyint NOT NULL,
  `territory` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1),(2),(3),(4),(5),(6),(7),(51),(52),(63),(64),(66),(85);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradel10n`
--

DROP TABLE IF EXISTS `gradel10n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradel10n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `abbr` varchar(10) NOT NULL,
  `language` varchar(2) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gradel10nparent_idx` (`parent`),
  CONSTRAINT `gradel10nparent` FOREIGN KEY (`parent`) REFERENCES `grade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradel10n`
--

LOCK TABLES `gradel10n` WRITE;
/*!40000 ALTER TABLE `gradel10n` DISABLE KEYS */;
INSERT INTO `gradel10n` VALUES (1,'Brillant uncirculated','BU','en',1),(2,'Stempelglanz','stgl','de',1),(3,'Uncirculated','unc','en',2),(4,'Unzirkuliert','unc','de',2),(5,'Extremely fine','XF','en',3),(6,'Vorzüglich','vz','de',3),(7,'Very fine','VF','en',4),(8,'Sehr schön','ss','de',4),(9,'Fine','F','en',5),(10,'Schön','s','de',5),(11,'Very good','VG','en',6),(12,'Sehr gut erhalten','sge','de',6),(13,'Good','Go','en',7),(14,'Gut erhalten','ge','de',7),(52,'geht so','6','de',51),(53,'Test','7a','de',52),(64,'Test4','4','de',63),(65,'Test5','5','de',64),(67,'Test9','9','de',66),(89,'Poor','P','en',85);
/*!40000 ALTER TABLE `gradel10n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `gradeview`
--

DROP TABLE IF EXISTS `gradeview`;
/*!50001 DROP VIEW IF EXISTS `gradeview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `gradeview` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `abbr` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `metal`
--

DROP TABLE IF EXISTS `metal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metal`
--

LOCK TABLES `metal` WRITE;
/*!40000 ALTER TABLE `metal` DISABLE KEYS */;
INSERT INTO `metal` VALUES (1,'Au'),(2,'Ag'),(3,'Cu'),(4,'Pt'),(7,'Bro'),(9,'Zn'),(10,'Sn');
/*!40000 ALTER TABLE `metal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metall10n`
--

DROP TABLE IF EXISTS `metall10n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metall10n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `language` varchar(2) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `metall10nparent_idx` (`parent`),
  CONSTRAINT `metall10nparent` FOREIGN KEY (`parent`) REFERENCES `metal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metall10n`
--

LOCK TABLES `metall10n` WRITE;
/*!40000 ALTER TABLE `metall10n` DISABLE KEYS */;
INSERT INTO `metall10n` VALUES (1,'Gold','de',1),(2,'Silber','de',2),(3,'Kupfer','de',3),(4,'Gold','en',1),(5,'Silver','en',2),(6,'Copper','en',3),(7,'Platin','de',4),(10,'Bronze','de',7),(12,'Zink','de',9),(13,'Zinn','de',10);
/*!40000 ALTER TABLE `metall10n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `metalview`
--

DROP TABLE IF EXISTS `metalview`;
/*!50001 DROP VIEW IF EXISTS `metalview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `metalview` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `abbr` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mintmark`
--

DROP TABLE IF EXISTS `mintmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mintmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mintname` varchar(45) DEFAULT NULL,
  `territory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `territory_idx` (`territory`),
  CONSTRAINT `mintmarkterritory` FOREIGN KEY (`territory`) REFERENCES `territory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mintmark`
--

LOCK TABLES `mintmark` WRITE;
/*!40000 ALTER TABLE `mintmark` DISABLE KEYS */;
INSERT INTO `mintmark` VALUES (2,'B','Bern',1),(3,'S','Stockholm',338),(8,'A','Berlin',2),(9,'D','München',2),(11,'F','Stuttgart',2),(12,'G','Karlsruhe',2);
/*!40000 ALTER TABLE `mintmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monetarysystem`
--

DROP TABLE IF EXISTS `monetarysystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetarysystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` int(4) NOT NULL,
  `end` int(4) DEFAULT NULL,
  `territory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monetarysystemterritory_idx` (`territory`),
  CONSTRAINT `monetarysystemterritory` FOREIGN KEY (`territory`) REFERENCES `territory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monetarysystem`
--

LOCK TABLES `monetarysystem` WRITE;
/*!40000 ALTER TABLE `monetarysystem` DISABLE KEYS */;
INSERT INTO `monetarysystem` VALUES (1,1850,NULL,1),(3,1803,1848,3),(4,1945,2001,4),(9,1924,1938,4),(14,2002,NULL,4),(26,2013,NULL,4),(28,1925,2003,51),(29,2002,NULL,51),(30,2013,NULL,51);
/*!40000 ALTER TABLE `monetarysystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monetarysysteml10n`
--

DROP TABLE IF EXISTS `monetarysysteml10n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetarysysteml10n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text,
  `language` varchar(2) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monetarysystemnamemonetarysystem_idx` (`parent`),
  CONSTRAINT `monetarysystemnamemonetarysystem` FOREIGN KEY (`parent`) REFERENCES `monetarysystem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monetarysysteml10n`
--

LOCK TABLES `monetarysysteml10n` WRITE;
/*!40000 ALTER TABLE `monetarysysteml10n` DISABLE KEYS */;
INSERT INTO `monetarysysteml10n` VALUES (1,'Swiss Franc','1 Franc = 100 Rappen','en',1),(3,'Bernese Franc','1 Franc = 10 Batzen = 100 Rappen','en',3),(4,'Second Austrian Schilling','1 Schilling = 100 Groschen','en',4),(8,'Schweizer Franken','1 Franken = 100 Rappen','de',1),(10,'Berner Franken','1 Franken = 10 Batzen = 100 Rappen','de',3),(11,'Zweiter Österreichischer Schilling','1 Schilling = 100 Groschen','de',4),(12,'Erster Österreichischer Schilling','1 Schilling = 100 Groschen','de',9),(17,'Euro','1 Euro = 100 Cents','de',14),(26,'First Austrian Schilling?','1 Schilling = 100 Groschen','en',9),(27,'New one','data','en',26),(28,'Afghani','1 Afghani = 100 Pul','de',28),(29,'Neuer Afghani','1 Afghani = 100 Puls','de',29),(30,'Afghani','1 Afghani = 100 Pul','en',28),(31,'New Afghani','1 Afghani = 100 Pul','en',29),(33,'Neuer Eintrag','','de',30);
/*!40000 ALTER TABLE `monetarysysteml10n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `monetarysystemview`
--

DROP TABLE IF EXISTS `monetarysystemview`;
/*!50001 DROP VIEW IF EXISTS `monetarysystemview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `monetarysystemview` (
  `id` tinyint NOT NULL,
  `start` tinyint NOT NULL,
  `end` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `monetaryunit`
--

DROP TABLE IF EXISTS `monetaryunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monetaryunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fractionof` int(11) DEFAULT NULL,
  `fraction` int(4) DEFAULT NULL,
  `monetarysystem` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fractionof_idx` (`fractionof`),
  KEY `unitsystem_idx` (`monetarysystem`),
  CONSTRAINT `fractionof` FOREIGN KEY (`fractionof`) REFERENCES `monetaryunit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `unitsystem` FOREIGN KEY (`monetarysystem`) REFERENCES `monetarysystem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monetaryunit`
--

LOCK TABLES `monetaryunit` WRITE;
/*!40000 ALTER TABLE `monetaryunit` DISABLE KEYS */;
INSERT INTO `monetaryunit` VALUES (1,'Franken',NULL,NULL,1),(2,'Rappen',1,100,1),(5,'Franken',NULL,NULL,3),(6,'Batzen',5,10,3),(7,'Rappen',6,10,3),(8,'Schilling',NULL,NULL,4),(9,'Groschen',8,100,4);
/*!40000 ALTER TABLE `monetaryunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
INSERT INTO `quality` VALUES (22),(23),(24),(25);
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualityl10n`
--

DROP TABLE IF EXISTS `qualityl10n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualityl10n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `abbr` varchar(10) NOT NULL,
  `language` varchar(2) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qualityl10nparent_idx` (`parent`),
  CONSTRAINT `qualityl10nparent` FOREIGN KEY (`parent`) REFERENCES `quality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualityl10n`
--

LOCK TABLES `qualityl10n` WRITE;
/*!40000 ALTER TABLE `qualityl10n` DISABLE KEYS */;
INSERT INTO `qualityl10n` VALUES (4,'Proof','Pf','de',22),(5,'Proof','Prf<br>','en',23),(6,'Brillant uncirculated','BU','en',24),(7,'Mint state','MS','en',25);
/*!40000 ALTER TABLE `qualityl10n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `qualityview`
--

DROP TABLE IF EXISTS `qualityview`;
/*!50001 DROP VIEW IF EXISTS `qualityview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `qualityview` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `abbr` tinyint NOT NULL,
  `language` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ruler`
--

DROP TABLE IF EXISTS `ruler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `from` int(4) NOT NULL,
  `to` int(4) DEFAULT NULL,
  `epoch` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `epoch_idx` (`epoch`),
  CONSTRAINT `epoch` FOREIGN KEY (`epoch`) REFERENCES `epoch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruler`
--

LOCK TABLES `ruler` WRITE;
/*!40000 ALTER TABLE `ruler` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territory`
--

DROP TABLE IF EXISTS `territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `continent` int(11) DEFAULT NULL,
  `iso3166` char(2) DEFAULT NULL,
  `toplevel` int(1) NOT NULL DEFAULT '0',
  `fictional` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `territorycontinent_idx` (`continent`),
  CONSTRAINT `territorycontinent` FOREIGN KEY (`continent`) REFERENCES `continent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=799 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territory`
--

LOCK TABLES `territory` WRITE;
/*!40000 ALTER TABLE `territory` DISABLE KEYS */;
INSERT INTO `territory` VALUES (1,1,'ch',1,0),(2,1,'de',1,0),(3,1,'',0,0),(4,1,'at',1,0),(5,1,NULL,0,0),(6,1,'fr',1,0),(7,1,'gb',1,0),(8,1,'im',0,0),(9,1,NULL,0,0),(10,1,NULL,0,0),(11,1,'',0,0),(13,1,'',0,0),(14,1,'',0,0),(15,1,'',0,0),(16,1,'',0,0),(17,1,'',0,0),(18,1,'',0,0),(19,1,'',0,0),(20,1,'',0,0),(21,1,'',0,0),(22,1,'',0,0),(23,1,'',0,0),(24,1,'',0,0),(25,1,'',0,0),(26,1,'',0,0),(27,1,'',0,0),(28,1,'',0,0),(29,1,'',0,0),(30,1,'',0,0),(31,1,'',0,0),(32,1,'',0,0),(33,1,'',0,0),(35,1,'gg',0,0),(36,2,'ai',0,0),(37,2,'bm',0,0),(38,2,'vg',0,0),(39,2,'ky',0,0),(40,3,'fk',0,0),(41,1,'gi',0,0),(42,2,'ms',0,0),(43,6,'pn',0,0),(44,4,'sh',0,0),(45,2,'tc',0,0),(46,1,'je',0,0),(47,1,'',0,0),(48,4,'',1,0),(49,5,'ge',1,0),(50,5,'',0,0),(51,5,'af',1,0),(52,4,'ae',1,0),(53,5,'',0,0),(54,5,'',0,0),(55,5,'',0,0),(56,5,'',0,0),(57,4,'',0,0),(58,1,'cz',1,0),(59,1,'sk',1,0),(60,1,'',1,0),(61,1,'',0,0),(62,1,'fi',1,0),(63,4,'sl',1,0),(64,4,'gm',1,0),(65,4,'ng',1,0),(66,4,'',0,0),(67,4,'gh',1,0),(68,1,'al',1,0),(69,1,'',0,0),(70,4,'dz',1,0),(71,4,'',0,0),(72,1,'ad',1,0),(73,4,'ao',1,0),(74,4,'',0,0),(75,1,'pt',1,0),(76,2,'ag',1,0),(77,3,'ar',1,0),(78,3,'',0,0),(79,3,'',0,0),(80,3,'',0,0),(81,3,'',0,0),(82,3,'',0,0),(83,5,'am',1,0),(84,1,'su',1,0),(85,1,'ee',1,0),(86,1,'lv',1,0),(87,1,'lt',1,0),(88,5,'az',1,0),(89,1,'by',1,0),(92,5,'kz',1,0),(93,5,'kg',1,0),(94,1,'md',1,0),(95,5,'tj',1,0),(96,5,'tm',1,0),(97,1,'ua',1,0),(98,5,'uz',1,0),(99,1,'',0,0),(100,1,'ru',1,0),(101,2,'aw',1,0),(102,1,'nl',1,0),(103,2,'an',1,0),(104,2,'cw',1,0),(105,4,'',0,0),(106,4,'',0,0),(107,6,'au',1,0),(108,1,'',0,0),(109,1,'',0,0),(110,1,'',0,0),(111,2,'bs',1,0),(112,5,'bh',1,0),(113,5,'',0,0),(114,5,'bd',1,0),(115,5,'pk',1,0),(116,5,'in',1,0),(117,5,'',0,0),(118,5,'',0,0),(119,5,'',0,0),(120,1,'dk',1,0),(121,1,'ie',1,0),(122,2,'cu',1,0),(123,1,'hr',1,0),(124,1,'yu',1,0),(125,1,'si',1,0),(126,1,'ba',1,0),(127,1,'rs',1,0),(128,1,'mk',1,0),(129,4,'cd',1,0),(130,4,'',0,0),(131,4,'',0,0),(132,1,'be',1,0),(133,4,'cg',1,0),(134,4,'',0,0),(135,4,'',1,0),(136,2,'bz',1,0),(137,2,'',0,0),(138,4,'',1,0),(139,4,'',0,0),(140,4,'bj',1,0),(141,5,'bt',1,0),(143,4,'',0,0),(144,4,'',1,0),(145,1,'',0,0),(146,3,'bo',1,0),(147,4,'bw',1,0),(148,4,'re',0,0),(149,3,'br',1,0),(150,7,'',0,0),(151,5,'io',0,0),(152,2,'',1,0),(153,2,'bb',1,0),(154,3,'gy',1,0),(155,3,'',0,0),(156,2,'jm',1,0),(157,3,'tt',1,0),(158,2,'gd',1,0),(159,2,'lc',1,0),(160,2,'vc',1,0),(161,2,'dm',1,0),(162,2,'kn',0,0),(163,5,'bn',1,0),(164,1,'bg',1,0),(165,5,'mm',1,0),(166,4,'bi',1,0),(167,4,'rw',1,0),(168,4,'',1,0),(169,5,'kh',1,0),(170,4,'cm',1,0),(171,4,'cf',1,0),(172,4,'td',1,0),(173,4,'gq',1,0),(174,4,'ga',1,0),(175,2,'ca',1,0),(176,4,'ci',1,0),(177,4,'gw',1,0),(178,4,'ml',1,0),(179,4,'ne',1,0),(180,4,'sn',1,0),(181,4,'tg',1,0),(182,4,'',0,0),(183,4,NULL,0,0),(184,4,'mu',1,0),(185,2,'',0,0),(186,2,'',1,0),(187,2,'',0,0),(188,4,'cv',1,0),(189,4,'',0,0),(190,2,'',1,0),(191,2,'cr',1,0),(192,2,'gt',1,0),(193,2,'hn',1,0),(194,2,'ni',1,0),(195,2,'sv',1,0),(196,5,'',0,0),(197,5,'',0,0),(198,5,'lk',1,0),(199,5,'',0,0),(200,3,'cl',1,0),(201,1,'fo',0,0),(202,2,'gl',0,0),(203,1,'gr',1,0),(204,5,'',1,0),(205,5,'cn',1,0),(206,5,'tw',1,0),(207,5,'',0,0),(208,5,'jp',1,0),(209,5,'',0,0),(210,5,'',0,0),(211,5,'',0,0),(212,5,'',0,0),(213,5,'cc',1,0),(214,3,'co',1,0),(215,4,'km',1,0),(216,4,'',0,0),(217,6,'nz',1,0),(218,6,'ck',1,0),(219,1,'',0,0),(220,5,'cy',1,0),(221,2,'',1,0),(222,1,'',1,0),(223,1,'pl',1,0),(224,3,'',0,0),(225,4,'dj',1,0),(226,4,'',0,0),(227,2,'do',1,0),(228,4,'',1,0),(229,4,'ke',1,0),(230,5,'tl',1,0),(231,5,'',0,0),(232,4,'eg',1,0),(233,3,'ec',1,0),(234,2,'',1,0),(235,4,'er',1,0),(236,4,'et',1,0),(237,6,'fj',1,0),(238,6,'',0,0),(239,5,'',1,0),(240,5,'la',1,0),(241,5,'vn',1,0),(242,5,'',0,0),(243,5,'',0,0),(244,3,'',0,0),(245,2,'',0,0),(246,3,'',0,0),(247,2,'ht',1,0),(248,2,'mq',0,0),(249,6,'pf',0,0),(250,5,'kr',1,0),(251,5,'kp',1,0),(252,5,'',1,0),(253,6,'pg',1,0),(254,6,'',0,0),(255,6,'',0,0),(256,4,'gn',1,0),(257,5,'hk',1,0),(258,1,'is',1,0),(259,1,'hu',1,0),(260,5,'id',1,0),(261,5,'',0,0),(262,6,'',1,0),(263,2,'us',1,0),(264,4,'',0,0),(265,4,'tz',1,0),(266,5,'',0,0),(267,5,'sa',1,0),(268,5,'il',1,0),(269,5,'',0,0),(270,5,'ir',1,0),(271,5,'iq',1,0),(272,4,'so',1,0),(273,4,'',0,0),(274,1,'it',1,0),(275,4,'',1,0),(277,1,'',0,0),(278,5,'jo',1,0),(279,4,'',1,0),(280,5,'',0,0),(281,6,'ki',1,0),(282,1,'li',1,0),(283,5,'kw',1,0),(284,5,'lb',1,0),(285,4,'ls',1,0),(286,4,'lr',1,0),(287,4,'ly',1,0),(288,1,'',0,0),(289,1,'lu',1,0),(290,5,'mo',1,0),(291,4,'mg',1,0),(292,4,'',0,0),(293,4,'mw',1,0),(294,5,'my',1,0),(295,5,'',1,0),(296,5,'',0,0),(297,5,'sg',1,0),(298,5,'',0,0),(299,5,'',0,0),(300,5,'',0,0),(301,5,'',0,0),(302,5,'',0,0),(303,5,'',0,0),(304,5,'',0,0),(305,5,'',0,0),(306,1,'es',1,0),(307,5,'mv',1,0),(308,1,'mt',1,0),(309,6,'mh',1,0),(310,4,'mr',1,0),(311,2,'mx',1,0),(312,2,'',0,0),(313,2,'',0,0),(314,2,'',0,0),(315,2,'',0,0),(316,2,'',0,0),(317,4,'',0,0),(318,1,'mc',1,0),(319,5,'mn',1,0),(320,1,'me',1,0),(321,4,'ma',1,0),(322,4,'',0,0),(323,4,'mz',1,0),(324,4,'',0,0),(325,5,'',1,0),(326,4,'na',1,0),(327,6,'nr',1,0),(328,5,'np',1,0),(329,6,'nc',1,0),(330,6,'vu',1,0),(331,6,'',0,0),(332,6,'nu',1,0),(333,1,'no',1,0),(334,5,'om',1,0),(335,5,'',1,0),(336,1,'tk',1,0),(337,5,'sy',1,0),(338,1,'se',1,0),(339,6,'pw',1,0),(340,2,'pa',1,0),(341,3,'py',1,0),(342,3,'pe',1,0),(343,5,'ph',1,0),(344,2,'',1,0),(345,5,'qa',1,0),(346,4,'',0,0),(347,4,'zw',1,0),(348,4,'zm',1,0),(349,4,'',0,0),(350,1,'ro',1,0),(351,1,'',0,0),(352,1,'',0,0),(353,2,'sm',1,0),(354,6,'ws',1,0),(355,6,'as',1,0),(356,1,'sm',1,0),(357,4,'st',1,0),(358,4,'',0,0),(359,4,'sc',1,0),(360,6,'sb',1,0),(361,4,'za',1,0),(362,5,'ye',1,0),(363,5,'',0,0),(364,5,'',0,0),(365,5,'',0,0),(366,5,'',0,0),(367,3,'gs',0,0),(368,1,'',0,0),(369,1,'',0,0),(370,1,'',0,0),(371,1,'',0,0),(372,1,'',0,0),(373,1,'',0,0),(374,1,'',0,0),(375,1,'',0,0),(376,1,'',0,0),(377,1,'',0,0),(378,1,'',0,0),(379,1,'',0,0),(380,1,'',0,0),(381,1,'',0,0),(382,1,'',0,0),(383,1,'',0,0),(384,4,'sd',1,0),(385,3,'sr',1,0),(386,3,'',0,0),(387,4,'sz',1,0),(388,4,'',1,0),(389,4,'eh',1,0),(390,1,'va',1,0),(391,3,'uy',1,0),(392,3,'ve',1,0),(393,4,'ug',1,0),(394,6,'tv',1,0),(395,4,'tn',1,0),(396,4,'',0,0),(397,4,'',1,0),(398,5,'',0,0),(399,5,'th',1,0),(400,5,'',1,0),(401,6,'tk',1,0),(402,6,'to',1,0),(403,5,'',0,0),(404,1,'',1,0),(405,1,'',0,0),(406,1,'',0,0),(407,1,'',0,0),(408,1,'',0,0),(409,1,'',0,0),(410,1,'',0,0),(411,1,'',0,0),(412,1,'',0,0),(413,1,'',0,0),(414,1,'',0,0),(415,1,'',0,0),(416,1,'',0,0),(417,1,'',0,0),(418,1,'',0,0),(419,1,'',0,0),(420,1,'',0,0),(421,1,'',0,0),(422,1,'',0,0),(423,5,'',0,0),(424,5,'',0,0),(425,5,'',0,0),(426,5,'',0,0),(427,5,'',0,0),(428,5,'',0,0),(429,5,'',0,0),(430,5,'',0,0),(431,5,'',0,0),(432,5,'',0,0),(433,5,'',0,0),(434,5,'',0,0),(435,5,'',0,0),(436,5,'',0,0),(437,5,'',0,0),(438,5,'',0,0),(439,5,'',0,0),(440,5,'',0,0),(441,5,'',0,0),(442,5,'',0,0),(443,5,'',0,0),(444,5,'',0,0),(445,5,'',0,0),(446,5,'',0,0),(447,5,'',0,0),(607,1,NULL,0,0),(608,1,NULL,0,0),(609,1,NULL,0,0),(610,1,NULL,0,0),(611,1,NULL,0,0),(612,1,NULL,0,0),(613,1,NULL,0,0),(614,1,NULL,0,0),(615,1,NULL,0,0),(616,1,NULL,0,0),(617,1,NULL,0,0),(618,1,NULL,0,0),(619,1,NULL,0,0),(620,1,NULL,0,0),(621,1,NULL,0,0),(622,1,NULL,0,0),(623,1,NULL,0,0),(624,1,NULL,0,0),(625,1,NULL,0,0),(626,1,NULL,0,0),(627,1,NULL,0,0),(628,1,NULL,0,0),(629,1,NULL,0,0),(630,1,NULL,0,0),(631,1,NULL,0,0),(632,1,NULL,0,0),(633,1,NULL,0,0),(634,1,NULL,0,0),(635,1,NULL,0,0),(636,1,NULL,0,0),(637,1,NULL,0,0),(638,1,NULL,0,0),(639,1,NULL,0,0),(640,1,NULL,0,0),(641,1,NULL,0,0),(642,1,NULL,0,0),(643,1,NULL,0,0),(644,1,NULL,0,0),(645,1,NULL,0,0),(646,1,NULL,0,0),(647,1,NULL,0,0),(648,1,NULL,0,0),(649,1,NULL,0,0),(650,1,NULL,0,0),(651,1,NULL,0,0),(652,1,NULL,0,0),(653,1,NULL,0,0),(654,1,NULL,0,0),(655,1,NULL,0,0),(656,1,NULL,0,0),(657,1,NULL,0,0),(658,1,NULL,0,0),(659,1,NULL,0,0),(660,1,NULL,0,0),(661,1,NULL,0,0),(662,1,NULL,0,0),(663,1,NULL,0,0),(664,1,NULL,0,0),(665,1,NULL,0,0),(666,1,NULL,0,0),(667,1,NULL,0,0),(668,1,NULL,0,0),(669,1,NULL,0,0),(670,1,NULL,0,0),(671,1,NULL,0,0),(672,1,NULL,0,0),(673,1,NULL,0,0),(674,1,NULL,0,0),(675,1,NULL,0,0),(676,1,NULL,0,0),(677,1,NULL,0,0),(678,1,NULL,0,0),(679,1,NULL,0,0),(680,1,NULL,0,0),(681,1,NULL,0,0),(682,1,NULL,0,0),(683,1,NULL,0,0),(684,1,NULL,0,0),(685,1,NULL,0,0),(686,1,NULL,0,0),(687,1,NULL,0,0),(688,1,NULL,0,0),(689,1,NULL,0,0),(690,1,NULL,0,0),(691,1,NULL,0,0),(692,1,NULL,0,0),(693,1,NULL,0,0),(694,1,NULL,0,0),(695,1,NULL,0,0),(696,1,NULL,0,0),(697,1,NULL,0,0),(698,1,NULL,0,0),(699,1,NULL,0,0),(700,1,NULL,0,0),(701,1,NULL,0,0),(702,1,NULL,0,0),(703,1,NULL,0,0),(704,1,NULL,0,0),(705,1,NULL,0,0),(706,1,NULL,0,0),(707,1,NULL,0,0),(708,1,NULL,0,0),(709,1,NULL,0,0),(710,1,NULL,0,0),(711,1,NULL,0,0),(712,1,NULL,0,0),(713,1,NULL,0,0),(714,1,NULL,0,0),(715,1,NULL,0,0),(716,1,NULL,0,0),(717,1,NULL,0,0),(718,1,NULL,0,0),(719,1,NULL,0,0),(720,1,NULL,0,0),(721,1,NULL,0,0),(722,1,NULL,0,0),(723,1,NULL,0,0),(724,1,NULL,0,0),(725,1,NULL,0,0),(726,1,NULL,0,0),(727,1,NULL,0,0),(728,1,NULL,0,0),(729,1,NULL,0,0),(730,1,NULL,0,0),(731,1,NULL,0,0),(732,1,NULL,0,0),(733,1,NULL,0,0),(734,1,NULL,0,0),(735,1,NULL,0,0),(736,1,NULL,0,0),(737,1,NULL,0,0),(738,1,NULL,0,0),(739,1,NULL,0,0),(740,1,NULL,0,0),(741,1,NULL,0,0),(742,1,NULL,0,0),(743,1,NULL,0,0),(744,1,NULL,0,0),(745,1,NULL,0,0),(746,1,NULL,0,0),(747,1,NULL,0,0),(748,1,NULL,0,0),(749,1,NULL,0,0),(750,1,NULL,0,0),(751,1,NULL,0,0),(752,1,NULL,0,0),(753,1,NULL,0,0),(754,1,NULL,0,0),(755,1,NULL,0,0),(756,1,NULL,0,0),(757,1,NULL,0,0),(758,1,NULL,0,0),(759,1,NULL,0,0),(760,1,NULL,0,0),(761,1,NULL,0,0),(762,1,NULL,0,0),(763,1,NULL,0,0),(764,1,NULL,0,0),(765,5,NULL,0,0),(766,5,NULL,0,0),(767,5,NULL,0,0),(768,5,NULL,0,0),(769,5,NULL,0,0),(770,5,NULL,0,0),(771,5,NULL,0,0),(772,5,NULL,0,0),(773,5,NULL,0,0),(774,5,NULL,0,0),(775,5,NULL,0,0),(776,5,NULL,0,0),(777,5,NULL,0,0),(778,5,NULL,0,0),(779,5,NULL,0,0),(780,5,NULL,0,0),(781,5,NULL,0,0),(782,5,NULL,0,0),(783,5,NULL,0,0),(784,5,NULL,0,0),(785,5,NULL,0,0),(786,5,NULL,0,0),(787,5,NULL,0,0),(788,5,NULL,0,0),(789,5,NULL,0,0),(790,5,NULL,0,0),(791,5,NULL,0,0),(792,5,NULL,0,0),(793,5,NULL,0,0),(794,5,NULL,0,0),(795,5,NULL,0,0),(796,5,NULL,0,0),(797,5,NULL,0,0),(798,5,NULL,0,0);
/*!40000 ALTER TABLE `territory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territoryname`
--

DROP TABLE IF EXISTS `territoryname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territoryname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `language` varchar(2) NOT NULL,
  `territory` int(11) NOT NULL,
  `primary` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `territory_idx` (`territory`),
  CONSTRAINT `territorynameterritory` FOREIGN KEY (`territory`) REFERENCES `territory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territoryname`
--

LOCK TABLES `territoryname` WRITE;
/*!40000 ALTER TABLE `territoryname` DISABLE KEYS */;
INSERT INTO `territoryname` VALUES (1,'Aachen','en',607,1),(2,'Aargau','en',27,1),(3,'Abkhazia','en',50,1),(4,'Afghanistan','en',51,1),(5,'Ajman','en',53,1),(6,'Åland Islands','en',61,1),(7,'Albania','en',68,1),(8,'Alderney','en',69,1),(9,'Algeria','en',70,1),(10,'American Samoa','en',355,1),(11,'Ametlla del Valles','en',368,1),(12,'Andorra','en',72,1),(13,'Angola','en',73,1),(14,'Anguilla','en',36,1),(15,'Anhalt-Bernburg','en',608,1),(16,'Anhalt-Dessau','en',609,1),(17,'Anhalt-Köthen','en',610,1),(18,'Anhalt-Zerbst','en',611,1),(19,'Anhui','en',423,1),(20,'Antigua and Barbuda','en',76,1),(21,'Appenzell Ausserrhoden','en',23,1),(22,'Appenzell Innerrhoden','en',24,1),(23,'Arahal','en',369,1),(24,'Arenys De Mar','en',370,1),(25,'Argentina','en',77,1),(26,'Armavir','en',351,1),(27,'Armenia','en',83,1),(28,'Aruba','en',101,1),(29,'Ascension','en',105,1),(30,'Asturias and Leon','en',371,1),(31,'Auersperg ','en',109,1),(32,'Augsburg','en',612,1),(33,'Australia','en',107,1),(34,'Austria','en',4,1),(35,'Azerbaijan','en',88,1),(36,'Azores','en',110,1),(37,'Baden','en',613,1),(38,'Bahamas','en',111,1),(39,'Bahawalpur','en',765,1),(40,'Bahrain','en',112,1),(41,'Bangladesh','en',114,1),(42,'Barbados','en',153,1),(43,'Baroda','en',766,1),(44,'Basel-Landschaft','en',21,1),(45,'Basel-Stadt','en',20,1),(46,'Basque Country','en',382,1),(47,'Bavaria','en',614,1),(48,'Beijing (Provisional Government of China)','en',207,1),(49,'Belarus','en',89,1),(50,'Belgian Congo','en',130,1),(51,'Belgium','en',132,1),(52,'Belize','en',136,1),(53,'Benin','en',140,1),(54,'Bentheim-Tecklenburg-Rheda','en',615,1),(55,'Berg','en',616,1),(56,'Bermuda','en',37,1),(57,'Berne','en',3,1),(58,'Bhaungar','en',787,1),(59,'Bhutan','en',141,1),(60,'Biafra','en',144,1),(61,'Biberach','en',617,1),(62,'Bikanir','en',767,1),(63,'Birkenfeld','en',618,1),(64,'Bocholt','en',619,1),(65,'Bohemia and Moravia','en',145,1),(66,'Bolivia','en',146,1),(67,'Bosnia and Herzegovina','en',126,1),(68,'Botswana','en',147,1),(69,'Brandenburg-Ansbach','en',620,1),(70,'Brandenburg-Ansbach-Bayreuth','en',621,1),(71,'Brandenburg-Bayreuth','en',622,1),(72,'Braunschweig-Blankenburg','en',623,1),(73,'Braunschweig-Lüneburg-Calenberg-Hannover','en',624,1),(74,'Braunschweig-Lüneburg-Celle','en',625,1),(75,'Braunschweig-Wolfenbüttel','en',626,1),(76,'Brazil','en',149,1),(77,'Bremen','en',627,1),(78,'Breslau','en',628,1),(79,'Bretzenheum','en',629,1),(80,'British Antarctic Territory','en',150,1),(81,'British Guiana','en',155,1),(82,'British Honduras','en',137,1),(83,'British India','en',113,1),(84,'British Indian Ocean Territory','en',151,1),(85,'British Virgin Islands','en',38,1),(86,'British West Africa','en',48,1),(87,'British West Indies','en',152,1),(88,'Brunei','en',163,1),(89,'Buchhorn','en',630,1),(90,'Buenos Aires','en',78,1),(91,'Bukhara','en',196,1),(92,'Bulgaria','en',164,1),(93,'Bundi','en',768,1),(94,'Burundi','en',166,1),(95,'Cambay','en',769,1),(96,'Cambodia','en',169,1),(97,'Cameroon','en',170,1),(98,'Canada','en',175,1),(99,'Cape Verde','en',188,1),(100,'Cayman Islands','en',39,1),(101,'Cazalla de la Sierra','en',372,1),(102,'Central African Republic','en',171,1),(103,'Central African States','en',135,1),(104,'Central American Republic','en',190,1),(105,'Ceylon','en',199,1),(106,'Chad','en',172,1),(107,'Chihuahua','en',312,1),(108,'Chile','en',200,1),(109,'China','en',204,1),(110,'China, People\'s Republic','en',205,1),(111,'Chinese Soviet Republic','en',447,1),(112,'Cisalpine Republic','en',406,1),(113,'Cocos (Keeling) Islands','en',213,1),(114,'Coesfeld','en',632,1),(115,'Cologne','en',675,1),(116,'Colombia','en',214,1),(117,'Comoros','en',215,1),(118,'Comoros (French)','en',216,1),(119,'Confederation of the Rhine','en',719,1),(120,'Congo Free State','en',131,1),(121,'Congo, Democratic Republic','en',129,1),(122,'Congo, Republic','en',133,1),(123,'Cook Islands','en',218,1),(124,'Cordoba','en',79,1),(125,'Corvey','en',633,1),(126,'Costa Rica','en',191,1),(127,'Crete','en',219,1),(128,'Croatia','en',123,1),(129,'Cuba','en',122,1),(130,'Curaçao','en',104,1),(131,'Cyprus','en',220,1),(132,'Czech Republic ','en',58,1),(133,'Czechoslovakia','en',60,1),(134,'Danish India','en',119,1),(135,'Danish West Indies','en',221,1),(136,'Danzig','en',222,1),(137,'Datia','en',788,1),(138,'Demerara-Essequibo','en',224,1),(139,'Denmark','en',120,1),(140,'Dewas','en',789,1),(141,'Djibouti','en',225,1),(142,'Dominica','en',161,1),(143,'Dominican Republic','en',227,1),(144,'Dortmund','en',635,1),(145,'Dungarpur','en',790,1),(146,'Durango','en',313,1),(147,'East Africa','en',228,1),(148,'East Caribbean States','en',234,1),(149,'East Hopei','en',209,1),(150,'East Timor','en',230,1),(151,'Ecuador','en',233,1),(152,'Egypt','en',232,1),(153,'Eichstadt','en',636,1),(154,'Einbeck','en',637,1),(155,'El Salvador','en',195,1),(156,'Elichpur','en',772,1),(157,'Ellwangen','en',638,1),(158,'Emilia','en',407,1),(159,'Entre Rios','en',80,1),(160,'Equatorial Guinea','en',173,1),(161,'Erfurt','en',639,1),(162,'Eritrea','en',235,1),(163,'Esslingen','en',640,1),(164,'Estonia','en',85,1),(165,'Ethiopia','en',236,1),(166,'Falkland Islands','en',40,1),(167,'Faroe Islands','en',201,1),(168,'Fiji','en',237,1),(169,'Fiji (British)','en',238,1),(170,'Finland','en',62,1),(171,'France','en',6,1),(172,'Franconian Circle','en',642,1),(173,'Frankfurt','en',641,1),(174,'Freiburg','en',643,1),(175,'Freising','en',644,1),(176,'French Afars and Issas','en',226,1),(177,'French Algeria','en',71,1),(178,'French Colonies','en',244,1),(179,'French Equatorial Africa','en',134,1),(180,'French Guiana','en',246,1),(181,'French India','en',118,1),(182,'French Indochina','en',239,1),(183,'French Madagascar','en',292,1),(184,'French Morocco','en',322,1),(185,'French Polynesia','en',249,1),(186,'French Tunisia','en',396,1),(187,'French West Africa','en',139,1),(188,'Fribourg','en',18,1),(189,'Friedberg','en',645,1),(190,'Fujairah','en',54,1),(191,'Fujian','en',424,1),(192,'Fulda','en',646,1),(193,'Fürstenberg-Stuhlingen','en',647,1),(194,'Further Austria','en',755,1),(195,'Gabon','en',174,1),(196,'Gambia','en',64,1),(197,'Gansu','en',425,1),(198,'Geneva','en',33,1),(199,'Genoa','en',408,1),(200,'Georgia','en',49,1),(201,'German Democratic Republic','en',405,1),(202,'German East Africa','en',264,1),(203,'German New Guinea','en',255,1),(204,'Germany','en',2,1),(205,'Ghana','en',67,1),(206,'Gibraltar','en',41,1),(207,'Glarus','en',16,1),(208,'Gold Coast','en',66,1),(209,'Gorizia','en',409,1),(210,'Goslar','en',648,1),(211,'Gratallops','en',373,1),(212,'Graubünden','en',26,1),(213,'Great Britain','en',7,1),(214,'Greece','en',203,1),(215,'Greenland','en',202,1),(216,'Grenada','en',158,1),(217,'Guadeloupe','en',245,1),(218,'Guangdong','en',427,1),(219,'Guangxi','en',426,1),(220,'Guatemala','en',192,1),(221,'Guernsey','en',35,1),(222,'Guerrero','en',314,1),(223,'Guinea','en',256,1),(224,'Guinea-Bissau','en',177,1),(225,'Guizhou','en',428,1),(226,'Guyana','en',154,1),(227,'Gwalior','en',770,1),(228,'Haiti','en',247,1),(229,'Hamburg','en',650,1),(230,'Hamm','en',651,1),(231,'Hanau-Lichtenberg','en',652,1),(232,'Hanau-Münzenberg','en',653,1),(233,'Hannover','en',654,1),(234,'Hawaii','en',262,1),(235,'Hejaz','en',266,1),(236,'Henan','en',429,1),(237,'Henneberg','en',655,1),(238,'Henneberg-Ilmenau','en',656,1),(239,'Hesse-Darmstadt','en',657,1),(240,'Hesse-Homburg','en',659,1),(241,'Hesse-Kassel','en',658,1),(242,'Hildesheim','en',660,1),(243,'Hohenlohe-Ingelfingen','en',661,1),(244,'Hohenlohe-Kirchberg','en',662,1),(245,'Hohenlohe-Neuenstein-Oehringen','en',663,1),(246,'Hohenlohe-Pfedelbach','en',664,1),(247,'Hohenlohe-Waldenburg-Schillingsfürst','en',665,1),(248,'Hohenzollern','en',668,1),(249,'Hohenzollern-Hechingen','en',666,1),(250,'Hohenzollern-Sigmaringen','en',667,1),(251,'Honduras','en',193,1),(252,'Hong Kong','en',257,1),(253,'Hubei','en',430,1),(254,'Hunan','en',431,1),(255,'Hungary','en',259,1),(256,'Hyderabad','en',771,1),(257,'Ibi','en',374,1),(258,'Iceland','en',258,1),(259,'Îles de France et Bourbon','en',183,1),(260,'India','en',116,1),(261,'Indonesia','en',260,1),(262,'Indore','en',773,1),(263,'Ionian Islands','en',288,1),(264,'Iran','en',270,1),(265,'Iraq','en',271,1),(266,'Ireland','en',121,1),(267,'Isenburg','en',669,1),(268,'Isle of Man','en',8,1),(269,'Isny','en',670,1),(270,'Israel','en',268,1),(271,'Italian Somaliland','en',273,1),(272,'Italy','en',274,1),(273,'Ivory Coast','en',176,1),(274,'Jaipur','en',774,1),(275,'Jamaica','en',156,1),(276,'Japan','en',208,1),(277,'Jersey','en',46,1),(278,'Jever','en',671,1),(279,'Jiangnan','en',432,1),(280,'Jiangsu','en',433,1),(281,'Jiangxi','en',434,1),(282,'Jilin','en',435,1),(283,'Jodhpur','en',775,1),(284,'Jordan','en',278,1),(285,'Jülich-Berg','en',672,1),(286,'Junagadh','en',776,1),(287,'Katanga','en',279,1),(288,'Kazakhstan','en',92,1),(289,'Kelantan','en',301,1),(290,'Kempten','en',673,1),(291,'Kenya','en',229,1),(292,'Khiva','en',197,1),(293,'Kiau Chau','en',280,1),(294,'Kingdom of Italy (Napoleonic)','en',410,1),(295,'Kiribati','en',281,1),(296,'Kishangarh','en',791,1),(297,'Kleve','en',631,1),(298,'Knyphausen','en',674,1),(299,'Konstanz','en',676,1),(300,'Korea','en',252,1),(301,'Kotah','en',777,1),(302,'Kutch','en',778,1),(303,'Kuwait','en',283,1),(304,'Kyrgyzstan','en',93,1),(305,'La Rioja','en',81,1),(306,'Laos','en',240,1),(307,'Latvia','en',86,1),(308,'Lauenburg','en',677,1),(309,'Lebanon','en',284,1),(310,'Leiningen-Dagsburg-Hartenburg','en',678,1),(311,'Lesotho','en',285,1),(312,'Liaoning','en',436,1),(313,'Liberia','en',286,1),(314,'Libya','en',287,1),(315,'Liechtenstein','en',282,1),(316,'Lindau','en',679,1),(317,'Lindau, Isny, Wangen, Leutkirch','en',680,1),(318,'Lippe-Detmold','en',681,1),(319,'Lithuania','en',87,1),(320,'Lombardy-Venetia','en',411,1),(321,'Lora del Rio','en',375,1),(322,'Löwenstein-Wertheim-Rochefort','en',682,1),(323,'Löwenstein-Wertheim-Virneburg','en',683,1),(324,'Löwenstein-Wertheim-Virneburg and Rochefort','en',684,1),(325,'Lübeck','en',685,1),(326,'Lucca','en',412,1),(327,'Lucerne','en',10,1),(328,'Lunavada','en',792,1),(329,'Lüneburg','en',686,1),(330,'Luxembourg','en',289,1),(331,'Macau','en',290,1),(332,'Macedonia','en',128,1),(333,'Madagascar','en',291,1),(334,'Madeira','en',277,1),(335,'Madras Presidency','en',779,1),(336,'Mainz','en',687,1),(337,'Makrai','en',793,1),(338,'Malacca ','en',302,1),(339,'Malawi','en',293,1),(340,'Malaya','en',295,1),(341,'Malaya and British Borneo','en',296,1),(342,'Malaysia','en',294,1),(343,'Maldives','en',307,1),(344,'Maler Kotla','en',794,1),(345,'Mali','en',178,1),(346,'Malta','en',308,1),(347,'Manchuko','en',210,1),(348,'Manchuria','en',437,1),(349,'Mansfeld-Bornstedt','en',688,1),(350,'Mansfeld-Eisleben','en',689,1),(351,'Marchena','en',376,1),(352,'Marshall Islands','en',309,1),(353,'Martinique','en',248,1),(354,'Mauritania','en',310,1),(355,'Mauritius','en',184,1),(356,'Mecklenburg-Schwerin','en',690,1),(357,'Mecklenburg-Strelitz','en',691,1),(358,'Memmingen','en',692,1),(359,'Mendoza','en',82,1),(360,'Mengjiang','en',211,1),(361,'Menorca','en',377,1),(362,'Mewar','en',780,1),(363,'Mexico','en',311,1),(364,'Moldova','en',94,1),(365,'Mombasa','en',317,1),(366,'Monaco','en',318,1),(367,'Mongolia','en',319,1),(368,'Montenegro','en',320,1),(369,'Montfort','en',693,1),(370,'Montserrat','en',42,1),(371,'Morocco','en',321,1),(372,'Mozambique','en',323,1),(373,'Mühlhausen','en',694,1),(374,'Münster','en',695,1),(375,'Mutawakkilite Kingdom of Yemen','en',366,1),(376,'Myanmar','en',165,1),(377,'Mysore','en',781,1),(378,'Nagorno-Karabakh','en',325,1),(379,'Namibia','en',326,1),(380,'Nanjing (Reformed Government of China)','en',212,1),(381,'Naples','en',413,1),(382,'Nassau','en',696,1),(383,'Nauru','en',327,1),(384,'Nawanagar','en',782,1),(385,'Nepal','en',328,1),(386,'Netherlands','en',102,1),(387,'Netherlands Antilles','en',103,1),(388,'Netherlands East Indies','en',261,1),(389,'Neuchâtel','en',32,1),(390,'New Brunswick','en',185,1),(391,'New Caledonia','en',329,1),(392,'New Foundland','en',186,1),(393,'New Guinea','en',254,1),(394,'New Hebrides','en',331,1),(395,'New Zealand','en',217,1),(396,'Nicaragua','en',194,1),(397,'Nidwalden','en',15,1),(398,'Niger','en',179,1),(399,'Nigeria','en',65,1),(400,'Nigeria (British)','en',143,1),(401,'Niue','en',332,1),(402,'North Borneo','en',299,1),(403,'North Korea','en',251,1),(404,'North Vietnam','en',242,1),(405,'Norway','en',333,1),(406,'Nulles','en',378,1),(407,'Nürnberg','en',697,1),(408,'Oaxaca','en',315,1),(409,'Obwalden','en',14,1),(410,'Oldenburg','en',698,1),(411,'Olot','en',379,1),(412,'Oman','en',334,1),(413,'Osnabrück','en',699,1),(414,'Ostfriesland','en',700,1),(415,'Öttingen-Wallenstein-Spielberg','en',701,1),(416,'Ottoman Empire','en',335,1),(417,'Paderborn','en',702,1),(418,'Pahang ','en',303,1),(419,'Pakistan','en',115,1),(420,'Palau','en',339,1),(421,'Palestine','en',269,1),(422,'Panama','en',340,1),(423,'Papal States','en',414,1),(424,'Papua New Guinea','en',253,1),(425,'Paraguay','en',341,1),(426,'Parma','en',415,1),(427,'Passau','en',703,1),(428,'Patiala','en',795,1),(429,'Penang','en',305,1),(430,'Peru','en',342,1),(431,'Pfalz ','en',704,1),(432,'Pfalz-Birkenfeld-Zweibrücken','en',705,1),(433,'Pfalz-Neuburg','en',706,1),(434,'Pfalz-Sulzbach','en',707,1),(435,'Philippines','en',343,1),(436,'Piedmont','en',416,1),(437,'Pitcarin Islands','en',43,1),(438,'Poland','en',223,1),(439,'Pomerania','en',708,1),(440,'Portugal','en',75,1),(441,'Portuguese Angola','en',74,1),(442,'Portuguese Cape Verde','en',189,1),(443,'Portuguese Guinea','en',182,1),(444,'Portuguese India','en',117,1),(445,'Portuguese Mozambique','en',324,1),(446,'Portuguese São Tomé and Príncipe','en',358,1),(447,'Portuguese Timor','en',231,1),(448,'Prince Edward Island','en',187,1),(449,'Prussia','en',709,1),(450,'Pudukkottai','en',783,1),(451,'Puebla','en',316,1),(452,'Puebla de Cazalla','en',380,1),(453,'Puerto Rico','en',344,1),(454,'Pyrmont','en',710,1),(455,'Qatar','en',345,1),(456,'Ras Al Khaimah','en',55,1),(457,'Regensburg','en',711,1),(458,'Réunion','en',148,1),(459,'Reuss-Ebersdorf','en',712,1),(460,'Reuss-Gera','en',713,1),(461,'Reuss-Lobenstein','en',714,1),(462,'Reuss-Lobenstein-Ebersdorf','en',715,1),(463,'Reuss-Obergreiz','en',716,1),(464,'Reuss-Schleiz','en',717,1),(465,'Reuss-Untergreiz','en',718,1),(466,'Rewa','en',796,1),(467,'Rhodesia and Nyasaland','en',346,1),(468,'Riedtberg','en',720,1),(469,'Roman Republic (1849)','en',417,1),(470,'Romania','en',350,1),(471,'Rostock','en',721,1),(472,'Ruanda-Urundi','en',168,1),(473,'Russia','en',100,1),(474,'Russian Empire','en',99,1),(475,'Rwanda','en',167,1),(476,'Saarland','en',352,1),(477,'Sahrawi Arab Democratic Republic','en',389,1),(478,'Sailana','en',797,1),(479,'Saint Helena','en',106,1),(480,'Saint Helena and Ascension','en',44,1),(481,'Saint Kitts and Nevis','en',162,1),(482,'Saint Lucia','en',159,1),(483,'Saint Pierre and Miquelon','en',353,1),(484,'Saint Vincent and the Grenadines','en',160,1),(485,'Saliaina','en',784,1),(486,'Salm-Kyrburg','en',732,1),(487,'Salzburg','en',108,1),(488,'Samoa','en',354,1),(489,'San Marino','en',356,1),(490,'Santander, Palencia and Burgos','en',383,1),(491,'São Tomé and Príncipe','en',357,1),(492,'Sarawak','en',300,1),(493,'Sardinia','en',418,1),(494,'Saudi Arabia','en',267,1),(495,'Saxe-Altenburg','en',723,1),(496,'Saxe-Coburg and Gotha','en',724,1),(497,'Saxe-Coburg-Saalfeld','en',725,1),(498,'Saxe-Eisenach','en',727,1),(499,'Saxe-Gotha-Altenburg','en',726,1),(500,'Saxe-Hennenberg-Schleusing','en',728,1),(501,'Saxe-Hildburghausen','en',729,1),(502,'Saxe-Meiningen','en',730,1),(503,'Saxe-Weimar-Eisenach','en',731,1),(504,'Saxony','en',722,1),(505,'Sayn-Altenkirchen','en',733,1),(506,'Schaffhausen','en',22,1),(507,'Schaumburg-Hessen','en',734,1),(508,'Schaumburg-Lippe','en',735,1),(509,'Schlesien-Württemberg-Oels','en',737,1),(510,'Schleswig-Holstein','en',738,1),(511,'Schmalkalden','en',739,1),(512,'Schonau','en',740,1),(513,'Schwäbisch Hall','en',649,1),(514,'Schwarzburg-Rudolstadt','en',741,1),(515,'Schwarzburg-Sonderhausen','en',742,1),(516,'Schwarzenberg','en',743,1),(517,'Schweinfurt','en',744,1),(518,'Schwyz','en',13,1),(519,'Scottland','en',47,1),(520,'Segarra de Gaia','en',381,1),(521,'Senegal','en',180,1),(522,'Serbia','en',127,1),(523,'Seychelles','en',359,1),(524,'Shaanxi','en',440,1),(525,'Shandong','en',438,1),(526,'Shanxi','en',441,1),(527,'Sharjah','en',56,1),(528,'Sichuan','en',439,1),(529,'Sicily','en',419,1),(530,'Sierra Leone','en',63,1),(531,'Silesia','en',736,1),(532,'Singapore','en',297,1),(533,'Slovakia','en',59,1),(534,'Slovenia','en',125,1),(535,'Soest','en',745,1),(536,'Solms-Laubach','en',746,1),(537,'Solomon Islands','en',360,1),(538,'Solothurn','en',19,1),(539,'Somalia','en',272,1),(540,'Somaliland','en',275,1),(541,'South Africa','en',361,1),(542,'South Arabia','en',364,1),(543,'South Georgia and the South Sandwich Islands','en',367,1),(544,'South Korea','en',250,1),(545,'South Vietnam','en',243,1),(546,'Southern Rhodesia','en',349,1),(547,'Soviet Union','en',84,1),(548,'Spain','en',306,1),(549,'Speyer','en',747,1),(550,'Sri Lanka','en',198,1),(551,'St. Gallen','en',25,1),(552,'Stolberg-Rossla','en',748,1),(553,'Stolberg-Stolberg','en',749,1),(554,'Stolberg-Wernigerode','en',750,1),(555,'Straits Settlements','en',298,1),(556,'Stralsund','en',751,1),(557,'Strassburg','en',752,1),(558,'Sudan','en',384,1),(559,'Sunth','en',798,1),(560,'Suriname','en',385,1),(561,'Suriname (Dutch)','en',386,1),(562,'Swaziland','en',387,1),(563,'Sweden','en',338,1),(564,'Switzerland','en',1,1),(565,'Syria','en',337,1),(566,'Taiwan','en',206,1),(567,'Tajikistan','en',95,1),(568,'Tannu Tuva','en',398,1),(569,'Tanzania','en',265,1),(570,'Teutonic Order','en',634,1),(571,'Thailand','en',399,1),(572,'Thurgau','en',28,1),(573,'Tibet','en',400,1),(574,'Ticino','en',29,1),(575,'Togo','en',181,1),(576,'Tokelau','en',401,1),(577,'Tonga','en',402,1),(578,'Tonk','en',785,1),(579,'Tonkin ','en',403,1),(580,'Transnistria','en',404,1),(581,'Travancore','en',786,1),(582,'Trengganu ','en',304,1),(583,'Trier','en',753,1),(584,'Trinidad and Tobago','en',157,1),(585,'Tristan da Cunha','en',397,1),(586,'Tunisia','en',395,1),(587,'Turkey','en',336,1),(588,'Turkmenistan','en',96,1),(589,'Turks and Caicos Islands','en',45,1),(590,'Tuscany','en',420,1),(591,'Tuvalu','en',394,1),(592,'Two Sicilies','en',421,1),(593,'Tyrol','en',5,1),(594,'Uganda','en',393,1),(595,'Ukraine','en',97,1),(596,'Ulm','en',754,1),(597,'Umm al-Qaiwain','en',57,1),(598,'United Arab Emirates','en',52,1),(599,'United States of America','en',263,1),(600,'Uri','en',11,1),(601,'Uruguay','en',391,1),(602,'Uzbekistan','en',98,1),(603,'Valais','en',31,1),(604,'Vanuatu','en',330,1),(605,'Vatican City','en',390,1),(606,'Vaud','en',30,1),(607,'Venetia','en',422,1),(608,'Venezuela','en',392,1),(609,'Vietnam','en',241,1),(610,'Waldeck','en',756,1),(611,'Waldeck and Pyrmont','en',757,1),(612,'Wallmoden-Gimborn','en',758,1),(613,'West African States','en',138,1),(614,'Westphalia','en',759,1),(615,'Wied-Neuwied','en',760,1),(616,'Wied-Runkel','en',761,1),(617,'Wismar','en',762,1),(618,'Württemberg','en',763,1),(619,'Würzburg','en',764,1),(620,'Xinjiang','en',442,1),(621,'Yemen','en',362,1),(622,'Yemen Arab Republic','en',365,1),(623,'Yemen, People\'s Democratic Republic','en',363,1),(624,'Yugoslavia','en',124,1),(625,'Yunnan','en',443,1),(626,'Zambia','en',348,1),(627,'Zanzibar','en',388,1),(628,'Zhejiang','en',444,1),(629,'Zhenjiang','en',445,1),(630,'Zhili','en',446,1),(631,'Zimbabwe','en',347,1),(632,'Zug','en',17,1),(633,'Zurich','en',9,1),(1024,'Schweiz','de',1,1),(1025,'Deutschland','de',2,1),(1026,'Bern','de',3,1),(1027,'Österreich','de',4,1),(1028,'Tirol','de',5,1),(1029,'Frankreich','de',6,1),(1030,'Großbritannien','de',7,1),(1031,'Isle of Man','de',8,1),(1032,'Zürich','de',9,1),(1033,'Luzern','de',10,1),(1034,'Uri','de',11,1),(1035,'Schwyz','de',13,1),(1036,'Obwalden','de',14,1),(1037,'Nidwalden','de',15,1),(1038,'Glarus','de',16,1),(1039,'Zug','de',17,1),(1040,'Freiburg (Schweiz)','de',18,1),(1041,'Solothurn','de',19,1),(1042,'Basel-Stadt','de',20,1),(1043,'Basel-Landschaft','de',21,1),(1044,'Schaffhausen','de',22,1),(1045,'Appenzell Ausserrhoden','de',23,1),(1046,'Appenzell Innerrhoden','de',24,1),(1047,'St. Gallen','de',25,1),(1048,'Graubünden','de',26,1),(1049,'Aargau','de',27,1),(1050,'Thurgau','de',28,1),(1051,'Tessin','de',29,1),(1052,'Waadt','de',30,1),(1053,'Wallis','de',31,1),(1054,'Neuenburg','de',32,1),(1055,'Genf','de',33,1),(1056,'Guernsey','de',35,1),(1057,'Anguilla','de',36,1),(1058,'Bermuda','de',37,1),(1059,'Britische Jungferninseln','de',38,1),(1060,'Cayman Islands','de',39,1),(1061,'Falklandinseln','de',40,1),(1062,'Gibraltar','de',41,1),(1063,'Montserrat','de',42,1),(1064,'Pitcarininseln','de',43,1),(1065,'St. Helena und Ascension','de',44,1),(1066,'Turks- und Caicosinseln','de',45,1),(1067,'Jersey','de',46,1),(1068,'Schottland','de',47,1),(1069,'Britisch-Westafrika','de',48,1),(1070,'Georgien','de',49,1),(1071,'Abchasien','de',50,1),(1072,'Afghanistan','de',51,1),(1073,'Vereinigte Arabische Emirate','de',52,1),(1074,'Adschman','de',53,1),(1075,'Fudschaira','de',54,1),(1076,'Ra’s al-Chaima','de',55,1),(1077,'Schardscha','de',56,1),(1078,'Umm al-Qaiwain','de',57,1),(1079,'Tschechische Republik','de',58,1),(1080,'Slowakei','de',59,1),(1081,'Tschechoslowakei','de',60,1),(1082,'Åland','de',61,1),(1083,'Finnland','de',62,1),(1084,'Sierra Leone','de',63,1),(1085,'Gambia','de',64,1),(1086,'Nigeria','de',65,1),(1087,'Goldküste','de',66,1),(1088,'Ghana','de',67,1),(1089,'Albanien','de',68,1),(1090,'Alderney','de',69,1),(1091,'Algerien','de',70,1),(1092,'Algerien (Französisch)','de',71,1),(1093,'Andorra','de',72,1),(1094,'Angola','de',73,1),(1095,'Angola (Portugiesisch)','de',74,1),(1096,'Portugal','de',75,1),(1097,'Antigua und Barbuda','de',76,1),(1098,'Argentinien','de',77,1),(1099,'Buenos Aires','de',78,1),(1100,'Cordoba','de',79,1),(1101,'Entre Rios','de',80,1),(1102,'La Rioja','de',81,1),(1103,'Mendoza','de',82,1),(1104,'Armenien','de',83,1),(1105,'Sowjetunion','de',84,1),(1106,'Estland','de',85,1),(1107,'Lettland','de',86,1),(1108,'Litauen','de',87,1),(1109,'Aserbaidschan','de',88,1),(1110,'Weißrussland','de',89,1),(1111,'Kasachstan','de',92,1),(1112,'Kirgisistan','de',93,1),(1113,'Moldawien','de',94,1),(1114,'Tadschikistan','de',95,1),(1115,'Turkmenistan','de',96,1),(1116,'Ukraine','de',97,1),(1117,'Usbekistan','de',98,1),(1118,'Russisches Reich','de',99,1),(1119,'Russland','de',100,1),(1120,'Aruba','de',101,1),(1121,'Niederlande','de',102,1),(1122,'Niederländische Antillen','de',103,1),(1123,'Curaçao','de',104,1),(1124,'Ascension','de',105,1),(1125,'St. Helena','de',106,1),(1126,'Australien','de',107,1),(1127,'Salzburg','de',108,1),(1128,'Auersperg ','de',109,1),(1129,'Azoren','de',110,1),(1130,'Bahamas','de',111,1),(1131,'Bahrain','de',112,1),(1132,'Britisch-Indien','de',113,1),(1133,'Bangladesch','de',114,1),(1134,'Pakistan','de',115,1),(1135,'Indien','de',116,1),(1136,'Portugiesisch-Indien','de',117,1),(1137,'Französisch-Indien','de',118,1),(1138,'Dänisch-Indien','de',119,1),(1139,'Dänemark','de',120,1),(1140,'Irland','de',121,1),(1141,'Kuba','de',122,1),(1142,'Kroatien','de',123,1),(1143,'Jugoslawien','de',124,1),(1144,'Slowenien','de',125,1),(1145,'Bosnien und Herzegowina','de',126,1),(1146,'Serbien','de',127,1),(1147,'Mazedonien','de',128,1),(1148,'Kongo, Demokratische Republik','de',129,1),(1149,'Belgisch-Kongo','de',130,1),(1150,'Kongo-Freistaat','de',131,1),(1151,'Belgien','de',132,1),(1152,'Kongo, Republik','de',133,1),(1153,'Französisch-Äquatorialafrika','de',134,1),(1154,'Zentralafrikanische Staaten','de',135,1),(1155,'Belize','de',136,1),(1156,'Britisch-Honduras','de',137,1),(1157,'Westafrikanische Staaten','de',138,1),(1158,'Französisch-Westafrika','de',139,1),(1159,'Benin','de',140,1),(1160,'Bhutan','de',141,1),(1161,'Nigeria (Britisch)','de',143,1),(1162,'Biafra','de',144,1),(1163,'Böhmen und Mähren','de',145,1),(1164,'Bolivien','de',146,1),(1165,'Botswana','de',147,1),(1166,'Réunion','de',148,1),(1167,'Brasilien','de',149,1),(1168,'Britisches Antarktis-Territorium','de',150,1),(1169,'Britisches Territorium im Indischen Ozean','de',151,1),(1170,'British West Indies','de',152,1),(1171,'Barbados','de',153,1),(1172,'Guyana','de',154,1),(1173,'Britisch-Guayana','de',155,1),(1174,'Jamaika','de',156,1),(1175,'Trinidad und Tobago','de',157,1),(1176,'Grenada','de',158,1),(1177,'St. Lucia','de',159,1),(1178,'St. Vincent und die Grenadinen','de',160,1),(1179,'Dominica','de',161,1),(1180,'St. Kitts und Nevis','de',162,1),(1181,'Brunei','de',163,1),(1182,'Bulgarien','de',164,1),(1183,'Myanmar','de',165,1),(1184,'Burundi','de',166,1),(1185,'Ruanda','de',167,1),(1186,'Ruanda-Urundi','de',168,1),(1187,'Kambodscha','de',169,1),(1188,'Kamerun','de',170,1),(1189,'Zentralafrikanische Republik','de',171,1),(1190,'Tschad','de',172,1),(1191,'Äquatorialguinea','de',173,1),(1192,'Gabun','de',174,1),(1193,'Kanada','de',175,1),(1194,'Elfenbeinküste','de',176,1),(1195,'Guinea-Bissau','de',177,1),(1196,'Mali','de',178,1),(1197,'Niger','de',179,1),(1198,'Senegal','de',180,1),(1199,'Togo','de',181,1),(1200,'Portugiesisch-Guinea','de',182,1),(1201,'Îles de France et Bourbon','de',183,1),(1202,'Mauritius','de',184,1),(1203,'New Brunswick','de',185,1),(1204,'Neufundland','de',186,1),(1205,'Prince Edward Island','de',187,1),(1206,'Kap Verde','de',188,1),(1207,'Kap Verde (Portugiesisch)','de',189,1),(1208,'Zentralamerikanische Republik','de',190,1),(1209,'Costa Rica','de',191,1),(1210,'Guatemala','de',192,1),(1211,'Honduras','de',193,1),(1212,'Nicaragua','de',194,1),(1213,'El Salvador','de',195,1),(1214,'Buchara','de',196,1),(1215,'Chiwa','de',197,1),(1216,'Sri Lanka','de',198,1),(1217,'Ceylon','de',199,1),(1218,'Chile','de',200,1),(1219,'Färöer','de',201,1),(1220,'Grönland','de',202,1),(1221,'Griechenland','de',203,1),(1222,'China','de',204,1),(1223,'China, Volksrepublik','de',205,1),(1224,'Taiwan','de',206,1),(1225,'Peking (Provisorische Regierung der Republik China)','de',207,1),(1226,'Japan','de',208,1),(1227,'Ost-Hopei ','de',209,1),(1228,'Mandschukuo','de',210,1),(1229,'Mengjiang','de',211,1),(1230,'Nanjing (Neuorganisierte Regierung der Republik China)','de',212,1),(1231,'Kokosinseln','de',213,1),(1232,'Kolumbien','de',214,1),(1233,'Komoren','de',215,1),(1234,'Komoren (Französisch)','de',216,1),(1235,'Neuseeland','de',217,1),(1236,'Cookinseln','de',218,1),(1237,'Kreta','de',219,1),(1238,'Zypern','de',220,1),(1239,'Dänisch-Westindien','de',221,1),(1240,'Danzig','de',222,1),(1241,'Polen','de',223,1),(1242,'Demerara-Essequibo','de',224,1),(1243,'Dschibuti','de',225,1),(1244,'Französisches Afar- und Issa-Territorium','de',226,1),(1245,'Dominikanische Republik','de',227,1),(1246,'Ostafrika','de',228,1),(1247,'Kenia','de',229,1),(1248,'Osttimor','de',230,1),(1249,'Portugiesisch-Timor','de',231,1),(1250,'Ägypten','de',232,1),(1251,'Ecuador','de',233,1),(1252,'Ostkaribische Staaten','de',234,1),(1253,'Eritrea','de',235,1),(1254,'Äthiopien','de',236,1),(1255,'Fidschi','de',237,1),(1256,'Fiji (British)','de',238,1),(1257,'Französisch-Indochina','de',239,1),(1258,'Laos','de',240,1),(1259,'Vietnam','de',241,1),(1260,'Nordvietnam','de',242,1),(1261,'Südvietnam','de',243,1),(1262,'Französische Kolonien','de',244,1),(1263,'Guadeloupe','de',245,1),(1264,'Französisch-Guayana','de',246,1),(1265,'Haiti','de',247,1),(1266,'Martinique','de',248,1),(1267,'Französisch-Polynesien','de',249,1),(1268,'Südkorea','de',250,1),(1269,'Nordkorea','de',251,1),(1270,'Korea','de',252,1),(1271,'Papua-Neuguinea','de',253,1),(1272,'Neuguinea','de',254,1),(1273,'Deutsch-Neuguinea','de',255,1),(1274,'Guinea','de',256,1),(1275,'Hongkong','de',257,1),(1276,'Island','de',258,1),(1277,'Ungarn','de',259,1),(1278,'Indonesien','de',260,1),(1279,'Niederländisch-Ostindien','de',261,1),(1280,'Hawaii','de',262,1),(1281,'Vereinigte Staaten von Amerika','de',263,1),(1282,'Deutsch-Ostafrika','de',264,1),(1283,'Tansania','de',265,1),(1284,'Hedschas','de',266,1),(1285,'Saudiarabien','de',267,1),(1286,'Israel','de',268,1),(1287,'Palästina','de',269,1),(1288,'Iran','de',270,1),(1289,'Irak','de',271,1),(1290,'Somalia','de',272,1),(1291,'Italienisch-Somaliland','de',273,1),(1292,'Italien','de',274,1),(1293,'Somaliland','de',275,1),(1294,'Madeira','de',277,1),(1295,'Jordanien','de',278,1),(1296,'Katanga','de',279,1),(1297,'Kiautschou','de',280,1),(1298,'Kiribati','de',281,1),(1299,'Liechtenstein','de',282,1),(1300,'Kuwait','de',283,1),(1301,'Libanon','de',284,1),(1302,'Lesotho','de',285,1),(1303,'Liberia','de',286,1),(1304,'Libyen','de',287,1),(1305,'Ionische Inseln','de',288,1),(1306,'Luxemburg','de',289,1),(1307,'Macao','de',290,1),(1308,'Madagaskar','de',291,1),(1309,'Madagaskar (Französisch)','de',292,1),(1310,'Malawi','de',293,1),(1311,'Malaysia','de',294,1),(1312,'Malaya','de',295,1),(1313,'Malaya und Britisch-Nordborneo','de',296,1),(1314,'Singapur','de',297,1),(1315,'Straits Settlements','de',298,1),(1316,'Nordborneo','de',299,1),(1317,'Sarawak','de',300,1),(1318,'Kelantan','de',301,1),(1319,'Malakka ','de',302,1),(1320,'Pahang ','de',303,1),(1321,'Trengganu ','de',304,1),(1322,'Penang','de',305,1),(1323,'Spanien','de',306,1),(1324,'Malediven','de',307,1),(1325,'Malta','de',308,1),(1326,'Marshallinseln','de',309,1),(1327,'Mauretanien','de',310,1),(1328,'Mexiko','de',311,1),(1329,'Chihuahua','de',312,1),(1330,'Durango','de',313,1),(1331,'Guerrero','de',314,1),(1332,'Oaxaca','de',315,1),(1333,'Puebla','de',316,1),(1334,'Mombasa','de',317,1),(1335,'Monaco','de',318,1),(1336,'Mongolei','de',319,1),(1337,'Montenegro','de',320,1),(1338,'Marokko','de',321,1),(1339,'Marokko (Französisch)','de',322,1),(1340,'Mosambik','de',323,1),(1341,'Mosambik (Portugiesisch)','de',324,1),(1342,'Bergkarabach','de',325,1),(1343,'Namibia','de',326,1),(1344,'Nauru','de',327,1),(1345,'Nepal','de',328,1),(1346,'Neukaledonien','de',329,1),(1347,'Vanuatu','de',330,1),(1348,'Neue Hebriden','de',331,1),(1349,'Niue','de',332,1),(1350,'Norwegen','de',333,1),(1351,'Oman','de',334,1),(1352,'Osmanisches Reich','de',335,1),(1353,'Türkei','de',336,1),(1354,'Syrien','de',337,1),(1355,'Schweden','de',338,1),(1356,'Palau','de',339,1),(1357,'Panama','de',340,1),(1358,'Paraguay','de',341,1),(1359,'Peru','de',342,1),(1360,'Philippinen','de',343,1),(1361,'Puerto Rico','de',344,1),(1362,'Katar','de',345,1),(1363,'Rhodesien und Njassaland','de',346,1),(1364,'Simbabwe','de',347,1),(1365,'Sambia','de',348,1),(1366,'Südrhodesien','de',349,1),(1367,'Rumänien','de',350,1),(1368,'Armavir','de',351,1),(1369,'Saarland','de',352,1),(1370,'Saint-Pierre und Miquelon','de',353,1),(1371,'Samoa','de',354,1),(1372,'Amerikanisch-Samoa','de',355,1),(1373,'San Marino','de',356,1),(1374,'São Tomé und Príncipe','de',357,1),(1375,'São Tomé und Príncipe (Portugiesisch)','de',358,1),(1376,'Seychellen','de',359,1),(1377,'Salomonen','de',360,1),(1378,'Südafrika','de',361,1),(1379,'Jemen','de',362,1),(1380,'Yemen, Volksdemokratische Republik','de',363,1),(1381,'Südarabische Föderation','de',364,1),(1382,'Jemenitische Arabische Republik','de',365,1),(1383,'Mutawakkilitisches Königreich Jemen','de',366,1),(1384,'Südgeorgien und die Südlichen Sandwichinseln','de',367,1),(1385,'Ametlla del Valles','de',368,1),(1386,'Arahal','de',369,1),(1387,'Arenys De Mar','de',370,1),(1388,'Asturien und Leon','de',371,1),(1389,'Cazalla de la Sierra','de',372,1),(1390,'Gratallops','de',373,1),(1391,'Ibi','de',374,1),(1392,'Lora del Rio','de',375,1),(1393,'Marchena','de',376,1),(1394,'Menorca','de',377,1),(1395,'Nulles','de',378,1),(1396,'Olot','de',379,1),(1397,'Puebla de Cazalla','de',380,1),(1398,'Segarra de Gaia','de',381,1),(1399,'Baskenland','de',382,1),(1400,'Santander, Palencia und Burgos','de',383,1),(1401,'Sudan','de',384,1),(1402,'Suriname','de',385,1),(1403,'Suriname (Niederländisch)','de',386,1),(1404,'Swasiland','de',387,1),(1405,'Sansibar','de',388,1),(1406,'Sahara, Demokratische Arabische Republik ','de',389,1),(1407,'Vatikanstadt','de',390,1),(1408,'Uruguay','de',391,1),(1409,'Venezuela','de',392,1),(1410,'Uganda','de',393,1),(1411,'Tuvalu','de',394,1),(1412,'Tunesien','de',395,1),(1413,'Tunesien (Französisch)','de',396,1),(1414,'Tristan da Cunha','de',397,1),(1415,'Tannu Tuva','de',398,1),(1416,'Thailand','de',399,1),(1417,'Tibet','de',400,1),(1418,'Tokelau','de',401,1),(1419,'Tonga','de',402,1),(1420,'Tonkin ','de',403,1),(1421,'Transnistrien','de',404,1),(1422,'Deutsche Demokratische Republik','de',405,1),(1423,'Cisalpinische Republik','de',406,1),(1424,'Emilia','de',407,1),(1425,'Genua','de',408,1),(1426,'Gorizia','de',409,1),(1427,'Königreich Italien (Napoleon)','de',410,1),(1428,'Lombardo-Venetien','de',411,1),(1429,'Lucca','de',412,1),(1430,'Neapel','de',413,1),(1431,'Kirchenstaat','de',414,1),(1432,'Parma','de',415,1),(1433,'Piemont','de',416,1),(1434,'Römische Republik (1849)','de',417,1),(1435,'Sardinien','de',418,1),(1436,'Sizilien','de',419,1),(1437,'Toskana','de',420,1),(1438,'Königreich beider Sizilien','de',421,1),(1439,'Venedig','de',422,1),(1440,'Anhui','de',423,1),(1441,'Fujian','de',424,1),(1442,'Gansu','de',425,1),(1443,'Guangxi','de',426,1),(1444,'Guangdong','de',427,1),(1445,'Guizhou','de',428,1),(1446,'Henan','de',429,1),(1447,'Hubei','de',430,1),(1448,'Hunan','de',431,1),(1449,'Jiangnan','de',432,1),(1450,'Jiangsu','de',433,1),(1451,'Jiangxi','de',434,1),(1452,'Jilin','de',435,1),(1453,'Liaoning','de',436,1),(1454,'Mandschurei','de',437,1),(1455,'Shandong','de',438,1),(1456,'Sichuan','de',439,1),(1457,'Shaanxi','de',440,1),(1458,'Shanxi','de',441,1),(1459,'Xinjiang','de',442,1),(1460,'Yunnan','de',443,1),(1461,'Zhejiang','de',444,1),(1462,'Zhenjiang','de',445,1),(1463,'Zhili','de',446,1),(1464,'Chinesische Sowjetrepublik','de',447,1),(1465,'Aachen','de',607,1),(1466,'Anhalt-Bernburg','de',608,1),(1467,'Anhalt-Dessau','de',609,1),(1468,'Anhalt-Köthen','de',610,1),(1469,'Anhalt-Zerbst','de',611,1),(1470,'Augsburg','de',612,1),(1471,'Baden','de',613,1),(1472,'Bayern','de',614,1),(1473,'Bentheim-Tecklenburg-Rheda','de',615,1),(1474,'Berg','de',616,1),(1475,'Biberach','de',617,1),(1476,'Birkenfeld','de',618,1),(1477,'Bocholt','de',619,1),(1478,'Brandenburg-Ansbach','de',620,1),(1479,'Brandenburg-Ansbach-Bayreuth','de',621,1),(1480,'Brandenburg-Bayreuth','de',622,1),(1481,'Braunschweig-Blankenburg','de',623,1),(1482,'Braunschweig-Lüneburg-Calenberg-Hannover','de',624,1),(1483,'Braunschweig-Lüneburg-Celle','de',625,1),(1484,'Braunschweig-Wolfenbüttel','de',626,1),(1485,'Bremen','de',627,1),(1486,'Breslau','de',628,1),(1487,'Bretzenheum','de',629,1),(1488,'Buchhorn','de',630,1),(1489,'Kleve','de',631,1),(1490,'Coesfeld','de',632,1),(1491,'Corvey','de',633,1),(1492,'Deutscher Orden','de',634,1),(1493,'Dortmund','de',635,1),(1494,'Eichstadt','de',636,1),(1495,'Einbeck','de',637,1),(1496,'Ellwangen','de',638,1),(1497,'Erfurt','de',639,1),(1498,'Esslingen','de',640,1),(1499,'Frankfurt','de',641,1),(1500,'Fränkischer Reichskreis','de',642,1),(1501,'Freiburg (Breisgau)','de',643,1),(1502,'Freising','de',644,1),(1503,'Friedberg','de',645,1),(1504,'Fulda','de',646,1),(1505,'Fürstenberg-Stuhlingen','de',647,1),(1506,'Goslar','de',648,1),(1507,'Schwäbisch Hall','de',649,1),(1508,'Hamburg','de',650,1),(1509,'Hamm','de',651,1),(1510,'Hanau-Lichtenberg','de',652,1),(1511,'Hanau-Münzenberg','de',653,1),(1512,'Hannover','de',654,1),(1513,'Henneberg','de',655,1),(1514,'Henneberg-Ilmenau','de',656,1),(1515,'Hessen-Darmstadt','de',657,1),(1516,'Hessen-Kassel','de',658,1),(1517,'Hessen-Homburg','de',659,1),(1518,'Hildesheim','de',660,1),(1519,'Hohenlohe-Ingelfingen','de',661,1),(1520,'Hohenlohe-Kirchberg','de',662,1),(1521,'Hohenlohe-Neuenstein-Oehringen','de',663,1),(1522,'Hohenlohe-Pfedelbach','de',664,1),(1523,'Hohenlohe-Waldenburg-Schillingsfürst','de',665,1),(1524,'Hohenzollern-Hechingen','de',666,1),(1525,'Hohenzollern-Sigmaringen','de',667,1),(1526,'Hohenzollern','de',668,1),(1527,'Isenburg','de',669,1),(1528,'Isny','de',670,1),(1529,'Jever','de',671,1),(1530,'Jülich-Berg','de',672,1),(1531,'Kempten','de',673,1),(1532,'Knyphausen','de',674,1),(1533,'Köln','de',675,1),(1534,'Konstanz','de',676,1),(1535,'Lauenburg','de',677,1),(1536,'Leiningen-Dagsburg-Hartenburg','de',678,1),(1537,'Lindau','de',679,1),(1538,'Lindau, Isny, Wangen, Leutkirch','de',680,1),(1539,'Lippe-Detmold','de',681,1),(1540,'Löwenstein-Wertheim-Rochefort','de',682,1),(1541,'Löwenstein-Wertheim-Virneburg','de',683,1),(1542,'Löwenstein-Wertheim-Virneburg und Rochefort','de',684,1),(1543,'Lübeck','de',685,1),(1544,'Lüneburg','de',686,1),(1545,'Mainz','de',687,1),(1546,'Mansfeld-Bornstedt','de',688,1),(1547,'Mansfeld-Eisleben','de',689,1),(1548,'Mecklenburg-Schwerin','de',690,1),(1549,'Mecklenburg-Strelitz','de',691,1),(1550,'Memmingen','de',692,1),(1551,'Montfort','de',693,1),(1552,'Mühlhausen','de',694,1),(1553,'Münster','de',695,1),(1554,'Nassau','de',696,1),(1555,'Nürnberg','de',697,1),(1556,'Oldenburg','de',698,1),(1557,'Osnabrück','de',699,1),(1558,'Ostfriesland','de',700,1),(1559,'Öttingen-Wallenstein-Spielberg','de',701,1),(1560,'Paderborn','de',702,1),(1561,'Passau','de',703,1),(1562,'Pfalz ','de',704,1),(1563,'Pfalz-Birkenfeld-Zweibrücken','de',705,1),(1564,'Pfalz-Neuburg','de',706,1),(1565,'Pfalz-Sulzbach','de',707,1),(1566,'Pommern','de',708,1),(1567,'Preussen','de',709,1),(1568,'Pyrmont','de',710,1),(1569,'Regensburg','de',711,1),(1570,'Reuß-Ebersdorf','de',712,1),(1571,'Reuß-Gera','de',713,1),(1572,'Reuß-Lobenstein','de',714,1),(1573,'Reuß-Lobenstein-Ebersdorf','de',715,1),(1574,'Reuß-Obergreiz','de',716,1),(1575,'Reuß-Schleiz','de',717,1),(1576,'Reuß-Untergreiz','de',718,1),(1577,'Rheinbund','de',719,1),(1578,'Riedtberg','de',720,1),(1579,'Rostock','de',721,1),(1580,'Sachsen','de',722,1),(1581,'Sachsen-Altenburg','de',723,1),(1582,'Sachsen-Coburg und Gotha','de',724,1),(1583,'Sachsen-Coburg-Saalfeld','de',725,1),(1584,'Sachsen-Gotha-Altenburg','de',726,1),(1585,'Sachsen-Eisenach','de',727,1),(1586,'Sachsen-Hennenberg-Schleusing','de',728,1),(1587,'Sachsen-Hildburghausen','de',729,1),(1588,'Sachsen-Meiningen','de',730,1),(1589,'Sachsen-Weimar-Eisenach','de',731,1),(1590,'Salm-Kyrburg','de',732,1),(1591,'Sayn-Altenkirchen','de',733,1),(1592,'Schaumburg-Hessen','de',734,1),(1593,'Schaumburg-Lippe','de',735,1),(1594,'Schlesien','de',736,1),(1595,'Schlesien-Württemberg-Oels','de',737,1),(1596,'Schleswig-Holstein','de',738,1),(1597,'Schmalkalden','de',739,1),(1598,'Schonau','de',740,1),(1599,'Schwarzburg-Rudolstadt','de',741,1),(1600,'Schwarzburg-Sonderhausen','de',742,1),(1601,'Schwarzenberg','de',743,1),(1602,'Schweinfurt','de',744,1),(1603,'Soest','de',745,1),(1604,'Solms-Laubach','de',746,1),(1605,'Speyer','de',747,1),(1606,'Stolberg-Rossla','de',748,1),(1607,'Stolberg-Stolberg','de',749,1),(1608,'Stolberg-Wernigerode','de',750,1),(1609,'Stralsund','de',751,1),(1610,'Strassburg','de',752,1),(1611,'Trier','de',753,1),(1612,'Ulm','de',754,1),(1613,'Vorderösterreich','de',755,1),(1614,'Waldeck','de',756,1),(1615,'Waldeck und Pyrmont','de',757,1),(1616,'Wallmoden-Gimborn','de',758,1),(1617,'Westfalen','de',759,1),(1618,'Wied-Neuwied','de',760,1),(1619,'Wied-Runkel','de',761,1),(1620,'Wismar','de',762,1),(1621,'Württemberg','de',763,1),(1622,'Würzburg','de',764,1),(1623,'Bahawalpur','de',765,1),(1624,'Baroda','de',766,1),(1625,'Bikanir','de',767,1),(1626,'Bundi','de',768,1),(1627,'Cambay','de',769,1),(1628,'Gwalior','de',770,1),(1629,'Hyderabad','de',771,1),(1630,'Elichpur','de',772,1),(1631,'Indore','de',773,1),(1632,'Jaipur','de',774,1),(1633,'Jodhpur','de',775,1),(1634,'Junagadh','de',776,1),(1635,'Kotah','de',777,1),(1636,'Kutch','de',778,1),(1637,'Madras (Präsidentschaft)','de',779,1),(1638,'Mewar','de',780,1),(1639,'Mysore','de',781,1),(1640,'Nawanagar','de',782,1),(1641,'Pudukkottai','de',783,1),(1642,'Saliaina','de',784,1),(1643,'Tonk','de',785,1),(1644,'Travancore','de',786,1),(1645,'Bhaungar','de',787,1),(1646,'Datia','de',788,1),(1647,'Dewas','de',789,1),(1648,'Dungarpur','de',790,1),(1649,'Kishangarh','de',791,1),(1650,'Lunavada','de',792,1),(1651,'Makrai','de',793,1),(1652,'Maler Kotla','de',794,1),(1653,'Patiala','de',795,1),(1654,'Rewa','de',796,1),(1655,'Sailana','de',797,1),(1656,'Sunth','de',798,1),(2047,'United Kingdom','en',7,0),(2048,'St. Helena','en',106,0),(2049,'St. Helena and Ascension','en',44,0),(2050,'Democratic Republic of the Congo','en',129,0),(2051,'Zaire','en',129,0),(2052,'Republic of the Congo (Léopoldville)','en',129,0),(2053,'Dahomey','en',140,0),(2054,'Île Bourbon','en',148,0),(2055,'Isle de Bourbon','en',148,0),(2056,'Îles de France et Bonaparte','en',183,0),(2057,'Isles de France et Bourbon','en',183,0),(2058,'St. Lucia','en',159,0),(2059,'St. Vincent and the Grenadines','en',160,0),(2060,'St. Kitts and Nevis','en',162,0),(2061,'Saint Christopher and Nevis','en',162,0),(2062,'St. Christopher and Nevis','en',162,0),(2063,'Burma','en',165,0),(2064,'Equatorial African States','en',135,0),(2065,'Côte d\'Ivoire','en',176,0),(2066,'People\'s Republic of China','en',205,0),(2067,'Republic of China','en',206,0),(2068,'Provisional Government of China','en',207,0),(2069,'Manchouko','en',210,0),(2070,'Meng Chiang ','en',211,0),(2071,'Mengkiang','en',211,0),(2072,'Reformed Government of the Republic of China','en',212,0),(2073,'Keeling Islands','en',213,0),(2074,'Demarary','en',224,0),(2075,'Essequebo','en',224,0),(2076,'French Territory of the Afars and the Issas','en',226,0),(2077,'Timor-Leste','en',230,0),(2078,'East Caribbean Territories','en',234,0),(2079,'French Cochinchina','en',239,0),(2080,'Cochinchina','en',239,0),(2081,'Democratic Republic of Vietnam','en',242,0),(2082,'Republic of Vietnam','en',243,0),(2083,'French Oceania','en',249,0),(2084,'French Somaliland','en',226,0),(2085,'Korea, Democratic People\'s Republic','en',251,0),(2086,'Democratic People\'s Republic of Korea','en',251,0),(2087,'Korea, Republic','en',250,0),(2088,'Republic of Korea','en',252,0),(2089,'Dutch East Indies','en',261,0),(2090,'USA','en',263,0),(2091,'Persia','en',270,0),(2092,'Mountainous Karabagh','en',325,0),(2093,'Netherlands West Indies','en',103,0),(2094,'Belau','en',339,0),(2095,'Rhodesia','en',347,0),(2096,'St. Pierre and Miquelon','en',353,0),(2097,'Western Samoa','en',354,0),(2098,'People\'s Democratic Republic of Yemen','en',363,0),(2099,'South Yemen','en',363,0),(2100,'North Yemen','en',365,0),(2101,'Euzkadi','en',382,0),(2102,'Western Sahara','en',389,0),(2103,'Tuvan People\'s Republic','en',398,0),(2104,'Siam','en',399,0),(2105,'Pridnestrovie','en',404,0),(2106,'Kingdom of the Two Sicilies','en',421,0),(2107,'Anhwei','en',423,0),(2108,'Fukien','en',424,0),(2109,'Kansu','en',425,0),(2110,'Kwangsi','en',426,0),(2111,'Kwangtung','en',427,0),(2112,'Kweichow','en',428,0),(2113,'Honan','en',429,0),(2114,'Hupeh','en',430,0),(2115,'Kiangnan','en',432,0),(2116,'Kiangsu','en',433,0),(2117,'Kiangsi','en',434,0),(2118,'Kirin','en',435,0),(2119,'Fengtien','en',436,0),(2120,'Shantung','en',438,0),(2121,'Szechuan','en',439,0),(2122,'Shensi','en',440,0),(2123,'Shansi','en',441,0),(2124,'Sinkiang','en',442,0),(2125,'Chekiang','en',444,0),(2126,'Chingkiang','en',445,0),(2127,'Chihli','en',446,0),(2128,'Bayern','en',614,0),(2129,'Cleve','en',631,0),(2130,'Fränkischer Kreis','en',642,0),(2131,'Hall','en',649,0),(2132,'Hessen-Darmstadt','en',657,0),(2133,'Hessen-Kassel','en',658,0),(2134,'Hessen-Homburg','en',659,0),(2135,'Köln','en',675,0),(2136,'Constance','en',676,0),(2137,'Rheinpfalz','en',704,0),(2138,'Pommern','en',708,0),(2139,'Preussen','en',709,0),(2140,'Rheinbund','en',719,0),(2141,'Rhenish Confederation','en',719,0),(2142,'Sachsen','en',722,0),(2143,'Sachsen-Altenburg','en',723,0),(2144,'Sachsen-Coburg und Gotha','en',724,0),(2145,'Sachsen-Coburg-Saalfeld','en',725,0),(2146,'Sachsen-Gotha-Altenburg','en',726,0),(2147,'Sachsen-Eisenach','en',727,0),(2148,'Sachsen-Hennenberg-Schleusing','en',728,0),(2149,'Sachsen-Hildburghausen','en',729,0),(2150,'Sachsen-Meiningen','en',730,0),(2151,'Sachsen-Weimar-Eisenach','en',731,0),(2152,'Schlesien','en',736,0),(2153,'Vorderösterreich','en',755,0),(2154,'Westfalen','en',759,0),(2155,'Vereinigtes Königreich','de',7,0),(2156,'Fribourg','de',18,0),(2157,'British Virgin Islands','de',38,0),(2158,'Kaimaninseln','de',39,0),(2159,'Ajman','de',53,0),(2160,'Fujairah','de',54,0),(2161,'Ras Al Khaimah','de',55,0),(2162,'Sharjah','de',56,0),(2163,'Belarus','de',88,0),(2164,'Demokratische Republik Kongo','de',129,0),(2165,'Republik Kongo','de',133,0),(2166,'Saint Lucia','de',159,0),(2167,'Saint Vincent and the Grenadines','de',160,0),(2168,'Saint Kitts and Nevis','de',162,0),(2169,'Birma','de',165,0),(2170,'Burma','de',165,0),(2171,'Côte d’Ivoire','de',176,0),(2172,'New Foundland','de',186,0),(2173,'Prinz-Edward-Insel','de',187,0),(2174,'Volksrepublik China','de',205,0),(2175,'Keelinginseln ','de',213,0),(2176,'Djibouti','de',225,0),(2177,'Afar- und Issa-Territorium','de',226,0),(2178,'Timor-Leste','de',230,0),(2179,'Fiji','de',237,0),(2180,'Republik Korea','de',250,0),(2181,'Demokratische Volksrepublik Korea','de',251,0),(2182,'USA','de',263,0),(2183,'Mozambique','de',323,0),(2184,'Qatar','de',345,0),(2185,'Zimbabwe','de',347,0),(2186,'Volksdemokratische Republik Jemen','de',363,0),(2187,'Südjemen','de',363,0),(2188,'Arabische Republik Jemen','de',365,0),(2189,'Nordjemen','de',365,0),(2190,'Demokratische Arabische Republik Sahara','de',389,0),(2191,'Westsahara','de',389,0),(2192,'Pridnestrowien','de',404,0),(2193,'Zisalpinische Republik','de',406,0);
/*!40000 ALTER TABLE `territoryname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territoryrelation`
--

DROP TABLE IF EXISTS `territoryrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territoryrelation` (
  `sourceterritory` int(11) NOT NULL,
  `targetterritory` int(11) NOT NULL,
  `relationtype` int(11) NOT NULL,
  PRIMARY KEY (`sourceterritory`,`targetterritory`,`relationtype`),
  KEY `sourceterritory_idx` (`sourceterritory`),
  KEY `targetterritory_idx` (`targetterritory`),
  KEY `relationtype_idx` (`relationtype`),
  CONSTRAINT `sourceterritory` FOREIGN KEY (`sourceterritory`) REFERENCES `territory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `targetterritory` FOREIGN KEY (`targetterritory`) REFERENCES `territory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territoryrelation`
--

LOCK TABLES `territoryrelation` WRITE;
/*!40000 ALTER TABLE `territoryrelation` DISABLE KEYS */;
INSERT INTO `territoryrelation` VALUES (2,405,4),(3,1,1),(5,4,1),(8,7,2),(9,1,1),(10,1,1),(11,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(27,1,1),(28,1,1),(29,1,1),(30,1,1),(31,1,1),(32,1,1),(33,1,1),(35,7,2),(36,7,2),(36,234,6),(37,7,2),(38,7,2),(39,7,2),(40,7,2),(41,7,2),(42,7,2),(42,234,6),(43,7,2),(44,7,2),(45,7,2),(46,7,2),(47,7,1),(48,7,3),(48,63,4),(48,64,4),(48,65,4),(48,67,4),(50,49,5),(53,52,4),(54,52,4),(55,52,4),(56,52,4),(57,52,4),(60,58,4),(60,59,4),(61,62,2),(66,67,4),(69,7,2),(69,35,1),(71,6,3),(71,70,4),(74,73,4),(74,75,3),(76,234,6),(78,77,1),(79,77,1),(80,77,1),(81,77,1),(82,77,1),(84,49,4),(84,83,4),(84,85,4),(84,86,4),(84,87,4),(84,88,4),(84,89,4),(84,92,4),(84,93,4),(84,94,4),(84,95,4),(84,96,4),(84,97,4),(84,98,4),(84,100,4),(99,84,4),(99,100,4),(101,102,1),(102,101,2),(102,103,2),(102,104,2),(103,101,4),(104,102,1),(104,103,4),(105,7,2),(105,44,1),(106,7,2),(106,44,1),(108,107,1),(109,107,1),(110,75,2),(113,7,3),(113,115,4),(113,116,4),(115,114,4),(117,75,3),(117,116,4),(118,6,3),(118,116,4),(119,116,4),(119,120,3),(124,123,4),(124,125,4),(124,127,4),(124,128,4),(127,124,4),(130,129,4),(130,132,3),(131,129,4),(131,130,4),(133,135,6),(134,6,3),(134,133,4),(134,135,4),(137,7,3),(137,136,4),(139,6,3),(139,138,4),(139,140,4),(140,138,6),(143,7,3),(143,65,4),(144,65,5),(145,2,7),(145,58,4),(145,60,4),(148,6,2),(150,7,2),(151,7,2),(152,7,3),(152,36,4),(152,38,4),(152,39,4),(152,42,4),(152,45,4),(152,76,4),(152,111,4),(152,137,4),(152,153,4),(152,155,4),(152,156,4),(152,157,4),(152,158,4),(152,159,4),(152,160,4),(152,161,4),(152,162,4),(152,234,4),(155,7,3),(155,154,4),(158,234,6),(159,234,6),(160,234,6),(161,234,6),(162,7,2),(162,234,6),(168,166,4),(168,167,4),(170,135,6),(171,135,6),(172,135,6),(173,135,6),(174,135,6),(176,138,6),(177,138,6),(178,138,6),(179,138,6),(180,138,6),(181,138,6),(182,75,3),(182,177,4),(183,6,3),(183,148,4),(183,184,4),(185,169,1),(186,169,1),(187,169,1),(189,75,3),(189,188,4),(190,191,4),(190,192,4),(190,193,4),(190,194,4),(190,195,4),(196,98,4),(197,98,4),(199,7,3),(199,198,4),(201,120,2),(202,120,2),(204,205,4),(204,206,4),(207,204,1),(207,208,7),(209,204,1),(209,208,7),(210,204,1),(210,208,7),(211,204,1),(211,208,7),(212,204,1),(212,208,7),(213,107,2),(216,6,3),(216,215,4),(218,217,2),(219,203,4),(221,120,3),(222,2,1),(222,223,4),(224,154,4),(224,155,4),(226,6,3),(226,225,4),(228,7,3),(228,229,4),(231,75,3),(231,230,4),(238,7,3),(238,237,4),(239,6,3),(239,169,4),(239,240,4),(239,241,4),(239,242,4),(239,243,4),(242,241,4),(243,241,4),(244,245,4),(244,246,4),(244,247,4),(244,248,4),(245,6,2),(246,6,2),(248,6,2),(249,6,2),(252,250,4),(252,251,4),(254,7,3),(254,253,4),(255,2,3),(255,253,4),(255,254,4),(257,7,3),(257,205,2),(261,102,3),(261,260,4),(262,263,4),(264,2,3),(264,166,4),(264,167,4),(264,265,4),(266,267,4),(269,268,4),(273,272,4),(273,274,3),(275,272,5),(277,75,2),(279,129,4),(280,2,3),(280,204,1),(288,7,3),(288,203,4),(290,75,3),(290,205,2),(292,6,3),(292,291,4),(295,7,3),(295,294,4),(295,296,4),(296,7,3),(296,294,4),(298,7,3),(298,294,4),(298,295,4),(298,297,4),(299,7,3),(299,294,4),(300,7,3),(300,294,4),(301,294,1),(302,294,1),(303,294,1),(304,294,1),(305,294,1),(312,311,1),(313,311,1),(314,311,1),(315,311,1),(316,311,1),(317,7,3),(317,228,4),(317,229,4),(320,124,4),(322,6,3),(322,321,4),(324,75,3),(324,323,4),(325,88,5),(329,6,2),(331,6,3),(331,7,3),(331,330,4),(332,217,2),(335,269,4),(335,271,4),(335,278,4),(335,284,4),(335,336,4),(344,306,3),(346,7,3),(346,293,4),(349,7,3),(349,346,4),(349,347,4),(351,100,1),(352,2,4),(352,6,2),(353,6,2),(355,263,2),(358,75,3),(358,357,4),(363,362,4),(364,363,4),(365,362,4),(366,362,4),(366,365,4),(367,7,2),(368,306,1),(369,306,1),(370,306,1),(371,306,1),(372,306,1),(373,306,1),(374,306,1),(375,306,4),(376,306,1),(377,306,1),(378,306,1),(379,306,1),(380,306,1),(381,306,1),(382,306,1),(383,306,1),(386,102,3),(386,385,4),(388,265,4),(396,6,3),(396,395,4),(397,7,2),(398,100,1),(400,204,1),(400,205,4),(401,217,2),(403,241,4),(403,242,4),(404,94,5),(405,2,4),(406,274,4),(407,274,4),(408,274,4),(409,274,4),(410,274,4),(411,274,4),(412,274,4),(413,274,4),(413,421,4),(414,274,4),(414,390,4),(414,417,4),(415,274,4),(416,274,4),(417,274,4),(417,414,4),(418,274,4),(419,274,4),(419,421,4),(420,274,4),(421,274,4),(422,274,4),(423,204,1),(424,204,1),(425,204,1),(426,204,1),(427,204,1),(429,204,1),(430,204,1),(431,204,1),(432,204,1),(433,204,1),(434,204,1),(435,172,1),(436,204,1),(437,204,1),(437,210,4),(438,204,1),(439,204,1),(440,204,1),(441,204,1),(442,204,1),(443,204,1),(444,204,1),(445,204,1),(446,204,1),(447,205,4),(607,2,1),(608,2,1),(609,2,1),(610,2,1),(611,2,1),(612,2,1),(613,2,1),(614,2,1),(615,2,1),(616,2,1),(617,2,1),(618,2,1),(619,2,1),(620,2,1),(621,2,1),(622,2,1),(623,2,1),(624,2,1),(625,2,1),(626,2,1),(627,2,1),(628,2,1),(629,2,1),(630,2,1),(631,2,1),(632,2,1),(633,2,1),(634,2,1),(635,2,1),(636,2,1),(637,2,1),(638,2,1),(639,2,1),(640,2,1),(641,2,1),(642,2,1),(643,2,1),(644,2,1),(645,2,1),(646,2,1),(647,2,1),(648,2,1),(649,2,1),(650,2,1),(651,2,1),(652,2,1),(653,2,1),(654,2,1),(655,2,1),(656,2,1),(657,2,1),(658,2,1),(659,2,1),(660,2,1),(661,2,1),(662,2,1),(663,2,1),(664,2,1),(665,2,1),(666,2,1),(667,2,1),(668,2,1),(669,2,1),(670,2,1),(671,2,1),(672,2,1),(673,2,1),(674,2,1),(675,2,1),(676,2,1),(677,2,1),(678,2,1),(679,2,1),(680,2,1),(681,2,1),(682,2,1),(683,2,1),(684,2,1),(685,2,1),(686,2,1),(687,2,1),(688,2,1),(689,2,1),(690,2,1),(691,2,1),(692,2,1),(693,2,1),(694,2,1),(695,2,1),(696,2,1),(697,2,1),(698,2,1),(699,2,1),(700,2,1),(701,2,1),(702,2,1),(703,2,1),(704,2,1),(705,2,1),(706,2,1),(707,2,1),(708,2,1),(709,2,1),(710,2,1),(711,2,1),(712,2,1),(713,2,1),(714,2,1),(715,2,1),(716,2,1),(717,2,1),(718,2,1),(719,2,1),(720,2,1),(721,2,1),(722,2,1),(723,2,1),(724,2,1),(725,2,1),(726,2,1),(727,2,1),(728,2,1),(729,2,1),(730,2,1),(731,2,1),(732,2,1),(733,2,1),(734,2,1),(735,2,1),(736,2,1),(737,2,1),(738,2,1),(739,2,1),(740,2,1),(741,2,1),(742,2,1),(743,2,1),(744,2,1),(745,2,1),(746,2,1),(747,2,1),(748,2,1),(749,2,1),(750,2,1),(751,2,1),(752,2,1),(753,2,1),(754,2,1),(755,2,1),(756,2,1),(757,2,1),(758,2,1),(759,2,1),(760,2,1),(761,2,1),(762,2,1),(763,2,1),(764,2,1),(765,116,1),(766,116,1),(767,116,1),(768,116,1),(769,116,1),(770,116,1),(771,116,1),(772,116,1),(773,116,1),(774,116,1),(775,116,1),(776,116,1),(777,116,1),(778,116,1),(779,116,1),(780,116,1),(781,116,1),(782,116,1),(783,116,1),(784,116,1),(785,116,1),(786,116,1),(787,116,1),(788,116,1),(789,116,1),(790,116,1),(791,116,1),(792,116,1),(793,116,1),(794,116,1),(795,116,1),(796,116,1),(797,116,1),(798,116,1);
/*!40000 ALTER TABLE `territoryrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `territoryview`
--

DROP TABLE IF EXISTS `territoryview`;
/*!50001 DROP VIEW IF EXISTS `territoryview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `territoryview` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `language` tinyint NOT NULL,
  `iso3166` tinyint NOT NULL,
  `toplevel` tinyint NOT NULL,
  `primary` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar` int(11) NOT NULL,
  `value1` int(4) NOT NULL,
  `value2` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,3,NULL),(4,1,4,NULL),(5,1,5,NULL),(6,1,6,NULL),(7,1,7,NULL),(8,1,8,NULL),(9,1,9,NULL),(10,1,10,NULL),(11,1,11,NULL),(12,1,12,NULL),(13,1,13,NULL),(14,1,14,NULL),(15,1,15,NULL),(16,1,16,NULL),(17,1,17,NULL),(18,1,18,NULL),(19,1,19,NULL),(20,1,20,NULL),(21,1,21,NULL),(22,1,22,NULL),(23,1,23,NULL),(24,1,24,NULL),(25,1,25,NULL),(26,1,26,NULL),(27,1,27,NULL),(28,1,28,NULL),(29,1,29,NULL),(30,1,30,NULL),(31,1,31,NULL),(32,1,32,NULL),(33,1,33,NULL),(34,1,34,NULL),(35,1,35,NULL),(36,1,36,NULL),(37,1,37,NULL),(38,1,38,NULL),(39,1,39,NULL),(40,1,40,NULL),(41,1,41,NULL),(42,1,42,NULL),(43,1,43,NULL),(44,1,44,NULL),(45,1,45,NULL),(46,1,46,NULL),(47,1,47,NULL),(48,1,48,NULL),(49,1,49,NULL),(50,1,50,NULL),(51,1,51,NULL),(52,1,52,NULL),(53,1,53,NULL),(54,1,54,NULL),(55,1,55,NULL),(56,1,56,NULL),(57,1,57,NULL),(58,1,58,NULL),(59,1,59,NULL),(60,1,60,NULL),(61,1,61,NULL),(62,1,62,NULL),(63,1,63,NULL),(64,1,64,NULL),(65,1,65,NULL),(66,1,66,NULL),(67,1,67,NULL),(68,1,68,NULL),(69,1,69,NULL),(70,1,70,NULL),(71,1,71,NULL),(72,1,72,NULL),(73,1,73,NULL),(74,1,74,NULL),(75,1,75,NULL),(76,1,76,NULL),(77,1,77,NULL),(78,1,78,NULL),(79,1,79,NULL),(80,1,80,NULL),(81,1,81,NULL),(82,1,82,NULL),(83,1,83,NULL),(84,1,84,NULL),(85,1,85,NULL),(86,1,86,NULL),(87,1,87,NULL),(88,1,88,NULL),(89,1,89,NULL),(90,1,90,NULL),(91,1,91,NULL),(92,1,92,NULL),(93,1,93,NULL),(94,1,94,NULL),(95,1,95,NULL),(96,1,96,NULL),(97,1,97,NULL),(98,1,98,NULL),(99,1,99,NULL),(100,1,100,NULL),(101,1,101,NULL),(102,1,102,NULL),(103,1,103,NULL),(104,1,104,NULL),(105,1,105,NULL),(106,1,106,NULL),(107,1,107,NULL),(108,1,108,NULL),(109,1,109,NULL),(110,1,110,NULL),(111,1,111,NULL),(112,1,112,NULL),(113,1,113,NULL),(114,1,114,NULL),(115,1,115,NULL),(116,1,116,NULL),(117,1,117,NULL),(118,1,118,NULL),(119,1,119,NULL),(120,1,120,NULL),(121,1,121,NULL),(122,1,122,NULL),(123,1,123,NULL),(124,1,124,NULL),(125,1,125,NULL),(126,1,126,NULL),(127,1,127,NULL),(128,1,128,NULL),(129,1,129,NULL),(130,1,130,NULL),(131,1,131,NULL),(132,1,132,NULL),(133,1,133,NULL),(134,1,134,NULL),(135,1,135,NULL),(136,1,136,NULL),(137,1,137,NULL),(138,1,138,NULL),(139,1,139,NULL),(140,1,140,NULL),(141,1,141,NULL),(142,1,142,NULL),(143,1,143,NULL),(144,1,144,NULL),(145,1,145,NULL),(146,1,146,NULL),(147,1,147,NULL),(148,1,148,NULL),(149,1,149,NULL),(150,1,150,NULL),(151,1,151,NULL),(152,1,152,NULL),(153,1,153,NULL),(154,1,154,NULL),(155,1,155,NULL),(156,1,156,NULL),(157,1,157,NULL),(158,1,158,NULL),(159,1,159,NULL),(160,1,160,NULL),(161,1,161,NULL),(162,1,162,NULL),(163,1,163,NULL),(164,1,164,NULL),(165,1,165,NULL),(166,1,166,NULL),(167,1,167,NULL),(168,1,168,NULL),(169,1,169,NULL),(170,1,170,NULL),(171,1,171,NULL),(172,1,172,NULL),(173,1,173,NULL),(174,1,174,NULL),(175,1,175,NULL),(176,1,176,NULL),(177,1,177,NULL),(178,1,178,NULL),(179,1,179,NULL),(180,1,180,NULL),(181,1,181,NULL),(182,1,182,NULL),(183,1,183,NULL),(184,1,184,NULL),(185,1,185,NULL),(186,1,186,NULL),(187,1,187,NULL),(188,1,188,NULL),(189,1,189,NULL),(190,1,190,NULL),(191,1,191,NULL),(192,1,192,NULL),(193,1,193,NULL),(194,1,194,NULL),(195,1,195,NULL),(196,1,196,NULL),(197,1,197,NULL),(198,1,198,NULL),(199,1,199,NULL),(200,1,200,NULL),(201,1,201,NULL),(202,1,202,NULL),(203,1,203,NULL),(204,1,204,NULL),(205,1,205,NULL),(206,1,206,NULL),(207,1,207,NULL),(208,1,208,NULL),(209,1,209,NULL),(210,1,210,NULL),(211,1,211,NULL),(212,1,212,NULL),(213,1,213,NULL),(214,1,214,NULL),(215,1,215,NULL),(216,1,216,NULL),(217,1,217,NULL),(218,1,218,NULL),(219,1,219,NULL),(220,1,220,NULL),(221,1,221,NULL),(222,1,222,NULL),(223,1,223,NULL),(224,1,224,NULL),(225,1,225,NULL),(226,1,226,NULL),(227,1,227,NULL),(228,1,228,NULL),(229,1,229,NULL),(230,1,230,NULL),(231,1,231,NULL),(232,1,232,NULL),(233,1,233,NULL),(234,1,234,NULL),(235,1,235,NULL),(236,1,236,NULL),(237,1,237,NULL),(238,1,238,NULL),(239,1,239,NULL),(240,1,240,NULL),(241,1,241,NULL),(242,1,242,NULL),(243,1,243,NULL),(244,1,244,NULL),(245,1,245,NULL),(246,1,246,NULL),(247,1,247,NULL),(248,1,248,NULL),(249,1,249,NULL),(250,1,250,NULL),(251,1,251,NULL),(252,1,252,NULL),(253,1,253,NULL),(254,1,254,NULL),(255,1,255,NULL),(256,1,256,NULL),(257,1,257,NULL),(258,1,258,NULL),(259,1,259,NULL),(260,1,260,NULL),(261,1,261,NULL),(262,1,262,NULL),(263,1,263,NULL),(264,1,264,NULL),(265,1,265,NULL),(266,1,266,NULL),(267,1,267,NULL),(268,1,268,NULL),(269,1,269,NULL),(270,1,270,NULL),(271,1,271,NULL),(272,1,272,NULL),(273,1,273,NULL),(274,1,274,NULL),(275,1,275,NULL),(276,1,276,NULL),(277,1,277,NULL),(278,1,278,NULL),(279,1,279,NULL),(280,1,280,NULL),(281,1,281,NULL),(282,1,282,NULL),(283,1,283,NULL),(284,1,284,NULL),(285,1,285,NULL),(286,1,286,NULL),(287,1,287,NULL),(288,1,288,NULL),(289,1,289,NULL),(290,1,290,NULL),(291,1,291,NULL),(292,1,292,NULL),(293,1,293,NULL),(294,1,294,NULL),(295,1,295,NULL),(296,1,296,NULL),(297,1,297,NULL),(298,1,298,NULL),(299,1,299,NULL),(300,1,300,NULL),(301,1,301,NULL),(302,1,302,NULL),(303,1,303,NULL),(304,1,304,NULL),(305,1,305,NULL),(306,1,306,NULL),(307,1,307,NULL),(308,1,308,NULL),(309,1,309,NULL),(310,1,310,NULL),(311,1,311,NULL),(312,1,312,NULL),(313,1,313,NULL),(314,1,314,NULL),(315,1,315,NULL),(316,1,316,NULL),(317,1,317,NULL),(318,1,318,NULL),(319,1,319,NULL),(320,1,320,NULL),(321,1,321,NULL),(322,1,322,NULL),(323,1,323,NULL),(324,1,324,NULL),(325,1,325,NULL),(326,1,326,NULL),(327,1,327,NULL),(328,1,328,NULL),(329,1,329,NULL),(330,1,330,NULL),(331,1,331,NULL),(332,1,332,NULL),(333,1,333,NULL),(334,1,334,NULL),(335,1,335,NULL),(336,1,336,NULL),(337,1,337,NULL),(338,1,338,NULL),(339,1,339,NULL),(340,1,340,NULL),(341,1,341,NULL),(342,1,342,NULL),(343,1,343,NULL),(344,1,344,NULL),(345,1,345,NULL),(346,1,346,NULL),(347,1,347,NULL),(348,1,348,NULL),(349,1,349,NULL),(350,1,350,NULL),(351,1,351,NULL),(352,1,352,NULL),(353,1,353,NULL),(354,1,354,NULL),(355,1,355,NULL),(356,1,356,NULL),(357,1,357,NULL),(358,1,358,NULL),(359,1,359,NULL),(360,1,360,NULL),(361,1,361,NULL),(362,1,362,NULL),(363,1,363,NULL),(364,1,364,NULL),(365,1,365,NULL),(366,1,366,NULL),(367,1,367,NULL),(368,1,368,NULL),(369,1,369,NULL),(370,1,370,NULL),(371,1,371,NULL),(372,1,372,NULL),(373,1,373,NULL),(374,1,374,NULL),(375,1,375,NULL),(376,1,376,NULL),(377,1,377,NULL),(378,1,378,NULL),(379,1,379,NULL),(380,1,380,NULL),(381,1,381,NULL),(382,1,382,NULL),(383,1,383,NULL),(384,1,384,NULL),(385,1,385,NULL),(386,1,386,NULL),(387,1,387,NULL),(388,1,388,NULL),(389,1,389,NULL),(390,1,390,NULL),(391,1,391,NULL),(392,1,392,NULL),(393,1,393,NULL),(394,1,394,NULL),(395,1,395,NULL),(396,1,396,NULL),(397,1,397,NULL),(398,1,398,NULL),(399,1,399,NULL),(400,1,400,NULL),(401,1,401,NULL),(402,1,402,NULL),(403,1,403,NULL),(404,1,404,NULL),(405,1,405,NULL),(406,1,406,NULL),(407,1,407,NULL),(408,1,408,NULL),(409,1,409,NULL),(410,1,410,NULL),(411,1,411,NULL),(412,1,412,NULL),(413,1,413,NULL),(414,1,414,NULL),(415,1,415,NULL),(416,1,416,NULL),(417,1,417,NULL),(418,1,418,NULL),(419,1,419,NULL),(420,1,420,NULL),(421,1,421,NULL),(422,1,422,NULL),(423,1,423,NULL),(424,1,424,NULL),(425,1,425,NULL),(426,1,426,NULL),(427,1,427,NULL),(428,1,428,NULL),(429,1,429,NULL),(430,1,430,NULL),(431,1,431,NULL),(432,1,432,NULL),(433,1,433,NULL),(434,1,434,NULL),(435,1,435,NULL),(436,1,436,NULL),(437,1,437,NULL),(438,1,438,NULL),(439,1,439,NULL),(440,1,440,NULL),(441,1,441,NULL),(442,1,442,NULL),(443,1,443,NULL),(444,1,444,NULL),(445,1,445,NULL),(446,1,446,NULL),(447,1,447,NULL),(448,1,448,NULL),(449,1,449,NULL),(450,1,450,NULL),(451,1,451,NULL),(452,1,452,NULL),(453,1,453,NULL),(454,1,454,NULL),(455,1,455,NULL),(456,1,456,NULL),(457,1,457,NULL),(458,1,458,NULL),(459,1,459,NULL),(460,1,460,NULL),(461,1,461,NULL),(462,1,462,NULL),(463,1,463,NULL),(464,1,464,NULL),(465,1,465,NULL),(466,1,466,NULL),(467,1,467,NULL),(468,1,468,NULL),(469,1,469,NULL),(470,1,470,NULL),(471,1,471,NULL),(472,1,472,NULL),(473,1,473,NULL),(474,1,474,NULL),(475,1,475,NULL),(476,1,476,NULL),(477,1,477,NULL),(478,1,478,NULL),(479,1,479,NULL),(480,1,480,NULL),(481,1,481,NULL),(482,1,482,NULL),(483,1,483,NULL),(484,1,484,NULL),(485,1,485,NULL),(486,1,486,NULL),(487,1,487,NULL),(488,1,488,NULL),(489,1,489,NULL),(490,1,490,NULL),(491,1,491,NULL),(492,1,492,NULL),(493,1,493,NULL),(494,1,494,NULL),(495,1,495,NULL),(496,1,496,NULL),(497,1,497,NULL),(498,1,498,NULL),(499,1,499,NULL),(500,1,500,NULL),(501,1,501,NULL),(502,1,502,NULL),(503,1,503,NULL),(504,1,504,NULL),(505,1,505,NULL),(506,1,506,NULL),(507,1,507,NULL),(508,1,508,NULL),(509,1,509,NULL),(510,1,510,NULL),(511,1,511,NULL),(512,1,512,NULL),(513,1,513,NULL),(514,1,514,NULL),(515,1,515,NULL),(516,1,516,NULL),(517,1,517,NULL),(518,1,518,NULL),(519,1,519,NULL),(520,1,520,NULL),(521,1,521,NULL),(522,1,522,NULL),(523,1,523,NULL),(524,1,524,NULL),(525,1,525,NULL),(526,1,526,NULL),(527,1,527,NULL),(528,1,528,NULL),(529,1,529,NULL),(530,1,530,NULL),(531,1,531,NULL),(532,1,532,NULL),(533,1,533,NULL),(534,1,534,NULL),(535,1,535,NULL),(536,1,536,NULL),(537,1,537,NULL),(538,1,538,NULL),(539,1,539,NULL),(540,1,540,NULL),(541,1,541,NULL),(542,1,542,NULL),(543,1,543,NULL),(544,1,544,NULL),(545,1,545,NULL),(546,1,546,NULL),(547,1,547,NULL),(548,1,548,NULL),(549,1,549,NULL),(550,1,550,NULL),(551,1,551,NULL),(552,1,552,NULL),(553,1,553,NULL),(554,1,554,NULL),(555,1,555,NULL),(556,1,556,NULL),(557,1,557,NULL),(558,1,558,NULL),(559,1,559,NULL),(560,1,560,NULL),(561,1,561,NULL),(562,1,562,NULL),(563,1,563,NULL),(564,1,564,NULL),(565,1,565,NULL),(566,1,566,NULL),(567,1,567,NULL),(568,1,568,NULL),(569,1,569,NULL),(570,1,570,NULL),(571,1,571,NULL),(572,1,572,NULL),(573,1,573,NULL),(574,1,574,NULL),(575,1,575,NULL),(576,1,576,NULL),(577,1,577,NULL),(578,1,578,NULL),(579,1,579,NULL),(580,1,580,NULL),(581,1,581,NULL),(582,1,582,NULL),(583,1,583,NULL),(584,1,584,NULL),(585,1,585,NULL),(586,1,586,NULL),(587,1,587,NULL),(588,1,588,NULL),(589,1,589,NULL),(590,1,590,NULL),(591,1,591,NULL),(592,1,592,NULL),(593,1,593,NULL),(594,1,594,NULL),(595,1,595,NULL),(596,1,596,NULL),(597,1,597,NULL),(598,1,598,NULL),(599,1,599,NULL),(600,1,600,NULL),(601,1,601,NULL),(602,1,602,NULL),(603,1,603,NULL),(604,1,604,NULL),(605,1,605,NULL),(606,1,606,NULL),(607,1,607,NULL),(608,1,608,NULL),(609,1,609,NULL),(610,1,610,NULL),(611,1,611,NULL),(612,1,612,NULL),(613,1,613,NULL),(614,1,614,NULL),(615,1,615,NULL),(616,1,616,NULL),(617,1,617,NULL),(618,1,618,NULL),(619,1,619,NULL),(620,1,620,NULL),(621,1,621,NULL),(622,1,622,NULL),(623,1,623,NULL),(624,1,624,NULL),(625,1,625,NULL),(626,1,626,NULL),(627,1,627,NULL),(628,1,628,NULL),(629,1,629,NULL),(630,1,630,NULL),(631,1,631,NULL),(632,1,632,NULL),(633,1,633,NULL),(634,1,634,NULL),(635,1,635,NULL),(636,1,636,NULL),(637,1,637,NULL),(638,1,638,NULL),(639,1,639,NULL),(640,1,640,NULL),(641,1,641,NULL),(642,1,642,NULL),(643,1,643,NULL),(644,1,644,NULL),(645,1,645,NULL),(646,1,646,NULL),(647,1,647,NULL),(648,1,648,NULL),(649,1,649,NULL),(650,1,650,NULL),(651,1,651,NULL),(652,1,652,NULL),(653,1,653,NULL),(654,1,654,NULL),(655,1,655,NULL),(656,1,656,NULL),(657,1,657,NULL),(658,1,658,NULL),(659,1,659,NULL),(660,1,660,NULL),(661,1,661,NULL),(662,1,662,NULL),(663,1,663,NULL),(664,1,664,NULL),(665,1,665,NULL),(666,1,666,NULL),(667,1,667,NULL),(668,1,668,NULL),(669,1,669,NULL),(670,1,670,NULL),(671,1,671,NULL),(672,1,672,NULL),(673,1,673,NULL),(674,1,674,NULL),(675,1,675,NULL),(676,1,676,NULL),(677,1,677,NULL),(678,1,678,NULL),(679,1,679,NULL),(680,1,680,NULL),(681,1,681,NULL),(682,1,682,NULL),(683,1,683,NULL),(684,1,684,NULL),(685,1,685,NULL),(686,1,686,NULL),(687,1,687,NULL),(688,1,688,NULL),(689,1,689,NULL),(690,1,690,NULL),(691,1,691,NULL),(692,1,692,NULL),(693,1,693,NULL),(694,1,694,NULL),(695,1,695,NULL),(696,1,696,NULL),(697,1,697,NULL),(698,1,698,NULL),(699,1,699,NULL),(700,1,700,NULL),(701,1,701,NULL),(702,1,702,NULL),(703,1,703,NULL),(704,1,704,NULL),(705,1,705,NULL),(706,1,706,NULL),(707,1,707,NULL),(708,1,708,NULL),(709,1,709,NULL),(710,1,710,NULL),(711,1,711,NULL),(712,1,712,NULL),(713,1,713,NULL),(714,1,714,NULL),(715,1,715,NULL),(716,1,716,NULL),(717,1,717,NULL),(718,1,718,NULL),(719,1,719,NULL),(720,1,720,NULL),(721,1,721,NULL),(722,1,722,NULL),(723,1,723,NULL),(724,1,724,NULL),(725,1,725,NULL),(726,1,726,NULL),(727,1,727,NULL),(728,1,728,NULL),(729,1,729,NULL),(730,1,730,NULL),(731,1,731,NULL),(732,1,732,NULL),(733,1,733,NULL),(734,1,734,NULL),(735,1,735,NULL),(736,1,736,NULL),(737,1,737,NULL),(738,1,738,NULL),(739,1,739,NULL),(740,1,740,NULL),(741,1,741,NULL),(742,1,742,NULL),(743,1,743,NULL),(744,1,744,NULL),(745,1,745,NULL),(746,1,746,NULL),(747,1,747,NULL),(748,1,748,NULL),(749,1,749,NULL),(750,1,750,NULL),(751,1,751,NULL),(752,1,752,NULL),(753,1,753,NULL),(754,1,754,NULL),(755,1,755,NULL),(756,1,756,NULL),(757,1,757,NULL),(758,1,758,NULL),(759,1,759,NULL),(760,1,760,NULL),(761,1,761,NULL),(762,1,762,NULL),(763,1,763,NULL),(764,1,764,NULL),(765,1,765,NULL),(766,1,766,NULL),(767,1,767,NULL),(768,1,768,NULL),(769,1,769,NULL),(770,1,770,NULL),(771,1,771,NULL),(772,1,772,NULL),(773,1,773,NULL),(774,1,774,NULL),(775,1,775,NULL),(776,1,776,NULL),(777,1,777,NULL),(778,1,778,NULL),(779,1,779,NULL),(780,1,780,NULL),(781,1,781,NULL),(782,1,782,NULL),(783,1,783,NULL),(784,1,784,NULL),(785,1,785,NULL),(786,1,786,NULL),(787,1,787,NULL),(788,1,788,NULL),(789,1,789,NULL),(790,1,790,NULL),(791,1,791,NULL),(792,1,792,NULL),(793,1,793,NULL),(794,1,794,NULL),(795,1,795,NULL),(796,1,796,NULL),(797,1,797,NULL),(798,1,798,NULL),(799,1,799,NULL),(800,1,800,NULL),(801,1,801,NULL),(802,1,802,NULL),(803,1,803,NULL),(804,1,804,NULL),(805,1,805,NULL),(806,1,806,NULL),(807,1,807,NULL),(808,1,808,NULL),(809,1,809,NULL),(810,1,810,NULL),(811,1,811,NULL),(812,1,812,NULL),(813,1,813,NULL),(814,1,814,NULL),(815,1,815,NULL),(816,1,816,NULL),(817,1,817,NULL),(818,1,818,NULL),(819,1,819,NULL),(820,1,820,NULL),(821,1,821,NULL),(822,1,822,NULL),(823,1,823,NULL),(824,1,824,NULL),(825,1,825,NULL),(826,1,826,NULL),(827,1,827,NULL),(828,1,828,NULL),(829,1,829,NULL),(830,1,830,NULL),(831,1,831,NULL),(832,1,832,NULL),(833,1,833,NULL),(834,1,834,NULL),(835,1,835,NULL),(836,1,836,NULL),(837,1,837,NULL),(838,1,838,NULL),(839,1,839,NULL),(840,1,840,NULL),(841,1,841,NULL),(842,1,842,NULL),(843,1,843,NULL),(844,1,844,NULL),(845,1,845,NULL),(846,1,846,NULL),(847,1,847,NULL),(848,1,848,NULL),(849,1,849,NULL),(850,1,850,NULL),(851,1,851,NULL),(852,1,852,NULL),(853,1,853,NULL),(854,1,854,NULL),(855,1,855,NULL),(856,1,856,NULL),(857,1,857,NULL),(858,1,858,NULL),(859,1,859,NULL),(860,1,860,NULL),(861,1,861,NULL),(862,1,862,NULL),(863,1,863,NULL),(864,1,864,NULL),(865,1,865,NULL),(866,1,866,NULL),(867,1,867,NULL),(868,1,868,NULL),(869,1,869,NULL),(870,1,870,NULL),(871,1,871,NULL),(872,1,872,NULL),(873,1,873,NULL),(874,1,874,NULL),(875,1,875,NULL),(876,1,876,NULL),(877,1,877,NULL),(878,1,878,NULL),(879,1,879,NULL),(880,1,880,NULL),(881,1,881,NULL),(882,1,882,NULL),(883,1,883,NULL),(884,1,884,NULL),(885,1,885,NULL),(886,1,886,NULL),(887,1,887,NULL),(888,1,888,NULL),(889,1,889,NULL),(890,1,890,NULL),(891,1,891,NULL),(892,1,892,NULL),(893,1,893,NULL),(894,1,894,NULL),(895,1,895,NULL),(896,1,896,NULL),(897,1,897,NULL),(898,1,898,NULL),(899,1,899,NULL),(900,1,900,NULL),(901,1,901,NULL),(902,1,902,NULL),(903,1,903,NULL),(904,1,904,NULL),(905,1,905,NULL),(906,1,906,NULL),(907,1,907,NULL),(908,1,908,NULL),(909,1,909,NULL),(910,1,910,NULL),(911,1,911,NULL),(912,1,912,NULL),(913,1,913,NULL),(914,1,914,NULL),(915,1,915,NULL),(916,1,916,NULL),(917,1,917,NULL),(918,1,918,NULL),(919,1,919,NULL),(920,1,920,NULL),(921,1,921,NULL),(922,1,922,NULL),(923,1,923,NULL),(924,1,924,NULL),(925,1,925,NULL),(926,1,926,NULL),(927,1,927,NULL),(928,1,928,NULL),(929,1,929,NULL),(930,1,930,NULL),(931,1,931,NULL),(932,1,932,NULL),(933,1,933,NULL),(934,1,934,NULL),(935,1,935,NULL),(936,1,936,NULL),(937,1,937,NULL),(938,1,938,NULL),(939,1,939,NULL),(940,1,940,NULL),(941,1,941,NULL),(942,1,942,NULL),(943,1,943,NULL),(944,1,944,NULL),(945,1,945,NULL),(946,1,946,NULL),(947,1,947,NULL),(948,1,948,NULL),(949,1,949,NULL),(950,1,950,NULL),(951,1,951,NULL),(952,1,952,NULL),(953,1,953,NULL),(954,1,954,NULL),(955,1,955,NULL),(956,1,956,NULL),(957,1,957,NULL),(958,1,958,NULL),(959,1,959,NULL),(960,1,960,NULL),(961,1,961,NULL),(962,1,962,NULL),(963,1,963,NULL),(964,1,964,NULL),(965,1,965,NULL),(966,1,966,NULL),(967,1,967,NULL),(968,1,968,NULL),(969,1,969,NULL),(970,1,970,NULL),(971,1,971,NULL),(972,1,972,NULL),(973,1,973,NULL),(974,1,974,NULL),(975,1,975,NULL),(976,1,976,NULL),(977,1,977,NULL),(978,1,978,NULL),(979,1,979,NULL),(980,1,980,NULL),(981,1,981,NULL),(982,1,982,NULL),(983,1,983,NULL),(984,1,984,NULL),(985,1,985,NULL),(986,1,986,NULL),(987,1,987,NULL),(988,1,988,NULL),(989,1,989,NULL),(990,1,990,NULL),(991,1,991,NULL),(992,1,992,NULL),(993,1,993,NULL),(994,1,994,NULL),(995,1,995,NULL),(996,1,996,NULL),(997,1,997,NULL),(998,1,998,NULL),(999,1,999,NULL),(1000,1,1000,NULL),(1001,1,1001,NULL),(1002,1,1002,NULL),(1003,1,1003,NULL),(1004,1,1004,NULL),(1005,1,1005,NULL),(1006,1,1006,NULL),(1007,1,1007,NULL),(1008,1,1008,NULL),(1009,1,1009,NULL),(1010,1,1010,NULL),(1011,1,1011,NULL),(1012,1,1012,NULL),(1013,1,1013,NULL),(1014,1,1014,NULL),(1015,1,1015,NULL),(1016,1,1016,NULL),(1017,1,1017,NULL),(1018,1,1018,NULL),(1019,1,1019,NULL),(1020,1,1020,NULL),(1021,1,1021,NULL),(1022,1,1022,NULL),(1023,1,1023,NULL),(1024,1,1024,NULL),(1025,1,1025,NULL),(1026,1,1026,NULL),(1027,1,1027,NULL),(1028,1,1028,NULL),(1029,1,1029,NULL),(1030,1,1030,NULL),(1031,1,1031,NULL),(1032,1,1032,NULL),(1033,1,1033,NULL),(1034,1,1034,NULL),(1035,1,1035,NULL),(1036,1,1036,NULL),(1037,1,1037,NULL),(1038,1,1038,NULL),(1039,1,1039,NULL),(1040,1,1040,NULL),(1041,1,1041,NULL),(1042,1,1042,NULL),(1043,1,1043,NULL),(1044,1,1044,NULL),(1045,1,1045,NULL),(1046,1,1046,NULL),(1047,1,1047,NULL),(1048,1,1048,NULL),(1049,1,1049,NULL),(1050,1,1050,NULL),(1051,1,1051,NULL),(1052,1,1052,NULL),(1053,1,1053,NULL),(1054,1,1054,NULL),(1055,1,1055,NULL),(1056,1,1056,NULL),(1057,1,1057,NULL),(1058,1,1058,NULL),(1059,1,1059,NULL),(1060,1,1060,NULL),(1061,1,1061,NULL),(1062,1,1062,NULL),(1063,1,1063,NULL),(1064,1,1064,NULL),(1065,1,1065,NULL),(1066,1,1066,NULL),(1067,1,1067,NULL),(1068,1,1068,NULL),(1069,1,1069,NULL),(1070,1,1070,NULL),(1071,1,1071,NULL),(1072,1,1072,NULL),(1073,1,1073,NULL),(1074,1,1074,NULL),(1075,1,1075,NULL),(1076,1,1076,NULL),(1077,1,1077,NULL),(1078,1,1078,NULL),(1079,1,1079,NULL),(1080,1,1080,NULL),(1081,1,1081,NULL),(1082,1,1082,NULL),(1083,1,1083,NULL),(1084,1,1084,NULL),(1085,1,1085,NULL),(1086,1,1086,NULL),(1087,1,1087,NULL),(1088,1,1088,NULL),(1089,1,1089,NULL),(1090,1,1090,NULL),(1091,1,1091,NULL),(1092,1,1092,NULL),(1093,1,1093,NULL),(1094,1,1094,NULL),(1095,1,1095,NULL),(1096,1,1096,NULL),(1097,1,1097,NULL),(1098,1,1098,NULL),(1099,1,1099,NULL),(1100,1,1100,NULL),(1101,1,1101,NULL),(1102,1,1102,NULL),(1103,1,1103,NULL),(1104,1,1104,NULL),(1105,1,1105,NULL),(1106,1,1106,NULL),(1107,1,1107,NULL),(1108,1,1108,NULL),(1109,1,1109,NULL),(1110,1,1110,NULL),(1111,1,1111,NULL),(1112,1,1112,NULL),(1113,1,1113,NULL),(1114,1,1114,NULL),(1115,1,1115,NULL),(1116,1,1116,NULL),(1117,1,1117,NULL),(1118,1,1118,NULL),(1119,1,1119,NULL),(1120,1,1120,NULL),(1121,1,1121,NULL),(1122,1,1122,NULL),(1123,1,1123,NULL),(1124,1,1124,NULL),(1125,1,1125,NULL),(1126,1,1126,NULL),(1127,1,1127,NULL),(1128,1,1128,NULL),(1129,1,1129,NULL),(1130,1,1130,NULL),(1131,1,1131,NULL),(1132,1,1132,NULL),(1133,1,1133,NULL),(1134,1,1134,NULL),(1135,1,1135,NULL),(1136,1,1136,NULL),(1137,1,1137,NULL),(1138,1,1138,NULL),(1139,1,1139,NULL),(1140,1,1140,NULL),(1141,1,1141,NULL),(1142,1,1142,NULL),(1143,1,1143,NULL),(1144,1,1144,NULL),(1145,1,1145,NULL),(1146,1,1146,NULL),(1147,1,1147,NULL),(1148,1,1148,NULL),(1149,1,1149,NULL),(1150,1,1150,NULL),(1151,1,1151,NULL),(1152,1,1152,NULL),(1153,1,1153,NULL),(1154,1,1154,NULL),(1155,1,1155,NULL),(1156,1,1156,NULL),(1157,1,1157,NULL),(1158,1,1158,NULL),(1159,1,1159,NULL),(1160,1,1160,NULL),(1161,1,1161,NULL),(1162,1,1162,NULL),(1163,1,1163,NULL),(1164,1,1164,NULL),(1165,1,1165,NULL),(1166,1,1166,NULL),(1167,1,1167,NULL),(1168,1,1168,NULL),(1169,1,1169,NULL),(1170,1,1170,NULL),(1171,1,1171,NULL),(1172,1,1172,NULL),(1173,1,1173,NULL),(1174,1,1174,NULL),(1175,1,1175,NULL),(1176,1,1176,NULL),(1177,1,1177,NULL),(1178,1,1178,NULL),(1179,1,1179,NULL),(1180,1,1180,NULL),(1181,1,1181,NULL),(1182,1,1182,NULL),(1183,1,1183,NULL),(1184,1,1184,NULL),(1185,1,1185,NULL),(1186,1,1186,NULL),(1187,1,1187,NULL),(1188,1,1188,NULL),(1189,1,1189,NULL),(1190,1,1190,NULL),(1191,1,1191,NULL),(1192,1,1192,NULL),(1193,1,1193,NULL),(1194,1,1194,NULL),(1195,1,1195,NULL),(1196,1,1196,NULL),(1197,1,1197,NULL),(1198,1,1198,NULL),(1199,1,1199,NULL),(1200,1,1200,NULL),(1201,1,1201,NULL),(1202,1,1202,NULL),(1203,1,1203,NULL),(1204,1,1204,NULL),(1205,1,1205,NULL),(1206,1,1206,NULL),(1207,1,1207,NULL),(1208,1,1208,NULL),(1209,1,1209,NULL),(1210,1,1210,NULL),(1211,1,1211,NULL),(1212,1,1212,NULL),(1213,1,1213,NULL),(1214,1,1214,NULL),(1215,1,1215,NULL),(1216,1,1216,NULL),(1217,1,1217,NULL),(1218,1,1218,NULL),(1219,1,1219,NULL),(1220,1,1220,NULL),(1221,1,1221,NULL),(1222,1,1222,NULL),(1223,1,1223,NULL),(1224,1,1224,NULL),(1225,1,1225,NULL),(1226,1,1226,NULL),(1227,1,1227,NULL),(1228,1,1228,NULL),(1229,1,1229,NULL),(1230,1,1230,NULL),(1231,1,1231,NULL),(1232,1,1232,NULL),(1233,1,1233,NULL),(1234,1,1234,NULL),(1235,1,1235,NULL),(1236,1,1236,NULL),(1237,1,1237,NULL),(1238,1,1238,NULL),(1239,1,1239,NULL),(1240,1,1240,NULL),(1241,1,1241,NULL),(1242,1,1242,NULL),(1243,1,1243,NULL),(1244,1,1244,NULL),(1245,1,1245,NULL),(1246,1,1246,NULL),(1247,1,1247,NULL),(1248,1,1248,NULL),(1249,1,1249,NULL),(1250,1,1250,NULL),(1251,1,1251,NULL),(1252,1,1252,NULL),(1253,1,1253,NULL),(1254,1,1254,NULL),(1255,1,1255,NULL),(1256,1,1256,NULL),(1257,1,1257,NULL),(1258,1,1258,NULL),(1259,1,1259,NULL),(1260,1,1260,NULL),(1261,1,1261,NULL),(1262,1,1262,NULL),(1263,1,1263,NULL),(1264,1,1264,NULL),(1265,1,1265,NULL),(1266,1,1266,NULL),(1267,1,1267,NULL),(1268,1,1268,NULL),(1269,1,1269,NULL),(1270,1,1270,NULL),(1271,1,1271,NULL),(1272,1,1272,NULL),(1273,1,1273,NULL),(1274,1,1274,NULL),(1275,1,1275,NULL),(1276,1,1276,NULL),(1277,1,1277,NULL),(1278,1,1278,NULL),(1279,1,1279,NULL),(1280,1,1280,NULL),(1281,1,1281,NULL),(1282,1,1282,NULL),(1283,1,1283,NULL),(1284,1,1284,NULL),(1285,1,1285,NULL),(1286,1,1286,NULL),(1287,1,1287,NULL),(1288,1,1288,NULL),(1289,1,1289,NULL),(1290,1,1290,NULL),(1291,1,1291,NULL),(1292,1,1292,NULL),(1293,1,1293,NULL),(1294,1,1294,NULL),(1295,1,1295,NULL),(1296,1,1296,NULL),(1297,1,1297,NULL),(1298,1,1298,NULL),(1299,1,1299,NULL),(1300,1,1300,NULL),(1301,1,1301,NULL),(1302,1,1302,NULL),(1303,1,1303,NULL),(1304,1,1304,NULL),(1305,1,1305,NULL),(1306,1,1306,NULL),(1307,1,1307,NULL),(1308,1,1308,NULL),(1309,1,1309,NULL),(1310,1,1310,NULL),(1311,1,1311,NULL),(1312,1,1312,NULL),(1313,1,1313,NULL),(1314,1,1314,NULL),(1315,1,1315,NULL),(1316,1,1316,NULL),(1317,1,1317,NULL),(1318,1,1318,NULL),(1319,1,1319,NULL),(1320,1,1320,NULL),(1321,1,1321,NULL),(1322,1,1322,NULL),(1323,1,1323,NULL),(1324,1,1324,NULL),(1325,1,1325,NULL),(1326,1,1326,NULL),(1327,1,1327,NULL),(1328,1,1328,NULL),(1329,1,1329,NULL),(1330,1,1330,NULL),(1331,1,1331,NULL),(1332,1,1332,NULL),(1333,1,1333,NULL),(1334,1,1334,NULL),(1335,1,1335,NULL),(1336,1,1336,NULL),(1337,1,1337,NULL),(1338,1,1338,NULL),(1339,1,1339,NULL),(1340,1,1340,NULL),(1341,1,1341,NULL),(1342,1,1342,NULL),(1343,1,1343,NULL),(1344,1,1344,NULL),(1345,1,1345,NULL),(1346,1,1346,NULL),(1347,1,1347,NULL),(1348,1,1348,NULL),(1349,1,1349,NULL),(1350,1,1350,NULL),(1351,1,1351,NULL),(1352,1,1352,NULL),(1353,1,1353,NULL),(1354,1,1354,NULL),(1355,1,1355,NULL),(1356,1,1356,NULL),(1357,1,1357,NULL),(1358,1,1358,NULL),(1359,1,1359,NULL),(1360,1,1360,NULL),(1361,1,1361,NULL),(1362,1,1362,NULL),(1363,1,1363,NULL),(1364,1,1364,NULL),(1365,1,1365,NULL),(1366,1,1366,NULL),(1367,1,1367,NULL),(1368,1,1368,NULL),(1369,1,1369,NULL),(1370,1,1370,NULL),(1371,1,1371,NULL),(1372,1,1372,NULL),(1373,1,1373,NULL),(1374,1,1374,NULL),(1375,1,1375,NULL),(1376,1,1376,NULL),(1377,1,1377,NULL),(1378,1,1378,NULL),(1379,1,1379,NULL),(1380,1,1380,NULL),(1381,1,1381,NULL),(1382,1,1382,NULL),(1383,1,1383,NULL),(1384,1,1384,NULL),(1385,1,1385,NULL),(1386,1,1386,NULL),(1387,1,1387,NULL),(1388,1,1388,NULL),(1389,1,1389,NULL),(1390,1,1390,NULL),(1391,1,1391,NULL),(1392,1,1392,NULL),(1393,1,1393,NULL),(1394,1,1394,NULL),(1395,1,1395,NULL),(1396,1,1396,NULL),(1397,1,1397,NULL),(1398,1,1398,NULL),(1399,1,1399,NULL),(1400,1,1400,NULL),(1401,1,1401,NULL),(1402,1,1402,NULL),(1403,1,1403,NULL),(1404,1,1404,NULL),(1405,1,1405,NULL),(1406,1,1406,NULL),(1407,1,1407,NULL),(1408,1,1408,NULL),(1409,1,1409,NULL),(1410,1,1410,NULL),(1411,1,1411,NULL),(1412,1,1412,NULL),(1413,1,1413,NULL),(1414,1,1414,NULL),(1415,1,1415,NULL),(1416,1,1416,NULL),(1417,1,1417,NULL),(1418,1,1418,NULL),(1419,1,1419,NULL),(1420,1,1420,NULL),(1421,1,1421,NULL),(1422,1,1422,NULL),(1423,1,1423,NULL),(1424,1,1424,NULL),(1425,1,1425,NULL),(1426,1,1426,NULL),(1427,1,1427,NULL),(1428,1,1428,NULL),(1429,1,1429,NULL),(1430,1,1430,NULL),(1431,1,1431,NULL),(1432,1,1432,NULL),(1433,1,1433,NULL),(1434,1,1434,NULL),(1435,1,1435,NULL),(1436,1,1436,NULL),(1437,1,1437,NULL),(1438,1,1438,NULL),(1439,1,1439,NULL),(1440,1,1440,NULL),(1441,1,1441,NULL),(1442,1,1442,NULL),(1443,1,1443,NULL),(1444,1,1444,NULL),(1445,1,1445,NULL),(1446,1,1446,NULL),(1447,1,1447,NULL),(1448,1,1448,NULL),(1449,1,1449,NULL),(1450,1,1450,NULL),(1451,1,1451,NULL),(1452,1,1452,NULL),(1453,1,1453,NULL),(1454,1,1454,NULL),(1455,1,1455,NULL),(1456,1,1456,NULL),(1457,1,1457,NULL),(1458,1,1458,NULL),(1459,1,1459,NULL),(1460,1,1460,NULL),(1461,1,1461,NULL),(1462,1,1462,NULL),(1463,1,1463,NULL),(1464,1,1464,NULL),(1465,1,1465,NULL),(1466,1,1466,NULL),(1467,1,1467,NULL),(1468,1,1468,NULL),(1469,1,1469,NULL),(1470,1,1470,NULL),(1471,1,1471,NULL),(1472,1,1472,NULL),(1473,1,1473,NULL),(1474,1,1474,NULL),(1475,1,1475,NULL),(1476,1,1476,NULL),(1477,1,1477,NULL),(1478,1,1478,NULL),(1479,1,1479,NULL),(1480,1,1480,NULL),(1481,1,1481,NULL),(1482,1,1482,NULL),(1483,1,1483,NULL),(1484,1,1484,NULL),(1485,1,1485,NULL),(1486,1,1486,NULL),(1487,1,1487,NULL),(1488,1,1488,NULL),(1489,1,1489,NULL),(1490,1,1490,NULL),(1491,1,1491,NULL),(1492,1,1492,NULL),(1493,1,1493,NULL),(1494,1,1494,NULL),(1495,1,1495,NULL),(1496,1,1496,NULL),(1497,1,1497,NULL),(1498,1,1498,NULL),(1499,1,1499,NULL),(1500,1,1500,NULL),(1501,1,1501,NULL),(1502,1,1502,NULL),(1503,1,1503,NULL),(1504,1,1504,NULL),(1505,1,1505,NULL),(1506,1,1506,NULL),(1507,1,1507,NULL),(1508,1,1508,NULL),(1509,1,1509,NULL),(1510,1,1510,NULL),(1511,1,1511,NULL),(1512,1,1512,NULL),(1513,1,1513,NULL),(1514,1,1514,NULL),(1515,1,1515,NULL),(1516,1,1516,NULL),(1517,1,1517,NULL),(1518,1,1518,NULL),(1519,1,1519,NULL),(1520,1,1520,NULL),(1521,1,1521,NULL),(1522,1,1522,NULL),(1523,1,1523,NULL),(1524,1,1524,NULL),(1525,1,1525,NULL),(1526,1,1526,NULL),(1527,1,1527,NULL),(1528,1,1528,NULL),(1529,1,1529,NULL),(1530,1,1530,NULL),(1531,1,1531,NULL),(1532,1,1532,NULL),(1533,1,1533,NULL),(1534,1,1534,NULL),(1535,1,1535,NULL),(1536,1,1536,NULL),(1537,1,1537,NULL),(1538,1,1538,NULL),(1539,1,1539,NULL),(1540,1,1540,NULL),(1541,1,1541,NULL),(1542,1,1542,NULL),(1543,1,1543,NULL),(1544,1,1544,NULL),(1545,1,1545,NULL),(1546,1,1546,NULL),(1547,1,1547,NULL),(1548,1,1548,NULL),(1549,1,1549,NULL),(1550,1,1550,NULL),(1551,1,1551,NULL),(1552,1,1552,NULL),(1553,1,1553,NULL),(1554,1,1554,NULL),(1555,1,1555,NULL),(1556,1,1556,NULL),(1557,1,1557,NULL),(1558,1,1558,NULL),(1559,1,1559,NULL),(1560,1,1560,NULL),(1561,1,1561,NULL),(1562,1,1562,NULL),(1563,1,1563,NULL),(1564,1,1564,NULL),(1565,1,1565,NULL),(1566,1,1566,NULL),(1567,1,1567,NULL),(1568,1,1568,NULL),(1569,1,1569,NULL),(1570,1,1570,NULL),(1571,1,1571,NULL),(1572,1,1572,NULL),(1573,1,1573,NULL),(1574,1,1574,NULL),(1575,1,1575,NULL),(1576,1,1576,NULL),(1577,1,1577,NULL),(1578,1,1578,NULL),(1579,1,1579,NULL),(1580,1,1580,NULL),(1581,1,1581,NULL),(1582,1,1582,NULL),(1583,1,1583,NULL),(1584,1,1584,NULL),(1585,1,1585,NULL),(1586,1,1586,NULL),(1587,1,1587,NULL),(1588,1,1588,NULL),(1589,1,1589,NULL),(1590,1,1590,NULL),(1591,1,1591,NULL),(1592,1,1592,NULL),(1593,1,1593,NULL),(1594,1,1594,NULL),(1595,1,1595,NULL),(1596,1,1596,NULL),(1597,1,1597,NULL),(1598,1,1598,NULL),(1599,1,1599,NULL),(1600,1,1600,NULL),(1601,1,1601,NULL),(1602,1,1602,NULL),(1603,1,1603,NULL),(1604,1,1604,NULL),(1605,1,1605,NULL),(1606,1,1606,NULL),(1607,1,1607,NULL),(1608,1,1608,NULL),(1609,1,1609,NULL),(1610,1,1610,NULL),(1611,1,1611,NULL),(1612,1,1612,NULL),(1613,1,1613,NULL),(1614,1,1614,NULL),(1615,1,1615,NULL),(1616,1,1616,NULL),(1617,1,1617,NULL),(1618,1,1618,NULL),(1619,1,1619,NULL),(1620,1,1620,NULL),(1621,1,1621,NULL),(1622,1,1622,NULL),(1623,1,1623,NULL),(1624,1,1624,NULL),(1625,1,1625,NULL),(1626,1,1626,NULL),(1627,1,1627,NULL),(1628,1,1628,NULL),(1629,1,1629,NULL),(1630,1,1630,NULL),(1631,1,1631,NULL),(1632,1,1632,NULL),(1633,1,1633,NULL),(1634,1,1634,NULL),(1635,1,1635,NULL),(1636,1,1636,NULL),(1637,1,1637,NULL),(1638,1,1638,NULL),(1639,1,1639,NULL),(1640,1,1640,NULL),(1641,1,1641,NULL),(1642,1,1642,NULL),(1643,1,1643,NULL),(1644,1,1644,NULL),(1645,1,1645,NULL),(1646,1,1646,NULL),(1647,1,1647,NULL),(1648,1,1648,NULL),(1649,1,1649,NULL),(1650,1,1650,NULL),(1651,1,1651,NULL),(1652,1,1652,NULL),(1653,1,1653,NULL),(1654,1,1654,NULL),(1655,1,1655,NULL),(1656,1,1656,NULL),(1657,1,1657,NULL),(1658,1,1658,NULL),(1659,1,1659,NULL),(1660,1,1660,NULL),(1661,1,1661,NULL),(1662,1,1662,NULL),(1663,1,1663,NULL),(1664,1,1664,NULL),(1665,1,1665,NULL),(1666,1,1666,NULL),(1667,1,1667,NULL),(1668,1,1668,NULL),(1669,1,1669,NULL),(1670,1,1670,NULL),(1671,1,1671,NULL),(1672,1,1672,NULL),(1673,1,1673,NULL),(1674,1,1674,NULL),(1675,1,1675,NULL),(1676,1,1676,NULL),(1677,1,1677,NULL),(1678,1,1678,NULL),(1679,1,1679,NULL),(1680,1,1680,NULL),(1681,1,1681,NULL),(1682,1,1682,NULL),(1683,1,1683,NULL),(1684,1,1684,NULL),(1685,1,1685,NULL),(1686,1,1686,NULL),(1687,1,1687,NULL),(1688,1,1688,NULL),(1689,1,1689,NULL),(1690,1,1690,NULL),(1691,1,1691,NULL),(1692,1,1692,NULL),(1693,1,1693,NULL),(1694,1,1694,NULL),(1695,1,1695,NULL),(1696,1,1696,NULL),(1697,1,1697,NULL),(1698,1,1698,NULL),(1699,1,1699,NULL),(1700,1,1700,NULL),(1701,1,1701,NULL),(1702,1,1702,NULL),(1703,1,1703,NULL),(1704,1,1704,NULL),(1705,1,1705,NULL),(1706,1,1706,NULL),(1707,1,1707,NULL),(1708,1,1708,NULL),(1709,1,1709,NULL),(1710,1,1710,NULL),(1711,1,1711,NULL),(1712,1,1712,NULL),(1713,1,1713,NULL),(1714,1,1714,NULL),(1715,1,1715,NULL),(1716,1,1716,NULL),(1717,1,1717,NULL),(1718,1,1718,NULL),(1719,1,1719,NULL),(1720,1,1720,NULL),(1721,1,1721,NULL),(1722,1,1722,NULL),(1723,1,1723,NULL),(1724,1,1724,NULL),(1725,1,1725,NULL),(1726,1,1726,NULL),(1727,1,1727,NULL),(1728,1,1728,NULL),(1729,1,1729,NULL),(1730,1,1730,NULL),(1731,1,1731,NULL),(1732,1,1732,NULL),(1733,1,1733,NULL),(1734,1,1734,NULL),(1735,1,1735,NULL),(1736,1,1736,NULL),(1737,1,1737,NULL),(1738,1,1738,NULL),(1739,1,1739,NULL),(1740,1,1740,NULL),(1741,1,1741,NULL),(1742,1,1742,NULL),(1743,1,1743,NULL),(1744,1,1744,NULL),(1745,1,1745,NULL),(1746,1,1746,NULL),(1747,1,1747,NULL),(1748,1,1748,NULL),(1749,1,1749,NULL),(1750,1,1750,NULL),(1751,1,1751,NULL),(1752,1,1752,NULL),(1753,1,1753,NULL),(1754,1,1754,NULL),(1755,1,1755,NULL),(1756,1,1756,NULL),(1757,1,1757,NULL),(1758,1,1758,NULL),(1759,1,1759,NULL),(1760,1,1760,NULL),(1761,1,1761,NULL),(1762,1,1762,NULL),(1763,1,1763,NULL),(1764,1,1764,NULL),(1765,1,1765,NULL),(1766,1,1766,NULL),(1767,1,1767,NULL),(1768,1,1768,NULL),(1769,1,1769,NULL),(1770,1,1770,NULL),(1771,1,1771,NULL),(1772,1,1772,NULL),(1773,1,1773,NULL),(1774,1,1774,NULL),(1775,1,1775,NULL),(1776,1,1776,NULL),(1777,1,1777,NULL),(1778,1,1778,NULL),(1779,1,1779,NULL),(1780,1,1780,NULL),(1781,1,1781,NULL),(1782,1,1782,NULL),(1783,1,1783,NULL),(1784,1,1784,NULL),(1785,1,1785,NULL),(1786,1,1786,NULL),(1787,1,1787,NULL),(1788,1,1788,NULL),(1789,1,1789,NULL),(1790,1,1790,NULL),(1791,1,1791,NULL),(1792,1,1792,NULL),(1793,1,1793,NULL),(1794,1,1794,NULL),(1795,1,1795,NULL),(1796,1,1796,NULL),(1797,1,1797,NULL),(1798,1,1798,NULL),(1799,1,1799,NULL),(1800,1,1800,NULL),(1801,1,1801,NULL),(1802,1,1802,NULL),(1803,1,1803,NULL),(1804,1,1804,NULL),(1805,1,1805,NULL),(1806,1,1806,NULL),(1807,1,1807,NULL),(1808,1,1808,NULL),(1809,1,1809,NULL),(1810,1,1810,NULL),(1811,1,1811,NULL),(1812,1,1812,NULL),(1813,1,1813,NULL),(1814,1,1814,NULL),(1815,1,1815,NULL),(1816,1,1816,NULL),(1817,1,1817,NULL),(1818,1,1818,NULL),(1819,1,1819,NULL),(1820,1,1820,NULL),(1821,1,1821,NULL),(1822,1,1822,NULL),(1823,1,1823,NULL),(1824,1,1824,NULL),(1825,1,1825,NULL),(1826,1,1826,NULL),(1827,1,1827,NULL),(1828,1,1828,NULL),(1829,1,1829,NULL),(1830,1,1830,NULL),(1831,1,1831,NULL),(1832,1,1832,NULL),(1833,1,1833,NULL),(1834,1,1834,NULL),(1835,1,1835,NULL),(1836,1,1836,NULL),(1837,1,1837,NULL),(1838,1,1838,NULL),(1839,1,1839,NULL),(1840,1,1840,NULL),(1841,1,1841,NULL),(1842,1,1842,NULL),(1843,1,1843,NULL),(1844,1,1844,NULL),(1845,1,1845,NULL),(1846,1,1846,NULL),(1847,1,1847,NULL),(1848,1,1848,NULL),(1849,1,1849,NULL),(1850,1,1850,NULL),(1851,1,1851,NULL),(1852,1,1852,NULL),(1853,1,1853,NULL),(1854,1,1854,NULL),(1855,1,1855,NULL),(1856,1,1856,NULL),(1857,1,1857,NULL),(1858,1,1858,NULL),(1859,1,1859,NULL),(1860,1,1860,NULL),(1861,1,1861,NULL),(1862,1,1862,NULL),(1863,1,1863,NULL),(1864,1,1864,NULL),(1865,1,1865,NULL),(1866,1,1866,NULL),(1867,1,1867,NULL),(1868,1,1868,NULL),(1869,1,1869,NULL),(1870,1,1870,NULL),(1871,1,1871,NULL),(1872,1,1872,NULL),(1873,1,1873,NULL),(1874,1,1874,NULL),(1875,1,1875,NULL),(1876,1,1876,NULL),(1877,1,1877,NULL),(1878,1,1878,NULL),(1879,1,1879,NULL),(1880,1,1880,NULL),(1881,1,1881,NULL),(1882,1,1882,NULL),(1883,1,1883,NULL),(1884,1,1884,NULL),(1885,1,1885,NULL),(1886,1,1886,NULL),(1887,1,1887,NULL),(1888,1,1888,NULL),(1889,1,1889,NULL),(1890,1,1890,NULL),(1891,1,1891,NULL),(1892,1,1892,NULL),(1893,1,1893,NULL),(1894,1,1894,NULL),(1895,1,1895,NULL),(1896,1,1896,NULL),(1897,1,1897,NULL),(1898,1,1898,NULL),(1899,1,1899,NULL),(1900,1,1900,NULL),(1901,1,1901,NULL),(1902,1,1902,NULL),(1903,1,1903,NULL),(1904,1,1904,NULL),(1905,1,1905,NULL),(1906,1,1906,NULL),(1907,1,1907,NULL),(1908,1,1908,NULL),(1909,1,1909,NULL),(1910,1,1910,NULL),(1911,1,1911,NULL),(1912,1,1912,NULL),(1913,1,1913,NULL),(1914,1,1914,NULL),(1915,1,1915,NULL),(1916,1,1916,NULL),(1917,1,1917,NULL),(1918,1,1918,NULL),(1919,1,1919,NULL),(1920,1,1920,NULL),(1921,1,1921,NULL),(1922,1,1922,NULL),(1923,1,1923,NULL),(1924,1,1924,NULL),(1925,1,1925,NULL),(1926,1,1926,NULL),(1927,1,1927,NULL),(1928,1,1928,NULL),(1929,1,1929,NULL),(1930,1,1930,NULL),(1931,1,1931,NULL),(1932,1,1932,NULL),(1933,1,1933,NULL),(1934,1,1934,NULL),(1935,1,1935,NULL),(1936,1,1936,NULL),(1937,1,1937,NULL),(1938,1,1938,NULL),(1939,1,1939,NULL),(1940,1,1940,NULL),(1941,1,1941,NULL),(1942,1,1942,NULL),(1943,1,1943,NULL),(1944,1,1944,NULL),(1945,1,1945,NULL),(1946,1,1946,NULL),(1947,1,1947,NULL),(1948,1,1948,NULL),(1949,1,1949,NULL),(1950,1,1950,NULL),(1951,1,1951,NULL),(1952,1,1952,NULL),(1953,1,1953,NULL),(1954,1,1954,NULL),(1955,1,1955,NULL),(1956,1,1956,NULL),(1957,1,1957,NULL),(1958,1,1958,NULL),(1959,1,1959,NULL),(1960,1,1960,NULL),(1961,1,1961,NULL),(1962,1,1962,NULL),(1963,1,1963,NULL),(1964,1,1964,NULL),(1965,1,1965,NULL),(1966,1,1966,NULL),(1967,1,1967,NULL),(1968,1,1968,NULL),(1969,1,1969,NULL),(1970,1,1970,NULL),(1971,1,1971,NULL),(1972,1,1972,NULL),(1973,1,1973,NULL),(1974,1,1974,NULL),(1975,1,1975,NULL),(1976,1,1976,NULL),(1977,1,1977,NULL),(1978,1,1978,NULL),(1979,1,1979,NULL),(1980,1,1980,NULL),(1981,1,1981,NULL),(1982,1,1982,NULL),(1983,1,1983,NULL),(1984,1,1984,NULL),(1985,1,1985,NULL),(1986,1,1986,NULL),(1987,1,1987,NULL),(1988,1,1988,NULL),(1989,1,1989,NULL),(1990,1,1990,NULL),(1991,1,1991,NULL),(1992,1,1992,NULL),(1993,1,1993,NULL),(1994,1,1994,NULL),(1995,1,1995,NULL),(1996,1,1996,NULL),(1997,1,1997,NULL),(1998,1,1998,NULL),(1999,1,1999,NULL),(2000,1,2000,NULL),(2001,1,2001,NULL),(2002,1,2002,NULL),(2003,1,2003,NULL),(2004,1,2004,NULL),(2005,1,2005,NULL),(2006,1,2006,NULL),(2007,1,2007,NULL),(2008,1,2008,NULL),(2009,1,2009,NULL),(2010,1,2010,NULL),(2011,1,2011,NULL),(2012,1,2012,NULL),(2013,1,2013,NULL),(2014,1,2014,NULL),(2015,1,2015,NULL),(2016,1,2016,NULL),(2017,1,2017,NULL),(2018,1,2018,NULL),(2019,1,2019,NULL),(2020,1,2020,NULL),(2021,1,2021,NULL),(2022,1,2022,NULL),(2023,1,2023,NULL),(2024,1,2024,NULL),(2025,1,2025,NULL),(2026,1,2026,NULL),(2027,1,2027,NULL),(2028,1,2028,NULL),(2029,1,2029,NULL),(2030,1,2030,NULL),(2031,1,2031,NULL),(2032,1,2032,NULL),(2033,1,2033,NULL),(2034,1,2034,NULL),(2035,1,2035,NULL),(2036,1,2036,NULL),(2037,1,2037,NULL),(2038,1,2038,NULL),(2039,1,2039,NULL),(2040,1,2040,NULL),(2041,1,2041,NULL),(2042,1,2042,NULL),(2043,1,2043,NULL),(2044,1,2044,NULL),(2045,1,2045,NULL),(2046,1,2046,NULL),(2047,1,2047,NULL),(2048,1,2048,NULL),(2049,1,2049,NULL),(2050,1,2050,NULL),(2051,1,2051,NULL),(2052,1,2052,NULL),(2053,1,2053,NULL),(2054,1,2054,NULL),(2055,1,2055,NULL),(2056,1,2056,NULL),(2057,1,2057,NULL),(2058,1,2058,NULL),(2059,1,2059,NULL),(2060,1,2060,NULL),(2061,1,2061,NULL),(2062,1,2062,NULL),(2063,1,2063,NULL),(2064,1,2064,NULL),(2065,1,2065,NULL),(2066,1,2066,NULL),(2067,1,2067,NULL),(2068,1,2068,NULL),(2069,1,2069,NULL),(2070,1,2070,NULL),(2071,1,2071,NULL),(2072,1,2072,NULL),(2073,1,2073,NULL),(2074,1,2074,NULL),(2075,1,2075,NULL),(2076,1,2076,NULL),(2077,1,2077,NULL),(2078,1,2078,NULL),(2079,1,2079,NULL),(2080,1,2080,NULL),(2081,1,2081,NULL),(2082,1,2082,NULL),(2083,1,2083,NULL),(2084,1,2084,NULL),(2085,1,2085,NULL),(2086,1,2086,NULL),(2087,1,2087,NULL),(2088,1,2088,NULL),(2089,1,2089,NULL),(2090,1,2090,NULL),(2091,1,2091,NULL),(2092,1,2092,NULL),(2093,1,2093,NULL),(2094,1,2094,NULL),(2095,1,2095,NULL),(2096,1,2096,NULL),(2097,1,2097,NULL),(2098,1,2098,NULL),(2099,1,2099,NULL),(2100,1,2100,NULL);
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `epochview`
--

/*!50001 DROP TABLE IF EXISTS `epochview`*/;
/*!50001 DROP VIEW IF EXISTS `epochview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `epochview` AS select `e`.`id` AS `id`,`l`.`name` AS `name`,`e`.`startYear` AS `startYear`,`e`.`endYear` AS `endYear`,`e`.`territory` AS `territory`,`l`.`language` AS `language` from (`epoch` `e` join `epochl10n` `l` on((`e`.`id` = `l`.`parent`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gradeview`
--

/*!50001 DROP TABLE IF EXISTS `gradeview`*/;
/*!50001 DROP VIEW IF EXISTS `gradeview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gradeview` AS select `g`.`id` AS `id`,`l`.`name` AS `name`,`l`.`abbr` AS `abbr`,`l`.`language` AS `language` from (`grade` `g` join `gradel10n` `l` on((`g`.`id` = `l`.`parent`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `metalview`
--

/*!50001 DROP TABLE IF EXISTS `metalview`*/;
/*!50001 DROP VIEW IF EXISTS `metalview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `metalview` AS select `m`.`id` AS `id`,`l`.`name` AS `name`,`m`.`abbr` AS `abbr`,`l`.`language` AS `language` from (`metal` `m` join `metall10n` `l` on((`m`.`id` = `l`.`parent`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monetarysystemview`
--

/*!50001 DROP TABLE IF EXISTS `monetarysystemview`*/;
/*!50001 DROP VIEW IF EXISTS `monetarysystemview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monetarysystemview` AS select `m`.`id` AS `id`,`m`.`start` AS `start`,`m`.`end` AS `end`,`ml`.`name` AS `name`,`ml`.`description` AS `description`,`ml`.`language` AS `language` from (`monetarysystem` `m` join `monetarysysteml10n` `ml` on((`m`.`id` = `ml`.`parent`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qualityview`
--

/*!50001 DROP TABLE IF EXISTS `qualityview`*/;
/*!50001 DROP VIEW IF EXISTS `qualityview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qualityview` AS select `q`.`id` AS `id`,`l`.`name` AS `name`,`l`.`abbr` AS `abbr`,`l`.`language` AS `language` from (`quality` `q` join `qualityl10n` `l` on((`q`.`id` = `l`.`parent`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `territoryview`
--

/*!50001 DROP TABLE IF EXISTS `territoryview`*/;
/*!50001 DROP VIEW IF EXISTS `territoryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `territoryview` AS select `t`.`id` AS `id`,`tn`.`name` AS `name`,`tn`.`language` AS `language`,`t`.`iso3166` AS `iso3166`,`t`.`toplevel` AS `toplevel`,`tn`.`primary` AS `primary` from (`territory` `t` join `territoryname` `tn` on((`t`.`id` = `tn`.`territory`))) */;
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

-- Dump completed on 2014-08-25 14:55:47
