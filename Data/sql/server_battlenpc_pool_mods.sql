-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: ffxiv_server
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `server_battlenpc_pool_mods`
--

DROP TABLE IF EXISTS `server_battlenpc_pool_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_battlenpc_pool_mods` (
  `poolId` int unsigned NOT NULL,
  `modId` smallint unsigned NOT NULL,
  `modVal` bigint NOT NULL,
  `isMobMod` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolId`,`modId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_pool_mods`
--

LOCK TABLES `server_battlenpc_pool_mods` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_pool_mods` DISABLE KEYS */;
INSERT INTO `server_battlenpc_pool_mods` VALUES (1,24,1,1),(2,2,3,1),(2,3,3,1),(2,24,1,1),(3,24,0,1),(3,49,1,0),(4,24,0,1),(4,49,1,0),(5,24,1,1),(6,24,1,1),(7,24,1,1),(8,24,1,1),(9,24,1,1),(10,24,1,1),(11,24,1,1),(12,24,1,1),(13,24,1,1),(14,24,1,1),(15,24,1,1),(16,24,1,1),(17,24,1,1),(18,24,1,1),(19,24,1,1),(20,24,1,1),(21,24,1,1),(22,24,1,1),(23,24,1,1),(24,24,1,1),(25,24,1,1),(26,24,1,1),(27,24,1,1),(28,24,1,1),(29,24,1,1),(30,24,1,1),(31,24,1,1),(32,24,1,1),(33,24,1,1),(34,24,1,1),(35,24,1,1),(36,24,1,1),(37,24,1,1),(38,24,1,1),(39,24,1,1),(40,24,1,1),(41,24,1,1),(42,24,1,1),(43,24,1,1),(44,24,1,1),(45,24,1,1),(46,24,1,1),(47,24,1,1),(48,24,1,1),(49,24,1,1),(50,24,1,1),(51,24,1,1),(52,24,1,1),(53,24,1,1),(54,24,1,1),(55,24,1,1),(56,24,1,1),(57,24,1,1),(58,24,1,1),(59,24,1,1),(60,24,1,1),(61,24,1,1),(62,24,1,1),(63,24,1,1),(64,24,1,1),(65,24,1,1),(66,24,1,1),(67,24,1,1),(68,24,1,1),(69,24,1,1),(70,24,1,1),(71,24,1,1),(72,24,1,1),(73,24,1,1),(74,24,1,1),(75,24,1,1),(76,24,1,1),(77,24,1,1),(78,24,1,1),(79,24,1,1),(80,24,1,1),(81,24,1,1),(82,24,1,1),(83,24,1,1),(84,24,1,1),(85,24,1,1),(86,24,1,1),(87,24,1,1),(88,24,1,1),(89,24,1,1),(90,24,1,1),(91,24,1,1),(92,24,1,1),(93,24,1,1),(94,24,1,1),(95,24,1,1),(96,24,1,1),(97,24,1,1),(98,24,1,1),(99,24,1,1),(100,24,1,1),(101,24,1,1),(102,24,1,1),(103,24,1,1),(104,24,1,1),(105,24,1,1),(106,24,1,1),(107,24,1,1),(108,24,1,1),(109,24,1,1),(110,24,1,1),(111,24,1,1),(112,24,1,1),(113,24,1,1),(114,24,1,1),(115,24,1,1),(116,24,1,1),(117,24,1,1),(118,24,1,1),(119,24,1,1),(120,24,1,1),(121,24,1,1),(122,24,1,1),(123,24,1,1),(124,24,1,1),(125,24,1,1),(126,24,1,1),(127,24,1,1),(128,24,1,1),(129,24,1,1),(130,24,1,1),(131,24,1,1),(132,24,1,1),(133,24,1,1),(134,24,1,1),(135,24,1,1),(136,24,1,1),(137,24,1,1),(138,24,1,1),(139,24,1,1),(140,24,1,1),(141,24,1,1),(142,24,1,1),(143,24,1,1),(144,24,1,1),(145,24,1,1),(146,24,1,1),(147,24,1,1),(148,24,1,1),(149,24,1,1),(150,24,1,1),(151,24,1,1),(152,24,1,1),(153,24,1,1),(154,24,1,1),(155,24,1,1),(156,24,1,1),(157,24,1,1);
/*!40000 ALTER TABLE `server_battlenpc_pool_mods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15  9:37:30
