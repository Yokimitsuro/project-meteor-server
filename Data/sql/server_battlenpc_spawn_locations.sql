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
-- Table structure for table `server_battlenpc_spawn_locations`
--

DROP TABLE IF EXISTS `server_battlenpc_spawn_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_battlenpc_spawn_locations` (
  `bnpcId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customDisplayName` varchar(32) NOT NULL DEFAULT '',
  `groupId` int(10) unsigned NOT NULL,
  `positionX` float NOT NULL,
  `positionY` float NOT NULL,
  `positionZ` float NOT NULL,
  `rotation` float NOT NULL,
  PRIMARY KEY (`bnpcId`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_spawn_locations`
--

LOCK TABLES `server_battlenpc_spawn_locations` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_spawn_locations` DISABLE KEYS */;
set autocommit=0;

-- ============================================================
-- Original spawns (zone 170 test rats + zone 166 battle)
-- ============================================================
INSERT INTO `server_battlenpc_spawn_locations` VALUES (1,'wharf_rat',1,25.584,200,-450,-2.514);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (2,'wharf_rat',1,20,200,-444,-3.14);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (3,'bloodthirsty_wolf',2,374.427,4.4,-698.711,-1.942);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (4,'bloodthirsty_wolf',2,375.377,4.4,-700.247,-1.992);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (5,'bloodthirsty_wolf',2,375.125,4.4,-703.591,-1.54);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (6,'yda',3,365.266,4.122,-700.73,1.5659);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (7,'papalymo',4,365.89,4.0943,-706.72,-0.718);

-- ============================================================
-- Central Thanalan (zone 170) - near Camp Black Brush (33,201,-482)
-- ============================================================
-- Group 5: Lemmings lv1-3 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (8,'',5,80,200,-380,0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (9,'',5,95,199,-375,1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (10,'',5,-20,198,-400,-1.2);
-- Group 6: Bugs lv3-5 (between camp and cactus basin)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (11,'',6,200,195,-300,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (12,'',6,220,194,-280,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (13,'',6,180,196,-320,1.8);
-- Group 7: Cactuars lv5-8 (near Cactus Basin gate 639,185,122)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (14,'',7,550,188,50,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (15,'',7,580,186,80,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (16,'',7,520,190,30,2.0);
-- Group 8: Moles lv4-7 (between areas)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (17,'',8,350,200,-200,0.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (18,'',8,380,198,-180,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (19,'',8,320,201,-220,1.0);

-- ============================================================
-- Lower La Noscea (zone 128) - near Camp Bearded Rock (30,46,-35)
-- ============================================================
-- Group 9: Lemmings lv1-3 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (20,'',9,100,46,-80,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (21,'',9,120,45,-60,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (22,'',9,80,46,-100,2.0);
-- Group 10: Dodos lv2-5 (toward Cedarwood gate 582,55,-1)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (23,'',10,300,50,-30,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (24,'',10,320,49,-10,1.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (25,'',10,280,51,-50,-0.8);
-- Group 11: Bats lv4-7 (near cliffs)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (26,'',11,500,52,20,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (27,'',11,480,53,40,0.7);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (28,'',11,520,51,0,2.5);
-- Group 12: Ladybugs lv6-9 (toward Moraby Bay gate 318,25,581)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (29,'',12,250,35,300,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (30,'',12,270,33,320,-2.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (31,'',12,230,37,280,1.5);

-- ============================================================
-- Central Shroud (zone 150) - near Camp Bentbranch (288,4,-544)
-- ============================================================
-- Group 13: Hares lv1-4 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (32,'',13,220,5,-480,0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (33,'',13,240,4,-460,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (34,'',13,200,6,-500,1.8);
-- Group 14: Chigoes lv2-4 (scattered)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (35,'',14,100,5,-520,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (36,'',14,120,4,-500,2.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (37,'',14,80,6,-540,-1.5);
-- Group 15: Monkeys lv3-6 (forest)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (38,'',15,400,8,-400,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (39,'',15,420,7,-380,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (40,'',15,380,9,-420,2.2);
-- Group 16: Flowers lv5-9 (toward Five Hangs gate 636,17,-324)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (41,'',16,500,12,-350,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (42,'',16,520,11,-330,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (43,'',16,480,13,-370,1.0);

-- ============================================================
-- Western Thanalan (zone 172) - near Camp Horizon (-1315,57,-147)
-- ============================================================
-- Group 17: Nuteaters lv1-4 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (44,'',17,-1250,55,-200,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (45,'',17,-1230,54,-220,-1.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (46,'',17,-1270,56,-180,1.8);
-- Group 18: Cactuars lv3-6 (between camp and Nophica's Wells -866,89,376)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (47,'',18,-1100,65,50,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (48,'',18,-1080,63,70,-2.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (49,'',18,-1120,67,30,1.5);
-- Group 19: Flowers lv5-8 (near Nophica's Wells)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (50,'',19,-920,85,300,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (51,'',19,-940,83,280,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (52,'',19,-900,87,320,2.5);
-- Group 20: Ladybugs lv6-9 (toward Footfalls gate -1653,25,-469)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (53,'',20,-1500,30,-350,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (54,'',20,-1480,28,-370,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (55,'',20,-1520,32,-330,1.5);

-- ============================================================
-- Eastern Thanalan (zone 171) - near Camp Drybone (1251,264,-544)
-- ============================================================
-- Group 21: Cactuars lv10-14 (near Drybone)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (56,'',21,1350,262,-450,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (57,'',21,1370,260,-430,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (58,'',21,1330,264,-470,2.0);
-- Group 22: Lizardmen lv12-16 (Halatali area, gate 1599,259,-233)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (59,'',22,1500,260,-300,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (60,'',22,1520,258,-280,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (61,'',22,1480,262,-320,1.5);
-- Group 23: Bombs lv14-18 (Burning Wall area, gate 2010,281,-768)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (62,'',23,1900,275,-700,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (63,'',23,1920,273,-680,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (64,'',23,1880,277,-720,2.0);
-- Group 24: Poisonous Flowers lv11-15 (Sandgate area, gate 2015,248,64)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (65,'',24,1900,250,-50,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (66,'',24,1920,248,-30,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (67,'',24,1880,252,-70,1.0);

-- ============================================================
-- Western La Noscea (zone 129) - near Camp Skull Valley (-992,62,-1121)
-- ============================================================
-- Group 25: Wolves lv10-14 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (68,'',25,-900,55,-1050,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (69,'',25,-920,53,-1070,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (70,'',25,-880,57,-1030,2.0);
-- Group 26: Bats lv11-15 (between camps, toward Bald Knoll -1883,54,-1373)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (71,'',26,-1400,50,-1250,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (72,'',26,-1420,48,-1270,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (73,'',26,-1380,52,-1230,1.2);
-- Group 27: Moles lv12-16 (Woad Whisper area, gate -636,50,-1287)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (74,'',27,-700,48,-1200,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (75,'',27,-720,46,-1220,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (76,'',27,-680,50,-1180,2.5);

-- ============================================================
-- East Shroud (zone 151) - near Camp Nine Ivies (1702,20,-862)
-- ============================================================
-- Group 28: Boars lv10-14 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (77,'',28,1600,22,-900,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (78,'',28,1620,21,-920,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (79,'',28,1580,23,-880,1.5);
-- Group 29: Large Monkeys lv12-15 (toward Lynx Pelt Patch 1296,48,-1534)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (80,'',29,1400,35,-1300,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (81,'',29,1420,33,-1280,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (82,'',29,1380,37,-1320,2.0);
-- Group 30: Yak Females lv13-17 (Verdant Drop area, gate 1529,27,-1147)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (83,'',30,1600,25,-1050,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (84,'',30,1620,23,-1030,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (85,'',30,1580,27,-1070,2.0);
-- Group 31: Flowers lv14-18 (Lark's Call area, gate 2297,33,-703)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (86,'',31,2100,30,-750,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (87,'',31,2120,28,-730,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (88,'',31,2080,32,-770,1.0);

-- ============================================================
-- Eastern La Noscea (zone 130) - near Camp Bloodshore (1123,46,-929)
-- ============================================================
-- Group 32: Winglizards lv15-19 (Tigerhelm area, gate 1628,62,-449)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (89,'',32,1500,55,-500,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (90,'',32,1520,53,-480,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (91,'',32,1480,57,-520,2.0);
-- Group 33: Wolves lv17-21 (near Bloodshore)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (92,'',33,1200,43,-850,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (93,'',33,1220,41,-830,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (94,'',33,1180,45,-870,1.5);
-- Group 34: Raptors lv20-24 (Agelyss Wise area, gate 1410,55,-1650)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (95,'',34,1350,50,-1500,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (96,'',34,1370,48,-1480,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (97,'',34,1330,52,-1520,2.5);

-- ============================================================
-- North Shroud (zone 152) - near Camp Emerald Moss (-1052,21,-1760)
-- ============================================================
-- Group 35: Yak Males lv20-24 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (98,'',35,-980,22,-1850,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (99,'',35,-1000,21,-1870,-1.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (100,'',35,-960,23,-1830,1.8);
-- Group 36: Goblins lv22-26 (Treespeak area, gate -888,40,-2192)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (101,'',36,-920,35,-2100,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (102,'',36,-940,33,-2120,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (103,'',36,-900,37,-2080,1.5);
-- Group 37: Sprites lv24-28 (Alder Springs area, gate -1567,17,-2593)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (104,'',37,-1450,18,-2500,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (105,'',37,-1470,17,-2520,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (106,'',37,-1430,19,-2480,2.0);

-- ============================================================
-- South Shroud (zone 154) - near Camp Tranquil (734,-12,1126)
-- ============================================================
-- Group 38: Funguars lv15-18 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (107,'',38,800,-10,1050,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (108,'',38,820,-11,1030,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (109,'',38,780,-9,1070,1.5);
-- Group 39: Petitghosts lv18-22 (Silent Arbor area, gate 991,-11,600)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (110,'',39,950,-10,700,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (111,'',39,970,-11,720,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (112,'',39,930,-9,680,2.0);

-- ============================================================
-- Coerthas Central (zone 143) - near Camp Dragonhead (216,303,-258)
-- ============================================================
-- Group 40: Yak Males lv30-35 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (113,'',40,300,300,-350,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (114,'',40,320,298,-370,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (115,'',40,280,302,-330,1.5);
-- Group 41: Griffins lv35-40 (Boulder Downs area, gate -517,210,543)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (116,'',41,-400,215,450,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (117,'',41,-420,213,430,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (118,'',41,-380,217,470,2.0);
-- Group 42: Ogres lv38-43 (Prominence Point area, gate 190,368,-662)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (119,'',42,250,360,-580,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (120,'',42,270,358,-560,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (121,'',42,230,362,-600,2.5);

-- ============================================================
-- NEW MONSTERS - 19 additional genera
-- ============================================================

-- Central Thanalan (170): Group 43 Antelope lv3-6 (near main road)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (122,'',43,450,193,-100,0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (123,'',43,470,192,-80,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (124,'',43,430,195,-120,1.8);

-- Lower La Noscea (128): Group 44 Megalo-crab lv5-9 (coastal Moraby Bay)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (125,'',44,200,30,400,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (126,'',44,220,28,420,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (127,'',44,180,32,380,2.0);

-- Central Shroud (150): Group 45 Sheep lv2-5 (near Bentbranch meadow)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (128,'',45,350,6,-520,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (129,'',45,370,5,-500,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (130,'',45,330,7,-540,1.5);

-- Western Thanalan (172): Group 46 Vulture lv5-8 (between camps)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (131,'',46,-1050,60,100,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (132,'',46,-1030,58,120,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (133,'',46,-1070,62,80,2.0);

-- Eastern Thanalan (171): Group 47 Coblyn lv10-14 (near mining areas)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (134,'',47,1450,258,-380,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (135,'',47,1470,256,-360,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (136,'',47,1430,260,-400,1.5);
-- Eastern Thanalan (171): Group 48 Salamander lv13-17 (near Burning Wall)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (137,'',48,1800,270,-650,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (138,'',48,1820,268,-630,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (139,'',48,1780,272,-670,2.0);

-- Western La Noscea (129): Group 49 Aldgoat lv12-16 (mountain paths)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (140,'',49,-1100,45,-1100,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (141,'',49,-1120,43,-1120,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (142,'',49,-1080,47,-1080,1.5);
-- Western La Noscea (129): Group 50 Gigantoad lv14-18 (wetland area)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (143,'',50,-1600,48,-1300,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (144,'',50,-1620,46,-1320,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (145,'',50,-1580,50,-1280,2.5);

-- East Shroud (151): Group 51 Diremite lv12-16 (deep forest)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (146,'',51,1500,28,-1100,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (147,'',51,1520,26,-1080,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (148,'',51,1480,30,-1120,2.0);
-- East Shroud (151): Group 52 Spriggan lv10-14 (near camp)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (149,'',52,1750,18,-800,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (150,'',52,1770,17,-780,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (151,'',52,1730,19,-820,1.5);

-- Eastern La Noscea (130): Group 53 Coeurl lv18-22 (Agelyss area)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (152,'',53,1450,52,-1400,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (153,'',53,1470,50,-1380,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (154,'',53,1430,54,-1420,2.5);
-- Eastern La Noscea (130): Group 54 Qiqirn lv16-20 (near Bloodshore)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (155,'',54,1150,42,-780,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (156,'',54,1170,40,-760,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (157,'',54,1130,44,-800,2.0);

-- North Shroud (152): Group 55 Ixal lv22-26 (Treespeak area)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (158,'',55,-850,38,-2150,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (159,'',55,-870,36,-2170,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (160,'',55,-830,40,-2130,1.5);
-- North Shroud (152): Group 56 Imp lv20-24 (dark forest)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (161,'',56,-1100,20,-1950,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (162,'',56,-1120,19,-1970,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (163,'',56,-1080,21,-1930,2.0);

-- South Shroud (154): Group 57 Morbol lv18-22 (Urth's Gift area)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (164,'',57,850,-8,850,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (165,'',57,870,-9,830,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (166,'',57,830,-7,870,2.5);
-- South Shroud (154): Group 58 Flan lv16-20 (Silent Arbor outskirts)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (167,'',58,900,-11,600,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (168,'',58,920,-12,580,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (169,'',58,880,-10,620,2.0);

-- Coerthas Central (143): Group 59 Ahriman lv32-37 (Stone Vigil approach)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (170,'',59,-300,220,350,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (171,'',59,-320,218,330,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (172,'',59,-280,222,370,1.5);
-- Coerthas Central (143): Group 60 Grenade lv35-40 (volcanic area)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (173,'',60,-450,210,500,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (174,'',60,-470,208,480,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (175,'',60,-430,212,520,2.0);
-- Coerthas Central (143): Group 61 Kobold lv30-35 (mountain base)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (176,'',61,350,305,-400,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (177,'',61,370,303,-420,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (178,'',61,330,307,-380,1.5);

-- Ixali Fencer HL (zone 143)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (179,'',62,400,310,-450,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (180,'',62,420,308,-470,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (181,'',62,380,312,-430,2.0);
-- Additional monster spawns
INSERT INTO `server_battlenpc_spawn_locations` VALUES (182,'',63,150,50,-200,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (183,'',63,170,48,-180,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (184,'',63,130,52,-220,2.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (185,'',64,-100,30,150,0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (186,'',64,-80,28,170,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (187,'',64,-120,32,130,1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (188,'',65,300,25,-100,0.1);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (189,'',65,320,23,-80,-1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (190,'',65,280,27,-120,1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (191,'',66,-200,15,100,0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (192,'',66,-180,13,120,-0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (193,'',66,-220,17,80,2.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (194,'',67,450,10,-300,0.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (195,'',67,470,8,-280,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (196,'',67,430,12,-320,1.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (197,'',68,600,80,-400,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (198,'',68,620,78,-380,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (199,'',68,580,82,-420,2.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (200,'',69,-500,70,300,0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (201,'',69,-480,68,320,-1.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (202,'',69,-520,72,280,1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (203,'',70,400,55,200,0.7);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (204,'',70,420,53,220,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (205,'',70,380,57,180,2.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (206,'',71,-350,45,-250,0.4);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (207,'',71,-330,43,-230,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (208,'',71,-370,47,-270,1.6);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (209,'',72,800,100,-500,0.6);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (210,'',72,820,98,-480,-0.7);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (211,'',72,780,102,-520,2.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (212,'',73,-700,85,400,0.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (213,'',73,-680,83,420,-1.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (214,'',73,-720,87,380,1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (215,'',74,-900,42,-2000,0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (216,'',74,-920,40,-2020,-0.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (217,'',74,-880,44,-1980,1.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (218,'',75,500,60,-350,0.3);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (219,'',75,520,58,-330,-1.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (220,'',76,200,355,-550,0.7);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (221,'',76,220,353,-530,-0.5);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (222,'',76,180,357,-570,2.0);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (223,'',77,-350,225,400,0.4);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (224,'',77,-330,223,420,-1.2);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (225,'',77,-370,227,380,1.8);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (226,'',78,-500,215,550,0.6);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (227,'',78,-480,213,530,-0.9);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (228,'',78,-520,217,570,1.3);

-- Additional monster variants (auto-generated from client data)
INSERT INTO `server_battlenpc_spawn_locations` VALUES (229,'',79,-161.8,22.8,46.5,0.85);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (230,'',79,160.7,28.9,1.3,1.10);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (231,'',79,-125.7,23.8,91.7,2.48);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (232,'',80,-19.3,27.9,-94.6,5.38);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (233,'',80,-38.4,5.4,-117.5,5.19);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (234,'',80,-29.7,29.5,-173.4,2.58);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (235,'',81,8.1,16.3,-96.0,4.12);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (236,'',81,186.9,27.6,-90.4,3.76);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (237,'',81,-78.7,28.7,-166.7,3.78);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (238,'',82,111.1,7.8,-24.7,6.00);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (239,'',82,171.1,12.9,0.6,0.80);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (240,'',82,44.2,16.5,46.1,1.61);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (241,'',83,191.8,-6.1,-181.7,5.27);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (242,'',83,99.9,-7.6,-15.5,2.50);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (243,'',83,102.2,17.4,149.8,0.32);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (244,'',84,-100.1,-1.0,9.3,1.78);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (245,'',84,-79.4,25.5,-112.1,5.23);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (246,'',84,-78.5,21.4,-33.2,0.09);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (247,'',85,-51.4,4.9,-91.8,3.09);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (248,'',85,75.6,9.9,-44.3,0.51);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (249,'',85,193.1,5.1,-177.5,2.53);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (250,'',86,-11.9,2.6,-72.2,2.38);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (251,'',86,-158.5,24.1,65.4,3.11);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (252,'',86,183.0,23.3,198.7,4.18);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (253,'',87,164.9,20.5,195.7,1.52);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (254,'',87,-39.6,2.3,-175.9,0.83);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (255,'',87,-55.8,14.2,-169.0,5.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (256,'',88,132.7,3.7,158.6,0.70);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (257,'',88,-150.8,14.3,-162.6,1.93);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (258,'',88,143.7,-7.7,-140.1,4.68);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (259,'',89,191.7,-7.3,16.4,1.38);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (260,'',89,161.9,6.0,-198.2,1.45);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (261,'',89,-92.8,10.8,-186.3,6.01);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (262,'',90,167.9,15.9,39.8,5.42);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (263,'',90,-144.3,2.5,-170.7,5.48);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (264,'',90,-44.8,21.8,106.0,2.72);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (265,'',91,138.4,14.5,-184.3,5.72);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (266,'',91,-61.3,23.0,85.5,1.70);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (267,'',91,-45.7,14.7,100.6,1.00);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (268,'',92,117.7,27.6,143.9,1.90);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (269,'',92,-7.9,4.3,19.5,1.61);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (270,'',92,-80.6,-6.3,-102.5,4.67);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (271,'',93,28.0,-5.2,171.1,3.63);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (272,'',93,150.0,4.7,-164.7,4.20);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (273,'',93,114.6,22.9,-109.8,0.93);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (274,'',94,48.7,19.5,144.7,0.36);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (275,'',94,1.8,3.3,-32.5,2.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (276,'',94,-128.8,4.5,75.1,3.04);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (277,'',95,-125.5,-4.4,-118.0,4.84);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (278,'',95,89.1,11.8,-50.3,2.13);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (279,'',95,141.7,2.7,147.1,3.34);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (280,'',96,174.7,20.3,-87.1,4.65);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (281,'',96,-36.5,21.4,25.5,2.97);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (282,'',96,167.7,27.1,53.7,1.20);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (283,'',97,-118.4,-8.5,102.0,4.81);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (284,'',97,47.7,29.4,-31.2,4.51);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (285,'',97,195.5,24.2,-148.0,4.68);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (286,'',98,-198.7,7.9,128.4,2.58);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (287,'',98,195.7,16.6,91.4,1.76);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (288,'',98,71.9,-8.6,154.6,5.40);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (289,'',99,51.1,15.7,34.1,0.44);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (290,'',99,-56.8,0.7,112.6,5.80);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (291,'',99,149.1,11.2,153.2,1.11);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (292,'',100,85.1,18.1,-7.5,2.01);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (293,'',100,-69.5,0.7,28.6,4.25);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (294,'',100,86.6,17.1,-185.6,5.55);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (295,'',101,-193.6,-3.8,111.5,1.79);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (296,'',101,-121.2,3.8,-185.0,5.59);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (297,'',101,66.6,-8.8,86.2,5.15);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (298,'',102,92.8,0.5,103.4,0.68);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (299,'',102,-130.4,16.7,-163.3,1.08);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (300,'',102,-35.4,28.2,-103.1,0.82);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (301,'',103,-110.5,14.9,175.5,3.84);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (302,'',103,84.9,29.8,138.9,2.42);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (303,'',103,-178.3,-3.4,-54.5,1.41);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (304,'',104,17.9,20.9,-190.9,5.41);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (305,'',104,71.8,-7.4,94.5,0.28);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (306,'',104,51.4,-3.3,-10.6,5.11);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (307,'',105,187.8,21.3,98.3,2.66);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (308,'',105,-69.7,-5.2,23.7,0.08);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (309,'',105,-67.0,-9.4,-93.0,3.82);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (310,'',106,-134.3,11.5,-92.3,4.47);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (311,'',106,80.1,15.7,-75.7,6.18);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (312,'',106,73.9,10.4,-61.9,3.66);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (313,'',107,-196.7,16.0,133.9,4.32);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (314,'',107,-10.6,29.4,154.8,1.96);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (315,'',107,-23.8,25.6,142.9,6.10);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (316,'',108,-51.4,12.2,22.1,2.55);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (317,'',108,-35.3,29.1,108.1,1.84);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (318,'',108,-131.1,-5.6,-41.4,2.85);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (319,'',109,22.4,22.8,-92.1,3.12);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (320,'',109,-124.1,20.7,-104.5,4.98);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (321,'',109,-155.3,1.3,-27.6,2.81);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (322,'',110,-7.7,14.6,156.7,4.07);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (323,'',110,-194.5,9.5,26.7,5.70);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (324,'',110,-125.4,21.4,-21.1,3.70);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (325,'',111,-110.2,21.5,-152.9,3.18);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (326,'',111,124.9,14.4,129.2,3.88);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (327,'',111,46.2,5.4,25.1,0.05);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (328,'',112,-139.4,6.8,-167.7,2.72);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (329,'',112,155.0,14.3,-105.2,0.69);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (330,'',112,-28.4,14.2,69.7,3.29);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (331,'',113,-48.4,-3.7,102.2,4.12);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (332,'',113,190.9,9.9,183.3,0.13);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (333,'',113,124.1,-5.8,-131.8,1.88);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (334,'',114,-178.7,2.3,-159.6,4.98);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (335,'',114,95.4,12.6,-12.0,0.06);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (336,'',114,101.1,5.9,-69.5,0.84);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (337,'',115,52.7,19.6,-163.9,0.24);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (338,'',115,-122.9,-2.4,-195.2,2.39);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (339,'',115,-121.8,-1.8,-177.0,4.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (340,'',116,9.4,7.4,-21.5,1.62);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (341,'',116,-104.4,26.6,194.1,0.47);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (342,'',116,-182.6,-2.5,-72.0,5.17);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (343,'',117,-172.1,24.6,-85.8,3.86);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (344,'',117,192.2,3.1,-43.2,1.18);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (345,'',117,-78.3,26.8,-126.5,1.61);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (346,'',118,89.7,21.0,-11.5,2.26);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (347,'',118,-94.4,-8.6,11.4,5.33);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (348,'',118,156.5,10.1,166.6,1.09);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (349,'',119,84.5,2.3,-33.0,3.52);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (350,'',119,-192.1,-4.1,195.2,1.37);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (351,'',119,-56.2,23.9,-155.8,5.47);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (352,'',120,-101.0,13.3,-179.9,3.95);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (353,'',120,-125.2,7.3,-176.7,5.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (354,'',120,-43.9,16.7,-82.6,5.44);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (355,'',121,36.1,2.5,151.2,3.15);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (356,'',121,11.4,-3.7,94.4,4.22);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (357,'',121,184.6,12.8,16.8,4.42);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (358,'',122,-60.1,10.4,-54.9,1.04);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (359,'',122,55.2,29.7,-177.0,1.75);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (360,'',122,-58.5,19.7,-120.5,4.05);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (361,'',123,-199.0,14.6,102.1,0.96);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (362,'',123,50.3,18.0,163.0,1.51);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (363,'',123,176.2,-8.3,41.0,5.09);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (364,'',124,34.4,27.8,-12.8,2.72);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (365,'',124,-41.0,6.6,144.1,4.01);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (366,'',124,42.0,24.5,100.8,3.12);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (367,'',125,114.2,24.3,-61.9,3.16);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (368,'',125,-31.8,29.7,62.9,0.59);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (369,'',125,17.3,4.0,-163.5,4.12);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (370,'',126,-192.8,20.7,-195.1,2.15);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (371,'',126,36.0,0.4,-52.8,1.05);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (372,'',126,3.8,22.2,-15.1,2.36);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (373,'',127,-63.2,5.6,78.1,4.53);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (374,'',127,-82.6,7.4,125.1,3.45);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (375,'',127,-58.0,3.7,184.8,0.77);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (376,'',128,72.8,9.1,-54.5,6.24);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (377,'',128,186.2,-8.7,-168.9,5.17);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (378,'',128,-101.3,11.0,-118.6,0.10);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (379,'',129,57.3,18.7,18.9,5.25);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (380,'',129,62.8,-4.0,2.7,3.74);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (381,'',129,130.8,18.5,24.8,5.96);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (382,'',130,-65.6,9.8,-46.0,2.21);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (383,'',130,-48.4,3.1,-24.4,4.76);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (384,'',130,6.1,-5.0,109.6,4.62);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (385,'',131,-120.6,-3.6,-106.0,2.44);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (386,'',131,133.2,23.2,-143.0,3.02);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (387,'',131,106.9,6.4,138.8,2.25);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (388,'',132,-180.7,10.4,-92.4,4.35);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (389,'',132,-82.3,1.4,-91.1,2.22);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (390,'',132,-199.3,23.5,-123.1,3.87);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (391,'',133,-128.9,18.6,-111.7,2.11);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (392,'',133,-6.0,-0.7,158.4,3.68);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (393,'',133,-173.5,-7.4,-94.4,5.77);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (394,'',134,-82.2,26.2,-123.8,1.69);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (395,'',134,149.4,26.8,119.7,5.93);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (396,'',134,-13.4,25.5,-74.8,0.48);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (397,'',135,-77.8,15.0,126.5,4.30);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (398,'',135,95.3,23.4,-150.3,3.26);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (399,'',135,-22.8,5.2,-70.5,4.51);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (400,'',136,-72.4,-7.7,11.9,0.58);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (401,'',136,139.1,11.8,173.4,1.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (402,'',136,70.5,25.7,-134.3,4.74);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (403,'',137,34.8,29.7,14.1,3.14);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (404,'',137,144.4,20.6,113.4,3.54);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (405,'',137,-94.1,9.3,-49.9,4.08);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (406,'',138,-118.7,-0.8,14.1,2.04);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (407,'',138,-117.0,7.0,164.1,1.84);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (408,'',138,-47.2,11.3,165.6,2.43);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (409,'',139,-36.5,-1.9,21.9,2.87);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (410,'',139,18.5,3.3,-78.4,1.04);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (411,'',139,1.9,26.1,9.8,4.10);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (412,'',140,-5.4,-0.9,190.5,4.39);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (413,'',140,-54.1,24.2,103.7,0.46);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (414,'',140,-197.1,-5.4,-195.2,4.19);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (415,'',141,-3.5,3.3,-98.6,4.86);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (416,'',141,90.5,28.4,-191.9,2.21);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (417,'',141,-24.9,8.3,-58.3,4.13);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (418,'',142,89.5,16.4,-181.6,3.62);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (419,'',142,25.5,20.9,-126.8,3.11);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (420,'',142,150.3,13.1,-119.0,4.48);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (421,'',143,66.8,20.8,140.6,3.77);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (422,'',143,128.9,9.0,126.3,6.26);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (423,'',143,124.1,24.5,-167.9,2.71);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (424,'',144,73.6,-4.3,131.0,3.08);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (425,'',144,-83.3,-7.9,11.6,0.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (426,'',144,-192.6,4.2,-88.8,0.29);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (427,'',145,92.2,11.5,198.3,3.33);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (428,'',145,-47.2,14.5,-146.5,1.97);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (429,'',145,-140.0,20.3,-182.5,5.81);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (430,'',146,187.6,5.1,34.8,2.73);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (431,'',146,-158.4,27.6,-105.0,5.02);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (432,'',146,-48.8,18.5,85.3,3.88);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (433,'',147,69.9,-8.8,-155.6,2.47);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (434,'',147,-105.2,8.9,161.4,5.88);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (435,'',147,75.2,6.8,6.2,5.00);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (436,'',148,-98.5,-2.2,172.2,0.61);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (437,'',148,-147.8,0.4,-76.4,5.13);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (438,'',148,170.9,-5.1,-190.1,4.07);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (439,'',149,55.1,2.9,-58.2,0.92);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (440,'',149,185.8,-9.7,-66.7,2.15);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (441,'',149,-46.1,28.3,-64.1,2.54);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (442,'',150,81.6,15.6,-77.4,5.59);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (443,'',150,-168.2,-2.6,198.7,5.79);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (444,'',150,-149.8,6.1,43.7,0.28);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (445,'',151,-0.2,17.0,91.3,4.64);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (446,'',151,110.9,-4.9,-80.9,3.43);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (447,'',151,22.5,5.2,99.8,4.98);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (448,'',152,125.6,-5.3,106.3,0.32);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (449,'',152,-66.0,20.4,99.2,1.81);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (450,'',152,107.2,-9.6,51.1,3.01);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (451,'',153,161.3,21.7,-39.7,6.25);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (452,'',153,59.1,17.4,44.9,2.82);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (453,'',153,-28.1,14.4,-161.8,3.96);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (454,'',154,44.2,9.2,-148.5,2.94);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (455,'',154,-148.5,14.5,-75.6,4.27);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (456,'',154,-60.3,-6.6,6.9,3.58);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (457,'',155,62.9,13.1,78.4,3.98);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (458,'',155,146.8,-0.9,24.7,3.95);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (459,'',155,57.9,5.5,131.0,1.82);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (460,'',156,-128.1,12.2,24.6,2.09);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (461,'',156,139.7,22.0,-56.5,1.10);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (462,'',156,197.5,23.4,79.4,2.63);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (463,'',157,163.9,-1.2,15.2,5.03);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (464,'',157,-89.5,13.0,139.2,3.50);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (465,'',157,-117.4,18.5,-134.4,6.19);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (466,'',158,21.3,10.2,56.0,0.44);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (467,'',158,-78.5,28.6,-16.2,0.88);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (468,'',158,80.5,-2.9,-162.8,2.67);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (469,'',159,29.4,24.5,21.5,2.69);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (470,'',159,-53.1,-5.5,-137.6,1.57);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (471,'',159,-197.8,-2.6,-174.6,3.22);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (472,'',160,37.3,26.7,-91.9,2.99);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (473,'',160,-21.3,-3.8,-73.7,3.84);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (474,'',160,100.7,14.5,81.6,2.16);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (475,'',161,-40.6,-6.8,-56.4,2.99);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (476,'',161,-191.0,4.0,23.6,1.59);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (477,'',161,-100.0,29.5,120.4,4.77);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (478,'',162,-174.0,24.9,162.4,4.93);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (479,'',162,60.2,-3.8,155.3,2.75);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (480,'',162,-156.7,2.4,182.1,0.14);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (481,'',163,129.1,-8.0,-142.0,0.91);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (482,'',163,86.4,21.8,141.9,6.25);
INSERT INTO `server_battlenpc_spawn_locations` VALUES (483,'',163,92.0,9.9,-153.5,3.29);
/*!40000 ALTER TABLE `server_battlenpc_spawn_locations` ENABLE KEYS */;
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
