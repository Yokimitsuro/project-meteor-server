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
-- Table structure for table `server_battlenpc_genus`
--

DROP TABLE IF EXISTS `server_battlenpc_genus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_battlenpc_genus` (
  `genusId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `modelSize` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `speed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `kindredId` int(11) unsigned NOT NULL DEFAULT '0',
  `kindredName` varchar(255) NOT NULL DEFAULT 'Unknown',
  `detection` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hpp` smallint(5) unsigned NOT NULL DEFAULT '100',
  `mpp` smallint(5) unsigned NOT NULL DEFAULT '100',
  `tpp` smallint(5) unsigned NOT NULL DEFAULT '100',
  `str` smallint(4) unsigned NOT NULL DEFAULT '1',
  `vit` smallint(4) unsigned NOT NULL DEFAULT '1',
  `dex` smallint(4) unsigned NOT NULL DEFAULT '1',
  `int` smallint(4) unsigned NOT NULL DEFAULT '1',
  `mnd` smallint(4) unsigned NOT NULL DEFAULT '1',
  `pie` smallint(4) unsigned NOT NULL DEFAULT '1',
  `att` smallint(4) unsigned NOT NULL DEFAULT '1',
  `acc` smallint(4) unsigned NOT NULL DEFAULT '1',
  `def` smallint(4) unsigned NOT NULL DEFAULT '1',
  `eva` smallint(4) unsigned NOT NULL DEFAULT '1',
  `slash` float NOT NULL DEFAULT '1',
  `pierce` float NOT NULL DEFAULT '1',
  `h2h` float NOT NULL DEFAULT '1',
  `blunt` float NOT NULL DEFAULT '1',
  `fire` float NOT NULL DEFAULT '1',
  `ice` float NOT NULL DEFAULT '1',
  `wind` float NOT NULL DEFAULT '1',
  `lightning` float NOT NULL DEFAULT '1',
  `earth` float NOT NULL DEFAULT '1',
  `water` float NOT NULL DEFAULT '1',
  `element` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`genusId`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_battlenpc_genus`
--

LOCK TABLES `server_battlenpc_genus` WRITE;
/*!40000 ALTER TABLE `server_battlenpc_genus` DISABLE KEYS */;
set autocommit=0;
-- Beast (kindredId=1)
INSERT INTO `server_battlenpc_genus` VALUES (1,'Aldgoat',2,8,1,'Beast',1,100,100,100,35,40,20,10,15,10,45,35,40,20,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (2,'Antelope',1,10,1,'Beast',1,100,100,100,25,25,35,10,10,10,35,35,25,40,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (3,'Wolf',1,10,1,'Beast',1,100,100,100,30,25,35,10,10,10,40,40,25,35,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (4,'Opo-opo',1,8,1,'Beast',1,100,100,100,20,20,30,15,15,10,30,35,20,35,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (5,'Coeurl',2,10,1,'Beast',13,100,100,100,55,50,45,30,25,15,70,60,50,45,1,1,1,1,1,1,1,1.25,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (6,'Goobbue',3,4,1,'Beast',5,100,100,100,65,80,15,20,30,15,75,40,80,10,0.75,0.75,1,0.75,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (7,'Sheep',1,6,1,'Beast',0,100,100,100,15,25,15,10,15,15,20,20,25,15,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (8,'Buffalo',2,6,1,'Beast',5,100,100,100,50,55,20,10,15,10,55,35,55,15,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (9,'Boar',1,8,1,'Beast',1,100,100,100,30,30,25,10,10,10,35,30,30,20,1,1,1,0.75,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (10,'Moon-Mouse',1,8,1,'Beast',4,100,100,100,20,20,25,15,10,10,25,30,20,30,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (11,'Mole',1,6,1,'Beast',4,100,100,100,25,25,20,10,10,10,30,25,30,20,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (12,'Rodent',1,8,1,'Beast',1,100,100,100,15,15,25,5,5,5,20,25,15,25,1,1,1,1,1,1,1,1,1,1,0);
-- Plantoid (kindredId=2)
INSERT INTO `server_battlenpc_genus` VALUES (13,'Cactuar',1,8,2,'Plantoid',1,100,100,100,25,20,30,20,15,15,35,40,25,30,1,0.75,1,1,1.25,1,1,1,0.75,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (14,'Funguar',1,4,2,'Plantoid',0,100,100,100,20,30,10,25,20,15,25,25,30,10,1,1,1,1,1.25,1,1,1,0.75,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (15,'Flying-trap',2,6,2,'Plantoid',1,100,100,100,40,35,25,20,15,10,45,35,35,20,1,1,1,1,1.25,1,1,1,0.75,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (16,'Morbol',3,4,2,'Plantoid',5,100,100,100,55,70,15,35,25,20,60,40,65,10,1,1,1,1,1.25,1,1,1,0.75,0.75,0);
-- Aquan (kindredId=3)
INSERT INTO `server_battlenpc_genus` VALUES (17,'Orobon',2,6,3,'Aquan',4,100,100,100,50,55,20,25,20,15,55,40,50,15,1,1,1,1,1,0.75,1,1.25,1,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (18,'Gigantoad',2,6,3,'Aquan',4,100,100,100,35,40,25,20,15,10,40,35,35,20,1,1,1,1,1,0.75,1,1.25,1,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (19,'Salamander',1,8,3,'Aquan',1,100,100,100,30,25,30,25,15,10,35,35,25,30,1,1,1,1,0.75,1,1,1.25,1,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (20,'Jelly-fish',1,4,3,'Aquan',0,100,100,100,15,20,10,30,25,20,20,25,15,10,1,1,1,1,1,0.75,1,1.25,1,0.75,6);
INSERT INTO `server_battlenpc_genus` VALUES (21,'Slug',1,4,3,'Aquan',0,100,100,100,15,20,10,10,10,10,20,20,20,5,1,1,1,1,1,0.75,1,1.25,1,0.75,0);
INSERT INTO `server_battlenpc_genus` VALUES (22,'Megalo-crab',2,6,3,'Aquan',1,100,100,100,40,45,15,10,15,10,45,35,50,10,0.75,0.75,0.75,0.75,1,0.75,1,1.25,1,0.75,0);
-- Spoken (kindredId=4)
INSERT INTO `server_battlenpc_genus` VALUES (23,'Amaalja',2,8,4,'Spoken',1,100,100,100,40,35,30,35,25,20,50,45,40,30,1,1,1,1,0.75,1,1.25,1,1,1,1);
INSERT INTO `server_battlenpc_genus` VALUES (24,'Ixal',1,8,4,'Spoken',1,100,100,100,35,30,35,25,20,15,45,45,30,35,1,1,1,1,1,1,0.75,1,1.25,1,3);
INSERT INTO `server_battlenpc_genus` VALUES (25,'Qiqirn',1,10,4,'Spoken',1,100,100,100,20,20,35,20,15,15,30,40,20,40,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (26,'Goblin',1,8,4,'Spoken',1,100,100,100,30,30,30,25,20,15,40,40,30,30,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (27,'Kobold',1,6,4,'Spoken',1,100,100,100,35,35,20,30,25,20,40,35,40,20,1,1,1,1,0.75,1,1,1,0.75,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (28,'Sylph',1,8,4,'Spoken',33,100,100,100,15,20,30,45,40,30,25,35,20,35,1,1,1,1,1,1,0.75,1,1.25,1,3);
INSERT INTO `server_battlenpc_genus` VALUES (29,'Person',2,8,4,'Spoken',1,100,100,100,35,35,30,30,25,20,45,40,35,30,1,1,1,1,1,1,1,1,1,1,0);
-- Reptilian (kindredId=5)
INSERT INTO `server_battlenpc_genus` VALUES (30,'Drake',3,8,5,'Reptilian',1,100,100,100,60,65,25,30,20,15,70,45,65,20,1,1,1,1,0.75,1,1,1,1,1,1);
INSERT INTO `server_battlenpc_genus` VALUES (31,'Basilisk',2,6,5,'Reptilian',1,100,100,100,50,55,20,25,20,10,55,40,55,15,1,1,1,1,1,1,1,1,0.75,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (32,'Raptor',2,10,5,'Reptilian',5,100,100,100,45,35,40,15,10,10,55,50,35,35,1,1,1,1,1,1.25,1,1,1,1,0);
-- Insect (kindredId=6)
INSERT INTO `server_battlenpc_genus` VALUES (33,'Ant-ring',1,8,6,'Insect',4,100,100,100,30,30,25,10,10,10,35,35,35,20,1,1,1,1,1.25,1,1,1,0.75,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (34,'Swarm',1,10,6,'Insect',4,100,100,100,15,10,35,10,10,5,25,35,10,40,1,1,1,1,1.25,1,0.75,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (35,'Diremite',2,8,6,'Insect',4,100,100,100,40,35,30,20,15,10,45,40,35,25,1,1,1,1,1.25,1,1,1,0.75,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (36,'Chigoe',1,10,6,'Insect',0,100,100,100,10,10,30,5,5,5,15,30,10,35,1,1,1,1,1.25,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (37,'Gnat',1,10,6,'Insect',0,100,100,100,12,10,30,10,5,5,18,30,10,35,1,1,1,1,1.25,1,0.75,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (38,'Beetle',2,6,6,'Insect',1,100,100,100,35,40,15,10,10,10,40,30,45,10,0.75,0.75,1,0.75,1.25,1,1,1,0.75,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (39,'Yarzon',1,8,6,'Insect',4,100,100,100,30,25,30,15,10,10,35,35,25,30,1,1,1,1,1.25,1,1,1,0.75,1,0);
-- Avian (kindredId=7)
INSERT INTO `server_battlenpc_genus` VALUES (40,'Apkallu',1,6,7,'Avian',0,100,100,100,20,25,25,10,15,10,25,30,25,25,1,1,1,1,1,0.75,1,1,1.25,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (41,'Vulture',2,8,7,'Avian',1,100,100,100,35,30,35,10,10,10,45,45,30,35,1,1,1,1,1,1,0.75,1,1.25,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (42,'Dodo',1,6,7,'Avian',0,100,100,100,15,20,15,5,10,10,20,20,20,15,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (43,'Bat',1,10,7,'Avian',4,100,100,100,15,15,30,10,10,5,20,30,15,35,1,1,1,1,1,1,0.75,1,1.25,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (44,'Hippogryph',3,10,7,'Avian',1,100,100,100,55,50,40,25,20,15,65,55,50,40,1,1,1,1,1,1,0.75,1,1.25,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (45,'Puk',1,10,7,'Avian',1,100,100,100,20,20,35,15,10,10,30,35,20,35,1,1,1,1,1,1,0.75,1,1.25,1,3);
-- Undead (kindredId=8)
INSERT INTO `server_battlenpc_genus` VALUES (46,'Ghost',1,6,8,'Undead',33,100,100,100,25,30,20,40,35,25,30,35,25,15,1.25,1.25,1.25,1.25,1.25,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (47,'The-Damned',2,6,8,'Undead',5,100,100,100,45,50,20,30,25,15,50,35,45,15,1.25,1,1,1,1.25,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (48,'Wight',2,8,8,'Undead',5,100,100,100,50,55,25,35,30,20,55,40,50,20,1,1,1,1,1.25,1,1,1,1,1,0);
-- Cursed (kindredId=9)
INSERT INTO `server_battlenpc_genus` VALUES (49,'Coblyn',1,8,9,'Cursed',1,100,100,100,25,25,25,15,10,10,30,30,30,25,0.75,0.75,1,0.75,1,1,1,1,0.75,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (50,'Spriggan',1,10,9,'Cursed',1,100,100,100,20,20,30,20,15,10,25,35,20,35,1,1,1,1,1,1,1,1,1,1,0);
-- Voidsent (kindredId=10)
INSERT INTO `server_battlenpc_genus` VALUES (51,'Ahriman',2,6,10,'Voidsent',33,100,100,100,35,35,25,50,40,30,40,45,35,25,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (52,'Imp',1,8,10,'Voidsent',1,100,100,100,25,20,30,30,20,15,30,35,20,30,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (53,'Will-O-Wisp',1,6,10,'Voidsent',32,100,100,100,10,15,15,40,35,25,15,30,15,15,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (54,'Fire-Elemental',2,6,10,'Voidsent',33,100,100,100,35,40,25,55,40,30,40,40,35,20,1,1,1,1,0.25,1.5,1,1,1,1.5,1);
INSERT INTO `server_battlenpc_genus` VALUES (55,'Water-Elemental',2,6,10,'Voidsent',33,100,100,100,35,40,25,55,40,30,40,40,35,20,1,1,1,1,1.5,0.75,1,1.25,1,0.25,6);
INSERT INTO `server_battlenpc_genus` VALUES (56,'Earth-Elemental',2,6,10,'Voidsent',33,100,100,100,40,50,20,50,35,25,45,35,50,15,1,1,1,1,1,1,1.5,1,0.25,1,4);
INSERT INTO `server_battlenpc_genus` VALUES (57,'Lightning-Elemental',2,6,10,'Voidsent',33,100,100,100,35,35,30,55,40,30,40,45,30,25,1,1,1,1,1,1,1,0.25,1.5,1.25,5);
INSERT INTO `server_battlenpc_genus` VALUES (58,'Ice-Elemental',2,6,10,'Voidsent',33,100,100,100,35,40,25,55,40,30,40,40,35,20,1,1,1,1,1.5,0.25,1,1,1,1,2);
INSERT INTO `server_battlenpc_genus` VALUES (59,'Wind-Elemental',2,6,10,'Voidsent',33,100,100,100,30,30,35,55,40,30,35,45,25,30,1,1,1,1,1,1,0.25,1,1.25,1,3);
INSERT INTO `server_battlenpc_genus` VALUES (60,'Ogre',3,6,10,'Voidsent',1,100,100,100,65,70,20,20,15,10,75,40,65,15,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (61,'Phurble',1,8,10,'Voidsent',1,100,100,100,20,20,25,20,15,10,25,30,20,25,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (62,'Plasmoid',1,6,10,'Voidsent',32,100,100,100,15,20,15,35,30,20,20,30,15,15,1,1,1,1,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (63,'Flan',2,4,10,'Voidsent',1,100,100,100,30,45,10,30,25,15,35,30,40,5,0.5,0.5,0.5,0.5,1,1,1,1,1,1,0);
INSERT INTO `server_battlenpc_genus` VALUES (64,'Bomb',1,6,10,'Voidsent',1,100,100,100,30,25,20,35,15,10,35,35,25,20,1,1,1,1,0.25,1.5,1,1,1,1.5,1);
INSERT INTO `server_battlenpc_genus` VALUES (65,'Grenade',2,6,10,'Voidsent',1,100,100,100,40,35,20,45,20,15,45,40,35,20,1,1,1,1,0.25,1.5,1,1,1,1.5,1);
/*!40000 ALTER TABLE `server_battlenpc_genus` ENABLE KEYS */;
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
