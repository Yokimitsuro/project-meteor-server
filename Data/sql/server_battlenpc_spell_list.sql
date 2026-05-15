-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ffxiv_server
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for server_battlenpc_spell_list
--

DROP TABLE IF EXISTS `server_battlenpc_spell_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_battlenpc_spell_list` (
  `spellListId` int(10) unsigned NOT NULL DEFAULT '0',
  `spellId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellListId`, `spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_spell_list`
--

LOCK TABLES `server_battlenpc_spell_list` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_spell_list` DISABLE KEYS */;
set autocommit=0;

-- ============================================================
-- Spell lists for magic-using mob types
-- ============================================================

-- Spell List 1: Bomb (fire magic)
INSERT INTO `server_battlenpc_spell_list` VALUES (1, 27310);  -- fire

-- Spell List 2: Sprite/Will-O-Wisp (thunder + blizzard)
INSERT INTO `server_battlenpc_spell_list` VALUES (2, 27308);  -- blizzard
INSERT INTO `server_battlenpc_spell_list` VALUES (2, 27313);  -- thunder

-- Spell List 3: Petitghost (thunder + sleep)
INSERT INTO `server_battlenpc_spell_list` VALUES (3, 27313);  -- thunder
INSERT INTO `server_battlenpc_spell_list` VALUES (3, 27306);  -- sleep

-- Spell List 4: Poisonous Flower (aero - wind DoT)
INSERT INTO `server_battlenpc_spell_list` VALUES (4, 27353);  -- aero

-- Spell List 5: Goblin (stone)
INSERT INTO `server_battlenpc_spell_list` VALUES (5, 27355);  -- stone

/*!40000 ALTER TABLE `server_battlenpc_spell_list` ENABLE KEYS */;
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

-- Dump completed
