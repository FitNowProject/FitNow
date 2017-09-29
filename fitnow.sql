CREATE DATABASE  IF NOT EXISTS `fitnowdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fitnowdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fitnowdb
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `idEvent` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Date` datetime NOT NULL,
  `Creator` varchar(45) NOT NULL,
  `Personal` tinyint(4) NOT NULL,
  `IdType_Event` int(11) NOT NULL,
  `IdPlace` int(11) NOT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `event_place_idx` (`IdPlace`),
  KEY `ecent_typeevent_idx` (`IdType_Event`),
  CONSTRAINT `ecent_typeevent` FOREIGN KEY (`IdType_Event`) REFERENCES `type_event` (`idType_Event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `event_place` FOREIGN KEY (`IdPlace`) REFERENCES `place` (`idPlace`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'name1','0000-00-00 00:00:00','creator1',1,1,1),(11,'name2','0000-00-00 00:00:00','creator2',0,11,11),(21,'name3','0000-00-00 00:00:00','creator3',1,21,21);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_place`
--

DROP TABLE IF EXISTS `photo_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_place` (
  `idPhoto_Place` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `IdPlace` int(11) NOT NULL,
  PRIMARY KEY (`idPhoto_Place`),
  KEY `photoplace_place_idx` (`IdPlace`),
  CONSTRAINT `photoplace_place` FOREIGN KEY (`IdPlace`) REFERENCES `place` (`idPlace`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_place`
--

LOCK TABLES `photo_place` WRITE;
/*!40000 ALTER TABLE `photo_place` DISABLE KEYS */;
INSERT INTO `photo_place` VALUES (1,'name1',1),(11,'name2',11),(21,'name3',21),(31,'name1',1),(41,'name2',11),(51,'name3',21);
/*!40000 ALTER TABLE `photo_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_user`
--

DROP TABLE IF EXISTS `photo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_user` (
  `idPhoto_User` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `IdUser` int(11) NOT NULL,
  PRIMARY KEY (`idPhoto_User`),
  KEY `photouser_user_idx` (`IdUser`),
  CONSTRAINT `photouser_user` FOREIGN KEY (`IdUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_user`
--

LOCK TABLES `photo_user` WRITE;
/*!40000 ALTER TABLE `photo_user` DISABLE KEYS */;
INSERT INTO `photo_user` VALUES (31,'name1',1),(41,'name2',11),(51,'name3',21);
/*!40000 ALTER TABLE `photo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `idPlace` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Localization` varchar(45) NOT NULL,
  PRIMARY KEY (`idPlace`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'name1','localization1'),(11,'name2','localization2'),(21,'name3','localization3');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_event`
--

DROP TABLE IF EXISTS `type_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_event` (
  `idType_Event` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`idType_Event`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_event`
--

LOCK TABLES `type_event` WRITE;
/*!40000 ALTER TABLE `type_event` DISABLE KEYS */;
INSERT INTO `type_event` VALUES (1,'name1','description1'),(11,'name2','description2'),(21,'name3','description3');
/*!40000 ALTER TABLE `type_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `FatLastName` varchar(45) NOT NULL,
  `MotLastName` varchar(45) NOT NULL,
  `Sex` varchar(45) NOT NULL,
  `Dni` int(11) NOT NULL,
  `Born` date NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `IsWorked` tinyint(4) NOT NULL,
  `Direction` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'name1','fln1','mln1','h',1,'0000-00-00',1,'email 1','username 1','password 1',0,''),(11,'name2','fln2','mln2','m',2,'0000-00-00',2,'email 2','username 2','password 2',1,'lima'),(21,'name3','fln3','mln3','h',3,'0000-00-00',3,'email 3','username 3','password 3',0,'lima'),(31,'Juan','Perez','Herrera','Masculino',123456789,'1990-10-12',987654321,'trainer@fitnow.com','trainer','fitnow',1,'Av.fit 123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_event` (
  `idUser_Event` int(11) NOT NULL AUTO_INCREMENT,
  `IdUser` int(11) NOT NULL,
  `IdEvent` int(11) NOT NULL,
  `Calification` int(11) NOT NULL,
  PRIMARY KEY (`idUser_Event`),
  KEY `userevent_user_idx` (`IdUser`),
  KEY `userevent_event_idx` (`IdEvent`),
  CONSTRAINT `userevent_event` FOREIGN KEY (`IdEvent`) REFERENCES `event` (`idEvent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userevent_user` FOREIGN KEY (`IdUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_event`
--

LOCK TABLES `user_event` WRITE;
/*!40000 ALTER TABLE `user_event` DISABLE KEYS */;
INSERT INTO `user_event` VALUES (1,1,1,5),(11,11,11,5),(21,21,21,5);
/*!40000 ALTER TABLE `user_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fitnowdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `spCreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateUser`(
IN p_Name varchar(45),
IN p_FatLastName varchar(45),
IN p_MotLastName varchar(45),
IN p_Sex varchar(45),
IN p_Dni int(11),
IN p_Born date,
IN p_Phone int(11),
IN p_Email varchar(45),
IN p_Username varchar(45),
IN p_Password varchar(45),
IN p_IsWorked tinyint(4),
IN p_Direction varchar(45)
)
BEGIN

if ( select exists (select 1 from user where Username = p_Username) ) THEN

    select 'Username Exists';

ELSE

insert into user
(
	Name,
    FatLastName,
    MotLastName,
    Sex,
    Dni,
    Born,
    Phone,
    Email,
    Username,
    Password,
    IsWorked,
    Direction
)
values
(
	p_Name,
	p_FatLastName, 
	p_MotLastName, 
	p_Sex, 
	p_Dni,
	p_Born,
	p_Phone,
	p_Email,
	p_Username,
	p_Password,
	p_IsWorked,
	p_Direction
);

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-27 17:19:01
