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
-- Table structure for table `server_battlenpc_pools`
--

DROP TABLE IF EXISTS `server_battlenpc_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_battlenpc_pools` (
  `poolId` int unsigned NOT NULL,
  `actorClassId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `genusId` int unsigned NOT NULL,
  `currentJob` tinyint unsigned NOT NULL DEFAULT '0',
  `combatSkill` tinyint unsigned NOT NULL,
  `combatDelay` smallint unsigned NOT NULL,
  `combatDmgMult` float unsigned NOT NULL DEFAULT '1',
  `aggroType` tinyint unsigned NOT NULL DEFAULT '0',
  `immunity` int unsigned NOT NULL DEFAULT '0',
  `linkType` tinyint unsigned NOT NULL DEFAULT '0',
  `spellListId` int unsigned NOT NULL DEFAULT '0',
  `skillListId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_pools`
--

LOCK TABLES `server_battlenpc_pools` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_pools` DISABLE KEYS */;
INSERT INTO `server_battlenpc_pools` VALUES (1,2104001,'wharf_rat',12,0,1,3600,1,0,0,0,0,14),(2,2201407,'bloodthirsty_wolf',3,0,1,3000,1,1,0,0,0,1),(3,2290005,'yda',29,2,1,4200,1,0,0,0,0,0),(4,2290006,'papalymo',29,22,1,4200,1,0,0,0,0,0),(5,2104002,'lemming',12,0,1,3600,1,0,0,0,0,0),(6,2104005,'nuteater',12,0,1,3600,1,0,0,0,0,0),(7,2104009,'hare',12,0,1,3000,1,0,0,0,0,0),(8,2104013,'glirulus',12,0,1,3600,1,0,0,0,0,0),(9,2100901,'cactuar_lesser',13,0,1,4200,1,1,0,0,0,3),(10,2100904,'cactuar',13,0,1,4200,1.2,1,0,0,0,3),(11,2103901,'bug',38,0,1,3600,1,0,0,0,0,12),(12,2103904,'ladybug',38,0,1,3600,1,0,0,0,0,12),(13,2102701,'flower',15,0,1,4200,1,1,0,0,0,8),(14,2102709,'poisonous_flower',15,0,1,4200,1.2,1,0,0,4,8),(15,2105701,'mole',11,0,1,4200,1,1,0,0,0,13),(16,2102001,'dodo',42,0,1,3600,1,0,0,0,0,11),(17,2104102,'bat',43,0,1,2400,0.8,1,0,0,0,9),(18,2201404,'wolf',3,0,1,3000,1,1,0,0,0,1),(19,2100501,'monkey',4,0,1,3600,1,0,0,0,0,6),(20,2100503,'monkey_large',4,0,1,3600,1.2,1,0,0,0,6),(21,2102301,'yak_male',8,0,1,4800,1,0,0,0,0,15),(22,2102305,'yak_female',8,0,1,4800,0.8,0,0,0,0,15),(23,2201501,'boar',9,0,1,3600,1,1,0,0,0,10),(24,2104217,'slug',21,0,1,4800,1,0,0,0,0,24),(25,2105612,'chigoe',36,0,1,2400,0.6,0,0,0,0,23),(26,2100101,'winglizard',30,0,1,3600,1,1,0,0,0,21),(27,2100201,'raptor',32,0,1,3000,1.2,1,0,0,0,2),(28,2106501,'lizardman',23,0,1,3600,1,1,0,0,0,20),(29,2201601,'bomb',64,0,1,3600,1,1,0,0,1,7),(30,2101608,'bomb_normal',64,0,1,3600,1.2,1,0,0,1,7),(31,2102501,'ogre_lesser',60,0,1,4800,1.5,1,0,0,0,4),(32,2105901,'funguar',14,0,1,4800,1,0,0,0,0,17),(33,2104306,'petitghost',46,0,1,3600,1,1,0,0,3,16),(34,2106214,'sprite',53,0,1,3600,1,1,0,0,2,18),(35,2100402,'griffin',44,0,1,4200,1.5,1,0,0,0,19),(36,2105802,'firefly',37,0,1,3000,0.8,0,0,0,0,0),(37,2110308,'goblin',26,0,1,3600,1,1,0,0,5,5),(38,2103201,'coeurl',5,0,1,3000,1.5,1,0,0,0,22),(39,2107606,'megalo_crab',22,0,1,4200,1,0,0,0,0,25),(40,2101001,'morbol',16,0,1,4800,1.5,1,0,0,0,26),(41,2103401,'flan',63,0,1,4200,1,0,0,0,0,34),(42,2103101,'gigantoad',18,0,1,3600,1,1,0,0,0,27),(43,2100701,'sheep',7,0,1,4200,0.8,0,0,0,0,32),(44,2102301,'aldgoat',1,0,1,4200,1.2,1,0,0,0,33),(45,2101112,'diremite',35,0,1,3600,1,1,0,0,0,39),(46,2101301,'salamander',19,0,1,3600,1,1,0,0,0,42),(47,2102103,'coblyn',49,0,1,3600,1,1,0,0,0,46),(48,2290036,'spriggan',50,0,1,3000,1,1,0,0,0,47),(49,2101701,'ahriman',51,0,1,3600,1.2,1,0,0,0,48),(50,2100301,'antelope',2,0,1,3000,1,0,0,0,0,44),(51,2102601,'imp',52,0,1,3000,1,1,0,0,0,49),(52,2106301,'qiqirn',25,0,1,3000,1,1,0,0,0,50),(53,2201601,'grenade',65,0,1,3600,1.2,1,0,0,1,29),(54,2101201,'vulture',41,0,1,3000,1,1,0,0,0,31),(55,2106401,'ixal',24,0,1,3600,1,1,0,0,0,40),(56,2106601,'kobold',27,0,1,3600,1,1,0,0,0,41),(57,2106401,'ixal_fencer_hl',24,0,1,3200,1.5,1,0,0,0,40),(58,2100601,'giant_gnat',37,0,1,3000,0.8,0,0,0,0,0),(59,2100103,'puk',45,0,1,3200,0.9,1,0,0,0,0),(60,2100905,'sabotender',13,0,1,3400,1.2,1,0,0,0,0),(61,2106502,'amaljaa_pugilist',23,2,1,3200,1.2,1,0,0,0,42),(62,2203301,'escaped_goobbue',6,0,1,4200,2,5,0,0,0,0),(63,2201402,'shaggy_wolf',3,0,1,3000,1,1,0,0,0,0),(64,2104014,'dormouse',12,0,1,2800,0.7,0,0,0,0,0),(65,2104010,'star_marmot',12,0,1,2800,0.7,0,0,0,0,0),(66,2102702,'roseling',15,0,1,3000,0.8,0,0,0,0,0),(67,2103908,'weevil',38,0,1,3000,1,1,0,0,0,0),(68,2102502,'redhorn_ogre',60,0,1,4200,1.8,1,0,0,0,0),(69,2204502,'greedy_angler',17,0,1,3200,1,4,0,0,0,0),(70,2100404,'cloud_hippocerf',44,0,1,4000,1.5,1,0,0,0,0),(71,2201608,'acid_bomb',64,0,1,3000,1,1,0,0,0,0),(72,2202001,'stray_dodo',42,0,1,2600,0.6,0,0,0,0,0),(73,2103906,'painted_ladybug',38,0,1,2600,0.7,0,0,0,0,0),(74,2100104,'sea_puk',30,0,1,3600,1,1,0,0,0,21),(75,2100502,'canopy_galago',4,0,1,3600,1,0,0,0,0,6),(76,2100504,'opo_opo',4,0,1,3600,1,0,0,0,0,6),(77,2100516,'curious_galago',4,0,1,3600,1,0,0,0,0,6),(78,2100902,'cactuar',13,0,1,4200,1,1,0,0,0,3),(79,2100903,'cochineal_cactuar',13,0,1,4200,1,1,0,0,0,3),(80,2100906,'sabotender',13,0,1,4200,1,1,0,0,0,3),(81,2100907,'sabotender_del_sol',13,0,1,4200,1,1,0,0,0,3),(82,2100908,'sabotender_del_sol',13,0,1,4200,1,1,0,0,0,3),(83,2100909,'desert_rose',13,0,1,4200,1,1,0,0,0,3),(84,2100910,'cactuar_jack',13,0,1,4200,1,1,0,0,0,3),(85,2100914,'cactuar',13,0,1,4200,1,1,0,0,0,3),(86,2101424,'feral_watchdog',3,0,1,3000,1,1,0,0,0,1),(87,2102302,'aldgoat_billy',8,0,1,4800,1,0,0,0,0,15),(88,2102303,'ravenous_billygoat',8,0,1,4800,1,0,0,0,0,15),(89,2102304,'ravenous_billygoat',8,0,1,4800,1,0,0,0,0,15),(90,2102306,'aldgoat_nanny',8,0,1,4800,1,0,0,0,0,15),(91,2102307,'ravenous_nannygoat',8,0,1,4800,1,0,0,0,0,15),(92,2102308,'ravenous_nannygoat',8,0,1,4800,1,0,0,0,0,15),(93,2102503,'spinesnap_ogre',60,0,1,4800,1.5,1,0,0,0,4),(94,2102703,'thorned_roseling',15,0,1,4200,1,1,0,0,0,8),(95,2102704,'thorned_roseling',15,0,1,4200,1,1,0,0,0,8),(96,2102705,'roselet',15,0,1,4200,1,1,0,0,0,8),(97,2102706,'roselet',15,0,1,4200,1,1,0,0,0,8),(98,2102707,'prickly_roselet',15,0,1,4200,1,1,0,0,0,8),(99,2102708,'mirror_roselet',15,0,1,4200,1,1,0,0,0,8),(100,2102710,'battrap',15,0,1,4200,1,1,0,0,0,8),(101,2102711,'gnattrap',15,0,1,4200,1,1,0,0,0,8),(102,2102712,'kedtrap',15,0,1,4200,1,1,0,0,0,8),(103,2102713,'vulturetrap',15,0,1,4200,1,1,0,0,0,8),(104,2102714,'pteroctrap',15,0,1,4200,1,1,0,0,0,8),(105,2102715,'imptrap',15,0,1,4200,1,1,0,0,0,8),(106,2102716,'eyetrap',15,0,1,4200,1,1,0,0,0,8),(107,2102717,'musk_roseling',15,0,1,4200,1,1,0,0,0,8),(108,2102718,'barometz',15,0,1,4200,1,1,0,0,0,8),(109,2102719,'roseling',15,0,1,4200,1,1,0,0,0,8),(110,2102720,'landtrap',15,0,1,4200,1,1,0,0,0,8),(111,2102721,'toadtrap',15,0,1,4200,1,1,0,0,0,8),(112,2102722,'pruned_roselet',15,0,1,4200,1,1,0,0,0,8),(113,2103902,'beady_beetle',38,0,1,3600,1,0,0,0,0,12),(114,2103903,'beady_beetle',38,0,1,3600,1,0,0,0,0,12),(115,2103905,'ladybug',38,0,1,3600,1,0,0,0,0,12),(116,2103907,'maidenbug',38,0,1,3600,1,0,0,0,0,12),(117,2103909,'ladybug',38,0,1,3600,1,0,0,0,0,12),(118,2103910,'oilbug',38,0,1,3600,1,0,0,0,0,12),(119,2104003,'plains_rat',12,0,1,3600,1,0,0,0,0,0),(120,2104004,'dire_rat',12,0,1,3600,1,0,0,0,0,0),(121,2104006,'arbor_squirrel',12,0,1,3600,1,0,0,0,0,0),(122,2104007,'mun_tuy_squirrel',12,0,1,3600,1,0,0,0,0,0),(123,2104011,'thistletail_marmot',12,0,1,3600,1,0,0,0,0,0),(124,2104012,'thistletail_marmot',12,0,1,3600,1,0,0,0,0,0),(125,2104015,'hispid_dormouse',12,0,1,3600,1,0,0,0,0,0),(126,2104016,'deadly_dormouse',12,0,1,3600,1,0,0,0,0,0),(127,2104017,'pygmy_dormouse',12,0,1,3600,1,0,0,0,0,0),(128,2104018,'dormouse',12,0,1,3600,1,0,0,0,0,0),(129,2104019,'spiny_dormouse',12,0,1,3600,1,0,0,0,0,0),(130,2104020,'deadly_dormouse',12,0,1,3600,1,0,0,0,0,0),(131,2104021,'nutgrabber_marmot',12,0,1,3600,1,0,0,0,0,0),(132,2104022,'bristletail_marmot',12,0,1,3600,1,0,0,0,0,0),(133,2104023,'rat',12,0,1,3600,1,0,0,0,0,0),(134,2104024,'squirrel',12,0,1,3600,1,0,0,0,0,0),(135,2104025,'marmot',12,0,1,3600,1,0,0,0,0,0),(136,2104026,'dormouse',12,0,1,3600,1,0,0,0,0,0),(137,2104027,'star_marmot',12,0,1,3600,1,0,0,0,0,0),(138,2105702,'sewer_mole',11,0,1,4200,1,1,0,0,0,13),(139,2106215,'spriggan_collector',53,0,1,3600,1,1,0,0,2,18),(140,2106503,'amaljaa_grappler',23,0,1,3600,1,1,0,0,0,20),(141,2106504,'amaljaa_grappler',23,0,1,3600,1,1,0,0,0,20),(142,2106505,'amaljaa_grappler',23,0,1,3600,1,1,0,0,0,20),(143,2106506,'amaljaa_grappler',23,0,1,3600,1,1,0,0,0,20),(144,2106507,'amaljaa_grappler',23,0,1,3600,1,1,0,0,0,20),(145,2201424,'territorial_wolf',3,0,1,3000,1,1,0,0,0,1),(146,2202301,'lowland_billygoat',8,0,1,4800,1,0,0,0,0,15),(147,2202302,'sure_footed_billygoat',8,0,1,4800,1,0,0,0,0,15),(148,2202303,'death_marked_billygoat',8,0,1,4800,1,0,0,0,0,15),(149,2202304,'lowland_nannygoat',8,0,1,4800,1,0,0,0,0,15),(150,2202305,'lowland_nannygoat',8,0,1,4800,1,0,0,0,0,15),(151,2202306,'suckling_nannygoat',8,0,1,4800,1,0,0,0,0,15),(152,2204001,'plague_rat',12,0,1,3600,1,0,0,0,0,0),(153,2204101,'wingrat',43,0,1,2400,0.8,1,0,0,0,9),(154,2204102,'wingrat',43,0,1,2400,0.8,1,0,0,0,9),(155,2204305,'brine_bogy',46,0,1,3600,1,1,0,0,3,16),(156,2205601,'chiglet',36,0,1,2400,0.6,0,0,0,0,23),(157,2205701,'rat_mole',11,0,1,4200,1,1,0,0,0,13);
/*!40000 ALTER TABLE `server_battlenpc_pools` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15  9:37:23
