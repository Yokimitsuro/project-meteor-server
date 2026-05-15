-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: ffxiv_server
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `server_battlenpc_pool_mods`
--

DROP TABLE IF EXISTS `server_battlenpc_pool_mods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_battlenpc_pool_mods` (
  `poolId` int(10) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `modVal` bigint(20) NOT NULL,
  `isMobMod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolId`,`modId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_pool_mods`
--

LOCK TABLES `server_battlenpc_pool_mods` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_pool_mods` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `server_battlenpc_pool_mods` VALUES (2,2,3,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (2,3,3,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (2,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (3,24,0,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (3,49,1,0);
INSERT INTO `server_battlenpc_pool_mods` VALUES (4,24,0,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (4,49,1,0);
-- Enable roaming for all monster pools
INSERT INTO `server_battlenpc_pool_mods` VALUES (1,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (5,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (6,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (7,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (8,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (9,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (10,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (11,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (12,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (13,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (14,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (15,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (16,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (17,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (18,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (19,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (20,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (21,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (22,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (23,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (24,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (25,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (26,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (27,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (28,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (29,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (30,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (31,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (32,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (33,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (34,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (35,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (36,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (37,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (38,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (39,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (40,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (41,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (42,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (43,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (44,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (45,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (46,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (47,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (48,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (49,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (50,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (51,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (52,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (53,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (54,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (55,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (56,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (57,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (58,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (59,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (60,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (61,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (62,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (63,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (64,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (65,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (66,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (67,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (68,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (69,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (70,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (71,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (72,24,1,1);
INSERT INTO `server_battlenpc_pool_mods` VALUES (73,24,1,1);
/*!40000 ALTER TABLE `server_battlenpc_pool_mods` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-18 14:54:09
