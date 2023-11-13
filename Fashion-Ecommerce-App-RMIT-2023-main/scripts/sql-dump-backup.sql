-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: talsprddb02.int.its.rmit.edu.au    Database: COSC3046_2302_G2
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentBody` varchar(500) CHARACTER SET utf8 NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `threadID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `isArchive` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`commentID`),
  KEY `threadID` (`threadID`),
  KEY `userID` (`userID`),
  CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`threadID`) REFERENCES `Thread` (`threadID`),
  CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,'lol','2023-10-13 00:12:40',16,1,1),(2,'hi from web','2023-10-13 00:54:48',16,1,1),(3,'Incredible ','2023-10-13 00:58:18',16,1,0),(4,'epic','2023-10-13 01:02:42',15,1,0),(5,'very epic.','2023-10-13 01:03:28',15,1,0),(6,'booo','2023-10-13 01:43:52',16,1,1),(7,'hello boys this looks good','2023-10-13 08:56:09',16,1,0),(8,'Nice!','2023-10-14 09:38:10',16,1,0),(9,'yaas','2023-10-14 12:21:47',16,1,0),(10,'yas','2023-10-15 08:55:52',15,1,0),(11,'pwoducts ','2023-10-15 23:28:37',15,1,0),(12,'test','2023-10-16 03:58:27',16,1,0),(13,'UwU','2023-10-18 23:04:38',16,1,0),(14,'testing with login :)','2023-10-19 22:10:18',21,7,1),(15,'test','2023-10-20 23:03:19',16,7,0),(16,'test','2023-10-20 23:28:26',16,7,0),(17,'testing','2023-10-20 23:28:43',23,7,0),(18,'','2023-10-20 23:39:17',24,21,0),(19,'CSS looks great.','2023-10-20 23:39:47',24,21,0),(20,'Nice!','2023-10-25 22:30:24',26,10,0),(21,'Testing the comment archive ','2023-10-28 12:51:43',21,10,0);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback` (
  `feedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `feedbackName` varchar(500) CHARACTER SET utf8 NOT NULL,
  `feedbackEmail` varchar(500) CHARACTER SET utf8 NOT NULL,
  `feedbackQues` varchar(500) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`feedbackID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (1,'user','user@gmail.com','will you help me pls? uwu'),(2,'user','user@gmail.com','gmail'),(3,'f','f@gmail.com','kmvosnv sev'),(4,'User','s40009363@student.rmit.edu.au','Do you provide any other categories?'),(5,'User','s40009363@student.rmit.edu.au','Do you provide any other categories?'),(6,'kyle','kyle@kyle.com','what isthis website about??'),(7,'1','1@2.com','1');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikedThreads`
--

DROP TABLE IF EXISTS `LikedThreads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LikedThreads` (
  `LikeID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `threadID` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LikeID`),
  UNIQUE KEY `uniqueLike` (`userID`,`threadID`),
  KEY `threadID` (`threadID`),
  CONSTRAINT `LikedThreads_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  CONSTRAINT `LikedThreads_ibfk_2` FOREIGN KEY (`threadID`) REFERENCES `Thread` (`threadID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikedThreads`
--

LOCK TABLES `LikedThreads` WRITE;
/*!40000 ALTER TABLE `LikedThreads` DISABLE KEYS */;
INSERT INTO `LikedThreads` VALUES (36,22,23,'2023-10-27 13:37:02'),(37,22,24,'2023-10-27 13:37:06'),(40,7,25,'2023-10-28 01:30:50'),(41,7,23,'2023-10-28 01:31:23'),(42,10,21,'2023-10-28 12:52:39'),(43,10,23,'2023-11-01 06:11:26'),(44,7,24,'2023-11-01 22:39:10');
/*!40000 ALTER TABLE `LikedThreads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyGuests`
--

DROP TABLE IF EXISTS `MyGuests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyGuests` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyGuests`
--

