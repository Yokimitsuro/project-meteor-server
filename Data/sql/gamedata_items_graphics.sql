-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for playonline
CREATE DATABASE IF NOT EXISTS `playonline` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `playonline`;

-- Dumping structure for table playonline.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `polId` varchar(50) NOT NULL,
  `passwordHash` varchar(32) NOT NULL,
  PRIMARY KEY (`polId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table playonline.chatrooms
CREATE TABLE IF NOT EXISTS `chatrooms` (
  `channel` varchar(50) NOT NULL,
  `chatroomName` varchar(50) NOT NULL,
  `usersCurrent` smallint(5) unsigned NOT NULL,
  `usersMax` smallint(5) unsigned NOT NULL,
  `permanent` tinyint(1) unsigned NOT NULL,
  `hasPassword` tinyint(1) unsigned NOT NULL,
  `memberCode` smallint(5) unsigned NOT NULL,
  `purposeCode` smallint(5) unsigned NOT NULL,
  `languageCode` smallint(5) unsigned NOT NULL,
  `zoneCode` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table of chatrooms currently active. This is cleared on POL-AUTH restart.';

-- Data exporting was unselected.
-- Dumping structure for table playonline.contentids
CREATE TABLE IF NOT EXISTS `contentids` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `polId` varchar(10) NOT NULL,
  `handleId` bigint(20) unsigned DEFAULT NULL,
  `gameId` smallint(5) unsigned NOT NULL,
  `creationPosition` tinyint(3) unsigned NOT NULL,
  `customPosition` tinyint(3) unsigned NOT NULL,
  `linkPosition` tinyint(3) unsigned NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT '',
  `description` varchar(63) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `creationPosition` (`creationPosition`),
  KEY `FK_contentids_accounts` (`polId`),
  CONSTRAINT `FK_contentids_accounts` FOREIGN KEY (`polId`) REFERENCES `accounts` (`polId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table playonline.handles
CREATE TABLE IF NOT EXISTS `handles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `polId` varchar(10) NOT NULL,
  `creationPosition` tinyint(3) unsigned NOT NULL,
  `customPosition` tinyint(3) unsigned NOT NULL,
  `picNum` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL,
  `comment` varchar(99) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `creationPosition` (`creationPosition`),
  KEY `FK_handles_accounts` (`polId`),
  CONSTRAINT `FK_handles_accounts` FOREIGN KEY (`polId`) REFERENCES `accounts` (`polId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of handles attached to an account.';

-- Data exporting was unselected.
-- Dumping structure for table playonline.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `handleId` bigint(20) unsigned NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT '',
  `portrait` int(10) unsigned NOT NULL DEFAULT '0',
  `lastUpdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ageVisibility` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `locationContinent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `locationCountry` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `locationProvinceState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `job` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `interest1` tinyint(3) unsigned DEFAULT '0',
  `interest2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `interest3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(87) NOT NULL DEFAULT '',
  PRIMARY KEY (`handleId`),
  CONSTRAINT `FK_profiles_handles` FOREIGN KEY (`handleId`) REFERENCES `handles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table playonline.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `clientIp` varchar(20) NOT NULL,
  `clientPort` bigint(20) unsigned NOT NULL,
  `accountId` varchar(10) NOT NULL,
  `rkey1` bigint(20) unsigned NOT NULL,
  `rkey2` bigint(20) unsigned NOT NULL,
  `blowkey` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`clientIp`,`clientPort`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
