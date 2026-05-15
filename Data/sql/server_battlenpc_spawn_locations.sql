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
