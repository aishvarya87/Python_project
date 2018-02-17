CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `CityCode` int(11) NOT NULL,
  `CityName` varchar(45) DEFAULT NULL,
  `Metro` varchar(45) DEFAULT NULL,
  `County` varchar(45) DEFAULT NULL,
  `State` varchar(10) DEFAULT NULL,
  `PopulationRank` int(11) DEFAULT NULL,
  PRIMARY KEY (`CityCode`),
  UNIQUE KEY `CityCode_UNIQUE` (`CityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_has_price_sqft`
--

DROP TABLE IF EXISTS `city_has_price_sqft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_has_price_sqft` (
  `City_CityCode` int(11) NOT NULL,
  `Price_sqft_CityCode` float NOT NULL,
  PRIMARY KEY (`City_CityCode`,`Price_sqft_CityCode`),
  KEY `fk_City_has_Price_sqft_Price_sqft1_idx` (`Price_sqft_CityCode`),
  KEY `fk_City_has_Price_sqft_City1_idx` (`City_CityCode`),
  CONSTRAINT `fk_City_has_Price_sqft_City1` FOREIGN KEY (`City_CityCode`) REFERENCES `city` (`CityCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_City_has_Price_sqft_Price_sqft1` FOREIGN KEY (`Price_sqft_CityCode`) REFERENCES `price_sqft` (`CityCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_has_price_sqft`
--

LOCK TABLES `city_has_price_sqft` WRITE;
/*!40000 ALTER TABLE `city_has_price_sqft` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_has_price_sqft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_has_rent`
--

DROP TABLE IF EXISTS `city_has_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_has_rent` (
  `City_CityCode` int(11) NOT NULL,
  `Rent_CityCode` int(11) NOT NULL,
  PRIMARY KEY (`City_CityCode`,`Rent_CityCode`),
  KEY `fk_City_has_Rent_Rent1_idx` (`Rent_CityCode`),
  KEY `fk_City_has_Rent_City_idx` (`City_CityCode`),
  CONSTRAINT `fk_City_has_Rent_City` FOREIGN KEY (`City_CityCode`) REFERENCES `city` (`CityCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_City_has_Rent_Rent1` FOREIGN KEY (`Rent_CityCode`) REFERENCES `rent` (`CityCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_has_rent`
--

LOCK TABLES `city_has_rent` WRITE;
/*!40000 ALTER TABLE `city_has_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_has_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_sqft`
--

DROP TABLE IF EXISTS `price_sqft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_sqft` (
  `CityCode` float NOT NULL,
  `Nov2010` float DEFAULT NULL,
  `Dec2010` float DEFAULT NULL,
  `Jan2011` float DEFAULT NULL,
  `Feb2011` float DEFAULT NULL,
  `Mar2011` float DEFAULT NULL,
  `Apr2011` float DEFAULT NULL,
  `May2011` float DEFAULT NULL,
  `Jun2011` float DEFAULT NULL,
  `July2011` float DEFAULT NULL,
  `Aug2011` float DEFAULT NULL,
  `Sep2011` float DEFAULT NULL,
  `Oct2011` float DEFAULT NULL,
  `Nov2011` float DEFAULT NULL,
  `Dec2011` float DEFAULT NULL,
  `Jan2012` float DEFAULT NULL,
  `Feb2012` float DEFAULT NULL,
  `Mar2012` float DEFAULT NULL,
  `Apr2012` float DEFAULT NULL,
  `May2012` float DEFAULT NULL,
  `Jun2012` float DEFAULT NULL,
  `July2012` float DEFAULT NULL,
  `Aug2012` float DEFAULT NULL,
  `Sep2012` float DEFAULT NULL,
  `Oct2012` float DEFAULT NULL,
  `Nov2012` float DEFAULT NULL,
  `Dec2012` float DEFAULT NULL,
  `Jan2013` float DEFAULT NULL,
  `Feb2013` float DEFAULT NULL,
  `Mar2013` float DEFAULT NULL,
  `Apr2013` float DEFAULT NULL,
  `May2013` float DEFAULT NULL,
  `Jun2013` float DEFAULT NULL,
  `July2013` float DEFAULT NULL,
  `Aug2013` float DEFAULT NULL,
  `Sep2013` float DEFAULT NULL,
  `Oct2013` float DEFAULT NULL,
  `Nov2013` float DEFAULT NULL,
  `Dec2013` float DEFAULT NULL,
  `Jan2014` float DEFAULT NULL,
  `Feb2014` float DEFAULT NULL,
  `Mar2014` float DEFAULT NULL,
  `Apr2014` float DEFAULT NULL,
  `May2014` float DEFAULT NULL,
  `Jun2014` float DEFAULT NULL,
  `July2014` float DEFAULT NULL,
  `Aug2014` float DEFAULT NULL,
  `Sep2014` float DEFAULT NULL,
  `Oct2014` float DEFAULT NULL,
  `Nov2014` float DEFAULT NULL,
  `Dec2014` float DEFAULT NULL,
  `Jan2015` float DEFAULT NULL,
  `Feb2015` float DEFAULT NULL,
  `Mar2015` float DEFAULT NULL,
  `Apr2015` float DEFAULT NULL,
  `May2015` float DEFAULT NULL,
  `Jun2015` float DEFAULT NULL,
  `July2015` float DEFAULT NULL,
  `Aug2015` float DEFAULT NULL,
  `Sep2015` float DEFAULT NULL,
  `Oct2015` float DEFAULT NULL,
  `Nov2015` float DEFAULT NULL,
  `Dec2015` float DEFAULT NULL,
  `Jan2016` float DEFAULT NULL,
  `Feb2016` float DEFAULT NULL,
  `Mar2016` float DEFAULT NULL,
  `Apr2016` float DEFAULT NULL,
  `May2016` float DEFAULT NULL,
  `Jun2016` float DEFAULT NULL,
  `July2016` float DEFAULT NULL,
  `Aug2016` float DEFAULT NULL,
  `Sep2016` float DEFAULT NULL,
  `Oct2016` float DEFAULT NULL,
  `Nov2016` float DEFAULT NULL,
  `Dec2016` float DEFAULT NULL,
  `Jan2017` float DEFAULT NULL,
  PRIMARY KEY (`CityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_sqft`
--

LOCK TABLES `price_sqft` WRITE;
/*!40000 ALTER TABLE `price_sqft` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_sqft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent` (
  `CityCode` int(11) NOT NULL,
  `Nov2010` int(11) DEFAULT NULL,
  `Dec2010` int(11) DEFAULT NULL,
  `Jan2011` int(11) DEFAULT NULL,
  `Feb2011` int(11) DEFAULT NULL,
  `Mar2011` int(11) DEFAULT NULL,
  `Apr2011` int(11) DEFAULT NULL,
  `May2011` int(11) DEFAULT NULL,
  `Jun2011` int(11) DEFAULT NULL,
  `July2011` int(11) DEFAULT NULL,
  `Aug2011` int(11) DEFAULT NULL,
  `Sep2011` int(11) DEFAULT NULL,
  `Oct2011` int(11) DEFAULT NULL,
  `Nov2011` int(11) DEFAULT NULL,
  `Dec2011` int(11) DEFAULT NULL,
  `Jan2012` int(11) DEFAULT NULL,
  `Feb2012` int(11) DEFAULT NULL,
  `Mar2012` int(11) DEFAULT NULL,
  `Apr2012` int(11) DEFAULT NULL,
  `May2012` int(11) DEFAULT NULL,
  `Jun2012` int(11) DEFAULT NULL,
  `July2012` int(11) DEFAULT NULL,
  `Aug2012` int(11) DEFAULT NULL,
  `Sep2012` int(11) DEFAULT NULL,
  `Oct2012` int(11) DEFAULT NULL,
  `Nov2012` int(11) DEFAULT NULL,
  `Dec2012` int(11) DEFAULT NULL,
  `Jan2013` int(11) DEFAULT NULL,
  `Feb2013` int(11) DEFAULT NULL,
  `Mar2013` int(11) DEFAULT NULL,
  `Apr2013` int(11) DEFAULT NULL,
  `May2013` int(11) DEFAULT NULL,
  `Jun2013` int(11) DEFAULT NULL,
  `July2013` int(11) DEFAULT NULL,
  `Aug2013` int(11) DEFAULT NULL,
  `Sep2013` int(11) DEFAULT NULL,
  `Oct2013` int(11) DEFAULT NULL,
  `Nov2013` int(11) DEFAULT NULL,
  `Dec2013` int(11) DEFAULT NULL,
  `Jan2014` int(11) DEFAULT NULL,
  `Feb2014` int(11) DEFAULT NULL,
  `Mar2014` int(11) DEFAULT NULL,
  `Apr2014` int(11) DEFAULT NULL,
  `May2014` int(11) DEFAULT NULL,
  `Jun2014` int(11) DEFAULT NULL,
  `July2014` int(11) DEFAULT NULL,
  `Aug2014` int(11) DEFAULT NULL,
  `Sep2014` int(11) DEFAULT NULL,
  `Oct2014` int(11) DEFAULT NULL,
  `Nov2014` int(11) DEFAULT NULL,
  `Dec2014` int(11) DEFAULT NULL,
  `Jan2015` int(11) DEFAULT NULL,
  `Feb2015` int(11) DEFAULT NULL,
  `Mar2015` int(11) DEFAULT NULL,
  `Apr2015` int(11) DEFAULT NULL,
  `May2015` int(11) DEFAULT NULL,
  `Jun2015` int(11) DEFAULT NULL,
  `July2015` int(11) DEFAULT NULL,
  `Aug2015` int(11) DEFAULT NULL,
  `Sep2015` int(11) DEFAULT NULL,
  `Oct2015` int(11) DEFAULT NULL,
  `Nov2015` int(11) DEFAULT NULL,
  `Dec2015` int(11) DEFAULT NULL,
  `Jan2016` int(11) DEFAULT NULL,
  `Feb2016` int(11) DEFAULT NULL,
  `Mar2016` int(11) DEFAULT NULL,
  `Apr2016` int(11) DEFAULT NULL,
  `May2016` int(11) DEFAULT NULL,
  `Jun2016` int(11) DEFAULT NULL,
  `July2016` int(11) DEFAULT NULL,
  `Aug2016` int(11) DEFAULT NULL,
  `Sep2016` int(11) DEFAULT NULL,
  `Oct2016` int(11) DEFAULT NULL,
  `Nov2016` int(11) DEFAULT NULL,
  `Dec2016` int(11) DEFAULT NULL,
  `Jan2017` int(11) DEFAULT NULL,
  PRIMARY KEY (`CityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04 14:14:50
