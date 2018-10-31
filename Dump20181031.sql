-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 192.168.1.9    Database: suibian
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `betchyaApp_bet`
--

DROP TABLE IF EXISTS `betchyaApp_bet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_bet` (
  `betid` int(11) NOT NULL AUTO_INCREMENT,
  `stake` double NOT NULL,
  `accept` varchar(3) DEFAULT NULL,
  `result` varchar(4) DEFAULT NULL,
  `counterparty_id` varchar(50) NOT NULL,
  `market_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `username_id` varchar(50) NOT NULL,
  PRIMARY KEY (`betid`),
  KEY `betchyaApp_bet_counterparty_id_522c5711_fk_betchyaAp` (`counterparty_id`),
  KEY `betchyaApp_bet_market_id_9b10d531_fk_betchyaApp_market_marketid` (`market_id`),
  KEY `betchyaApp_bet_team_id_33ba845b_fk_betchyaApp_team_teamid` (`team_id`),
  KEY `betchyaApp_bet_username_id_459c1443_fk_betchyaApp_user_username` (`username_id`),
  CONSTRAINT `betchyaApp_bet_counterparty_id_522c5711_fk_betchyaAp` FOREIGN KEY (`counterparty_id`) REFERENCES `betchyaApp_user` (`username`),
  CONSTRAINT `betchyaApp_bet_market_id_9b10d531_fk_betchyaApp_market_marketid` FOREIGN KEY (`market_id`) REFERENCES `betchyaApp_market` (`marketid`),
  CONSTRAINT `betchyaApp_bet_team_id_33ba845b_fk_betchyaApp_team_teamid` FOREIGN KEY (`team_id`) REFERENCES `betchyaApp_team` (`teamid`),
  CONSTRAINT `betchyaApp_bet_username_id_459c1443_fk_betchyaApp_user_username` FOREIGN KEY (`username_id`) REFERENCES `betchyaApp_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_bet`
--

LOCK TABLES `betchyaApp_bet` WRITE;
/*!40000 ALTER TABLE `betchyaApp_bet` DISABLE KEYS */;
/*!40000 ALTER TABLE `betchyaApp_bet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_card`
--

DROP TABLE IF EXISTS `betchyaApp_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_card` (
  `cardid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `cardname` varchar(100) NOT NULL,
  `cardnumber` varchar(50) NOT NULL,
  `expirydate` date NOT NULL,
  `securitycode` int(11) NOT NULL,
  PRIMARY KEY (`cardid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_card`
--

LOCK TABLES `betchyaApp_card` WRITE;
/*!40000 ALTER TABLE `betchyaApp_card` DISABLE KEYS */;
INSERT INTO `betchyaApp_card` VALUES (1,'u1','u1','1111111111111111','2010-10-01',111),(2,'Betchya','Betchya','1111111111111111','2010-10-01',111);
/*!40000 ALTER TABLE `betchyaApp_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_contact`
--

DROP TABLE IF EXISTS `betchyaApp_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_contact` (
  `usernamea_id` varchar(50) NOT NULL,
  `usernameb_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usernamea_id`),
  UNIQUE KEY `betchyaApp_contact_usernamea_id_usernameb_id_a6b00104_uniq` (`usernamea_id`,`usernameb_id`),
  KEY `betchyaApp_contact_usernameb_id_f1f04206_fk_betchyaAp` (`usernameb_id`),
  CONSTRAINT `betchyaApp_contact_usernamea_id_128a8174_fk_betchyaAp` FOREIGN KEY (`usernamea_id`) REFERENCES `betchyaApp_user` (`username`),
  CONSTRAINT `betchyaApp_contact_usernameb_id_f1f04206_fk_betchyaAp` FOREIGN KEY (`usernameb_id`) REFERENCES `betchyaApp_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_contact`
--

LOCK TABLES `betchyaApp_contact` WRITE;
/*!40000 ALTER TABLE `betchyaApp_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `betchyaApp_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_contactrequest`
--

DROP TABLE IF EXISTS `betchyaApp_contactrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_contactrequest` (
  `sendingusername_id` varchar(50) NOT NULL,
  `receivingusername_id` varchar(50) NOT NULL,
  PRIMARY KEY (`sendingusername_id`),
  UNIQUE KEY `betchyaApp_contactreques_sendingusername_id_recei_6fe4b347_uniq` (`sendingusername_id`,`receivingusername_id`),
  KEY `betchyaApp_contactre_receivingusername_id_b1f6412b_fk_betchyaAp` (`receivingusername_id`),
  CONSTRAINT `betchyaApp_contactre_receivingusername_id_b1f6412b_fk_betchyaAp` FOREIGN KEY (`receivingusername_id`) REFERENCES `betchyaApp_user` (`username`),
  CONSTRAINT `betchyaApp_contactre_sendingusername_id_06a471ae_fk_betchyaAp` FOREIGN KEY (`sendingusername_id`) REFERENCES `betchyaApp_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_contactrequest`
--

LOCK TABLES `betchyaApp_contactrequest` WRITE;
/*!40000 ALTER TABLE `betchyaApp_contactrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `betchyaApp_contactrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_game`
--

DROP TABLE IF EXISTS `betchyaApp_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_game` (
  `gameid` int(11) NOT NULL AUTO_INCREMENT,
  `startdatetime` datetime(6) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `teama_id` int(11) NOT NULL,
  `teamb_id` int(11) NOT NULL,
  PRIMARY KEY (`gameid`),
  KEY `betchyaApp_game_teama_id_5a2751bc_fk_betchyaApp_team_teamid` (`teama_id`),
  KEY `betchyaApp_game_teamb_id_36ae5686_fk_betchyaApp_team_teamid` (`teamb_id`),
  CONSTRAINT `betchyaApp_game_teama_id_5a2751bc_fk_betchyaApp_team_teamid` FOREIGN KEY (`teama_id`) REFERENCES `betchyaApp_team` (`teamid`),
  CONSTRAINT `betchyaApp_game_teamb_id_36ae5686_fk_betchyaApp_team_teamid` FOREIGN KEY (`teamb_id`) REFERENCES `betchyaApp_team` (`teamid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_game`
--

LOCK TABLES `betchyaApp_game` WRITE;
/*!40000 ALTER TABLE `betchyaApp_game` DISABLE KEYS */;
INSERT INTO `betchyaApp_game` VALUES (2,'2018-10-10 09:04:52.000000','Rome',1,2),(3,'2018-10-03 09:50:49.000000','US',5,6),(4,'2018-10-30 09:51:07.000000','US',3,4),(5,'2018-10-30 09:51:35.000000','Madrid',13,1);
/*!40000 ALTER TABLE `betchyaApp_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_market`
--

DROP TABLE IF EXISTS `betchyaApp_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_market` (
  `marketid` int(11) NOT NULL AUTO_INCREMENT,
  `oddsa` double NOT NULL,
  `oddsb` double NOT NULL,
  `game_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`marketid`),
  KEY `betchyaApp_market_game_id_9246505e_fk_betchyaApp_game_gameid` (`game_id`),
  KEY `betchyaApp_market_sport_id_c4b503ea_fk_betchyaApp_sport_sportid` (`sport_id`),
  CONSTRAINT `betchyaApp_market_game_id_9246505e_fk_betchyaApp_game_gameid` FOREIGN KEY (`game_id`) REFERENCES `betchyaApp_game` (`gameid`),
  CONSTRAINT `betchyaApp_market_sport_id_c4b503ea_fk_betchyaApp_sport_sportid` FOREIGN KEY (`sport_id`) REFERENCES `betchyaApp_sport` (`sportid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_market`
--

LOCK TABLES `betchyaApp_market` WRITE;
/*!40000 ALTER TABLE `betchyaApp_market` DISABLE KEYS */;
INSERT INTO `betchyaApp_market` VALUES (2,1.5,4.2,2,1),(3,1.8,1.2,3,3),(4,1.2,1.5,4,2),(5,2.4,2.8,5,1),(6,2.2,3.5,2,1);
/*!40000 ALTER TABLE `betchyaApp_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_sport`
--

DROP TABLE IF EXISTS `betchyaApp_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_sport` (
  `sportid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sportid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_sport`
--

LOCK TABLES `betchyaApp_sport` WRITE;
/*!40000 ALTER TABLE `betchyaApp_sport` DISABLE KEYS */;
INSERT INTO `betchyaApp_sport` VALUES (1,'Soccer'),(2,'Basketball'),(3,'Football');
/*!40000 ALTER TABLE `betchyaApp_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_team`
--

DROP TABLE IF EXISTS `betchyaApp_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_team` (
  `teamid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`teamid`),
  KEY `betchyaApp_team_sport_id_bf4403f2_fk_betchyaApp_sport_sportid` (`sport_id`),
  CONSTRAINT `betchyaApp_team_sport_id_bf4403f2_fk_betchyaApp_sport_sportid` FOREIGN KEY (`sport_id`) REFERENCES `betchyaApp_sport` (`sportid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_team`
--

LOCK TABLES `betchyaApp_team` WRITE;
/*!40000 ALTER TABLE `betchyaApp_team` DISABLE KEYS */;
INSERT INTO `betchyaApp_team` VALUES (1,'Milan',1),(2,'Lazio',1),(3,'Bulls',2),(4,'Celtics',2),(5,'Texas',3),(6,'Florida',3),(7,'Ohio',3),(8,'Alabama',3),(9,'Hornets',2),(10,'Warriors',2),(11,'New Orleans',2),(12,'Man UTD',1),(13,'Real Madrid',1),(14,'Arsenal',1),(15,'Rome',1);
/*!40000 ALTER TABLE `betchyaApp_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `betchyaApp_user`
--

DROP TABLE IF EXISTS `betchyaApp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `betchyaApp_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `balance` double NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `primarycardid_id` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `betchyaApp_user_primarycardid_id_fea666df_fk_betchyaAp` (`primarycardid_id`),
  CONSTRAINT `betchyaApp_user_primarycardid_id_fea666df_fk_betchyaAp` FOREIGN KEY (`primarycardid_id`) REFERENCES `betchyaApp_card` (`cardid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_user`
--

LOCK TABLES `betchyaApp_user` WRITE;
/*!40000 ALTER TABLE `betchyaApp_user` DISABLE KEYS */;
INSERT INTO `betchyaApp_user` VALUES ('Betchya','pbkdf2_sha256$120000$Fgzf3m56YobB$c0bTpSavETCRI0KTLPFznywvWjkFhsecrBB3tjbRwmA=',0,'Betchya','Betchya','111','Betchya@Betchya.com','12345678',2),('u1','pbkdf2_sha256$120000$b3Xam2NHflhX$KO1qvZgQcVmI/i+TGHNlgoR6FbOB7wnP/PblzlIXMv0=',1000,'u1','u1','111','user1@aaa.com','12345678',1);
/*!40000 ALTER TABLE `betchyaApp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-31 23:50:02
