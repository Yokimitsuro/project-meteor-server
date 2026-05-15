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
-- Table structure for table `server_battlenpc_groups`
--

DROP TABLE IF EXISTS `server_battlenpc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_battlenpc_groups` (
  `groupId` int(10) unsigned NOT NULL DEFAULT '0',
  `poolId` int(10) unsigned NOT NULL DEFAULT '0',
  `scriptName` varchar(50) NOT NULL,
  `minLevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxLevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `respawnTime` int(10) unsigned NOT NULL DEFAULT '10',
  `hp` int(10) unsigned NOT NULL DEFAULT '0',
  `mp` int(10) unsigned NOT NULL DEFAULT '0',
  `dropListId` int(10) unsigned NOT NULL DEFAULT '0',
  `allegiance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spawnType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `animationId` int(10) unsigned NOT NULL DEFAULT '0',
  `actorState` smallint(5) unsigned NOT NULL DEFAULT '0',
  `privateAreaName` varchar(32) NOT NULL DEFAULT '',
  `privateAreaLevel` int(11) NOT NULL DEFAULT '0',
  `zoneId` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_groups`
--

LOCK TABLES `server_battlenpc_groups` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_groups` DISABLE KEYS */;
set autocommit=0;
-- Original groups (group 1 fixed with real HP/levels)
INSERT INTO `server_battlenpc_groups` VALUES (1,1,'wharf_rat',1,3,60,100,0,0,0,0,0,0,'',0,170);
INSERT INTO `server_battlenpc_groups` VALUES (2,2,'bloodthirsty_wolf',5,8,0,300,0,0,0,1,0,0,'',0,166);
INSERT INTO `server_battlenpc_groups` VALUES (3,3,'yda',1,1,0,0,0,0,1,1,0,0,'',0,166);
INSERT INTO `server_battlenpc_groups` VALUES (4,4,'papalymo',1,1,0,0,0,0,1,1,0,0,'',0,166);

-- ============================================================
-- Central Thanalan (zone 170) - Level 1-10
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (5,5,'lemming',1,3,60,100,0,0,0,0,0,0,'',0,170);
INSERT INTO `server_battlenpc_groups` VALUES (6,11,'bug',3,5,60,200,0,0,0,0,0,0,'',0,170);
INSERT INTO `server_battlenpc_groups` VALUES (7,9,'cactuar_lesser',5,8,60,350,0,0,0,0,0,0,'',0,170);
INSERT INTO `server_battlenpc_groups` VALUES (8,15,'mole',4,7,60,250,0,0,0,0,0,0,'',0,170);

-- ============================================================
-- Lower La Noscea (zone 128) - Level 1-10
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (9,5,'lemming',1,3,60,100,0,0,0,0,0,0,'',0,128);
INSERT INTO `server_battlenpc_groups` VALUES (10,16,'dodo',2,5,60,150,0,0,0,0,0,0,'',0,128);
INSERT INTO `server_battlenpc_groups` VALUES (11,17,'bat',4,7,60,250,0,0,0,0,0,0,'',0,128);
INSERT INTO `server_battlenpc_groups` VALUES (12,12,'ladybug',6,9,60,400,0,0,0,0,0,0,'',0,128);

-- ============================================================
-- Central Shroud (zone 150) - Level 1-10
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (13,7,'hare',1,4,60,120,0,0,0,0,0,0,'',0,150);
INSERT INTO `server_battlenpc_groups` VALUES (14,25,'chigoe',2,4,60,80,0,0,0,0,0,0,'',0,150);
INSERT INTO `server_battlenpc_groups` VALUES (15,19,'monkey',3,6,60,200,0,0,0,0,0,0,'',0,150);
INSERT INTO `server_battlenpc_groups` VALUES (16,13,'flower',5,9,60,350,0,0,0,0,0,0,'',0,150);

-- ============================================================
-- Western Thanalan (zone 172) - Level 1-10
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (17,6,'nuteater',1,4,60,110,0,0,0,0,0,0,'',0,172);
INSERT INTO `server_battlenpc_groups` VALUES (18,9,'cactuar_lesser',3,6,60,200,0,0,0,0,0,0,'',0,172);
INSERT INTO `server_battlenpc_groups` VALUES (19,13,'flower',5,8,60,300,0,0,0,0,0,0,'',0,172);
INSERT INTO `server_battlenpc_groups` VALUES (20,12,'ladybug',6,9,60,380,0,0,0,0,0,0,'',0,172);

-- ============================================================
-- Eastern Thanalan (zone 171) - Level 10-20
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (21,10,'cactuar',10,14,90,600,0,0,0,0,0,0,'',0,171);
INSERT INTO `server_battlenpc_groups` VALUES (22,28,'lizardman',12,16,90,800,0,0,0,0,0,0,'',0,171);
INSERT INTO `server_battlenpc_groups` VALUES (23,29,'bomb',14,18,90,950,0,0,0,0,0,0,'',0,171);
INSERT INTO `server_battlenpc_groups` VALUES (24,14,'poisonous_flower',11,15,90,700,0,0,0,0,0,0,'',0,171);

-- ============================================================
-- Western La Noscea (zone 129) - Level 10-20
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (25,18,'wolf',10,14,90,600,0,0,0,0,0,0,'',0,129);
INSERT INTO `server_battlenpc_groups` VALUES (26,17,'bat',11,15,90,650,0,0,0,0,0,0,'',0,129);
INSERT INTO `server_battlenpc_groups` VALUES (27,15,'mole',12,16,90,750,0,0,0,0,0,0,'',0,129);

-- ============================================================
-- East Shroud (zone 151) - Level 10-20
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (28,23,'boar',10,14,90,600,0,0,0,0,0,0,'',0,151);
INSERT INTO `server_battlenpc_groups` VALUES (29,20,'monkey_large',12,15,90,750,0,0,0,0,0,0,'',0,151);
INSERT INTO `server_battlenpc_groups` VALUES (30,22,'yak_female',13,17,90,850,0,0,0,0,0,0,'',0,151);
INSERT INTO `server_battlenpc_groups` VALUES (31,13,'flower',14,18,90,900,0,0,0,0,0,0,'',0,151);

-- ============================================================
-- Eastern La Noscea (zone 130) - Level 15-25
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (32,26,'winglizard',15,19,90,900,0,0,0,0,0,0,'',0,130);
INSERT INTO `server_battlenpc_groups` VALUES (33,18,'wolf',17,21,90,1050,0,0,0,0,0,0,'',0,130);
INSERT INTO `server_battlenpc_groups` VALUES (34,27,'raptor',20,24,120,1250,0,0,0,0,0,0,'',0,130);

-- ============================================================
-- North Shroud (zone 152) - Level 20-30
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (35,21,'yak_male',20,24,120,1100,0,0,0,0,0,0,'',0,152);
INSERT INTO `server_battlenpc_groups` VALUES (36,37,'goblin',22,26,120,1250,0,0,0,0,0,0,'',0,152);
INSERT INTO `server_battlenpc_groups` VALUES (37,34,'sprite',24,28,120,1350,0,0,0,0,0,0,'',0,152);

-- ============================================================
-- South Shroud (zone 154) - Level 15-25
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (38,32,'funguar',15,18,90,850,0,0,0,0,0,0,'',0,154);
INSERT INTO `server_battlenpc_groups` VALUES (39,33,'petitghost',18,22,120,1050,0,0,0,0,0,0,'',0,154);

-- ============================================================
-- Coerthas Central (zone 143) - Level 30-45
-- ============================================================
INSERT INTO `server_battlenpc_groups` VALUES (40,21,'yak_male',30,35,120,1700,0,0,0,0,0,0,'',0,143);
INSERT INTO `server_battlenpc_groups` VALUES (41,35,'griffin',35,40,120,2100,0,0,0,0,0,0,'',0,143);
INSERT INTO `server_battlenpc_groups` VALUES (42,31,'ogre_lesser',38,43,120,2500,0,0,0,0,0,0,'',0,143);

-- ============================================================
-- NEW MONSTERS - 19 additional genera across all zones
-- ============================================================

-- Central Thanalan (zone 170) lv1-10
INSERT INTO `server_battlenpc_groups` VALUES (43,50,'antelope',3,6,60,200,0,0,0,0,0,0,'',0,170);

-- Lower La Noscea (zone 128) lv1-10
INSERT INTO `server_battlenpc_groups` VALUES (44,39,'megalo_crab',5,9,60,400,0,0,0,0,0,0,'',0,128);

-- Central Shroud (zone 150) lv1-10
INSERT INTO `server_battlenpc_groups` VALUES (45,43,'sheep',2,5,60,150,0,0,0,0,0,0,'',0,150);

-- Western Thanalan (zone 172) lv1-10
INSERT INTO `server_battlenpc_groups` VALUES (46,54,'vulture',5,8,60,300,0,0,0,0,0,0,'',0,172);

-- Eastern Thanalan (zone 171) lv10-20
INSERT INTO `server_battlenpc_groups` VALUES (47,47,'coblyn',10,14,90,600,0,0,0,0,0,0,'',0,171);
INSERT INTO `server_battlenpc_groups` VALUES (48,46,'salamander',13,17,90,850,0,0,0,0,0,0,'',0,171);

-- Western La Noscea (zone 129) lv10-20
INSERT INTO `server_battlenpc_groups` VALUES (49,44,'aldgoat',12,16,90,750,0,0,0,0,0,0,'',0,129);
INSERT INTO `server_battlenpc_groups` VALUES (50,42,'gigantoad',14,18,90,900,0,0,0,0,0,0,'',0,129);

-- East Shroud (zone 151) lv10-20
INSERT INTO `server_battlenpc_groups` VALUES (51,45,'diremite',12,16,90,750,0,0,0,0,0,0,'',0,151);
INSERT INTO `server_battlenpc_groups` VALUES (52,48,'spriggan',10,14,90,600,0,0,0,0,0,0,'',0,151);

-- Eastern La Noscea (zone 130) lv15-25
INSERT INTO `server_battlenpc_groups` VALUES (53,38,'coeurl',18,22,120,1200,0,0,0,0,0,0,'',0,130);
INSERT INTO `server_battlenpc_groups` VALUES (54,52,'qiqirn',16,20,90,950,0,0,0,0,0,0,'',0,130);

-- North Shroud (zone 152) lv20-30
INSERT INTO `server_battlenpc_groups` VALUES (55,55,'ixal',22,26,120,1250,0,0,0,0,0,0,'',0,152);
INSERT INTO `server_battlenpc_groups` VALUES (56,51,'imp',20,24,120,1100,0,0,0,0,0,0,'',0,152);

-- South Shroud (zone 154) lv15-25
INSERT INTO `server_battlenpc_groups` VALUES (57,40,'morbol',18,22,120,1200,0,0,0,0,0,0,'',0,154);
INSERT INTO `server_battlenpc_groups` VALUES (58,41,'flan',16,20,90,950,0,0,0,0,0,0,'',0,154);

-- Coerthas Central (zone 143) lv30-45
INSERT INTO `server_battlenpc_groups` VALUES (59,49,'ahriman',32,37,120,2000,0,0,0,0,0,0,'',0,143);
INSERT INTO `server_battlenpc_groups` VALUES (60,53,'grenade',35,40,120,2100,0,0,0,0,0,0,'',0,143);
INSERT INTO `server_battlenpc_groups` VALUES (61,56,'kobold',30,35,120,1700,0,0,0,0,0,0,'',0,143);
-- Ixali Fencer high-level Lv46-49
INSERT INTO `server_battlenpc_groups` VALUES (62,57,'ixal',46,49,120,4500,200,0,0,0,0,0,'',0,143);
-- Additional monster variants across all zones
INSERT INTO `server_battlenpc_groups` VALUES (63,72,'stray_dodo',3,7,90,200,0,0,0,0,0,0,'',0,128);
INSERT INTO `server_battlenpc_groups` VALUES (64,73,'painted_ladybug',2,5,60,120,0,0,0,0,0,0,'',0,128);
INSERT INTO `server_battlenpc_groups` VALUES (65,65,'star_marmot',3,6,60,150,0,0,0,0,0,0,'',0,150);
INSERT INTO `server_battlenpc_groups` VALUES (66,64,'dormouse',2,6,60,130,0,0,0,0,0,0,'',0,170);
INSERT INTO `server_battlenpc_groups` VALUES (67,58,'giant_gnat',4,8,90,180,0,0,0,0,0,0,'',0,172);
INSERT INTO `server_battlenpc_groups` VALUES (68,63,'shaggy_wolf',12,16,90,700,0,0,0,0,0,0,'',0,129);
INSERT INTO `server_battlenpc_groups` VALUES (69,66,'roseling',10,14,90,550,0,0,0,0,0,0,'',0,129);
INSERT INTO `server_battlenpc_groups` VALUES (70,67,'weevil',13,17,90,650,0,0,0,0,0,0,'',0,151);
INSERT INTO `server_battlenpc_groups` VALUES (71,59,'puk',12,16,90,750,0,0,0,0,0,0,'',0,171);
INSERT INTO `server_battlenpc_groups` VALUES (72,60,'sabotender',18,22,120,1000,0,0,0,0,0,0,'',0,130);
INSERT INTO `server_battlenpc_groups` VALUES (73,69,'greedy_angler',16,20,120,850,0,0,0,0,0,0,'',0,130);
INSERT INTO `server_battlenpc_groups` VALUES (74,61,'amaljaa_pugilist',24,28,120,1300,100,0,0,0,0,0,'',0,152);
INSERT INTO `server_battlenpc_groups` VALUES (75,62,'escaped_goobbue',18,22,180,2000,0,0,0,0,0,0,'',0,154);
INSERT INTO `server_battlenpc_groups` VALUES (76,68,'redhorn_ogre',38,43,120,3200,0,0,0,0,0,0,'',0,143);
INSERT INTO `server_battlenpc_groups` VALUES (77,70,'cloud_hippocerf',35,40,120,2800,0,0,0,0,0,0,'',0,143);
INSERT INTO `server_battlenpc_groups` VALUES (78,71,'acid_bomb',33,38,120,1800,0,0,0,0,0,0,'',0,143);
-- Additional monster variants (auto-generated from client data)
INSERT INTO `server_battlenpc_groups` VALUES (79,74,'sea_puk',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (80,75,'canopy_galago',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (81,76,'opo_opo',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (82,77,'curious_galago',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (83,78,'cactuar',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (84,79,'cochineal_cactuar',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (85,80,'sabotender',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (86,81,'sabotender_del_sol',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (87,82,'sabotender_del_sol',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (88,83,'desert_rose',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (89,84,'cactuar_jack',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (90,85,'cactuar',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (91,86,'feral_watchdog',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (92,87,'aldgoat_billy',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (93,88,'ravenous_billygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (94,89,'ravenous_billygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (95,90,'aldgoat_nanny',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (96,91,'ravenous_nannygoat',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (97,92,'ravenous_nannygoat',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (98,93,'spinesnap_ogre',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (99,94,'thorned_roseling',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (100,95,'thorned_roseling',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (101,96,'roselet',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (102,97,'roselet',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (103,98,'prickly_roselet',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (104,99,'mirror_roselet',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (105,100,'battrap',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (106,101,'gnattrap',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (107,102,'kedtrap',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (108,103,'vulturetrap',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (109,104,'pteroctrap',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (110,105,'imptrap',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (111,106,'eyetrap',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (112,107,'musk_roseling',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (113,108,'barometz',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (114,109,'roseling',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (115,110,'landtrap',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (116,111,'toadtrap',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (117,112,'pruned_roselet',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (118,113,'beady_beetle',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (119,114,'beady_beetle',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (120,115,'ladybug',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (121,116,'maidenbug',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (122,117,'ladybug',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (123,118,'oilbug',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (124,119,'plains_rat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (125,120,'dire_rat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (126,121,'arbor_squirrel',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (127,122,'mun_tuy_squirrel',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (128,123,'thistletail_marmot',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (129,124,'thistletail_marmot',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (130,125,'hispid_dormouse',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (131,126,'deadly_dormouse',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (132,127,'pygmy_dormouse',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (133,128,'dormouse',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (134,129,'spiny_dormouse',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (135,130,'deadly_dormouse',22,32,1080,0,5,5,0,0,0,1,130,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (136,131,'nutgrabber_marmot',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (137,132,'bristletail_marmot',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (138,133,'rat',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (139,134,'squirrel',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (140,135,'marmot',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (141,136,'dormouse',35,50,1675,0,5,5,0,0,0,1,132,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (142,137,'star_marmot',35,50,1675,0,5,5,0,0,0,1,132,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (143,138,'sewer_mole',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (144,139,'spriggan_collector',15,25,800,0,5,5,0,0,0,1,129,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (145,140,'amaljaa_grappler',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (146,141,'amaljaa_grappler',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (147,142,'amaljaa_grappler',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (148,143,'amaljaa_grappler',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (149,144,'amaljaa_grappler',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (150,145,'territorial_wolf',28,38,1320,0,5,5,0,0,0,1,131,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (151,146,'lowland_billygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (152,147,'sure_footed_billygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (153,148,'death_marked_billygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (154,149,'lowland_nannygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (155,150,'lowland_nannygoat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (156,151,'suckling_nannygoat',8,18,520,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (157,152,'plague_rat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (158,153,'wingrat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (159,154,'wingrat',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (160,155,'brine_bogy',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (161,156,'chiglet',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (162,157,'rat_mole',1,10,225,0,5,5,0,0,0,1,128,0,0);
INSERT INTO `server_battlenpc_groups` VALUES (163,158,'ifrit',1,10,225,0,5,5,0,0,0,1,128,0,0);
/*!40000 ALTER TABLE `server_battlenpc_groups` ENABLE KEYS */;
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
