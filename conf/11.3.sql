-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 45.63.29.1    Database: suibian
-- ------------------------------------------------------
-- Server version	5.7.24

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_bet`
--

LOCK TABLES `betchyaApp_bet` WRITE;
/*!40000 ALTER TABLE `betchyaApp_bet` DISABLE KEYS */;
INSERT INTO `betchyaApp_bet` VALUES (1,20,'Yes',NULL,'Betchya',4,4,'1234');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_card`
--

LOCK TABLES `betchyaApp_card` WRITE;
/*!40000 ALTER TABLE `betchyaApp_card` DISABLE KEYS */;
INSERT INTO `betchyaApp_card` VALUES (1,'u1','u1','1111111111111111','2010-10-01',111),(2,'Betchya','Betchya','1111111111111111','2010-10-01',111),(3,'1234','abc','1111','2021-08-01',123);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_game`
--

LOCK TABLES `betchyaApp_game` WRITE;
/*!40000 ALTER TABLE `betchyaApp_game` DISABLE KEYS */;
INSERT INTO `betchyaApp_game` VALUES (2,'2018-10-10 09:04:52.000000','Rome',1,2),(3,'2018-10-03 09:50:49.000000','US',5,6),(4,'2018-10-30 09:51:07.000000','US',3,4),(5,'2018-10-30 09:51:35.000000','Madrid',13,1),(6,'2018-10-24 14:00:00.000000','GB',16,17),(7,'2018-10-24 15:30:00.000000','GB',18,19),(8,'2018-10-24 15:30:00.000000','GB',20,21),(9,'2018-10-24 16:00:00.000000','GB',22,23),(10,'2018-10-24 16:00:00.000000','GB',24,25),(11,'2018-10-24 16:00:00.000000','GB',26,27),(12,'2018-10-24 16:00:00.000000','GB',28,29),(13,'2018-10-24 16:00:00.000000','GB',30,31),(14,'2018-10-24 16:00:00.000000','GB',32,33),(15,'2018-10-24 16:00:00.000000','GB',34,35),(16,'2018-10-24 16:00:00.000000','GB',36,37),(17,'2018-10-24 16:00:00.000000','GB',38,39),(18,'2018-10-24 16:00:00.000000','GB',40,41),(19,'2018-10-24 16:00:00.000000','GB',42,43),(20,'2018-10-24 16:00:00.000000','GB',44,45),(21,'2018-10-24 16:30:00.000000','GB',46,47),(22,'2018-10-24 16:30:00.000000','GB',48,49),(23,'2018-10-24 17:00:00.000000','GB',50,51),(24,'2018-10-24 17:00:00.000000','GB',52,53),(25,'2018-10-24 17:00:00.000000','GB',54,55),(26,'2018-10-24 17:00:00.000000','GB',56,57),(27,'2018-10-24 17:00:00.000000','GB',58,59),(28,'2018-10-24 17:00:00.000000','GB',60,61),(29,'2018-10-24 17:30:00.000000','GB',62,63),(30,'2018-10-24 17:30:00.000000','GB',64,65),(31,'2018-10-24 17:30:00.000000','GB',66,67),(32,'2018-10-24 18:00:00.000000','GB',68,69),(33,'2018-10-24 18:00:00.000000','GB',70,71),(34,'2018-10-24 18:00:00.000000','GB',72,73),(35,'2018-10-24 18:00:00.000000','GB',74,75),(36,'2018-10-24 18:00:00.000000','GB',76,77),(37,'2018-10-24 18:00:00.000000','GB',78,79),(38,'2018-10-24 18:00:00.000000','GB',80,81),(39,'2018-10-24 18:00:00.000000','GB',80,81),(40,'2018-10-24 18:30:00.000000','GB',82,83),(41,'2018-10-24 18:30:00.000000','GB',84,85),(42,'2018-10-24 18:30:00.000000','GB',86,87),(43,'2018-10-24 18:30:00.000000','GB',88,89),(44,'2018-10-24 18:30:00.000000','GB',90,91),(45,'2018-10-24 18:30:00.000000','GB',92,93),(46,'2018-10-24 18:30:00.000000','GB',94,95),(47,'2018-10-24 18:30:00.000000','GB',96,97),(48,'2018-10-24 22:15:00.000000','GB',98,99),(49,'2018-10-24 23:10:00.000000','GB',100,101),(50,'2018-10-24 23:10:00.000000','GB',102,103),(51,'2018-10-24 23:40:00.000000','GB',104,105),(52,'2018-10-25 00:10:00.000000','GB',106,107),(53,'2018-10-25 00:10:00.000000','GB',108,109),(54,'2018-10-25 00:40:00.000000','GB',110,111),(55,'2018-10-25 02:10:00.000000','GB',112,113),(56,'2018-10-25 02:10:00.000000','GB',114,115),(57,'2018-10-25 08:50:00.000000','AU',116,117),(58,'2018-10-25 09:50:00.000000','AU',118,119),(59,'2018-10-27 04:00:00.000000','AU',120,121),(60,'2018-10-27 08:50:00.000000','AU',122,123),(61,'2018-10-28 01:20:00.000000','AU',124,125),(62,'2018-10-28 03:50:00.000000','AU',126,127),(63,'2018-10-29 08:50:00.000000','AU',128,129),(64,'2018-10-26 06:35:00.000000','NZ',130,131);
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `betchyaApp_team`
--

LOCK TABLES `betchyaApp_team` WRITE;
/*!40000 ALTER TABLE `betchyaApp_team` DISABLE KEYS */;
INSERT INTO `betchyaApp_team` VALUES (1,'Milan',1),(2,'Lazio',1),(3,'Bulls',2),(4,'Celtics',2),(5,'Texas',3),(6,'Florida',3),(7,'Ohio',3),(8,'Alabama',3),(9,'Hornets',2),(10,'Warriors',2),(11,'New Orleans',2),(12,'Man UTD',1),(13,'Real Madrid',1),(14,'Arsenal',1),(15,'Rome',1),(16,'Nadezhda Ladies',2),(17,'USK Praha Ladies',2),(18,'Tampereen Pyrinto',2),(19,'Salon Vilpas',2),(20,'Kouvot',2),(21,'Ura Basket',2),(22,'Olympiakos Pireaus Ladies',2),(23,'Fenerbahce Ladies',2),(24,'BK Pardubice',2),(25,'Avtodor Saratov',2),(26,'BC Dnipro',2),(27,'Aris Thessaloniki',2),(28,'Istanbul BBK',2),(29,'Charleroi',2),(30,'Besiktas',2),(31,'Strasbourg',2),(32,'Steaua',2),(33,'KB Prishtina',2),(34,'BC Rytas',2),(35,'Torino',2),(36,'Balkan Botevgrad',2),(37,'Tsmoki Minsk',2),(38,'Ironi Ness Ziona',2),(39,'Den Bosch',2),(40,'Lietkabelis',2),(41,'Basketball Nymburk',2),(42,'Galatasaray',2),(43,'Monaco',2),(44,'BC Cherkasski Mavpy',2),(45,'Bakken Bears',2),(46,'TTT Riga Ladies',2),(47,'Dynamo Kursk Ladies',2),(48,'AEK Athens',2),(49,'Brose Baskets',2),(50,'Charleville-Mezieres Ladies',2),(51,'Sopron Ladies',2),(52,'Zenit St Petersburg',2),(53,'Valencia BC',2),(54,'Svendborg Rabbits',2),(55,'Stevnsgade Supermen',2),(56,'Falco-Szova KC',2),(57,'Leicester Riders',2),(58,'GTK Gliwice',2),(59,'AZS Koszalin',2),(60,'MKS Polkowice Ladies',2),(61,'Bourges Ladies',2),(62,'KK Cedevita',2),(63,'Lokomotiv Kuban',2),(64,'Pinar Karsiyaka',2),(65,'Donar Groningen',2),(66,'Fraport Skyliners',2),(67,'Mornar',2),(68,'ZZ Leiden',2),(69,'CSM Oradea',2),(70,'S.oliver Baskets',2),(71,'Sakarya BSB',2),(72,'Antwerp Giants',2),(73,'Hapoel Jerusalem',2),(74,'Castors Braine Ladies',2),(75,'Schio Ladies',2),(76,'Andorra',2),(77,'Ratiopharm Ulm',2),(78,'BBC Bayreuth',2),(79,'Promitheas',2),(80,'Olimpija Ljubljana',2),(81,'Virtus Bologna',2),(82,'Varese',2),(83,'FC Porto',2),(84,'Villeneuve dAscq Ladies',2),(85,'UMMC Ekaterinburg Ladie',2),(86,'Dijon',2),(87,'Fuenlabrada',2),(88,'Basket Brescia',2),(89,'Crvena Zvezda Belgrade',2),(90,'BC Oostende',2),(91,'Neptunas Klaipeda',2),(92,'Dinamo Sassari',2),(93,'Szolnoki Olaj',2),(94,'London Lions',2),(95,'Cheshire Phoenix',2),(96,'Candelas Breogan',2),(97,'Joventut',2),(98,'Paulistano',2),(99,'minas Tenis Clube',2),(100,'Brooklyn Nets',2),(101,'Cleveland Cavaliers',2),(102,'Dallas Mavericks',2),(103,'Atlanta Hawks',2),(104,'New York Knicks',2),(105,'Miami Heat',2),(106,'Charlotte Hornets',2),(107,'Chicago Bulls',2),(108,'Utah Jazz',2),(109,'Houston Rockets',2),(110,'Indiana Pacers',2),(111,'San Antonio Spurs',2),(112,'Memphis Grizzlies',2),(113,'Sacramento Kings',2),(114,'Los Angeles Lakers',2),(115,'Phoenix Suns',2),(116,'Brisbane Bullets',2),(117,'Perth Wildcats',2),(118,'Cairns Taipans',2),(119,'Adelaide 36ers',2),(120,'Perth Wildcats',2),(121,'Melbourne United',2),(122,'Illawarra Hawks',2),(123,'Brisbane Bullets',2),(124,'New Zealand Breakers',2),(125,'Adelaide 36ers',2),(126,'Sydney Kings',2),(127,'Cairns Taipans',2),(128,'Melbourne United',2),(129,'Illawarra Hawks',2),(130,'Waikato',3),(131,'Otago',3);
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
INSERT INTO `betchyaApp_user` VALUES ('1234','pbkdf2_sha256$120000$QEOtLcEsbm6g$5cWQ5Q2/gG7lJjiC0HB2N4AzI3Qx0GlZ/YoS/MP9txA=',30,'1244444','1244234','13413','231243123@32424.com','342341354315',3),('Betchya','pbkdf2_sha256$120000$Fgzf3m56YobB$c0bTpSavETCRI0KTLPFznywvWjkFhsecrBB3tjbRwmA=',0,'Betchya','Betchya','111','Betchya@Betchya.com','12345678',2),('u1','pbkdf2_sha256$120000$b3Xam2NHflhX$KO1qvZgQcVmI/i+TGHNlgoR6FbOB7wnP/PblzlIXMv0=',1000,'u1','u1','111','user1@aaa.com','12345678',1);
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

-- Dump completed on 2018-11-02  4:57:42
