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
-- Table structure for table `server_battlenpc_pools`
--

DROP TABLE IF EXISTS `server_battlenpc_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_battlenpc_pools` (
  `poolId` int(10) unsigned NOT NULL,
  `actorClassId` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `genusId` int(10) unsigned NOT NULL,
  `currentJob` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combatSkill` tinyint(3) unsigned NOT NULL,
  `combatDelay` smallint(5) unsigned NOT NULL,
  `combatDmgMult` float unsigned NOT NULL DEFAULT '1',
  `aggroType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `immunity` int(10) unsigned NOT NULL DEFAULT '0',
  `linkType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellListId` int(10) unsigned NOT NULL DEFAULT '0',
  `skillListId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_pools`
--

LOCK TABLES `server_battlenpc_pools` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_pools` DISABLE KEYS */;
set autocommit=0;
-- Original pools
INSERT INTO `server_battlenpc_pools` VALUES (1,2104001,'wharf_rat',12,0,1,3600,1,0,0,0,0,14);
INSERT INTO `server_battlenpc_pools` VALUES (2,2201407,'bloodthirsty_wolf',3,0,1,3000,1,1,0,0,0,1);
INSERT INTO `server_battlenpc_pools` VALUES (3,2290005,'yda',29,2,1,4200,1,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (4,2290006,'papalymo',29,22,1,4200,1,0,0,0,0,0);
-- Rodents (passive)
INSERT INTO `server_battlenpc_pools` VALUES (5,2104002,'lemming',12,0,1,3600,1,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (6,2104005,'nuteater',12,0,1,3600,1,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (7,2104009,'hare',12,0,1,3000,1,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (8,2104013,'glirulus',12,0,1,3600,1,0,0,0,0,0);
-- Cactuars (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (9,2100901,'cactuar_lesser',13,0,1,4200,1,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (10,2100904,'cactuar',13,0,1,4200,1.2,1,0,0,0,3);
-- Beetles/Bugs (passive)
INSERT INTO `server_battlenpc_pools` VALUES (11,2103901,'bug',38,0,1,3600,1,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (12,2103904,'ladybug',38,0,1,3600,1,0,0,0,0,12);
-- Flowers/Flytraps (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (13,2102701,'flower',15,0,1,4200,1,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (14,2102709,'poisonous_flower',15,0,1,4200,1.2,1,0,0,4,8);
-- Mole (aggressive sound)
INSERT INTO `server_battlenpc_pools` VALUES (15,2105701,'mole',11,0,1,4200,1,1,0,0,0,13);
-- Dodo (passive)
INSERT INTO `server_battlenpc_pools` VALUES (16,2102001,'dodo',42,0,1,3600,1,0,0,0,0,11);
-- Bat (aggressive sound)
INSERT INTO `server_battlenpc_pools` VALUES (17,2104102,'bat',43,0,1,2400,0.8,1,0,0,0,9);
-- Wolf (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (18,2201404,'wolf',3,0,1,3000,1,1,0,0,0,1);
-- Monkeys
INSERT INTO `server_battlenpc_pools` VALUES (19,2100501,'monkey',4,0,1,3600,1,0,0,0,0,6);
INSERT INTO `server_battlenpc_pools` VALUES (20,2100503,'monkey_large',4,0,1,3600,1.2,1,0,0,0,6);
-- Yaks (passive)
INSERT INTO `server_battlenpc_pools` VALUES (21,2102301,'yak_male',8,0,1,4800,1,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (22,2102305,'yak_female',8,0,1,4800,0.8,0,0,0,0,15);
-- Boar (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (23,2201501,'boar',9,0,1,3600,1,1,0,0,0,10);
-- Slug (passive)
INSERT INTO `server_battlenpc_pools` VALUES (24,2104217,'slug',21,0,1,4800,1,0,0,0,0,24);
-- Chigoe (passive)
INSERT INTO `server_battlenpc_pools` VALUES (25,2105612,'chigoe',36,0,1,2400,0.6,0,0,0,0,23);
-- Winglizard (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (26,2100101,'winglizard',30,0,1,3600,1,1,0,0,0,21);
-- Raptor (aggressive sight+sound)
INSERT INTO `server_battlenpc_pools` VALUES (27,2100201,'raptor',32,0,1,3000,1.2,1,0,0,0,2);
-- Lizardman / Amal'jaa (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (28,2106501,'lizardman',23,0,1,3600,1,1,0,0,0,20);
-- Bombs (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (29,2201601,'bomb',64,0,1,3600,1,1,0,0,1,7);
INSERT INTO `server_battlenpc_pools` VALUES (30,2101608,'bomb_normal',64,0,1,3600,1.2,1,0,0,1,7);
-- Ogre (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (31,2102501,'ogre_lesser',60,0,1,4800,1.5,1,0,0,0,4);
-- Funguar (passive)
INSERT INTO `server_battlenpc_pools` VALUES (32,2105901,'funguar',14,0,1,4800,1,0,0,0,0,17);
-- Petitghost (aggressive sight+magic)
INSERT INTO `server_battlenpc_pools` VALUES (33,2104306,'petitghost',46,0,1,3600,1,1,0,0,3,16);
-- Sprite / Will-O-Wisp (aggressive magic)
INSERT INTO `server_battlenpc_pools` VALUES (34,2106214,'sprite',53,0,1,3600,1,1,0,0,2,18);
-- Griffin / Hippogryph (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (35,2100402,'griffin',44,0,1,4200,1.5,1,0,0,0,19);
-- Firefly / Gnat (passive)
INSERT INTO `server_battlenpc_pools` VALUES (36,2105802,'firefly',37,0,1,3000,0.8,0,0,0,0,0);
-- Goblin (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (37,2110308,'goblin',26,0,1,3600,1,1,0,0,5,5);
-- Coeurl (aggressive sight+sound)
INSERT INTO `server_battlenpc_pools` VALUES (38,2103201,'coeurl',5,0,1,3000,1.5,1,0,0,0,22);
-- Megalo-crab (passive)
INSERT INTO `server_battlenpc_pools` VALUES (39,2107606,'megalo_crab',22,0,1,4200,1,0,0,0,0,25);
-- Morbol (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (40,2101001,'morbol',16,0,1,4800,1.5,1,0,0,0,26);
-- Flan (passive)
INSERT INTO `server_battlenpc_pools` VALUES (41,2103401,'flan',63,0,1,4200,1,0,0,0,0,34);
-- Gigantoad (aggressive sound)
INSERT INTO `server_battlenpc_pools` VALUES (42,2103101,'gigantoad',18,0,1,3600,1,1,0,0,0,27);
-- Sheep (passive)
INSERT INTO `server_battlenpc_pools` VALUES (43,2100701,'sheep',7,0,1,4200,0.8,0,0,0,0,32);
-- Aldgoat (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (44,2102301,'aldgoat',1,0,1,4200,1.2,1,0,0,0,33);
-- Diremite (aggressive sound)
INSERT INTO `server_battlenpc_pools` VALUES (45,2101112,'diremite',35,0,1,3600,1,1,0,0,0,39);
-- Salamander (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (46,2101301,'salamander',19,0,1,3600,1,1,0,0,0,42);
-- Coblyn (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (47,2102103,'coblyn',49,0,1,3600,1,1,0,0,0,46);
-- Spriggan (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (48,2290036,'spriggan',50,0,1,3000,1,1,0,0,0,47);
-- Ahriman (aggressive sight+magic)
INSERT INTO `server_battlenpc_pools` VALUES (49,2101701,'ahriman',51,0,1,3600,1.2,1,0,0,0,48);
-- Antelope (passive)
INSERT INTO `server_battlenpc_pools` VALUES (50,2100301,'antelope',2,0,1,3000,1,0,0,0,0,44);
-- Imp (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (51,2102601,'imp',52,0,1,3000,1,1,0,0,0,49);
-- Qiqirn (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (52,2106301,'qiqirn',25,0,1,3000,1,1,0,0,0,50);
-- Grenade (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (53,2201601,'grenade',65,0,1,3600,1.2,1,0,0,1,29);
-- Vulture (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (54,2101201,'vulture',41,0,1,3000,1,1,0,0,0,31);
-- Ixal (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (55,2106401,'ixal',24,0,1,3600,1,1,0,0,0,40);
-- Kobold (aggressive sight)
INSERT INTO `server_battlenpc_pools` VALUES (56,2106601,'kobold',27,0,1,3600,1,1,0,0,0,41);
/*!40000 ALTER TABLE `server_battlenpc_pools` ENABLE KEYS */;
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