LOCK TABLES `MyGuests` WRITE;
/*!40000 ALTER TABLE `MyGuests` DISABLE KEYS */;
/*!40000 ALTER TABLE `MyGuests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productImage` longblob NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDesc` varchar(1000) DEFAULT NULL,
  `productPrice` int(11) NOT NULL,
  `productStock` int(11) NOT NULL,
  `size` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'../assets/images/TeeShirt-1.png','Premium first edition smiley T-shirt','This white t-shirt features a playful graphic design that is sure to turn heads. The design consists of a red circle with a smiley face in it, complete with Xs for eyes and a tongue sticking out. Above the circle, you\'ll find the text \'DELUXE\' in bold, red, and black letters, while below the circle, you\'ll find the text \'SOCIETY\' in the same font and colors. Made from high-quality materials, this t-shirt is both comfortable and durable, making it perfect for everyday wear. Whether you\'re running errands or hanging out with friends, this t-shirt is sure to make a statement.',55,100,NULL),(2,'../assets/images/TeeShirt-2.png','Premium limited edition white T-shirt','Introducing the Deluxe Society T-Shirt, the perfect addition to your wardrobe! This classic white t-shirt features a bold graphic design that is sure to turn heads. The black & red circle with black \"D\" and \"S\" inside it, along with the text \"Deluxe Society\" in black and red, make for an eye-catching design that is both stylish and unique. Made from high-quality materials, this t-shirt is comfortable to wear and will last you for years to come.',55,100,NULL),(3,'../assets/images/TeeShirt-3.png','Premium worldwide white T-shirt','Introducing the Deluxe Society T-Shirt, the perfect addition to your wardrobe! This classic white t-shirt features a bold graphic design that is sure to turn heads. The circle below the text \"Deluxe Society\" depicts people in a globe worldwide in red,black & purple make for an eye-catching design that is both stylish and unique. Made from high-quality materials, this t-shirt is comfortable to wear and will last you for years to come.',35,100,NULL),(4,'../assets/images/TeeShirt-4.png','Premium plain design T-shirt','Introducing our Deluxe Society t-shirt, the perfect addition to your wardrobe. This stylish white t-shirt features a black circle logo on the chest, with \"DELUXE SOCIETY\" written in white text and \"WEAR DRIP!\" in smaller text below. Made from high-quality cotton, this crew neck t-shirt is both comfortable and durable, making it perfect for everyday wear. Whether youâ€™re dressing up or dressing down, this versatile t-shirt is sure to become a staple in your wardrobe. Order yours today and experience the ultimate in style and comfort.',30,100,NULL),(5,'../assets/images/TeeShirt-5.png','Premium Space white T-shirt','Introducing our all-new Deluxe Society Space T-shirt, a celestial addition to your clothing collection. This unique white tee showcases a mesmerizing moon on a wooden stand, accompanied by the striking \"Deluxe Society Space\" text in bold black, and a touch of elegance with the same text in red cursive. Crafted from premium-quality cotton, this crew neck tee is a harmonious blend of comfort and durability, making it your ideal choice for everyday attire.',40,100,NULL),(10,'../assets/images/TeeShirt-6.png','Premium Halloween white T-shirt','This t-shirt design is perfect for those who love edgy and gothic fashion. The design features a skull with a sword through it and flames coming out of the eyes. The skull is gold in color, and the flames are pink. The text reads \"Deluxe Society Est. 2021\" in black letters in a gothic font. The design is for a white t-shirt. This t-shirt would be perfect for anyone who loves skulls, swords, and gothic fashion. It would make a great addition to any wardrobe and is sure to turn heads.',60,100,NULL);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team` (
  `studentID` int(11) NOT NULL,
  `studentName` varchar(100) NOT NULL,
  `studentRole` varchar(100) NOT NULL,
  `studentEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (4009361,'Ata Nader','Lead Frontend Developer','s4009361@student.rmit.edu.au'),(4014941,'Agampreet Singh','Lead Backend Developer','s4014941@student.rmit.edu.au'),(4018548,'Russell Sheikh','Database Engineer/Developer','s4018548@student.rmit.edu.au'),(40095666,'Abdul-Wakil Amida','Web Developer','s4009566@student.rmit.edu.au');
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Thread`
--

DROP TABLE IF EXISTS `Thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Thread` (
  `threadID` int(100) NOT NULL AUTO_INCREMENT,
  `threadTitle` varchar(100) NOT NULL,
  `threadDesc` varchar(500) NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `isArchive` tinyint(1) NOT NULL,
  `userID` int(11) NOT NULL,
  `threadIMG` longblob,
  `likeCount` int(11) DEFAULT '0',
  PRIMARY KEY (`threadID`),
  KEY `userID` (`userID`),
  CONSTRAINT `Thread_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Thread`
--

LOCK TABLES `Thread` WRITE;
/*!40000 ALTER TABLE `Thread` DISABLE KEYS */;
INSERT INTO `Thread` VALUES (15,'Products',' absolutely adore the trendy styles this store offers. The clothes fit so well and they look amazing. ','2023-10-13 10:53:58',0,1,NULL,0),(16,'Quality','The clothing from this brand is not only stylish but also incredibly comfortable, making it a top choice for both fashion-forward individuals and those seeking everyday wear.','2023-10-13 10:55:15',0,1,NULL,0),(17,'dwad','dawdwa','2023-10-19 18:33:26',1,7,NULL,0),(18,'thread with login test','thread with login test... im tired X|','2023-10-19 18:38:57',1,7,NULL,0),(19,'thread with login test','thread with login test... im tired X|','2023-10-19 18:39:51',1,7,NULL,0),(20,'efsefse','fsefsefesf','2023-10-19 18:40:00',0,7,NULL,0),(21,'Testing for admin archive tabel','TEST:Is the table dynamically fetching all data','2023-10-19 23:43:45',0,10,NULL,1),(22,'','','2023-10-20 16:41:08',1,7,NULL,0),(23,'Testing with img','Testing with img','2023-10-21 09:53:47',0,7,NULL,0),(29,'Post to try deleting ','Testing delete icon from threadOpen page','2023-11-01 22:55:14',1,10,NULL,0);
/*!40000 ALTER TABLE `Thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `userPassword` varchar(100) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `userIMG` longblob,
  `lastname` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `userAddress` varchar(500) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `userState` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `userCountry` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `isUserArchive` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `UQ_user_name` (`userName`),
  UNIQUE KEY `UQ_user_email` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'User','AYO','ayo@gmail.com',0,NULL,NULL,'S','A','909 f street',232143253,NULL,NULL,NULL,0),(6,'nfiebnfew','$2y$10$jcicryPXyNi1j5hDzgNsSOFvIWuFh8RMx/cz7d3CUSaZMOSw.HrdC','fBi@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `User` VALUES (7,'as','$2y$10$qzBwYqp0NBMXJaiaY04ZgO4lhkBuDrIi6bPk.Ny/yts/XI1bskVXK','s4014941@Gmail.com',0,NULL,NULL,'Demo','Group 2 ','abdefghijkl st',1122334455,3000,'Victoria','Australia',0);
INSERT INTO `User` VALUES (8,'rus','$2y$10$QsvPqiYDImq/Cx3HthhfxOfGZ2cPa91X61XpaY0qYuspHsvTaIBMm','rus@Gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(9,'russell','$2y$10$Dp5yzqLk8eEcgSBYKPyOF.MKMGottVw/xN9JbjwOo314rOWD6htie','russell1234@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(10,'AHN','$2y$10$Lm8O88vo5hzdGujOV2zPl.R4mA7nr04t4rzPlCAAzX6IiaVXqC3Bm','AHN@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(12,'as1','$2y$10$h2PNT5UZ8e1V0Z.81/1aB.YOoRK2ym4sclLYq7wPH.udqKV2frLa6','as1@Gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(14,'russell33','$2y$10$SA.3j3mOf9dX1lv5A7uOPOkQFijs4zE6AQciVevj8b4a/trVSE/1m','russell33@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(15,'demo','$2y$10$CNdOEPlQVXx/In3g8mVdYuXAzqkXxaki8r8L4/lLA9C5pO/yptUBC','Demo123456@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(17,'demo1','$2y$10$qQ9OihgUuN0uDCearxDvBet1KN2b2PigD3vXKDCTjA5319yMuuw8K','Demo1234567@Gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(19,'random','$2y$10$52jxdnkqthx9cigD6tZmnOGbMQbA/QXVaR15CPTOA2LC4nsWwLjGi','random1@Gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(20,'random2','$2y$10$NIOTX3wrIsrpYeMzaUoXbe6AEZSDKY1puhPfQC20C.dvQGG0KAqOW','random2@Gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(21,'russell4321','$2y$10$Y67jd9aqlq1YlKHydIKfOOfehhPB/9tlPixKuHpgvH5TnewenUvCC','russell4321@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(22,'agamsingh','$2y$10$XJpkD4Rwncw2aDpYIlGHuul3yBTOKXXeytEF16fPSbACHg94sXFXC','singh.agam0009@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(23,'russell789','$2y$10$IU/g7Mk3TTUWqL8QcRrlp.PytT1R5dCoiZxmu36buSU7tsB3gdMPm','kideyej146@ustorp.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(24,'jane','$2y$10$JsPTCXx0Yt5U/fM5u7rYy.7l.JS9AIu6yp2YZpEWjAvw4Q.rA6jBu','jane@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(27,'User 1','$2y$10$QiNKxKi0HL.oNv/NR.MtO.8xC72NYvsIGGhiFGRXumiNSnWgg/bhG','user1@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(28,'User 2','$2y$10$mFWkY4cFGVEkih0zQilNiuclVmMaYo.pCfvClMCDZBopuh0GSQyW2','user2@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(29,'Admin','$2y$10$aptf67M2g7gHPqk8J6SkAuTUgyGb0RmmOMLCI8Ic/lGj/v8TqOxXm','admin@gmail.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(30,'Trying','$2y$10$CEJmLLWPWcNqtmU2wTu7HOllOrL3qDfW7WPyWGr77Hj9h5s1fsn6m','try12@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(31,'try','Try56@gmail.com','try56@gmail.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(32,'AN','$2y$10$NtzcNYFfb6Y9b8GIm3foHO2TJdCVyAzzAr5gSGM1QuApuhC1l9VlS','s4009361@student.rmit.edu.au',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expiration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset`
--

LOCK TABLES `password_reset` WRITE;
/*!40000 ALTER TABLE `password_reset` DISABLE KEYS */;
INSERT INTO `password_reset` VALUES (10,'0','42ffaca6a4c913e1983e8ff28ad32eabc2d03c39b6ebd8309b1747a728c364e9','kideyej146@ustorp.com','2023-10-22 22:27:31','2023-10-22 22:27:31'),(14,'0','3f60ef2dcbb2fbefa7a0608f6f6148c12924b145905885ef026294fdf92f8715','s4009361@student.rmit.edu.au','2023-11-02 22:25:34','2023-11-02 22:25:34'),(16,'0','7ec92608460dacd424d3e3bafb1ee802338af168af3b0504ac0fed758261dc42','AHNAD2@schools.vic.edu.au','2023-11-02 23:04:27','2023-11-02 23:04:27'),(17,'0','2d7283f1d840c33c80efc1a0c3f3a12d6b8c4c97b9bbda2aee7b2a7292ffa557','AHNAD2@schools.vic.edu.au','2023-11-02 23:05:40','2023-11-02 23:05:40'),(18,'0','89dd11b717ccf8971fecea4c6c3c4bc8c1306a6a913b4549544d1bd76caf7eb6','AHNAD2@schools.vic.edu.au','2023-11-02 23:06:38','2023-11-02 23:06:38'),(19,'0','6839f9508594fafd62ab72b972877d936c5193c7ad5622955c864bd9bdd48577','AHNAD2@schools.vic.edu.au','2023-11-02 23:07:36','2023-11-02 23:07:36'),(20,'0','0da8ca8cdd34b203acebcc37f50d5dad9fbe9de3d7baf64619fc67a9c9068f1d','AHNAD2@schools.vic.edu.au','2023-11-02 23:08:01','2023-11-02 23:08:01');
/*!40000 ALTER TABLE `password_reset` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-03 18:30:57
