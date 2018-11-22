-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: joinme
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_images`
--

DROP TABLE IF EXISTS `activity_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activity_images` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image` longblob NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_id_UNIQUE` (`image_id`),
  KEY `activity_images_idx` (`activity_id`),
  CONSTRAINT `activity_images` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_images`
--

LOCK TABLES `activity_images` WRITE;
/*!40000 ALTER TABLE `activity_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_message`
--

DROP TABLE IF EXISTS `activity_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activity_message` (
  `activity_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `message` varchar(45) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(2) NOT NULL,
  `reply_user_message_id` int(11) NOT NULL,
  PRIMARY KEY (`activity_message_id`),
  UNIQUE KEY `idactivity_message_id_UNIQUE` (`activity_message_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `activity_id` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_message`
--

LOCK TABLES `activity_message` WRITE;
/*!40000 ALTER TABLE `activity_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_status`
--

DROP TABLE IF EXISTS `app_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `app_status` (
  `app_status_id` int(10) unsigned NOT NULL,
  `app_download` int(10) unsigned DEFAULT NULL,
  `web_app_visit` int(10) unsigned DEFAULT NULL,
  `app_visit` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`app_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_status`
--

LOCK TABLES `app_status` WRITE;
/*!40000 ALTER TABLE `app_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contact` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_f_idx` (`user_id`),
  CONSTRAINT `contact_foreign_key` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `created_activity_list`
--

DROP TABLE IF EXISTS `created_activity_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `created_activity_list` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(45) NOT NULL,
  `activity_description` varchar(300) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `tag_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `activity_date` datetime DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cost` int(10) unsigned DEFAULT NULL,
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity_id`),
  UNIQUE KEY `activity_id_UNIQUE` (`activity_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `tag_id_idx` (`tag_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `created_activity_list`
--

LOCK TABLES `created_activity_list` WRITE;
/*!40000 ALTER TABLE `created_activity_list` DISABLE KEYS */;
INSERT INTO `created_activity_list` VALUES (3,'cricket','love to play						','\0',1,70,NULL,'2018-10-27 02:05:11',10,'23.27570735926235','77.45217561721802',6),(4,'cricket','love to play						','\0',1,70,NULL,'2018-10-27 02:05:29',10,'23.27570735926235','77.45217561721802',3),(5,' bnm,.','											Description of the activity\r\n     ','\0',1,70,NULL,'2018-10-27 02:08:49',77777,'23.273047621659554','77.45163706283483',0),(6,'basketball','need 10 players','1',1,62,NULL,'2018-10-27 11:16:27',10,'23.247856454446544','75.848414169468',0),(7,'dance','group dance','A',10,63,NULL,'2018-10-27 11:25:00',150,'23.21521445656746545','77.24897564875564',0),(8,'music','bollywood','A',10,64,NULL,'2018-10-27 11:25:00',400,'23.454845445454','77.4587457457845',0),(9,'travel','hilly areas','A',10,65,NULL,'2018-10-27 11:25:00',12000,'23.458756','77.45845485',0),(10,'hill climbing','2000 m','A',11,73,NULL,'2018-10-27 11:34:51',5000,'23.73872696','77.576782',0),(11,'foreign tour','dubai','A',11,67,NULL,'2018-10-27 11:37:52',50000,'23.3637','77.5262718',0),(12,'museum','delhi tour','A',11,72,NULL,'2018-10-27 11:37:52',23000,'23.44554','77.4322345',0),(13,'ludo','4 players','A',12,67,NULL,'2018-10-27 11:41:19',100,'23.64623','77.34567544',0),(14,'chess','5 minute game','A',12,71,NULL,'2018-10-27 11:41:19',100,'23.232323','77.3344566',0),(15,'chain reaction','maximum 4 players','A',12,70,NULL,'2018-10-27 11:41:19',50,'23.33445433','77.47568475',0),(16,'Sherya ghoshal show','Campion auditorium','A',13,66,NULL,'2018-10-27 11:47:24',500,'23.788657','77.4535',0),(17,'Sonu nigam show','open camp','A',13,65,NULL,'2018-10-27 11:47:24',600,'23.6767','77.64646',0),(18,'Arijit singh show','Kalindi palace','A',13,64,NULL,'2018-10-27 11:47:24',400,'23.45545','77.646',0),(19,'Ramesh baba aarti program','Gurukul ','A',14,70,NULL,'2018-10-27 11:47:24',200,'23.3546','77.4433333333',0),(20,'Pandit guru ji bhajan sandhya','Samta ashram','A',14,71,NULL,'2018-10-27 11:47:24',150,'23.5464','77.544444',2),(21,'Baba rameshwar path puja','Pujit ji rent house','A',14,72,NULL,'2018-10-27 11:47:24',300,'23.43534','77.5444444',0),(22,'Java coaching ','2 days camp ,lnct audi','A',15,71,NULL,'2018-10-27 11:55:45',1000,'23.445555','77.444332',0),(23,'Android show','24 hrs non stop','A',15,70,NULL,'2018-10-27 11:55:45',700,'23.333333','77.5443',0),(24,'C# programming','Maha mangeshkar audi','A',15,69,NULL,'2018-10-27 11:55:45',500,'23.222222','77.5543',0),(25,'Traditional twist','Fashion doom,indore','A',16,68,NULL,'2018-10-27 11:55:45',500,'23.444444567','77.3322134',0),(26,'Extra ordinary tadka','Fast and furious stadium','A',16,67,NULL,'2018-10-27 11:55:45',500,'23.4444456677','77.44444',0),(27,'Fashion bingo','LNCT auditorium','A',16,66,NULL,'2018-10-27 11:55:45',500,'23.44566','77.66555',0),(28,'landscape drawing','bharat bhavan','A',17,65,NULL,'2018-10-27 12:00:50',100,'23.2523726','77.1623761',0),(29,'Card making','Laichuk park','A',17,62,NULL,'2018-10-27 12:03:36',100,'23.45678','77.6666666',0),(30,'Portrait sketching','Alpino auditorium','A',17,63,NULL,'2018-10-27 12:03:36',100,'23.45555','77.65434',0),(31,'dance','pop','\0',1,70,NULL,'2018-10-27 15:30:51',0,'23.285080358456515','77.44776201160892',0),(34,'swimming','learn swimming here','\0',28,70,NULL,'2018-10-28 00:14:34',0,'22.76265813471132','77.71650195121765',53);
/*!40000 ALTER TABLE `created_activity_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_activity_list`
--

DROP TABLE IF EXISTS `selected_activity_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `selected_activity_list` (
  `selected_activity_list_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity_id` int(10) unsigned NOT NULL,
  `status` char(2) NOT NULL DEFAULT 'AA',
  PRIMARY KEY (`selected_activity_list_id`),
  UNIQUE KEY `idselected_activity_list_id_UNIQUE` (`selected_activity_list_id`),
  KEY `activity_id_idx` (`activity_id`),
  CONSTRAINT `select_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `created_activity_list` (`activity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_activity_list`
--

LOCK TABLES `selected_activity_list` WRITE;
/*!40000 ALTER TABLE `selected_activity_list` DISABLE KEYS */;
INSERT INTO `selected_activity_list` VALUES (1,62,'2018-10-28 03:35:51',3,'AA'),(2,62,'2018-10-28 03:36:51',3,'AA'),(3,62,'2018-10-28 03:39:27',3,'AA'),(4,62,'2018-10-28 03:47:18',3,'AA'),(5,62,'2018-10-28 03:50:57',3,'AA'),(6,62,'2018-10-28 03:53:23',4,'AA');
/*!40000 ALTER TABLE `selected_activity_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tags` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  `tag_description` varchar(300) DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tag_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_id_UNIQUE` (`tag_id`),
  UNIQUE KEY `tag_UNIQUE` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'outdoor games','cricket,tanis etc','2018-10-26 23:37:42',NULL),(5,'development','Moral of the story is Game development is always in demand profession ','2018-10-27 19:08:32',NULL),(10,'hobby','dance','2018-10-27 10:51:35',NULL),(11,'travel','bike,car','2018-10-27 11:05:23',NULL),(12,'indoor games','carrom chess ludo','2018-10-27 11:05:23',NULL),(13,'concert','music ','2018-10-27 11:05:23',NULL),(14,'devotional','bhajan','2018-10-27 11:05:23',NULL),(15,'coaching','java android','2018-10-27 11:05:23',NULL),(16,'fashion','western indian','2018-10-27 11:05:23',NULL),(17,'painting','painting all types','2018-10-27 11:58:55',NULL),(18,'jobs','search job for you','2018-10-27 12:23:46',NULL),(19,'home tutions','get home tutors','2018-10-27 12:23:46',NULL),(21,'bobby','happy hoby','2018-10-27 15:31:12',NULL),(28,'competition','you can be a part of a competition ','2018-10-28 00:09:44',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `about` varchar(45) DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(45) NOT NULL,
  `rating` int(2) DEFAULT NULL,
  `coins` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `unique_id_UNIQUE` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (62,'sud','Sudhanshu','Gour',NULL,NULL,'8109049748',NULL,NULL,NULL,'2018-10-25 14:25:20','8109049748',NULL,NULL),(63,'jatin24','Jatin','Namdev',NULL,NULL,'7047059357',NULL,NULL,NULL,'2018-10-25 14:25:20','7047059357',NULL,NULL),(64,'lokesh','Lokesh','Sarathe',NULL,NULL,'7748993409',NULL,NULL,NULL,'2018-10-25 14:25:20','7748993409',NULL,NULL),(65,'sumit','Sumit','Mishra',NULL,NULL,'7049458212',NULL,NULL,NULL,'2018-10-25 14:31:05','7049458212',NULL,NULL),(66,'akshay','Akshay','Upadhyay',NULL,NULL,'8982405026',NULL,NULL,NULL,'2018-10-25 14:31:05','8982405026',NULL,NULL),(67,'ajay','Ajay','Singh',NULL,NULL,'9752342810',NULL,NULL,NULL,'2018-10-25 14:31:05','9752342810',NULL,NULL),(68,'akash','Akash','jain',NULL,NULL,'7987295842',NULL,NULL,NULL,'2018-10-25 14:44:27','7987295842',NULL,NULL),(69,'akshat','Akshat','Tamrakar',NULL,NULL,'8962303313',NULL,NULL,NULL,'2018-10-25 14:44:27','8962303313',NULL,NULL),(70,'aman','Aman','Gupta',NULL,NULL,'9754810898',NULL,NULL,NULL,'2018-10-25 14:44:27','9754810898',NULL,NULL),(71,'geetu','Geetesh','Namdev',NULL,NULL,'8839835430',NULL,NULL,NULL,'2018-10-25 14:44:27','8839835430',NULL,NULL),(72,'8888888888','lok','lok',NULL,NULL,'8888888888',NULL,'\0',NULL,'2018-10-26 21:10:36','8888888888',0,0),(73,'9999999999','sssss','sssss',NULL,NULL,'9999999999',NULL,'\0',NULL,'2018-10-26 21:20:12','9999999999',0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_message` (
  `user_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `reciever_id` int(10) unsigned NOT NULL,
  `message` varchar(45) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(2) NOT NULL,
  PRIMARY KEY (`user_message_id`),
  UNIQUE KEY `idactivity_message_id_UNIQUE` (`user_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-28 13:15:40
