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
-- Ixali Fencer high-level (aggressive sight, higher damage)
INSERT INTO `server_battlenpc_pools` VALUES (57,2106401,'ixal_fencer_hl',24,0,1,3200,1.5,1,0,0,0,40);
-- Additional monster variants (extracted from client displayName sheet)
INSERT INTO `server_battlenpc_pools` VALUES (58,2100601,'giant_gnat',37,0,1,3000,0.8,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (59,2100103,'puk',45,0,1,3200,0.9,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (60,2100905,'sabotender',13,0,1,3400,1.2,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (61,2106502,'amaljaa_pugilist',23,2,1,3200,1.2,1,0,0,0,42);
INSERT INTO `server_battlenpc_pools` VALUES (62,2203301,'escaped_goobbue',6,0,1,4200,2.0,5,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (63,2201402,'shaggy_wolf',3,0,1,3000,1.0,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (64,2104014,'dormouse',12,0,1,2800,0.7,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (65,2104010,'star_marmot',12,0,1,2800,0.7,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (66,2102702,'roseling',15,0,1,3000,0.8,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (67,2103908,'weevil',38,0,1,3000,1.0,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (68,2102502,'redhorn_ogre',60,0,1,4200,1.8,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (69,2204502,'greedy_angler',17,0,1,3200,1.0,4,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (70,2100404,'cloud_hippocerf',44,0,1,4000,1.5,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (71,2201608,'acid_bomb',64,0,1,3000,1.0,1,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (72,2202001,'stray_dodo',42,0,1,2600,0.6,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (73,2103906,'painted_ladybug',38,0,1,2600,0.7,0,0,0,0,0);
-- Additional monster variants (auto-generated from client data)
INSERT INTO `server_battlenpc_pools` VALUES (74,2100104,'sea_puk',30,0,1,3600,1.0,1,0,0,0,21);
INSERT INTO `server_battlenpc_pools` VALUES (75,2100502,'canopy_galago',4,0,1,3600,1.0,0,0,0,0,6);
INSERT INTO `server_battlenpc_pools` VALUES (76,2100504,'opo_opo',4,0,1,3600,1.0,0,0,0,0,6);
INSERT INTO `server_battlenpc_pools` VALUES (77,2100516,'curious_galago',4,0,1,3600,1.0,0,0,0,0,6);
INSERT INTO `server_battlenpc_pools` VALUES (78,2100902,'cactuar',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (79,2100903,'cochineal_cactuar',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (80,2100906,'sabotender',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (81,2100907,'sabotender_del_sol',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (82,2100908,'sabotender_del_sol',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (83,2100909,'desert_rose',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (84,2100910,'cactuar_jack',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (85,2100914,'cactuar',13,0,1,4200,1.0,1,0,0,0,3);
INSERT INTO `server_battlenpc_pools` VALUES (86,2101424,'feral_watchdog',3,0,1,3000,1.0,1,0,0,0,1);
INSERT INTO `server_battlenpc_pools` VALUES (87,2102302,'aldgoat_billy',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (88,2102303,'ravenous_billygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (89,2102304,'ravenous_billygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (90,2102306,'aldgoat_nanny',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (91,2102307,'ravenous_nannygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (92,2102308,'ravenous_nannygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (93,2102503,'spinesnap_ogre',60,0,1,4800,1.5,1,0,0,0,4);
INSERT INTO `server_battlenpc_pools` VALUES (94,2102703,'thorned_roseling',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (95,2102704,'thorned_roseling',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (96,2102705,'roselet',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (97,2102706,'roselet',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (98,2102707,'prickly_roselet',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (99,2102708,'mirror_roselet',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (100,2102710,'battrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (101,2102711,'gnattrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (102,2102712,'kedtrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (103,2102713,'vulturetrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (104,2102714,'pteroctrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (105,2102715,'imptrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (106,2102716,'eyetrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (107,2102717,'musk_roseling',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (108,2102718,'barometz',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (109,2102719,'roseling',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (110,2102720,'landtrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (111,2102721,'toadtrap',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (112,2102722,'pruned_roselet',15,0,1,4200,1.0,1,0,0,0,8);
INSERT INTO `server_battlenpc_pools` VALUES (113,2103902,'beady_beetle',38,0,1,3600,1.0,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (114,2103903,'beady_beetle',38,0,1,3600,1.0,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (115,2103905,'ladybug',38,0,1,3600,1.0,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (116,2103907,'maidenbug',38,0,1,3600,1.0,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (117,2103909,'ladybug',38,0,1,3600,1.0,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (118,2103910,'oilbug',38,0,1,3600,1.0,0,0,0,0,12);
INSERT INTO `server_battlenpc_pools` VALUES (119,2104003,'plains_rat',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (120,2104004,'dire_rat',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (121,2104006,'arbor_squirrel',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (122,2104007,'mun_tuy_squirrel',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (123,2104011,'thistletail_marmot',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (124,2104012,'thistletail_marmot',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (125,2104015,'hispid_dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (126,2104016,'deadly_dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (127,2104017,'pygmy_dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (128,2104018,'dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (129,2104019,'spiny_dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (130,2104020,'deadly_dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (131,2104021,'nutgrabber_marmot',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (132,2104022,'bristletail_marmot',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (133,2104023,'rat',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (134,2104024,'squirrel',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (135,2104025,'marmot',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (136,2104026,'dormouse',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (137,2104027,'star_marmot',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (138,2105702,'sewer_mole',11,0,1,4200,1.0,1,0,0,0,13);
INSERT INTO `server_battlenpc_pools` VALUES (139,2106215,'spriggan_collector',53,0,1,3600,1.0,1,0,0,2,18);
INSERT INTO `server_battlenpc_pools` VALUES (140,2106503,'amaljaa_grappler',23,0,1,3600,1.0,1,0,0,0,20);
INSERT INTO `server_battlenpc_pools` VALUES (141,2106504,'amaljaa_grappler',23,0,1,3600,1.0,1,0,0,0,20);
INSERT INTO `server_battlenpc_pools` VALUES (142,2106505,'amaljaa_grappler',23,0,1,3600,1.0,1,0,0,0,20);
INSERT INTO `server_battlenpc_pools` VALUES (143,2106506,'amaljaa_grappler',23,0,1,3600,1.0,1,0,0,0,20);
INSERT INTO `server_battlenpc_pools` VALUES (144,2106507,'amaljaa_grappler',23,0,1,3600,1.0,1,0,0,0,20);
INSERT INTO `server_battlenpc_pools` VALUES (145,2201424,'territorial_wolf',3,0,1,3000,1.0,1,0,0,0,1);
INSERT INTO `server_battlenpc_pools` VALUES (146,2202301,'lowland_billygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (147,2202302,'sure_footed_billygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (148,2202303,'death_marked_billygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (149,2202304,'lowland_nannygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (150,2202305,'lowland_nannygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (151,2202306,'suckling_nannygoat',8,0,1,4800,1.0,0,0,0,0,15);
INSERT INTO `server_battlenpc_pools` VALUES (152,2204001,'plague_rat',12,0,1,3600,1.0,0,0,0,0,0);
INSERT INTO `server_battlenpc_pools` VALUES (153,2204101,'wingrat',43,0,1,2400,0.8,1,0,0,0,9);
INSERT INTO `server_battlenpc_pools` VALUES (154,2204102,'wingrat',43,0,1,2400,0.8,1,0,0,0,9);
INSERT INTO `server_battlenpc_pools` VALUES (155,2204305,'brine_bogy',46,0,1,3600,1.0,1,0,0,3,16);
INSERT INTO `server_battlenpc_pools` VALUES (156,2205601,'chiglet',36,0,1,2400,0.6,0,0,0,0,23);
INSERT INTO `server_battlenpc_pools` VALUES (157,2205701,'rat_mole',11,0,1,4200,1.0,1,0,0,0,13);
INSERT INTO `server_battlenpc_pools` VALUES (158,2207303,'ifrit',66,0,1,4800,3.0,5,0,0,0,0);
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
