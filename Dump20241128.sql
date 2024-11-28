-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: twitter_data1
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `twitter_profiles`
--

DROP TABLE IF EXISTS `twitter_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) DEFAULT NULL,
  `profile_handle` varchar(255) DEFAULT NULL,
  `profile_bio` text,
  `profile_website` varchar(255) DEFAULT NULL,
  `profile_joining_date` varchar(255) DEFAULT NULL,
  `profile_following` varchar(50) DEFAULT NULL,
  `profile_followers` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_profiles`
--

LOCK TABLES `twitter_profiles` WRITE;
/*!40000 ALTER TABLE `twitter_profiles` DISABLE KEYS */;
INSERT INTO `twitter_profiles` VALUES (1,'GTN UK@GTNUK1',NULL,'Providing Entertainment & Travel to Commercial Radio. Reaching 28.9M weekly listeners. Winners of The Arqiva National Sales Team of the Year 2010, 2011 & 2016','https://t.co/aJKvkwp2dG','Joined October 2015','452',NULL),(2,'WhatsApp@WhatsApp',NULL,'push, push','https://t.co/ku2ShnxNRC','Joined May 2009',NULL,NULL),(3,'A & A Customs Broker@aacb_CBPTrade',NULL,'Customs Broker',NULL,'Joined December 2017','124',NULL),(4,'A&A Customs Brokers@aacbdotcom',NULL,'A & A Freight | Warehousing | Customs Brokerage | Helping people ship across borders.','http://t.co/laZo1M99c7','Joined August 2012','3,866',NULL),(5,'A&A Window Products@AAWindowPRODUCT',NULL,'A commercial glass and glazing company serving the window industry in New England since 1954. #SafetyQualityService','https://t.co/UrYUiEDwWi','Joined June 2015',NULL,NULL),(6,'A&B Home@ABHomeInc',NULL,'Industry leader in wholesale home decor, furniture, and garden, since 1993.','https://t.co/2lx3XxMZio','Joined December 2011','178',NULL),(7,'A & B Reprographics@Abrepro',NULL,'From large format black & white prints to the most sophisticated of digital color printing jobs, A & B can get the job done right.','http://t.co/zyISURRqvP','Joined May 2009','123',NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'A & C CHRISTOFI LTD@ACChristofiLtd',NULL,'A & C CHRISTOFI LTD is a fast growing professional services company based in Limassol, Cyprus. Our main Concern is your Business.','https://t.co/msJpvYtuAt','Joined November 2015','291',NULL),(10,'A & B Kia@AandB_Kia',NULL,'A&B Kia is a Kia dealer in Benwood, WV. Stay connected to exceed expectations. Build strong relationships. Drive the best with us.','http://t.co/H1m1Bi9YHp','Joined December 2012',NULL,NULL),(11,'A&E Clothing@aeclothing1',NULL,'Used Clothing Distributor','https://t.co/sIZNy1TeMH','Joined January 2016','0',NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Wix@Wix',NULL,'Create, manage and grow your business online with Wix. It’s more than just a website builder, it’s how your vision comes to life. For support: @WixHelp.','https://t.co/vzQPGJokOE','Joined June 2007',NULL,NULL),(15,'A & G Insurance LLC@AGInsuranceLLC',NULL,'A & G Insurance prides itself on being your local, full service, Independent Insurance Agency.','http://t.co/qDF7dVozxt','Joined September 2011','256',NULL);
/*!40000 ALTER TABLE `twitter_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 14:23:13
