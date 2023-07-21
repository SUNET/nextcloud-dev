-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gss
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB-1:11.0.2+maria~ubu2204
USE gss;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES
('admin','{\"displayname\":{\"value\":\"admin\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES
(1,'admin','displayname','admin'),
(2,'admin','address',''),
(3,'admin','website',''),
(4,'admin','email',''),
(5,'admin','phone',''),
(6,'admin','twitter',''),
(7,'admin','fediverse',''),
(8,'admin','organisation',''),
(9,'admin','role',''),
(10,'admin','headline',''),
(11,'admin','biography',''),
(12,'admin','profile_enabled','1');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `affecteduser` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `subjectparams` longtext NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageparams` longtext DEFAULT NULL,
  `file` varchar(4000) DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES
(1,1689973669,30,'file_created','admin','admin','files','created_self','[{\"7\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8001/index.php/apps/files/?dir=/','files',7),
(2,1689973669,30,'file_changed','admin','admin','files','changed_self','[{\"7\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8001/index.php/apps/files/?dir=/','files',7),
(3,1689973669,30,'file_created','admin','admin','files','created_self','[{\"8\":\"\\/Templates\"}]','','[]','/Templates','http://localhost:8001/index.php/apps/files/?dir=/','files',8),
(4,1689973669,30,'file_created','admin','admin','files','created_self','[{\"9\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',9),
(5,1689973669,30,'file_changed','admin','admin','files','changed_self','[{\"9\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',9),
(6,1689973670,30,'file_created','admin','admin','files','created_self','[{\"10\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',10),
(7,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"10\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',10),
(8,1689973670,30,'file_created','admin','admin','files','created_self','[{\"11\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',11),
(9,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"11\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',11),
(10,1689973670,30,'file_created','admin','admin','files','created_self','[{\"12\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',12),
(11,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"12\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',12),
(12,1689973670,30,'file_created','admin','admin','files','created_self','[{\"13\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',13),
(13,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"13\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',13),
(14,1689973670,30,'file_created','admin','admin','files','created_self','[{\"14\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',14),
(15,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"14\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',14),
(16,1689973670,30,'file_created','admin','admin','files','created_self','[{\"15\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',15),
(17,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"15\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',15),
(18,1689973670,30,'file_created','admin','admin','files','created_self','[{\"16\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',16),
(19,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"16\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',16),
(20,1689973670,30,'file_created','admin','admin','files','created_self','[{\"17\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',17),
(21,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"17\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',17),
(22,1689973670,30,'file_created','admin','admin','files','created_self','[{\"18\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',18),
(23,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"18\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',18),
(24,1689973670,30,'file_created','admin','admin','files','created_self','[{\"19\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',19),
(25,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"19\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',19),
(26,1689973670,30,'file_created','admin','admin','files','created_self','[{\"20\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',20),
(27,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"20\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',20),
(28,1689973670,30,'file_created','admin','admin','files','created_self','[{\"21\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',21),
(29,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"21\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',21),
(30,1689973670,30,'file_created','admin','admin','files','created_self','[{\"22\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',22),
(31,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"22\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',22),
(32,1689973670,30,'file_created','admin','admin','files','created_self','[{\"23\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',23),
(33,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"23\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/Templates','files',23),
(34,1689973670,30,'file_created','admin','admin','files','created_self','[{\"24\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8001/index.php/apps/files/?dir=/','files',24),
(35,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"24\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8001/index.php/apps/files/?dir=/','files',24),
(36,1689973670,30,'file_created','admin','admin','files','created_self','[{\"25\":\"\\/Photos\"}]','','[]','/Photos','http://localhost:8001/index.php/apps/files/?dir=/','files',25),
(37,1689973670,30,'file_created','admin','admin','files','created_self','[{\"26\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',26),
(38,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"26\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',26),
(39,1689973670,30,'file_created','admin','admin','files','created_self','[{\"27\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',27),
(40,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"27\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',27),
(41,1689973670,30,'file_created','admin','admin','files','created_self','[{\"28\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',28),
(42,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"28\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',28),
(43,1689973670,30,'file_created','admin','admin','files','created_self','[{\"29\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',29),
(44,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"29\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',29),
(45,1689973670,30,'file_created','admin','admin','files','created_self','[{\"30\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',30),
(46,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"30\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',30),
(47,1689973670,30,'file_created','admin','admin','files','created_self','[{\"31\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',31),
(48,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"31\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',31),
(49,1689973670,30,'file_created','admin','admin','files','created_self','[{\"32\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',32),
(50,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"32\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',32),
(51,1689973670,30,'file_created','admin','admin','files','created_self','[{\"33\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',33),
(52,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"33\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',33),
(53,1689973670,30,'file_created','admin','admin','files','created_self','[{\"34\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',34),
(54,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"34\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/Photos','files',34),
(55,1689973670,30,'file_created','admin','admin','files','created_self','[{\"35\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8001/index.php/apps/files/?dir=/','files',35),
(56,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"35\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8001/index.php/apps/files/?dir=/','files',35),
(57,1689973670,30,'file_created','admin','admin','files','created_self','[{\"36\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8001/index.php/apps/files/?dir=/','files',36),
(58,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"36\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8001/index.php/apps/files/?dir=/','files',36),
(59,1689973670,30,'file_created','admin','admin','files','created_self','[{\"37\":\"\\/Documents\"}]','','[]','/Documents','http://localhost:8001/index.php/apps/files/?dir=/','files',37),
(60,1689973670,30,'file_created','admin','admin','files','created_self','[{\"38\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',38),
(61,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"38\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',38),
(62,1689973670,30,'file_created','admin','admin','files','created_self','[{\"39\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',39),
(63,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"39\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',39),
(64,1689973670,30,'file_created','admin','admin','files','created_self','[{\"40\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',40),
(65,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"40\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',40),
(66,1689973670,30,'file_created','admin','admin','files','created_self','[{\"41\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',41),
(67,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"41\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://localhost:8001/index.php/apps/files/?dir=/Documents','files',41),
(68,1689973670,30,'file_created','admin','admin','files','created_self','[{\"42\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/','files',42),
(69,1689973670,30,'file_changed','admin','admin','files','changed_self','[{\"42\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8001/index.php/apps/files/?dir=/','files',42),
(70,1689973670,30,'calendar','admin','admin','dav','calendar_add_self','{\"actor\":\"admin\",\"calendar\":{\"id\":1,\"uri\":\"personal\",\"name\":\"Personal\"}}','','[]','','','calendar',1),
(71,1689973670,30,'contacts','admin','admin','dav','addressbook_add_self','{\"actor\":\"admin\",\"addressbook\":{\"id\":1,\"uri\":\"contacts\",\"name\":\"Contacts\"}}','','[]','','','addressbook',1),
(145,1689976074,30,'calendar','admin','system','dav','calendar_add','{\"actor\":\"admin\",\"calendar\":{\"id\":3,\"uri\":\"contact_birthdays\",\"name\":\"Contact birthdays\"}}','','[]','','','calendar',3);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) NOT NULL,
  `amq_affecteduser` varchar(64) NOT NULL,
  `amq_appid` varchar(32) NOT NULL,
  `amq_subject` varchar(255) NOT NULL,
  `amq_subjectparams` longtext DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
INSERT INTO `oc_addressbookchanges` VALUES
(4,'Database:user.vcf',4,3,3);
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES
(1,'principals/users/admin','Contacts','contacts',NULL,1),
(3,'principals/system/system','system','system','System addressbook which holds all users of this instance',5);
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES
('activity','enabled','yes'),
('activity','installed_version','2.18.0'),
('activity','types','filesystem'),
('backgroundjob','lastjob','25'),
('circles','enabled','yes'),
('circles','installed_version','26.0.0'),
('circles','loopback_tmp_scheme','http'),
('circles','types','filesystem,dav'),
('cloud_federation_api','enabled','yes'),
('cloud_federation_api','installed_version','1.9.0'),
('cloud_federation_api','types','filesystem'),
('comments','enabled','yes'),
('comments','installed_version','1.16.0'),
('comments','types','logging'),
('contactsinteraction','enabled','yes'),
('contactsinteraction','installed_version','1.7.0'),
('contactsinteraction','types','dav'),
('core','installedat','1689975926.8356'),
('core','lastcron','1689976384'),
('core','lastupdatedat','1689975926.8371');
INSERT INTO `oc_appconfig` VALUES
INSERT INTO `oc_appconfig` VALUES
('core','public_files','files_sharing/public.php'),
('core','public_webdav','dav/appinfo/v1/publicwebdav.php'),
('core','vendor','nextcloud'),
('dashboard','enabled','yes'),
('dashboard','installed_version','7.6.0'),
('dashboard','types',''),
('dav','enabled','yes'),
('dav','installed_version','1.25.0'),
('dav','types','filesystem'),
('federatedfilesharing','enabled','yes'),
('federatedfilesharing','installed_version','1.16.0'),
('federatedfilesharing','types',''),
('federation','enabled','yes'),
('federation','installed_version','1.16.0'),
('federation','types','authentication'),
('files','enabled','yes'),
('files','installed_version','1.21.1'),
('files','types','filesystem'),
('files_pdfviewer','enabled','yes'),
('files_pdfviewer','installed_version','2.7.0'),
('files_pdfviewer','types',''),
('files_rightclick','enabled','yes'),
('files_rightclick','installed_version','1.5.0'),
('files_rightclick','types',''),
('files_sharing','enabled','yes'),
('files_sharing','installed_version','1.18.0'),
('files_sharing','types','filesystem'),
('files_trashbin','enabled','yes'),
('files_trashbin','installed_version','1.16.0'),
('files_trashbin','types','filesystem,dav'),
('files_versions','enabled','yes'),
('files_versions','installed_version','1.19.1'),
('files_versions','types','filesystem,dav'),
('firstrunwizard','enabled','yes'),
('firstrunwizard','installed_version','2.15.0'),
('firstrunwizard','types','logging'),
('globalsiteselector','enabled','yes'),
('globalsiteselector','installed_version','2.4.3'),
('globalsiteselector','types','extended_authentication'),
('logreader','enabled','yes'),
('logreader','installed_version','2.11.0'),
('logreader','types',''),
('lookup_server_connector','enabled','yes'),
('lookup_server_connector','installed_version','1.14.0'),
('lookup_server_connector','types','authentication'),
('nextcloud_announcements','enabled','yes'),
('nextcloud_announcements','installed_version','1.15.0'),
('nextcloud_announcements','pub_date','Thu, 24 Oct 2019 00:00:00 +0200'),
('nextcloud_announcements','types','logging'),
('notifications','enabled','yes'),
('notifications','installed_version','2.14.0'),
('notifications','types','logging'),
('oauth2','enabled','yes'),
('oauth2','installed_version','1.14.0'),
('oauth2','types','authentication'),
('password_policy','enabled','yes'),
('password_policy','installed_version','1.16.0'),
('password_policy','types','authentication'),
('photos','enabled','yes'),
('photos','installed_version','2.2.0'),
('photos','lastPlaceMappedUser','admin2'),
('photos','lastPlaceMappingDone','true'),
('photos','types','dav,authentication'),
('privacy','enabled','yes'),
('privacy','installed_version','1.10.0'),
('privacy','types',''),
('provisioning_api','enabled','yes'),
('provisioning_api','installed_version','1.16.0'),
('provisioning_api','types','prevent_group_restriction'),
('recommendations','enabled','yes'),
('recommendations','installed_version','1.5.0'),
('recommendations','types',''),
('related_resources','enabled','yes'),
('related_resources','installed_version','1.1.0-alpha1'),
('related_resources','types',''),
('serverinfo','enabled','yes'),
('serverinfo','installed_version','1.16.0'),
('serverinfo','types',''),
('settings','enabled','yes'),
('settings','installed_version','1.8.0'),
('settings','types',''),
('sharebymail','enabled','yes'),
('sharebymail','installed_version','1.16.0'),
('sharebymail','types','filesystem'),
('support','enabled','yes'),
('support','installed_version','1.9.0'),
('support','types','session'),
('survey_client','enabled','yes'),
('survey_client','installed_version','1.14.0'),
('survey_client','types',''),
('systemtags','enabled','yes'),
('systemtags','installed_version','1.16.0'),
('systemtags','types','logging'),
('text','enabled','yes'),
('text','installed_version','3.7.2'),
('text','types','dav'),
('theming','enabled','yes'),
('theming','installed_version','2.1.1'),
('theming','types','logging'),
('twofactor_backupcodes','enabled','yes'),
('twofactor_backupcodes','installed_version','1.15.0'),
('twofactor_backupcodes','types',''),
('updatenotification','enabled','yes'),
('updatenotification','installed_version','1.16.0'),
('updatenotification','types',''),
('user_saml','enabled','yes'),
('user_saml','general-allow_multiple_user_back_ends','0'),
('user_saml','general-require_provisioned_account','1'),
('user_saml','installed_version','5.2.1'),
('user_saml','type','saml'),
('user_saml','types','authentication'),
('user_status','enabled','yes'),
('user_status','installed_version','1.6.0'),
('user_status','types',''),
('viewer','enabled','yes'),
('viewer','installed_version','1.10.0'),
('viewer','types',''),
('weather_status','enabled','yes'),
('weather_status','installed_version','1.6.0'),
('weather_status','types',''),
('workflowengine','enabled','yes'),
('workflowengine','installed_version','2.8.0'),
('workflowengine','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authorized_groups`
--

DROP TABLE IF EXISTS `oc_authorized_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authorized_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admindel_groupid_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authorized_groups`
--

LOCK TABLES `oc_authorized_groups` WRITE;
/*!40000 ALTER TABLE `oc_authorized_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authorized_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` longtext DEFAULT NULL,
  `name` longtext NOT NULL,
  `token` varchar(200) NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext DEFAULT NULL,
  `public_key` longtext DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES
(1,'admin','admin','P1a/hoYm8oOx7fAVwxT/CApDWT1IX0NqzhMGuXF/cMENQYPgHXmOqYC0V6yBQr27yNW7K97iJ0NBwjNnKZEo77H1jMDxdbSHK1dIeTDV7Bke7i67H35Fb0vlmQS4Y57xqrin+Njz60OfGiVRCCdJLVSzAU31w8vV6Z8p0CYFehnOPZN8VCdgWplaJgh89dvcdhbCZDTN1VHwIMPFAJUoO7I91EOHfC54asJMDSBeKa7nWvxPHDG+1batMwK/vehF84xQJM8LJir5R4LyVGQucUa5U4RyYFESqE2ANwBBGODo2k7lrEBACKSG0Tx3vm6vVP14pH7SjPBXX477bZnRlA==','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0','b1be43d23bb328b2ba421b46b8152ba11bad74ce44f93da1a4b48de4f8b8cfeb47bc5d55d08d9529f2c60b45320b60228c6925f7fca21fae6fa698cb6e22c94f',0,0,1689973815,1689973670,NULL,NULL,'7be3846699a21d12076df83d4ca303ced65d66530cbf574d672e606b54439731fb77f36efa87aa1a1fd3dc5e2d3199e263ebf48d2d1381cdc49f2869adc4f5bc311366adf19c61f7cc47a5aad986821a2dc52e54f7035a001a36291b8120019666597d5317106c6df855e91f934edc0d139941fb20f1a3917a5c6e9972899e66f0519beedb15a2ad10e9947d101c696a6bf413bae0c45d414c9b1fa190ff595e5a8ed9e96e49ace470bdccbfa9d9965613f1a9b530c2832d955f64643c70b28d6fcc1132f5b5d194a60495ffbe7e53b052d25b25d4c07c4fec4155c2098eda8a21a0369ff9c5d64279f92d74e8f2d40fd720d6ad7adc49f135a45bc4131d539d637948572cf3ac80aa6cd9f8bb6163c1e9283ab5047ab993ee1b3bc731edab90c3845718ef6a448cc508f2991af21094e497c74129b9608fb0f722aac7c18dfcf9842e50ee73f7d7a95b49f917a675f2d3b19b778d2c789473719a0a954f6b0958e5921121ba65278a2fe30bf1cc80fad46272007b1042b1395fab1986206ffc50d831d691606729b19e64b91581d65bfc4ee1e2996ade2710020a0ec16192405992a2c85b3d4b0e4e28709379ce3bf6d2e097adf71322151deeabb0c02e53070fab106e83d80434d0a38f1fcc9c0826a9af22d9c78e0c7ed9db76833e738297030c2da8167cb2a78700e016714758ce64b67442c6f4c2d3d0a08781252c4f1bd98289fd9348d31c5dc4a36b4406266b85040f93e2aeaf50d35edeea8b4b473aa6ff02311dd85e20d02132556baed99f0af88e5d38c8569f3edee1847f38030abcb1352c148b5deb6fc456af537edd89000a6125c785e46ee8e644a31865689e486d0c118205e9bffc6863e31b356447f3fadc9d5422847d4ad5e3dc55426c62359c60bfdc1e395c601596b47317a986651eeb485c06d4b7298ef21c27193a6079375e365006322f4c21262e1708f8552067b9981861c6a627d9e4a4f37c43836ca98e66a41fc2d94eebc77b421a96a49a31d7ca8cb3f6ccfdd25acbdcb1a97f01d828d88949b882de089b7dd41ea721d10db28345dfde86b4316266f38b987e739cbac085257399378694b5892378355c2b0ceb4c0bf129a55d54afdc17ad3025b9bc887d7decb10011e2e2334f2df0569ff0dab0da36370e5b100b3f312e7e070179039131c8b5d2c069cc31dd0e58af3e0a1de21cf5737c3573ef6e98787773d371bde5ba9f8a2ecbc8e7497d8981a7d1673ddc40b8abfccd7d28c2a73010bf4c4db25327f7f520de9140b61db08d8cf1aa26f774ec049f28b9c89de07885897620b8071a99ba652fefb32114a284e7f0d646cfe56cb06d49cd2680c5e95e467b0ee5edee8ae693586106264e26f6694b78e02e185e9c440e857ade7a1d7c13d82126cdc906879e4ea4414e97f41964b1b51088c4a377043d1f207bb5981888df968511b22ffe53aead8de9d04518a111e6dbeffbcc1f451c1a6e8994fda429cd34e4132097e8c482933e88267568166419c02bce42d85a7922376c7c1284223dc2bb3f23684f42b31c0b88b7250ae55c35f30caf9cf7d302ca1e18200b4cea8157f228243d1c3394ee8361d58571038b913042bb812013ad7f99aba20bb87798b399a93953d28df580df0c233968f8338643c2a1a89e850b9374de6dda01bacb02a4b3555ba9aabe31126ebc624be3d0aad7450872e6e1b89ce9ac16d0d3c4a39c55a9338662f8d1b2174737164ff047632d722baf4c3d6a9127e6222a9e8ea6e419e1725ac2f1f338b011dc058cab6f579e8650cb88671192fe3b9d740815ebe93131b5722312a604426bcfa0c1eb67da2533f113390993005b4f480d974edbc4d538f06beb6af3c55c4c996933df22bf31390e0965e2466878456c733db72c39d23fee80ddede8fcdf7223b489b91e227d642e9da63651c95710c69a09f863331c3ada20b0bc077144d1a7d8a58aa17d5cb6602552402f4bcb3f18828ea4ba1a9fee57c833c7bfcaaf4811c0c51f29e0f21350534faff8f1fdb20fb0492922d3c697e3a860a3c9c8a6765d7116ecb503d6c007529e7af18cdbc9a1fe1aa481b02eb2905c29ba3532bdf7fe2fd2b51e2af5c001295cfd8b12e323f919f3ffd70eaa011c42cce9ae1b065be2fd1d561b610e026102f7a89817ec2e51802360d09bee232749d91ed413149271a6c48324e0ce2fc03c90728208d250338dbda4b6cf9c7a1d7ecd639a18d629d169d20dac4e74203f4d0afe7bd9610965456c15da72c27dd6a2d47add7e751bd6134964b5a19dc8204dfd1cfe588e2fd15ca1ba301e4ab7c6333a3a5ff64467f53e64b5556b27dfcb51f4997aae9e19c727b906300023d84a79de757f48303d7b43722373a55b3b11dafdf94887d59ca5486163a8100ce68f20e01c50ce1bb82baa1b|251b35e9ed07ccef96091b828fa040f8|8151276c6c8d3357ae8e96b5e79d6410881b4088107daaf979aba58e7dff081b152f69c98adafe23ad7f77ee6c82447eb15b8e85f00062ec7bd3ee5b64093bd2|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4LrXiWPMC1roI6trjsKk\ndMNPsRHY52kixbOoHjJtpzTXnlX8WO5xn11Evwalqj4VsX4MmDPp8Oes4CAnFE0P\nvseo1eXHUi5o9+1zhrEWR6DjEtssZxyu2GD5hLpBOVA6NBEZyJMuFyN8aXb0mcTb\n0ZHhwd1g/w8ZfF4uQSHUqN8/FysFew/4twCXyrlVbb2k8fH5nCZPIDxz1bbsI4Ah\nZVIa3/xyP3gvZmgsJ4eri2HrXa1Dp8K/s8N+JooGu37Ow/7y+cwNuD28b6qrLeKt\nkXZ/hvZdcBugsQDRDaiB3yDjTTqvcN22kBFmDcTamCWD8ZmbYzyhzbSBRRtKGG1K\nowIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$VG41MlhNTG9VWmV2MWlNVw$Tw+kfl74b48VAS+4rowB51cvmpkuMzqhxn+XtjJU3os'),
(6,'admin','admin','n8zNw3xGcZv19txt7v+xTKoy7pPyqtmLqqb3CrrkfNefTYtREjIoGMHK5YycIFeTWt6vIU4UjSsfXo7Ua7MseDDOUPK/BJcV8RX/bBrsv0/UqKQwKpd6AWeAIw7yWtqaDGh8aEYJcROh4bYRqNEFTs/n9vWiEy17JccyWUHjNzx2ZTYiS/6TeSN/HLi6p4DHPAhgGWI583Fjjn5zmzTmdnQzCxq4V4kpaEV9USpVmc6lArJlH7+W9eG7HkjjbedREaYYKiwbxIxblF74t6A3RTfsxIs/Wjxqt7lzXGCG7AMISqU8fZw3a1HSNEvrfe+n2jFyI//HwzV/xHlZJmprTw==','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0','31d490fa22d90e2e161c998d13ce15b27bd4307a22293ca8a0a707191ecc8939bcce2231aeb3f9c9808d65e1f8df1f64262e4bfdadceee29a888f09d5e41db4d',0,1,1689976334,1689976196,NULL,NULL,'fe084a66fd52208a74645d0a89823b6f01f53823d59e5cf8f5a3bc9ee94dff82e589e49ab5e8fcf4cfafb3d9197375cfbeea11227318c18bb2f835f891bddcfd18cab58b0f44a11e92b5bf0854d2c21cdba15b836671e591a01879571f596dafb17d5be8485c64f81c7711b96229fc186989207fef958ad84cb8179d604c2d9a958cab31dfd19b03fe95862e4a0fea484723c4d6d45128734177449c70d7ac82952fd07d01c7a7c8ddb0f0b8f600b2f41d4912bd4c6d3ee232c66d094c1070e52695b98489cb33bff1d794139c6f326df387ef00836d41bfb66f0a7e8a044da0a40344731c47ddba38a8164dcd7cce5d7b5efe1f9c9bfbfda79bc00f116af44e68b0b9199e95b18fef094712931fd6fe2d389d319e8656f1ad53c48c6ff825b0a0632b67032130a1b9a127270cc0cdcf292dd64f239092ebea4c9c93f81eb6b53d9a5d90773a20d14631729f7474814be51b7c39bdc8f24444688a5e5b00d6e4506c125b65f8811827b3b00d43f7f50ebf15479436b12ae81d509a14a475cfa3c1f432c639b3995854459e388e00f01d8184b21a866bcc055ab47537e0be3d622c80b453ebdfad066e15894bd73cfd707c87cab49df4b85276691e589d4913b20027e25b4dd29190c564fe1430bae4a62b44d3149e941bdeb9e0c511fba8b1897d1da8e8ed5f295bd5e5880908ef0873f962b2c13ca73dc49b470682584ef457e6dd89d922efd6c2c7272a890a773a03e01b638a8aea9123374d40d993f7bafa0e37b9c8ef605c68d5a2d8bdc000dd3fb28e579184aa97c2e052258cb066b3d1c94b706aa0cf2aee5a6a05fdc3acb7e3709997948d910eaa7dd64a574306e9bb9a52b91525a2300b40eb7d04a703ac8cb74a0bfe93443c14cffde7840041659503dc4366d329981f49bf92e59ec44aa660fe20a5ea22c02a2631c365111784a36e43a173fc91936549227da5f5d82931f6e3f19d9643b3f9d626fa436f8530fc12647d1d96e3389da6b9c0d831874265282b91571a4c10d6161b2782783b5d5d53a71af516deef20513e59aec13aa40ed9ae24d9472ab0e1441c5dbea2e69ac2ef8c56e031a62921969ba5fec93ea864e0c99dfe44909e04ce7971a610361481b350300251a682e28612d4152048d818d9d28638756e80e91b375a1aace75f773b051acb0b26f680eac0ffc5904e91bcfd536c15fd12bfbccd6ae284bbfd988feac873aaccf8ea6ce45093b8c9e798ba468611b6a830c00312f26e5c8ecf301b38de22ef8aecf7eccd4415f8c44fce7babc90163c3a66f8e3e890b4d573c91ecb10042725dce03f17b7eaeb37b77be7cf7da7360a81666ac486a4248e03a5080adb8dde3bcf8629b912585632272251847654adf998840684ff703dd929dc92f56ad7e420f6039a9d3bd49e0ff0d00bcc67c9e20f87e5cac7327450956e7c8f61c60ff9fee12566f79ac85a0b2646525f23683ed65213fcb595b48b0642f2e38d635dc941e8642d3dc791356f8f7253f9944ce104e9b694a3898c8ee77abbc90457d86cf7217ace55d7a6446867d91936db334735ac117f93b1cbb4d484888c82a24dc46052c243a5066a5071d0e51e6ee3c8012faf09165dd3cc82a81c6e35f155bd946bbd2750ad25fa87d7b8ad2afdf350c4746afa9cc304004880d72b7625179e322a1e9bf35f0b8931143e10afe4e58d6ef4ffe786dbd8e9bf3ea47ebcd14c8b72585402294cedae5d2e8fd609244194b2f0c68d67a101d0aeb4be2267cbff305c4f4b74a85fa76b3d2a99e78f07eab2dd8c4ab6d27a876d90e6c3ea7d02e96bd106f67fe026f095d2e2bd89fc34e6b53f594762c30bcc7587e654fe63200c4e7b93630d442fce8a35f265ce2de3aca27dd8803834dbf097f54df6903bb0515b294cd6a87b3ee61b364ab0964a1f19504ec49786cc158651269f8a3dea6695863b2502ab114c31ca313097558cfa40a25cca356cb1e0b276901bab9618d9c7c39c2d20cbbfe20658683d7e210136d0c28a62bce3a16d2b120949c9dc5fdb9ea96b94f2a6b0113ba5e95ad5e07d34ad3e9c5eac325958499b9c7aa79f9f830d206f52ccbab3002c6b107c4b098a857f13fbcb04afb8d79a078ab685d1ae4201330b10a53894d0ef02eb02caa434c073b58b58135695084075c0412eacf65a9bb9e0f09e5ff70e89fa96c007156cfa4c1a221353c32e967b4d6ae68de9a19cc86262b9911defc4820a2fd7d8103373b13836bc2ab6ddd701e7a226b2f0e4d2f4b71a899003ce2635f4de25920e2cce772b5f5c4744c2ea6d0059ad9d26de39469753411910060667fbe6aad71c00c930c85ccdf27a57adef4917696f92b3119f9f87e4d9cf358e932115ff434ea0125f9675a42afa72b3e86d3a97315327e9bc7facfa1610958ae682ff3eed43544|5e729119e57e73ecf6d4abe9a112ed7b|d21d4e28fba90c907d7fae3880f37cb4f3b579b1e430f7af094d193d95e4709f38d39144bad2b832903341bb5ba670a195959e2883d33cc45b8c33b54b1ff366|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApr/8Pz+tqg68vJc+1D1F\nzrhq7qMy9cPdfqhazmpdcK5d5VjIJrEjOjpDWgp5ICrtlrBy4E/iuFsW74HDHGBB\nUcsgww2HDOEIMf9sVn6yY8260K0iVj2PBaBZec37ksEgodKq/pY2uBr2zEzQU/eh\n+LBLwjiFDaauhlhS6nq2W7gAfAZBZi9MCf2cRSmXBsCEbzdHM6CzJq5w0pSpvEhm\nWAtDJkssvtLkSn4MUpZ3Gtk8vIAwYt5AfgtNSS2D3+OW/G9mIIVl8utiW1TNIYdY\ny7P+bgQjZUT/FaVVEpXPwZ+jczpRkRjYCIWfGB7assSAQGaLJh77YlGG5VIA/pq5\n6QIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$VG41MlhNTG9VWmV2MWlNVw$Tw+kfl74b48VAS+4rowB51cvmpkuMzqhxn+XtjJU3os');
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `recurrenceid` varchar(255) DEFAULT NULL,
  `attendee` varchar(255) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) NOT NULL,
  `alarm_hash` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `timezone` longtext DEFAULT NULL,
  `components` varchar(64) DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES
(1,'principals/users/admin','Personal','personal',1,NULL,0,'#0082c9',NULL,'VEVENT',0,NULL),
(3,'principals/system/system','Contact birthdays','contact_birthdays',1,NULL,0,'#E9D859',NULL,'VEVENT',0,NULL);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `refreshrate` varchar(10) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abid` (`addressbookid`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) NOT NULL,
  `name` varchar(127) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `sanitized_name` varchar(127) DEFAULT '',
  `instance` varchar(255) DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES
(1,'rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','user:admin:rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','admin','','',1,1,'[]','','2023-07-21 21:07:49',0,''),
(2,'G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','app:circles:G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','Circles','','',8193,10001,'[]','','2023-07-21 21:07:49',0,''),
(4,'Y7poZnvVuHfbkVKYViSdO8kNv8wmJ7h','group:admin','admin','','',1540,2,'{\"population\":0,\"populationInherited\":0}','','2023-07-21 21:46:39',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `event` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) DEFAULT NULL,
  `circle_id` varchar(31) NOT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `user_id` varchar(127) NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) DEFAULT '',
  `invited_by` varchar(31) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cached_name` varchar(255) DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) DEFAULT NULL,
  `contact_meta` longtext DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES
(1,'G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','circles',10000,'',NULL,9,'Member','[]','Circles','2023-07-21 21:07:49','',NULL,'2023-07-21 21:07:49'),
(2,'rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','admin',1,'','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx',9,'Member','[]','admin','2023-07-21 21:07:49','',NULL,'2023-07-21 21:07:49'),
(4,'G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','Y7poZnvVuHfbkVKYViSdO8kNv8wmJ7h','coqLtuJDMN89OdDFuIhDK2rAXrofOFW','circles',10000,'',NULL,9,'Member','[]','Circles','2023-07-21 21:46:39','',NULL,'2023-07-21 21:46:39');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) NOT NULL,
  `inheritance_last` varchar(31) NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext NOT NULL,
  PRIMARY KEY (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES
('G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx',9,'G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx',1,'[\"G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx\"]'),
('rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7',9,'rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7',1,'[\"rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `token` varchar(63) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) DEFAULT NULL,
  `instance` varchar(127) DEFAULT NULL,
  `href` varchar(254) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `instance` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) DEFAULT NULL,
  `single_id` varchar(31) DEFAULT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `token` varchar(31) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) NOT NULL DEFAULT '',
  `resource_id` varchar(64) NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `verb` varchar(64) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `reference_id` varchar(64) DEFAULT NULL,
  `reactions` varchar(4000) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) NOT NULL,
  `proxy_id` varchar(64) NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`),
  KEY `direct_edit_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES
(1,0,'files/0bcf776322b017bc4dd9e9ec9c78aa73',1689979534),
(2,0,'files/38d3fc13a505a341da34815c5ccc8b3d',1689979798),
(3,0,'files/d9e0f217f4fe6fa9b3c0afca993dc77e',1689977281),
(4,0,'files/d69450e812d741ad987e6155f2660de0',1689977281),
(5,0,'files/34e4f9cc5559f0fe4fbdf504aa42a2ae',1689977290),
(6,0,'files/accdb684cf7b1a669499b9e390f0924d',1689977290),
(7,0,'files/33c9049d2fe3ff7bcc467260f65f21fe',1689977290),
(8,0,'files/78de2998943da66324921e1d9639b7b3',1689977290),
(9,0,'files/31e79b1914bd43595b227f5f3b8bbbc6',1689977290),
(10,0,'files/605b3336a0a86915a87ac7a536d670f9',1689977290),
(11,0,'files/3302c4aa766ee979f507b03e6babf544',1689977290),
(12,0,'files/80be1e9a2db227f6e5c39b274f3cc113',1689977290),
(13,0,'files/5b244595a2b5868900e7b5e59dd96e69',1689977290),
(14,0,'files/09663774c84b0a0666d22cb9331d60da',1689977290),
(15,0,'files/3408813d436fc784dff72a0dc0abe773',1689977290),
(16,0,'files/3d8dd9fe8f3d3713f48fd87cf2ea61a6',1689977290),
(17,0,'files/4adea0b96cf710b63559fca0438cbf85',1689977290),
(18,0,'files/c0ecb171534369956f685327ed97c7d9',1689977290),
(19,0,'files/f6c92c3296d422bea88bda88ff994029',1689977290),
(20,0,'files/8b84718d259c738df2d6b98ab332920e',1689977290),
(21,0,'files/b10da1c261ae4eb9f028956ed734be11',1689977290),
(22,0,'files/c52cbe82b39c1a071e71ce6e899184ca',1689977290),
(23,0,'files/6f44cc05915d5ca9c73a72b922e86a53',1689977290),
(24,0,'files/91ab12c206a868e0459585b059159fc6',1689977290),
(25,0,'files/d112af8e1b15c0f45c27485c62b9ab67',1689977290),
(26,0,'files/dc1a3ae250c43127123191e9a51cfdb4',1689977290),
(27,0,'files/3c20ff774cf38e84e5288f379a38d1e8',1689977290),
(28,0,'files/ed67ddd54c8c5e073856084bb9448e12',1689977290),
(30,0,'files/b6ef755cfc70b5eb94f5d3aad8ba833d',1689979798),
(31,0,'files/2b7e5de9afe8b3f7b056c0ba2a04af46',1689979798),
(32,0,'files/cdff7cca41f3f905de0c60387e63dbf3',1689977290),
(33,0,'files/d7f93e169178cf12e2d72f9d6f2f7631',1689977290),
(40,0,'files/57a6d6929059470e4152598fb95ccef4',1689977290),
(41,0,'files/fcc3c752b44f26f0dda744025c8e56d4',1689977290),
(42,0,'files/3a5a54a89135de9b7ef442ae2877c63e',1689977290),
(43,0,'files/03daab5f4f7f6bf65b7eb37c659af020',1689977290),
(44,0,'files/86f9af2b10a98ac0d55a01a4af09c807',1689977290),
(45,0,'files/f4807b788884712b295eea25defd4fac',1689977290),
(46,0,'files/a7cbbe2af620c21a0c8834e23b08d024',1689977290),
(52,0,'files/6b05fc1e9352e07f036518718bc8dc61',1689979540),
(53,0,'files/acf43090e4e0b259db877d47092563f1',1689979540),
(54,0,'files/de81b9709cca9edd4a502833e65b4a4d',1689979540),
(55,0,'files/adaba39962a656433564c50eec1d8a53',1689979540),
(56,0,'files/65a94a57b0b70fdad3e428c25d017c4d',1689979540),
(57,0,'files/a88a0cd91b111f2124cf4731810aa108',1689979540),
(58,0,'files/b9eae2564241951cfa12ed4a113d56bc',1689979540),
(59,0,'files/1a23056465313d8569b85d63560331d4',1689979540),
(60,0,'files/edbe44de32d883535bc9c5b94be3138f',1689979540),
(61,0,'files/eb18e7275124bf03effdcac0a6692f5f',1689979540),
(62,0,'files/3219f3f1a632549f32397f74b959a60c',1689979540),
(63,0,'files/1bf8d83dcdd4edb2b18cb0fd0287281f',1689979540),
(64,0,'files/818abcb2ae25cae0a3f9c89acdf880be',1689979540),
(65,0,'files/c7d694b37bb73a54dec45a7a4c7ea4e7',1689979540),
(66,0,'files/172fab0029b61384fe8a517c0afe31c6',1689979540),
(67,0,'files/242eb6c11f3779e95cc9f587787b1b34',1689979540),
(68,0,'files/423bc2570ccf6abf58ea5c0112745a59',1689979540),
(69,0,'files/02973a2ba2ba6f38a95367b5fc9605a2',1689979540),
(70,0,'files/d5fe28cbc758a90779a29b694cf64cc4',1689979540),
(71,0,'files/d9b752ec3ff1606ac6737ba120d76f7d',1689979540),
(72,0,'files/d7c0308386d7656bc83b9b9cf0ca878c',1689979540),
(73,0,'files/cc7393eebe62f670ed28c6ac2907702f',1689979540),
(74,0,'files/9d66ed400d2f2eeeee4fda8fc9a9728a',1689979540),
(75,0,'files/189c1c682acd633560a57a98ae4aa525',1689979540),
(77,0,'files/c0d05497f26e18bd0f316b3354b5c160',1689979540),
(78,0,'files/302df635eae5c7dccb8dac7e3032646c',1689979540),
(79,0,'files/9fef824304ba9e76c3aa48c2edc3eda5',1689979540),
(82,0,'files/2e1eee46c60c3854e3cad25c77186960',1689979540),
(87,0,'files/3ff2482eb209ac54a99eee9f776ebe03',1689979590),
(88,0,'files/a2cd72079f165b577f58475d2f9e7cc7',1689979590),
(89,0,'files/be3434449c563fb5eeb07643812db495',1689979590),
(90,0,'files/1e8026ac2cd2521d3a45d6773af20440',1689979590),
(91,0,'files/c3ca2e5782a7924b520901fc17a8b3dd',1689979590),
(92,0,'files/7998c06786cd7362e5afe612d83f4092',1689979590),
(93,0,'files/263f5579f8642c1981255daa6bd73710',1689979590),
(94,0,'files/890766b8f827b1b096ce7455bdcd8a32',1689979590),
(95,0,'files/f4cf309edc23b820e5be1cf47891e8d9',1689979590),
(96,0,'files/1c3d93a465d44c63bb7bd7ee35adc083',1689979590),
(97,0,'files/a89517c9204b4999b2ecf2611f47a705',1689979590),
(98,0,'files/a0cc71450296d8c1d297205d3b838515',1689979590),
(99,0,'files/e7ee9aa22f59aa07fcf4097093048515',1689979590),
(100,0,'files/70e45c5922aeaf3fd4bc012830eec4db',1689979590),
(104,0,'files/76f4c73b545e08cea45d806526415381',1689979590),
(108,0,'files/421bacee5aa734532bd700a79886b384',1689979692),
(109,0,'files/1052350a88d2d1aac5009dc2ad80e5b6',1689979692),
(110,0,'files/3f7a95a096837878218161e5e41de21d',1689979692),
(113,0,'files/60533af0c33d8d317716a0658ff9c4aa',1689979692),
(114,0,'files/2dfd8b4e558fc0084a2cc30551d5a3d9',1689979692),
(115,0,'files/02d2a9b5f42858f7b542766886c0be1b',1689979692),
(116,0,'files/d8c3a74f150858ffe7f158fc12dce0bd',1689979692),
(117,0,'files/d374acee7eefd8e8c0ba4fb4614553e8',1689979692),
(118,0,'files/c696e3f7d5da1febb504f696e9d97c1b',1689979692),
(119,0,'files/f3675aca53da332ea1f954fd0a4d8784',1689979692),
(120,0,'files/5ac9bda3ec4114e5a15f078686a11db6',1689979692),
(121,0,'files/e8108659d271dc469789455cd0519bbe',1689979692),
(122,0,'files/370f2637780092a1f5e8b14bcfec674b',1689979692),
(123,0,'files/3b3c192a33e45809aa55f716cfaf8d9f',1689979692),
(124,0,'files/86b53c862825ebbffad292f697da0143',1689979692),
(125,0,'files/bc627159b3f05689e18342f75fb5eac3',1689979692),
(126,0,'files/378024551555056637c49408a015b709',1689979692),
(127,0,'files/e1fb463b5a6cf43bbeef04120847ab0b',1689979692),
(128,0,'files/1cc8c3050c2cde6827a3ad6db1d726ec',1689979692),
(129,0,'files/9e9317032d1947aaea3e1ce1d675f23a',1689979692),
(130,0,'files/347a9f47ea5444e3c01f75755395cd31',1689979692),
(131,0,'files/bf879d8c02e1086f400ed803c3b36965',1689979692),
(132,0,'files/9d2a0c9833bf086e63a5e5d72aa9260c',1689979692),
(133,0,'files/3503a9d6470d6ea6506206c84af69707',1689979692),
(134,0,'files/216c11af1c28c9a1f1b735319ff6332f',1689979692),
(135,0,'files/f363c610c2f5b6d7976dbb99081d9b9f',1689979692),
(136,0,'files/cc592b0254e57279989ecf1534dbffb5',1689979692),
(137,0,'files/ea0d3c6ebf9b8ae040f36b0f20ac43ee',1689979692),
(138,0,'files/7bcf9e4c0eb53fb0074e07f7e37daa46',1689979692),
(139,0,'files/c285d9a7589ee13bcaf1afac5b92d292',1689979692),
(140,0,'files/337c438823d675b203a57198be5f1857',1689979692),
(141,0,'files/8ec2bfd3c60c90dc56d19a48cdca7bd4',1689979692),
(142,0,'files/d0a7f3f967e15259a56fff657f4084a5',1689979692),
(143,0,'files/89343dcae63d59755d3df065435f39bd',1689979692),
(144,0,'files/621ac774a213b8a98ed8fd9a4b385724',1689979692),
(145,0,'files/6f27eb1acf6c6f33234ca3c6331592dc',1689979692),
(146,0,'files/e94c651053a0bc46a21f0969074f8bd2',1689979692),
(147,0,'files/199d7ea7ffce932c72135af3094ba368',1689979692),
(149,0,'files/d2f18fd2b686f34777a1ce1314d2ec93',1689979692),
(150,0,'files/0d6d02e2a18e78cb4cf150b947c70961',1689979692),
(151,0,'files/b7ec5703db64a0f286d90bae30ff032b',1689979694),
(152,0,'files/a64b35fe077d812bed545663316e7323',1689979694),
(153,0,'files/713c219658d30aced3761a13055ebcec',1689979694),
(154,0,'files/35a7d7c8bc81e76f0e6adece8bc73a57',1689979694),
(155,0,'files/cacf47dcee999c2f3c59f5248cd4dc3f',1689979694),
(156,0,'files/98028e5532d6baace287d3a754f076c9',1689979694),
(157,0,'files/a098c46c8639cc026362209bccee400a',1689979694),
(158,0,'files/8aa2ab4ae43bf349b14042b4276403bd',1689979694),
(159,0,'files/137c49585af6688ccdb1f0fd912bb2e7',1689979694),
(160,0,'files/e930f1cc868f5724403771ad894b20f6',1689979694),
(161,0,'files/bc8797d4f8abc20b0ee385229f2dcfeb',1689979694),
(162,0,'files/1737bbbb89d368303e976b0028ba56b7',1689979694),
(163,0,'files/6e3925f26ea5b5b60eda94512110a214',1689979694),
(164,0,'files/dc49c9c4171e08b0786efb3e33cef7ef',1689979694),
(165,0,'files/3305cd10eb3239ef4ae06ba47a21549a',1689979694),
(166,0,'files/4b3cc4be5471aa94ed3117e3a111653f',1689979694),
(167,0,'files/f75b740f74b5e2d1e4b398f8a25f1b17',1689979694),
(168,0,'files/20c2bf1c5e4ce1bc5049f4b41eb62e83',1689979694),
(169,0,'files/7682bd437532c8f90c97f205114abd7d',1689979694),
(170,0,'files/f917d1c6a48b0b95bf29d09abd5ddac5',1689979694),
(171,0,'files/438508ba77a9369e34b0d936a22a97db',1689979694),
(172,0,'files/24781c732d6d748d80a0049c720ce7fc',1689979694),
(173,0,'files/392d77f0300b3d1e29be62c0d3916a73',1689979694),
(174,0,'files/74b54722a75c2bed8d88535f7d84bae1',1689979694),
(175,0,'files/2dd85da8fd8b15c376a9f9d0cd3914b7',1689979694),
(176,0,'files/3bba2dca1293020198a77049b5ae9d9a',1689979694),
(177,0,'files/d7c4fb355779377f2d7847dffd9be658',1689979694),
(178,0,'files/8c0ef30f933f5473a70915341648b299',1689979694),
(179,0,'files/e8038c21def70649d5dfd4964a7f9d4f',1689979694),
(180,0,'files/3b7390a28ab1af8fd57ba17690c53e2a',1689979694),
(181,0,'files/7bc8be0479ddcdb63c7c7a724b90645a',1689979694),
(182,0,'files/c9f74d54b91cbff4f0b7f5d48938b9d8',1689979694),
(183,0,'files/3e30a7d6de3d46e267f7196e1b1280a0',1689979694),
(184,0,'files/512935c90d3371a2260c445cca50f8e9',1689979694),
(185,0,'files/e39e55bb9d3f22aa8d9377cc408b8355',1689979694),
(186,0,'files/0c2b0fecfeb769fdeba90a6d545f32f1',1689979694),
(187,0,'files/c865011f3bfee625dda39b25c751a0c7',1689979694),
(188,0,'files/6317e29e37e94b4f52975aee0e0c1926',1689979694),
(189,0,'files/d712d3f5f9bdf4e48b1396cdadd51d49',1689979694),
(190,0,'files/fbe3426c2f3f80c02a48c452381b8ef8',1689979694),
(191,0,'files/ad7f94043362e1a5fb607bfed50bbcfe',1689979694),
(192,0,'files/3f6fb0b2d8977a0e103675b6d018fc66',1689979694),
(193,0,'files/87b499c03b788437c1bd39c2efa67257',1689979694),
(194,0,'files/db448cb29983bc330cc729d7c728c7c8',1689979694),
(195,0,'files/0c9d0f98e0f929c4304d2f71bb37a13a',1689979694),
(196,0,'files/836e11a8a61791da9a413700b258afbb',1689979694),
(197,0,'files/412c94c653b60325a5ff6a3c5cfe9cde',1689979798),
(198,0,'files/6aedffa6504c49f51dde06b5d4e45d56',1689979798),
(199,0,'files/f030c098f962425b41072f5c67ec5b12',1689979798),
(200,0,'files/4cb81c223b901a8f8627c72205538061',1689979798),
(201,0,'files/d1f6ecc1cbe3868d222458067ae56334',1689979798),
(202,0,'files/f46b8c6a8b9f7ec72fbfad33a5e3337f',1689979798),
(203,0,'files/c7c240146d383396b5c8a3d2b4a70330',1689979798),
(204,0,'files/60580ae19eb9d8440c87d80b60db5523',1689979798),
(205,0,'files/6a9cc9b8ad04bb2d030aa278f159aab8',1689979798),
(206,0,'files/9359b824d780c859a2ff4100f4a75c4d',1689979798),
(207,0,'files/cb259731d8b1d9756cedd85655cdc9fd',1689979798),
(208,0,'files/1f18393415819bd8162d784c4f3f095e',1689979798),
(209,0,'files/09e8159146a320e0f47121bcaaf889d2',1689979798),
(210,0,'files/3164e47dc5665e1f88a6143dc8dce464',1689979798),
(211,0,'files/fa8b49ccd03e69f7eaf9dda531a53e32',1689979798),
(212,0,'files/aa6c31aac2fb137baa6ce6837855a4e1',1689979798);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_metadata`
--

DROP TABLE IF EXISTS `oc_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_metadata` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_metadata`
--

LOCK TABLES `oc_file_metadata` WRITE;
/*!40000 ALTER TABLE `oc_file_metadata` DISABLE KEYS */;
INSERT INTO `oc_file_metadata` VALUES
(24,'size','{\"width\":500,\"height\":500}'),
(26,'size','{\"width\":1920,\"height\":1281}'),
(27,'size','{\"width\":1600,\"height\":1067}'),
(28,'size','{\"width\":1200,\"height\":1800}'),
(29,'size','{\"width\":1600,\"height\":1067}'),
(30,'size','{\"width\":1600,\"height\":1067}'),
(31,'size','{\"width\":1600,\"height\":1067}'),
(32,'size','{\"width\":3000,\"height\":2000}'),
(33,'size','{\"width\":1600,\"height\":1066}'),
(136,'size','{\"width\":500,\"height\":500}'),
(138,'size','{\"width\":1920,\"height\":1281}'),
(139,'size','{\"width\":1600,\"height\":1067}'),
(140,'size','{\"width\":1200,\"height\":1800}'),
(141,'size','{\"width\":1600,\"height\":1067}'),
(142,'size','{\"width\":1600,\"height\":1067}'),
(143,'size','{\"width\":1600,\"height\":1067}'),
(144,'size','{\"width\":3000,\"height\":2000}'),
(145,'size','{\"width\":1600,\"height\":1066}'),
(256,'size','{\"width\":500,\"height\":500}'),
(258,'size','{\"width\":1920,\"height\":1281}'),
(259,'size','{\"width\":1600,\"height\":1067}'),
(260,'size','{\"width\":1200,\"height\":1800}'),
(261,'size','{\"width\":1600,\"height\":1067}'),
(262,'size','{\"width\":1600,\"height\":1067}'),
(263,'size','{\"width\":1600,\"height\":1067}'),
(264,'size','{\"width\":3000,\"height\":2000}'),
(265,'size','{\"width\":1600,\"height\":1066}');
/*!40000 ALTER TABLE `oc_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) DEFAULT NULL,
  `path_hash` varchar(32) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_id_storage_size` (`fileid`,`storage`,`size`),
  KEY `fs_parent` (`parent`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`),
  KEY `fs_storage_path_prefix` (`storage`,`path`(64))
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES
(1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,26998601,1689976198,1689975988,0,0,'64bafd8621278',23,''),
(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,26969508,1689976198,1689973670,0,0,'64bafd8621278',31,''),
(3,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1689975934,1689975934,0,0,'64bafc7eb3c04',23,''),
(4,2,'appdata_ocv97i5mvjzf','925dff74b915485d8fdab566fe35d7a3',3,'appdata_ocv97i5mvjzf',2,1,0,1689973690,1689973690,0,0,'64baf3a5e03bb',31,''),
(5,2,'appdata_ocv97i5mvjzf/photos','cdd390341d43bd862c55800ab7623587',4,'photos',2,1,0,1689973669,1689973669,0,0,'64baf3a5e13d9',31,''),
(6,2,'appdata_ocv97i5mvjzf/photos/geonames','33ddfc1453059b2fba6c3cd6933a6031',5,'geonames',2,1,0,1689973669,1689973669,0,0,'64baf3a5e1c86',31,''),
(7,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',4,3,3963036,1689973669,1689973669,0,0,'bf2c0d16677e3c3386525bc035b09eb6',27,''),
(8,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,209176,1689976198,1689973670,0,0,'64bafd8621278',31,''),
(9,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',8,'Mindmap.odg',6,5,13653,1689973669,1689973669,0,0,'09ce7feab6ec8ddeab073f91bb0a2d98',27,''),
(10,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',8,'Expense report.ods',7,5,13441,1689973670,1689973670,0,0,'f49e67bf89e98c2eb658e0468179528d',27,''),
(11,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',8,'SWOT analysis.whiteboard',8,5,38605,1689973670,1689973670,0,0,'fe4eb0f9a34ec5bdabb5eeb17a5f8438',27,''),
(13,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',8,'Letter.odt',11,5,15961,1689973670,1689973670,0,0,'a8accc7d918036153a1373bf208aaa6d',27,''),
(15,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',8,'Business model canvas.odg',6,5,16988,1689973670,1689973670,0,0,'0ab4d20abf72cffe387e23b6ccb2b7a3',27,''),
(16,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',8,'Simple.odp',12,5,14810,1689973670,1689973670,0,0,'cdaae024ec6d8793abc4feb24e9ebe5f',27,''),
(19,1,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',8,'Flowchart.odg',6,5,11836,1689973670,1689973670,0,0,'6f87e1a6521c16fa1b6eaf2ea86dff36',27,''),
(20,1,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',8,'Diagram & table.ods',7,5,13378,1689973670,1689973670,0,0,'263d99b42649ae72f7cb10a9b32d493d',27,''),
(21,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',8,'Impact effort matrix.whiteboard',8,5,52674,1689973670,1689973670,0,0,'fb9f14d3a2c0bd069c1625dcfab22970',27,''),
(22,1,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',8,'Invoice.odt',11,5,17276,1689973670,1689973670,0,0,'a0cc4e38386f1953e13b017dc76efa63',27,''),
(23,1,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',8,'Readme.md',10,9,554,1689973670,1689973670,0,0,'386fe08eb3b9c06ceabe43d6a9fdfe13',27,''),
(24,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',14,13,50598,1689973670,1689973670,0,0,'616211eaa5d181bc70484ab61e0e008a',27,''),
(25,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1689973670,1689973670,0,0,'64baf3a65c63c',31,''),
(26,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',25,'Vineyard.jpg',15,13,427030,1689973670,1689973670,0,0,'f92d0c79a6bea67685d9f7a22fb62cff',27,''),
(27,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',25,'Gorilla.jpg',15,13,474653,1689973670,1689973670,0,0,'b53e75a6939b422ac25210df06093c4e',27,''),
(28,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',25,'Steps.jpg',15,13,567689,1689973670,1689973670,0,0,'a768484b4e3e97aa1090f6184b8d7b59',27,''),
(29,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',25,'Birdie.jpg',15,13,593508,1689973670,1689973670,0,0,'34a32c80d82e15780ba43306f8b257a8',27,''),
(30,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',25,'Frog.jpg',15,13,457744,1689973670,1689973670,0,0,'988a45b2b08169a72eacbe2c2f42e19e',27,''),
(31,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',25,'Toucan.jpg',15,13,167989,1689973670,1689973670,0,0,'b0baf41970de84b12fba14fda11b8569',27,''),
(32,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',25,'Nextcloud community.jpg',15,13,797325,1689973670,1689973670,0,0,'f8d0ff043dbeb2f16f51af3d693919cb',27,''),
(33,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',25,'Library.jpg',15,13,2170375,1689973670,1689973670,0,0,'5cf039a95355319b5033984ab4f36f08',27,''),
(34,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',25,'Readme.md',10,9,150,1689973670,1689973670,0,0,'6df84be95930e6fd27e61f52aee25e20',27,''),
(35,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',16,5,976625,1689973670,1689973670,0,0,'0426b92e7e7c210c234f429d6eb2aceb',27,''),
(36,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',16,5,15004539,1689973670,1689973670,0,0,'9bffc08e274c14fb3624b8590c363a64',27,''),
(37,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1689973670,1689973670,0,0,'64baf3a679d26',31,''),
(38,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',37,'Example.md',10,9,1095,1689973670,1689973670,0,0,'7a32c522908f9a60e8d4358425889a82',27,''),
(39,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',37,'Readme.md',10,9,136,1689973670,1689973670,0,0,'ed45127d9dcfb5ba482f18c290da0fa0',27,''),
(40,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',37,'Nextcloud flyer.pdf',16,5,1083339,1689973670,1689973670,0,0,'e79b8bf94a0f5b94b609f222506d7d71',27,''),
(41,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',37,'Welcome to Nextcloud Hub.docx',17,5,24295,1689973670,1689973670,0,0,'71e7b7c3f5836cbbeae6356b67af44dc',27,''),
(42,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',10,9,206,1689973670,1689973670,0,0,'11f4e79e96057b0577d9af478fcbd8b1',27,''),
(43,2,'appdata_ocv97i5mvjzf/js','927a9a519d51e501e0a76bc16f73453f',4,'js',2,1,0,1689973794,1689973794,0,0,'64baf3b0cae77',31,''),
(44,2,'appdata_ocv97i5mvjzf/js/core','543d28d0541b82c7c3680a8b06a3b6db',43,'core',2,1,0,1689973680,1689973680,0,0,'64baf3b0cbd62',31,''),
(45,2,'appdata_ocv97i5mvjzf/js/core/merged-template-prepend.js','00c5fd7f1806e68f3025d3428c943469',44,'merged-template-prepend.js',18,5,12238,1689973680,1689973680,0,0,'837e773c0b3ff153a8b08637b3defa24',27,''),
(46,2,'appdata_ocv97i5mvjzf/js/core/merged-template-prepend.js.deps','120122a82ddd67a3b5cd01a106d22622',44,'merged-template-prepend.js.deps',8,5,246,1689973680,1689973680,0,0,'3a57865c968a313536ac637d8d38702c',27,''),
(47,2,'appdata_ocv97i5mvjzf/js/core/merged-template-prepend.js.gzip','8c0fa3e9646c3cf27bfab45dbec805d9',44,'merged-template-prepend.js.gzip',19,5,3098,1689973680,1689973680,0,0,'e99c9421ee615ab72f583f0c3b33a6a9',27,''),
(48,2,'appdata_ocv97i5mvjzf/appstore','aceb9a1a46f9d9b9f502f5593146bac9',4,'appstore',2,1,0,1689973785,1689973785,0,0,'64baf3b1a2b01',31,''),
(49,2,'appdata_ocv97i5mvjzf/theming','b044891d697f43f263626a200ac1701b',4,'theming',2,1,0,1689973681,1689973681,0,0,'64baf3b1c1ae7',31,''),
(50,2,'appdata_ocv97i5mvjzf/theming/global','ca1b83e7c48724b7002e4fc5a1996e03',49,'global',2,1,0,1689973681,1689973681,0,0,'64baf3b1c27aa',31,''),
(51,2,'appdata_ocv97i5mvjzf/theming/global/0','d571ad538d2ed751857c4e583fa49413',50,'0',2,1,0,1689973785,1689973785,0,0,'64baf3b1ca8a5',31,''),
(52,2,'appdata_ocv97i5mvjzf/theming/global/0/touchIcon-core','705f2b805b4f0b15fc19e432a9a76711',51,'touchIcon-core',8,5,48880,1689973681,1689973681,0,0,'e3f3bc55fe296b2d542198708c10846f',27,''),
(53,2,'appdata_ocv97i5mvjzf/appstore/apps.json','8deee9031fe9982f9732c2768ab8e06a',48,'apps.json',20,5,2308607,1689973683,1689973683,0,0,'b320eeb161bd694cb83fa56fabd20e77',27,''),
(54,2,'appdata_ocv97i5mvjzf/avatar','5185b8006b91aab851e4038eaaa6952b',4,'avatar',2,1,0,1689973689,1689973689,0,0,'64baf3b9c2994',31,''),
(55,2,'appdata_ocv97i5mvjzf/avatar/admin','2e3d57450bf4c7a43a235fcc8ee0e282',54,'admin',2,1,0,1689973690,1689973690,0,0,'64baf3b9c3d60',31,''),
(56,2,'appdata_ocv97i5mvjzf/preview','832be1670c418397086db69cf0560e15',4,'preview',2,1,0,1689973690,1689973690,0,0,'64baf3ba045cc',31,''),
(57,2,'appdata_ocv97i5mvjzf/preview/d','fcad85873ea278a47939da86afec0e59',56,'d',2,1,-1,1689973690,1689973690,0,0,'64baf3ba0710c',31,''),
(58,2,'appdata_ocv97i5mvjzf/preview/9','d0bd0d91394fbda2e9273518884fbb3f',56,'9',2,1,-1,1689973690,1689973690,0,0,'64baf3ba074d9',31,''),
(59,2,'appdata_ocv97i5mvjzf/preview/c','907d6373823fad66b02293370ad0fbea',56,'c',2,1,-1,1689973690,1689973690,0,0,'64baf3ba074e0',31,''),
(60,2,'appdata_ocv97i5mvjzf/preview/d/3','1500f5193ad8080898efcbeffbea7134',57,'3',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06d7c',31,''),
(61,2,'appdata_ocv97i5mvjzf/preview/9/b','96a6850ff69dcd81796de84b8d440b52',58,'b',2,1,-1,1689973690,1689973690,0,0,'64baf3ba07237',31,''),
(62,2,'appdata_ocv97i5mvjzf/preview/d/3/d','f785c54405e2c795847d140c7e4b582d',60,'d',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06ae3',31,''),
(63,2,'appdata_ocv97i5mvjzf/preview/c/5','96bab148cf24c1313e2efc2997480c3f',59,'5',2,1,-1,1689973690,1689973690,0,0,'64baf3ba07223',31,''),
(64,2,'appdata_ocv97i5mvjzf/preview/9/b/f','dd91e340ab611179cf66ec999323d525',61,'f',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06d78',31,''),
(65,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9','aca365c373ad14a422ac356713fab065',62,'9',2,1,-1,1689973690,1689973690,0,0,'64baf3ba068bc',31,''),
(66,2,'appdata_ocv97i5mvjzf/preview/c/5/1','90600b895be42db17d3014486059d436',63,'1',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06ec7',31,''),
(67,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3','66585f4049ba8a805b2e173d8c1e456d',64,'3',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06af9',31,''),
(68,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9/4','ec0d25f7fb613a4f68ab7f566137f9f6',65,'4',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06643',31,''),
(69,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3/1','c024614f3f81fbe5f4905c65fb4e6bd2',67,'1',2,1,-1,1689973690,1689973690,0,0,'64baf3ba067a1',31,''),
(70,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c','7a95b68b4e8d1bd81f8590e036d1b98a',66,'c',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06c5c',31,''),
(71,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9/4/4','43c53118e0f3da96798f06d813fc0129',68,'4',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06380',31,''),
(72,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c/e','6f04451ff794eea685de82ac5ec39dd3',70,'e',2,1,-1,1689973690,1689973690,0,0,'64baf3ba069e7',31,''),
(73,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3/1/c','0207c09a4fdf12217a04ea14bb2ca819',69,'c',2,1,-1,1689973690,1689973690,0,0,'64baf3ba0652d',31,''),
(74,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9/4/4/6','00af39dfbdda5aa55ecd4196d5ba0313',71,'6',2,1,-1,1689973690,1689973690,0,0,'64baf3ba05d2e',31,''),
(75,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c/e/4','aa8c53a88e6e4c7354b4c44c4bf5d695',72,'4',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06644',31,''),
(76,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3/1/c/7','e9eea19e7046eb6f5a5a6d3f09ee5762',73,'7',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06261',31,''),
(77,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9/4/4/6/10','7d9735f5b9d01144be78d7a49da226b0',74,'10',2,1,0,1689973690,1689973690,0,0,'64baf3ba05a0e',31,''),
(78,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3/1/c/7/15','7088dfcf2188683c501ea295fffb4602',76,'15',2,1,0,1689973690,1689973690,0,0,'64baf3ba05c85',31,''),
(79,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c/e/4/1','bfcf21fbd4dbeb894affd0c1911c243a',75,'1',2,1,-1,1689973690,1689973690,0,0,'64baf3ba06378',31,''),
(80,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c/e/4/1/13','a3cc56ba2335dac184a8850698d5ad0a',79,'13',2,1,0,1689973690,1689973690,0,0,'64baf3ba05ecf',31,''),
(81,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9/4/4/6/10/236-255-max.png','74817b9499ecb6ea17b13c266ea31312',77,'236-255-max.png',14,13,4699,1689973690,1689973690,0,0,'87c56e1d9d64805e97f47cc52dd916ca',27,''),
(82,2,'appdata_ocv97i5mvjzf/preview/d/3/d/9/4/4/6/10/236-236-crop.png','ed78819a0171619949ecd1f98613b86b',77,'236-236-crop.png',14,13,14704,1689973690,1689973690,0,0,'58019a229ef0ec0bfec42db4d03a48f0',27,''),
(83,2,'appdata_ocv97i5mvjzf/theming/global/0/icon-core-#0082c9filetypes_x-office-spreadsheet.svg','13418733174e3b3f957af94cc94e29b7',51,'icon-core-#0082c9filetypes_x-office-spreadsheet.svg',21,13,327,1689973690,1689973690,0,0,'1c696a128c3b4ea88397562f18cce993',27,''),
(84,2,'appdata_ocv97i5mvjzf/theming/global/0/icon-core-#0082c9filetypes_file.svg','1dea593ad70cc2e911292c35a694300f',51,'icon-core-#0082c9filetypes_file.svg',21,13,228,1689973690,1689973690,0,0,'f9faf12eb84b21d9975fa87711c11ced',27,''),
(85,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c/e/4/1/13/181-256-max.png','0cd948db0c59daca752489602f3d47d0',80,'181-256-max.png',14,13,4052,1689973690,1689973690,0,0,'66f7e683f211e6ae0005ad4b0b7db0a6',27,''),
(86,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3/1/c/7/15/256-181-max.png','93a6d1dd524b455cf12d554a8cabd268',78,'256-181-max.png',14,13,4032,1689973690,1689973690,0,0,'8b04f019b52dafcfabd02d09b0dd428a',27,''),
(87,2,'appdata_ocv97i5mvjzf/theming/global/0/icon-core-#0082c9filetypes_text.svg','fc1fa68837f6b05c0cfdd0c714486476',51,'icon-core-#0082c9filetypes_text.svg',21,13,295,1689973690,1689973690,0,0,'9b8b1db817aff9d5517f4e7521e686e9',27,''),
(88,2,'appdata_ocv97i5mvjzf/preview/9/b/f/3/1/c/7/15/181-181-crop.png','31a332769fd791d909b9b8123c3d8fc0',78,'181-181-crop.png',14,13,8254,1689973690,1689973690,0,0,'d4b3fa3ecabb96d3f7c564bb06a4613d',27,''),
(89,2,'appdata_ocv97i5mvjzf/preview/c/5/1/c/e/4/1/13/181-181-crop.png','1163921beefb60ccffc08e25a2b29288',80,'181-181-crop.png',14,13,8626,1689973690,1689973690,0,0,'9916e603fd25d01434558897ba9bbf3e',27,''),
(90,2,'appdata_ocv97i5mvjzf/theming/global/0/icon-core-#0082c9filetypes_x-office-document.svg','6020fac84c1fa4cd207abb0cef3398e3',51,'icon-core-#0082c9filetypes_x-office-document.svg',21,13,295,1689973690,1689973690,0,0,'7302e9aa99d946e4ca399cb35f6c6167',27,''),
(91,2,'appdata_ocv97i5mvjzf/theming/global/0/icon-core-#0082c9filetypes_x-office-drawing.svg','b1edccc3a37b99ef2eb8e2fc60e4a726',51,'icon-core-#0082c9filetypes_x-office-drawing.svg',21,13,291,1689973690,1689973690,0,0,'f45d96f9c95f47882ca6b6d64ee46502',27,''),
(92,2,'appdata_ocv97i5mvjzf/theming/global/0/icon-core-#0082c9filetypes_x-office-presentation.svg','6812a61198a3bd792ad8d5eb259656c2',51,'icon-core-#0082c9filetypes_x-office-presentation.svg',21,13,261,1689973690,1689973690,0,0,'ad991cb6be9978fe40e28dc08ade8d60',27,''),
(93,2,'appdata_ocv97i5mvjzf/preview/c/7','9c8cef21bb442ee1bbdde6d4a3f6663d',59,'7',2,1,-1,1689973690,1689973690,0,0,'64baf3ba2415e',31,''),
(94,2,'appdata_ocv97i5mvjzf/preview/c/7/4','02604f833279086e24afd2c1b8860e19',93,'4',2,1,-1,1689973690,1689973690,0,0,'64baf3ba23f94',31,''),
(95,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d','6087777d99162204ca01f73cfa1973ee',94,'d',2,1,-1,1689973690,1689973690,0,0,'64baf3ba23d95',31,''),
(96,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d/9','0d4605bab282cecd188d9bab46018ac2',95,'9',2,1,-1,1689973690,1689973690,0,0,'64baf3ba23bca',31,''),
(97,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d/9/7','93a4a47189be0d159b46df2183547a5f',96,'7',2,1,-1,1689973690,1689973690,0,0,'64baf3ba239e6',31,''),
(98,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d/9/7/b','ae4c918f1322acfcd0e6ca60df168816',97,'b',2,1,-1,1689973690,1689973690,0,0,'64baf3ba237e1',31,''),
(99,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d/9/7/b/16','11b99ed4436d4e5e74cd51ba033720a3',98,'16',2,1,0,1689973690,1689973690,0,0,'64baf3ba2356f',31,''),
(100,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d/9/7/b/16/256-144-max.png','90e5b66c0747fe585e3210fc8c7ed842',99,'256-144-max.png',14,13,2197,1689973690,1689973690,0,0,'65e94e9b94b5922ee73cdf6b98785423',27,''),
(101,2,'appdata_ocv97i5mvjzf/preview/c/7/4/d/9/7/b/16/144-144-crop.png','e4ba37d63c8922a1b0d4eaf254343019',99,'144-144-crop.png',14,13,5409,1689973690,1689973690,0,0,'6c1435b0d586b0d1103e49238e933c14',27,''),
(102,2,'appdata_ocv97i5mvjzf/avatar/admin/avatar-dark.png','c968003dcb9dd37e995f6ba4029f79d0',55,'avatar-dark.png',14,13,18918,1689973690,1689973690,0,0,'a665a4fd5b6b7e73b46c3f13b8ba9f4e',27,''),
(103,2,'appdata_ocv97i5mvjzf/avatar/admin/generated','c45119f6048ccd8d1cfcf2470e90e25c',55,'generated',8,5,0,1689973690,1689973690,0,0,'60c9d38818ff1c98fe1896f16274cb3d',27,''),
(104,2,'appdata_ocv97i5mvjzf/avatar/admin/avatar-dark.64.png','41dde24e4474000750571ce184bd749b',55,'avatar-dark.64.png',14,13,950,1689973690,1689973690,0,0,'19815fa824bec7a3beddfa84745b9f0f',27,''),
(105,2,'appdata_ocv97i5mvjzf/theming/global/0/favIcon-dashboard','8bb72f1fe9819a192b4312b4608b704b',51,'favIcon-dashboard',8,5,90022,1689973690,1689973690,0,0,'de18c0409e6619a5f7d22516224c9cfd',27,''),
(106,2,'appdata_ocv97i5mvjzf/theming/global/0/touchIcon-dashboard','01171dbdd9a27b3add883de9c5a68115',51,'touchIcon-dashboard',8,5,7556,1689973690,1689973690,0,0,'a07f75491c81b7290f3341cbf78e9936',27,''),
(107,2,'appdata_ocv97i5mvjzf/theming/global/0/favIcon-settings','db754fc086e2c649e6ea7320aaba9546',51,'favIcon-settings',8,5,90022,1689973785,1689973785,0,0,'2722321a40cab8f3264d6e335f532a2e',27,''),
(108,2,'appdata_ocv97i5mvjzf/theming/global/0/touchIcon-settings','7a3980e3536d8b035ae5d00d387c9ad9',51,'touchIcon-settings',8,5,48880,1689973785,1689973785,0,0,'ce82f1cf7b8bae319bf5f0241dd3f71b',27,''),
(109,2,'appdata_ocv97i5mvjzf/appstore/categories.json','42e1ed1c4360905dc5afb6d4e5fd5afb',48,'categories.json',20,5,141893,1689973785,1689973785,0,0,'efe4433a7c0920ce32cfff676213da4a',27,''),
(110,2,'appdata_ocv97i5mvjzf/js/files','51912cad3bebe4bc4fa96b5c88376ea1',43,'files',2,1,0,1689973794,1689973794,0,0,'64baf42221d9f',31,''),
(111,2,'appdata_ocv97i5mvjzf/js/files/merged-index.js','813c293b395d3e4ced12a4a4c0072bda',110,'merged-index.js',18,5,415795,1689973794,1689973794,0,0,'4af62565932d80af05bf2e23d4a24b87',27,''),
(112,2,'appdata_ocv97i5mvjzf/js/files/merged-index.js.deps','de02639e5c863299558eb4edce2fe304',110,'merged-index.js.deps',8,5,1962,1689973794,1689973794,0,0,'d9cce9f5c263da26e7018cc54dd9f281',27,''),
(113,2,'appdata_ocv97i5mvjzf/js/files/merged-index.js.gzip','5a26eac8fac214f1d6b59298fbffe1fc',110,'merged-index.js.gzip',19,5,94347,1689973794,1689973794,0,0,'bca292e8b6456ddd860cb0c92d3dbe0a',27,''),
(116,2,'appdata_ocvxa5c1ugz1','f5462caa050c51d0a78fd0dee7f016df',3,'appdata_ocvxa5c1ugz1',2,1,0,1689975940,1689975940,0,0,'64bafc772cda2',31,''),
(117,2,'appdata_ocvxa5c1ugz1/photos','9e7ccba99f6957d66abb61a4e57848fb',116,'photos',2,1,0,1689975927,1689975927,0,0,'64bafc772d9e9',31,''),
(118,2,'appdata_ocvxa5c1ugz1/photos/geonames','be503c6531ead746280509ce2a247fea',117,'geonames',2,1,0,1689975927,1689975927,0,0,'64bafc772e48a',31,''),
(155,2,'appdata_ocvxa5c1ugz1/js','6f6441e83d2f7f6c5710b2731483e0ec',116,'js',2,1,0,1689976250,1689976250,0,0,'64bafc7ddc4e0',31,''),
(156,2,'appdata_ocvxa5c1ugz1/js/core','8742d22ab8a106708fee2b56a8a66d2b',155,'core',2,1,0,1689975933,1689975933,0,0,'64bafc7ddd211',31,''),
(157,2,'appdata_ocvxa5c1ugz1/js/core/merged-template-prepend.js','91e23bd3ccf586a71ef776e5b4ce8d34',156,'merged-template-prepend.js',18,5,12238,1689975933,1689975933,0,0,'15c243492cc244e95c6151502f11f170',27,''),
(158,2,'appdata_ocvxa5c1ugz1/js/core/merged-template-prepend.js.deps','1dd4babb692929d53caaf76701953bed',156,'merged-template-prepend.js.deps',8,5,246,1689975933,1689975933,0,0,'5fe2076d2a6c72962a9a52b452d30a22',27,''),
(159,2,'appdata_ocvxa5c1ugz1/js/core/merged-template-prepend.js.gzip','bb40bee92c2fcc9e6f1ceee252c5719b',156,'merged-template-prepend.js.gzip',19,5,3098,1689975933,1689975933,0,0,'def7d3e89ad973d7a3b8ba077337cb9f',27,''),
(160,2,'appdata_ocvxa5c1ugz1/appstore','0761ae9a3b7caf2352dbde67afc3c1c1',116,'appstore',2,1,0,1689975948,1689975948,0,0,'64bafc7eb00f4',31,''),
(161,2,'appdata_ocvxa5c1ugz1/theming','964c1eb07d9a2f94cf0a8119c5653315',116,'theming',2,1,0,1689975934,1689975934,0,0,'64bafc7ed2ca5',31,''),
(162,2,'appdata_ocvxa5c1ugz1/theming/global','eb8b7a8d7f96f963c06c9f3435f4c1d8',161,'global',2,1,0,1689975934,1689975934,0,0,'64bafc7ed39c7',31,''),
(163,2,'appdata_ocvxa5c1ugz1/theming/global/0','5cabe793cb2176d9fd7d95ab8fc11357',162,'0',2,1,0,1689976094,1689976094,0,0,'64bafc7edb6d0',31,''),
(164,2,'appdata_ocvxa5c1ugz1/theming/global/0/favIcon-core','3581ebd59716de6f79d4d6150acc2a10',163,'favIcon-core',8,5,90022,1689975934,1689975934,0,0,'5cdd3bdff5e219f24247cdb59dd06fbf',27,''),
(165,2,'appdata_ocvxa5c1ugz1/appstore/apps.json','a9de81ea513000fdae3e342735dab8f7',160,'apps.json',20,5,2308607,1689975935,1689975935,0,0,'361ff38a313e037fd53fc821c5c0d651',27,''),
(166,2,'appdata_ocvxa5c1ugz1/theming/global/0/favIcon-dashboard','e32efa181731484edd6c34d5822805cb',163,'favIcon-dashboard',8,5,90022,1689975940,1689975940,0,0,'cc59872962c508110cf006260167321c',27,''),
(167,2,'appdata_ocvxa5c1ugz1/theming/global/0/touchIcon-dashboard','dd98e6ac8928e322bc6e0047ec8884f6',163,'touchIcon-dashboard',8,5,7556,1689975940,1689975940,0,0,'ce9713c4002b7d2d764226b95e53e96a',27,''),
(168,2,'appdata_ocvxa5c1ugz1/avatar','b1371242650d6a5afb28e2f7cc8952ce',116,'avatar',2,1,0,1689976284,1689976284,0,0,'64bafc84981a4',31,''),
(170,2,'appdata_ocvxa5c1ugz1/preview','a3ac4ef099fb3def19294e8d2335f2cd',116,'preview',2,1,0,1689975940,1689975940,0,0,'64bafc84d8772',31,''),
(171,2,'appdata_ocvxa5c1ugz1/preview/0','c4d480a7de084de7a450bb5b1c30cd29',170,'0',2,1,-1,1689975940,1689975940,0,0,'64bafc84dba76',31,''),
(172,2,'appdata_ocvxa5c1ugz1/preview/c','cf7fa9eca091c69197a1f294c4ebd00f',170,'c',2,1,-1,1689975940,1689975940,0,0,'64bafc84dbcf3',31,''),
(173,2,'appdata_ocvxa5c1ugz1/preview/3','583c9f006f663c0ddcc646f2c644ef4f',170,'3',2,1,-1,1689975940,1689975940,0,0,'64bafc84dbe12',31,''),
(174,2,'appdata_ocvxa5c1ugz1/preview/0/6','61b5fda54d2701857b3c57712d27195d',171,'6',2,1,-1,1689975940,1689975940,0,0,'64bafc84db675',31,''),
(175,2,'appdata_ocvxa5c1ugz1/preview/c/8','7d54a7b249537320f8c4a31f7c663457',172,'8',2,1,-1,1689975940,1689975940,0,0,'64bafc84db950',31,''),
(176,2,'appdata_ocvxa5c1ugz1/preview/3/d','b8afbec2d96e6b51cc9608d6c5cc099b',173,'d',2,1,-1,1689975940,1689975940,0,0,'64bafc84dba9e',31,''),
(177,2,'appdata_ocvxa5c1ugz1/preview/0/6/9','0d507a28a25e12f415f80d2fc8ae3c7f',174,'9',2,1,-1,1689975940,1689975940,0,0,'64bafc84db2f9',31,''),
(178,2,'appdata_ocvxa5c1ugz1/preview/c/8/f','154b0f98777b81fc8446a00c4b55b2b7',175,'f',2,1,-1,1689975940,1689975940,0,0,'64bafc84db2f9',31,''),
(179,2,'appdata_ocvxa5c1ugz1/preview/3/d/e','8d0c5e7ec616d7c15d9afc13c46dbfa6',176,'e',2,1,-1,1689975940,1689975940,0,0,'64bafc84db529',31,''),
(180,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f','d09fb7c337ee13dccf3f1c32045e5432',178,'f',2,1,-1,1689975940,1689975940,0,0,'64bafc84dafdc',31,''),
(181,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0','726fee89cd835a7e175db62b5aadfc64',177,'0',2,1,-1,1689975940,1689975940,0,0,'64bafc84dafd7',31,''),
(182,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f','166210931a0f83e607bf4a61b8236d37',179,'f',2,1,-1,1689975940,1689975940,0,0,'64bafc84db1a2',31,''),
(183,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f/e','4e8aa92ca13ab108a2b07e9131075809',180,'e',2,1,-1,1689975940,1689975940,0,0,'64bafc84daba2',31,''),
(184,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0/5','e021009362580f5da6d55be99d74836f',181,'5',2,1,-1,1689975940,1689975940,0,0,'64bafc84dacc0',31,''),
(185,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f/1','891ab3a174f1fb10ed0be4f3cbdbb2ff',182,'1',2,1,-1,1689975940,1689975940,0,0,'64bafc84daeb8',31,''),
(186,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f/e/9','a83ea201abe28078419235caa57cbf0b',183,'9',2,1,-1,1689975940,1689975940,0,0,'64bafc84da726',31,''),
(187,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f/1/8','6aee0eb973092ac3e93381be2ca90385',185,'8',2,1,-1,1689975940,1689975940,0,0,'64bafc84daa53',31,''),
(188,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0/5/9','13d02a4c65abc7f694bfd852249e393b',184,'9',2,1,-1,1689975940,1689975940,0,0,'64bafc84da926',31,''),
(189,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f/e/9/a','b1802ea19725c0167eb30810103bb2d6',186,'a',2,1,-1,1689975940,1689975940,0,0,'64bafc84d9fcc',31,''),
(190,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f/1/8/4','b73fdd21482ee4f55a4ab1fb3e277fa5',187,'4',2,1,-1,1689975940,1689975940,0,0,'64bafc84da48b',31,''),
(191,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0/5/9/b','22e2884b26ed3c10e5a46b93e6e1e7ec',188,'b',2,1,-1,1689975940,1689975940,0,0,'64bafc84da48b',31,''),
(192,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f/e/9/a/124','21c4e3557d1c900fce48134735ed92f9',189,'124',2,1,0,1689975941,1689975941,0,0,'64bafc84d9c05',31,''),
(193,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0/5/9/b/126','ac6ef868385ce49a2301903d2f9bda45',191,'126',2,1,0,1689975941,1689975941,0,0,'64bafc84d9ccb',31,''),
(194,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f/1/8/4/125','61de9f764cd9a8a5f6219492af579304',190,'125',2,1,0,1689975940,1689975940,0,0,'64bafc84d9ca6',31,''),
(195,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_video.svg','5a688591480fae8490c6c4cf56e71364',163,'icon-core-#0082c9filetypes_video.svg',21,13,277,1689975940,1689975940,0,0,'bfd754fe9626625064f7c36e331e5c9f',27,''),
(196,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_x-office-drawing.svg','5cf0c1e89dd0b10b29f42c00337bd25f',163,'icon-core-#0082c9filetypes_x-office-drawing.svg',21,13,291,1689975940,1689975940,0,0,'8983c08fa0d62dd6124a77afcbce9359',27,''),
(197,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f/1/8/4/125/181-256-max.png','a6c55d4e12dc96c6f4e82dbc461c8590',194,'181-256-max.png',14,13,4052,1689975940,1689975940,0,0,'88fab31a6e954d3deab59b5ebe9e004b',27,''),
(198,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_x-office-spreadsheet.svg','24837c3ff2a45071a34af3356dbd726b',163,'icon-core-#0082c9filetypes_x-office-spreadsheet.svg',21,13,327,1689975940,1689975940,0,0,'48feec067395379ed700e7017d63315c',27,''),
(199,2,'appdata_ocvxa5c1ugz1/preview/3/d/e/f/1/8/4/125/181-181-crop.png','fab01081b1a592423dfeda5fc7368735',194,'181-181-crop.png',14,13,8626,1689975940,1689975940,0,0,'3be748d50bfe23b25749ffff0c5b6af3',27,''),
(200,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_file.svg','69656be2d899a74768caafcf8168a870',163,'icon-core-#0082c9filetypes_file.svg',21,13,228,1689975940,1689975940,0,0,'a456e8cd6ad7609ab3ade4aad608859a',27,''),
(201,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f/e/9/a/124/4096-4096-max.png','ef9953ae0959d9c318c3834631d29685',192,'4096-4096-max.png',14,13,69461,1689975940,1689975940,0,0,'ac42e2593b7d3c9b2c00c1952cfc871c',27,''),
(202,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_text.svg','01a0d4001a12d75927f751f41001bf19',163,'icon-core-#0082c9filetypes_text.svg',21,13,295,1689975940,1689975940,0,0,'a38657ab1b106180fff46ccf1f76599b',27,''),
(203,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_x-office-document.svg','202f84c97b9f344bdbc8191f72fdb451',163,'icon-core-#0082c9filetypes_x-office-document.svg',21,13,295,1689975941,1689975941,0,0,'1a3e69d54344aa77e3001339a3152564',27,''),
(204,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0/5/9/b/126/4096-4096-max.png','b28c65ae9c2556c9a7d597360c6d7f4d',193,'4096-4096-max.png',14,13,68696,1689975941,1689975941,0,0,'2993e495b8a4525d205375c08abbfba4',27,''),
(208,2,'appdata_ocvxa5c1ugz1/preview/c/8/f/f/e/9/a/124/256-256-crop.png','feb82305c9259713582530d2c30a6003',192,'256-256-crop.png',14,13,12242,1689975941,1689975941,0,0,'6eb1a862681f1c1f4fd5a101e52c6bc2',27,''),
(209,2,'appdata_ocvxa5c1ugz1/preview/0/6/9/0/5/9/b/126/256-256-crop.png','2a46d8bae5c2fd7761af0d762217c21a',193,'256-256-crop.png',14,13,12062,1689975941,1689975941,0,0,'cf3a2a8afdd367c6b2d1559900106adb',27,''),
(210,2,'appdata_ocvxa5c1ugz1/theming/global/0/favIcon-settings','ae959a7cc4022d03c3ac73ff3e32e79d',163,'favIcon-settings',8,5,90022,1689975947,1689975947,0,0,'b9c2f89caaf83b26486704364382a11b',27,''),
(211,2,'appdata_ocvxa5c1ugz1/theming/global/0/touchIcon-settings','2adf28ebda69945843580ccbd6baa621',163,'touchIcon-settings',8,5,48880,1689975947,1689975947,0,0,'af16eb27443ce5efc8afa34b518c9038',27,''),
(212,2,'appdata_ocvxa5c1ugz1/appstore/categories.json','b7917c9c8d27fc0392a42a70de8f5326',160,'categories.json',20,5,141893,1689975948,1689975948,0,0,'48319a889bf79d1fe61fa13ebd5677ac',27,''),
(213,2,'appdata_ocvxa5c1ugz1/theming/global/0/touchIcon-core','58dcaafd62093241cf24a2be2b855043',163,'touchIcon-core',8,5,48880,1689975982,1689975982,0,0,'da094268da9892849107e1ac9b45f876',27,''),
(214,1,'cache','0fea6a13c52b4d4725368f24b045ca84',1,'cache',2,1,0,1689975988,1689975988,0,0,'64bafcb48f6d3',31,''),
(215,2,'appdata_ocvxa5c1ugz1/preview/c/2','9da6230ed7cb644759fc8908f6542256',172,'2',2,1,-1,1689975990,1689975990,0,0,'64bafcb66885b',31,''),
(216,2,'appdata_ocvxa5c1ugz1/preview/c/2/0','70767e95da8fbfa69072bc7d5d70d9ad',215,'0',2,1,-1,1689975990,1689975990,0,0,'64bafcb6685e2',31,''),
(217,2,'appdata_ocvxa5c1ugz1/preview/a','bb20b7becd4615caf38e7489b00f0041',170,'a',2,1,-1,1689975990,1689975990,0,0,'64bafcb668cdd',31,''),
(218,2,'appdata_ocvxa5c1ugz1/preview/c/2/0/a','9baa3a3bcfce945c896fe1205cb3e7c2',216,'a',2,1,-1,1689975990,1689975990,0,0,'64bafcb66827e',31,''),
(219,2,'appdata_ocvxa5c1ugz1/preview/a/a','8bfa40b844bc0dd09defc29c1c3866c4',217,'a',2,1,-1,1689975990,1689975990,0,0,'64bafcb668ac8',31,''),
(220,2,'appdata_ocvxa5c1ugz1/preview/c/2/0/a/d','95376bc99c919ff8a1bd30ff264b170f',218,'d',2,1,-1,1689975990,1689975990,0,0,'64bafcb667f3b',31,''),
(221,2,'appdata_ocvxa5c1ugz1/preview/c/2/0/a/d/4','e94d32651a45801fa377404dfb4428ea',220,'4',2,1,-1,1689975990,1689975990,0,0,'64bafcb667bb2',31,''),
(222,2,'appdata_ocvxa5c1ugz1/preview/a/a/b','ed7c739031dde817c341bf1683772121',219,'b',2,1,-1,1689975990,1689975990,0,0,'64bafcb668752',31,''),
(223,2,'appdata_ocvxa5c1ugz1/preview/c/2/0/a/d/4/d','22d1c40d8354656fc18f05ead08c5eb1',221,'d',2,1,-1,1689975990,1689975990,0,0,'64bafcb667707',31,''),
(224,2,'appdata_ocvxa5c1ugz1/preview/a/a/b/3','a7485ab6379fbcc37e672211104c9fdc',222,'3',2,1,-1,1689975990,1689975990,0,0,'64bafcb6684d1',31,''),
(225,2,'appdata_ocvxa5c1ugz1/preview/c/2/0/a/d/4/d/12','ed4a9ec3448e32ba595b7eb11094b503',223,'12',2,1,0,1689975990,1689975990,0,0,'64bafcb66625e',31,''),
(226,2,'appdata_ocvxa5c1ugz1/preview/a/a/b/3/2','b2cfe7b61e3cba3249fc86270f1cb57f',224,'2',2,1,-1,1689975990,1689975990,0,0,'64bafcb668173',31,''),
(227,2,'appdata_ocvxa5c1ugz1/preview/a/a/b/3/2/3','1f882cc7a8763f8cd8b6b53138a9360a',226,'3',2,1,-1,1689975990,1689975990,0,0,'64bafcb667e31',31,''),
(228,2,'appdata_ocvxa5c1ugz1/preview/a/a/b/3/2/3/8','06afd524cacf16ae9e41ae9c2f7873fc',227,'8',2,1,-1,1689975990,1689975990,0,0,'64bafcb667a9f',31,''),
(229,2,'appdata_ocvxa5c1ugz1/preview/a/a/b/3/2/3/8/14','237188585863ff4f673ead904a88afcd',228,'14',2,1,0,1689975990,1689975990,0,0,'64bafcb666259',31,''),
(275,2,'appdata_ocvxa5c1ugz1/preview/a/4','c42e1d1d153554004de06be001e06ee1',217,'4',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7c11',31,''),
(276,2,'appdata_ocvxa5c1ugz1/preview/b','38bcd0ba37afd19bcb48d367333cadbe',170,'b',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7fe8',31,''),
(277,2,'appdata_ocvxa5c1ugz1/preview/a/4/f','edaf66f7581ec4936412e137696caab7',275,'f',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7954',31,''),
(278,2,'appdata_ocvxa5c1ugz1/preview/c/f','2ebb04cf79f441b6cead940c3dc8addf',172,'f',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea8275',31,''),
(279,2,'appdata_ocvxa5c1ugz1/preview/3/6','f29abd70dde6d47777f563bc17fad66e',173,'6',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea8275',31,''),
(280,2,'appdata_ocvxa5c1ugz1/preview/b/1','916ad106c2b40af3a8e584908ff5f7aa',276,'1',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7d3b',31,''),
(281,2,'appdata_ocvxa5c1ugz1/preview/f','0ed3a7ec717e97f7de1f55272227bc4c',170,'f',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea8678',31,''),
(282,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2','64d971732b0b3d6a43dd5f26eb6137f4',277,'2',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7418',31,''),
(283,2,'appdata_ocvxa5c1ugz1/preview/c/f/a','17a1d6d2e9a65400e51bd0ac2f0b0826',278,'a',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7d42',31,''),
(284,2,'appdata_ocvxa5c1ugz1/preview/3/6/6','06b9acd51e641e3a101bab987ee89840',279,'6',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7d3f',31,''),
(285,2,'appdata_ocvxa5c1ugz1/preview/5','567f79505ea63720e303770924c5a1b9',170,'5',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea878e',31,''),
(286,2,'appdata_ocvxa5c1ugz1/preview/b/1/a','0a0fbaebd4e7a2f981b83be053dcc8e4',280,'a',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7a76',31,''),
(287,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0','91943b3868ff892ae4786f3cccf7403c',283,'0',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea795a',31,''),
(288,2,'appdata_ocvxa5c1ugz1/preview/f/7','b669f3f146add4170299d44de65bcd38',281,'7',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea8275',31,''),
(289,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6','ca77f30da9ef6f64442a8b267e3774f1',284,'6',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7955',31,''),
(290,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2/3','1ae275168c6cef0830a99a9d8d0bade3',282,'3',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea70f9',31,''),
(291,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2/3/6','9b92b688653ebc1400d74be7c082c182',290,'6',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea6c1d',31,''),
(292,2,'appdata_ocvxa5c1ugz1/preview/f/7/1','120901df90d2a47d940a77b682e71123',288,'1',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7e81',31,''),
(293,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6/0','e36591879e959bd26de0279651d3f594',289,'0',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7418',31,''),
(294,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5','635b99498e5c0680bacee60ae4a4e4a7',286,'5',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea771d',31,''),
(295,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0/8','275c4caf02a666d98afe309adb2422e3',287,'8',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7417',31,''),
(296,2,'appdata_ocvxa5c1ugz1/preview/5/0','cde035efe6a6fd364a270f5c533f635e',285,'0',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea8277',31,''),
(297,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2/3/6/7','fccc6a2c756812a1e8f871673635d4f9',291,'7',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea68aa',31,''),
(298,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8','5608811f45d7cb91b623e28a04c78f4e',292,'8',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7b43',31,''),
(299,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6/0/e','5b830ba2319687608edc3b5ce259425a',293,'e',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea6fe0',31,''),
(300,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5/9','3f69cc7d80aa67c5a42c5480e7a38e95',294,'9',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea72d8',31,''),
(301,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0/8/6','080a92886dbc6d24574aa9c0579b7368',295,'6',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea6fd8',31,''),
(302,2,'appdata_ocvxa5c1ugz1/preview/5/0/2','055972f7d12ca1646639e97f22f2594d',296,'2',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7d46',31,''),
(303,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2/3/6/7/260','ad8304db4931acdb71c926d2b9a3577d',297,'260',2,1,0,1689976094,1689976094,0,0,'64bafd1ea658c',31,''),
(304,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6/0/e/5','341666f4e658da0139c35b685baec319',299,'5',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea69d3',31,''),
(305,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8/4','89132e9119f0dd748a508b62c7477d0b',298,'4',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea741a',31,''),
(306,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0/8/6/0','cc6b846d2f015c7c68126f99b7acd18a',301,'0',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea69d2',31,''),
(307,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e','812d350cd24e382fa510ac7211939542',302,'e',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7954',31,''),
(308,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5/9/b','d5913cd9bd716d83142906762bdc2b6a',300,'b',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea6fd7',31,''),
(309,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8/4/9','f21f236eba60275d4df97661d1eeab1d',305,'9',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea6fd7',31,''),
(310,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e/4','5acf34ce7bdf0753e30aed2660c84625',307,'4',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7447',31,''),
(311,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0/8/6/0/259','2274bd694dfd1ee50b125901491987f8',306,'259',2,1,0,1689976094,1689976094,0,0,'64bafd1ea66cb',31,''),
(312,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6/0/e/5/262','1f950b7503ebb79fcad3ec38325ecbe2',304,'262',2,1,0,1689976094,1689976094,0,0,'64bafd1ea65b2',31,''),
(313,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5/9/b/3','c2d9cc962052bd00cebac477a7ede125',308,'3',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea69d2',31,''),
(314,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8/4/9/9','47446bbf93f96846589c676637931775',309,'9',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea69d0',31,''),
(315,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e/4/a','8e71791155c2fe55367603a873647597',310,'a',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea7105',31,''),
(316,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5/9/b/3/261','800e13c24c94f00f2ef341fbe4aae3df',313,'261',2,1,0,1689976094,1689976094,0,0,'64bafd1ea658c',31,''),
(317,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8/4/9/9/256','b874f8c84871d6c7276cc9675d25140a',314,'256',2,1,0,1689976094,1689976094,0,0,'64bafd1ea66cb',31,''),
(318,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e/4/a/1','6f0fc49d8fd91bded4dbe397825d84bd',315,'1',2,1,-1,1689976094,1689976094,0,0,'64bafd1ea6b41',31,''),
(319,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e/4/a/1/258','008f1de0a6e8cd975e432be20d251959',318,'258',2,1,0,1689976094,1689976094,0,0,'64bafd1ea681c',31,''),
(320,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8/4/9/9/256/500-500-max.png','a01879aa8a4c9c0bb6d5175a2778b36f',317,'500-500-max.png',14,13,50545,1689976094,1689976094,0,0,'1692abdcadffb5a413cf4787b2b9f1ff',27,''),
(321,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6/0/e/5/262/1600-1067-max.jpg','9114d3f6ecd28c1691a9de3574a90f1b',312,'1600-1067-max.jpg',15,13,147631,1689976094,1689976094,0,0,'da0e131ad5af563a9a5cee0a633bc605',27,''),
(322,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2/3/6/7/260/1200-1800-max.jpg','b87e12ad2cf645c9d73f72c9a83ed9ea',303,'1200-1800-max.jpg',15,13,207095,1689976094,1689976094,0,0,'a1b128a5e179118dccde62889f58c765',27,''),
(323,2,'appdata_ocvxa5c1ugz1/preview/f/7/1/8/4/9/9/256/256-256-crop.png','80042488bd27a404f46438561b6395f8',317,'256-256-crop.png',14,13,24388,1689976094,1689976094,0,0,'8a7928fad251a136a5f6dde2b53b5aa2',27,''),
(324,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5/9/b/3/261/1600-1067-max.jpg','28b81ce2cda25d9cc3ec827800d02dbb',316,'1600-1067-max.jpg',15,13,165982,1689976094,1689976094,0,0,'719d24219675cf7e687c72b2ac9fa059',27,''),
(325,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0/8/6/0/259/1600-1067-max.jpg','2ef7b5ca16f8e23282644dc427d6c535',311,'1600-1067-max.jpg',15,13,232378,1689976094,1689976094,0,0,'9b7091af3888afcd7b4d1f492e8a2372',27,''),
(326,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e/4/a/1/258/1920-1281-max.jpg','c56b46910247f5013071ae0b8d42685e',319,'1920-1281-max.jpg',15,13,294390,1689976094,1689976094,0,0,'bc3bbf6f5dac542f3f3a6123458ec6be',27,''),
(327,2,'appdata_ocvxa5c1ugz1/preview/3/6/6/6/0/e/5/262/256-256-crop.jpg','527844efcd990e226011f402254f7f4a',312,'256-256-crop.jpg',15,13,8563,1689976094,1689976094,0,0,'edbd5a1ed8d6d946a626d09b3dcf655f',27,''),
(328,2,'appdata_ocvxa5c1ugz1/theming/global/0/icon-core-#0082c9filetypes_image.svg','cf258a2a505a6fd96e13d1585c81f369',163,'icon-core-#0082c9filetypes_image.svg',21,13,352,1689976094,1689976094,0,0,'6cd040dc88eb0438f34efc8a0dd1883d',27,''),
(329,2,'appdata_ocvxa5c1ugz1/preview/b/1/a/5/9/b/3/261/256-256-crop.jpg','de8859395b482805a0d909c87b5d9a90',316,'256-256-crop.jpg',15,13,13183,1689976094,1689976094,0,0,'ddfbf554ca4fe5645889d8ba6285599b',27,''),
(330,2,'appdata_ocvxa5c1ugz1/preview/8','811f815dcd40a509acf445cdc0352fde',170,'8',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed44b7',31,''),
(331,2,'appdata_ocvxa5c1ugz1/preview/8/c','c0babf2ad528a6d86a1baa1d0b9c0815',330,'c',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed423f',31,''),
(332,2,'appdata_ocvxa5c1ugz1/preview/8/c/1','004a49fec284c240f024d23f39533135',331,'1',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed3f92',31,''),
(333,2,'appdata_ocvxa5c1ugz1/preview/a/4/f/2/3/6/7/260/256-256-crop.jpg','8aa0d90de627d1753188e1f3bc2f684e',303,'256-256-crop.jpg',15,13,8544,1689976094,1689976094,0,0,'0eaa0195ad97c318c56528018b4f1a4a',27,''),
(334,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9','cf33881e589e1f51eb69ca504cba5b55',332,'9',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed3c41',31,''),
(335,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9/f','6fbfbf760051512678e2256c4e15f88e',334,'f',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed397b',31,''),
(336,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9/f/5','9382b47d8a41edf5c9991e299cd38b75',335,'5',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed3707',31,''),
(337,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9/f/5/7','25df669334dd4936c307cc761c453f3e',336,'7',2,1,-1,1689976094,1689976094,0,0,'64bafd1ed345c',31,''),
(338,2,'appdata_ocvxa5c1ugz1/preview/c/f/a/0/8/6/0/259/256-256-crop.jpg','faffa5dadbdf3faaf0ab7f1a189560a4',311,'256-256-crop.jpg',15,13,13880,1689976094,1689976094,0,0,'811ce5767b05905d3887566011c22c7a',27,''),
(339,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9/f/5/7/263','eaece5f03a219684494b94d727f848a6',337,'263',2,1,0,1689976094,1689976094,0,0,'64bafd1ed2fb2',31,''),
(340,2,'appdata_ocvxa5c1ugz1/preview/5/0/2/e/4/a/1/258/256-256-crop.jpg','6787c8616b821590aea2962cc161afd5',319,'256-256-crop.jpg',15,13,15761,1689976094,1689976094,0,0,'c8d4f90839b53c13ce3ad0bce15c8fe2',27,''),
(341,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9/f/5/7/263/1600-1067-max.jpg','adbb227fcb51ce23204a56bf41b7012b',339,'1600-1067-max.jpg',15,13,137923,1689976094,1689976094,0,0,'3e05777859b9d92fe7369624276260aa',27,''),
(342,2,'appdata_ocvxa5c1ugz1/preview/8/c/1/9/f/5/7/263/256-256-crop.jpg','f5a61f440578d32f62f9544bfb042294',339,'256-256-crop.jpg',15,13,13785,1689976094,1689976094,0,0,'ccc1e6e08f0f4a9e62fc7feba8bcb110',27,''),
(343,2,'appdata_ocvxa5c1ugz1/preview/7','a2886e14ae2ba9b1b2129f31e15ed58b',170,'7',2,1,-1,1689976198,1689976198,0,0,'64bafd861c872',31,''),
(344,2,'appdata_ocvxa5c1ugz1/preview/6','f0f0e49c98639498e1c88b25b030a405',170,'6',2,1,-1,1689976198,1689976198,0,0,'64bafd861c980',31,''),
(345,2,'appdata_ocvxa5c1ugz1/preview/7/0','a130a12a39e0667d691821e936975c02',343,'0',2,1,-1,1689976198,1689976198,0,0,'64bafd861c52e',31,''),
(346,2,'appdata_ocvxa5c1ugz1/preview/6/f','357d2e59bb17131cd77aaf2c73e0511e',344,'f',2,1,-1,1689976198,1689976198,0,0,'64bafd861c640',31,''),
(347,2,'appdata_ocvxa5c1ugz1/preview/6/f/4','41f7f831d92f6f81cc7776509ad5b1d1',346,'4',2,1,-1,1689976198,1689976198,0,0,'64bafd861c342',31,''),
(348,2,'appdata_ocvxa5c1ugz1/preview/7/0/e','bd91c5698d00b247ccbc7361f68712f0',345,'e',2,1,-1,1689976198,1689976198,0,0,'64bafd861c1a3',31,''),
(349,2,'appdata_ocvxa5c1ugz1/preview/6/f/4/9','dc18a1037036fea95a16f0fc15a518ba',347,'9',2,1,-1,1689976198,1689976198,0,0,'64bafd861bff8',31,''),
(350,2,'appdata_ocvxa5c1ugz1/preview/7/0/e/f','572bc0552a86337fa7d43c9c1e09ae32',348,'f',2,1,-1,1689976198,1689976198,0,0,'64bafd861beb7',31,''),
(351,2,'appdata_ocvxa5c1ugz1/preview/6/f/4/9/2','ce36e523dff2f1ad9d0fd894de6b6cd0',349,'2',2,1,-1,1689976198,1689976198,0,0,'64bafd861bb9c',31,''),
(352,2,'appdata_ocvxa5c1ugz1/preview/7/0/e/f/d','d95876b1f2cbc94a5660dd2af8f5dd49',350,'d',2,1,-1,1689976198,1689976198,0,0,'64bafd861ba76',31,''),
(353,2,'appdata_ocvxa5c1ugz1/preview/6/f/4/9/2/2','5ab50efa1cf50fa47481d28e49b1342c',351,'2',2,1,-1,1689976198,1689976198,0,0,'64bafd861b8e5',31,''),
(354,2,'appdata_ocvxa5c1ugz1/preview/7/0/e/f/d/f','8e8a21b3042c8b6ae795d4eb4062e08e',352,'f',2,1,-1,1689976198,1689976198,0,0,'64bafd861b7b9',31,''),
(355,2,'appdata_ocvxa5c1ugz1/preview/6/f/4/9/2/2/f','d3c9766ec8191fbc1c8362b86274a033',353,'f',2,1,-1,1689976198,1689976198,0,0,'64bafd861b644',31,''),
(356,2,'appdata_ocvxa5c1ugz1/preview/7/0/e/f/d/f/2','94ee3898ce6ca692b17b4c4973abad29',354,'2',2,1,-1,1689976198,1689976198,0,0,'64bafd861b52e',31,''),
(357,2,'appdata_ocvxa5c1ugz1/preview/6/f/4/9/2/2/f/18','458d330329aaa73ed00e3e1f04866ecb',355,'18',2,1,0,1689976198,1689976198,0,0,'64bafd861b2fe',31,''),
(358,2,'appdata_ocvxa5c1ugz1/preview/7/0/e/f/d/f/2/17','dfb2e88f54fe0435fecc0cd87f3de562',356,'17',2,1,0,1689976198,1689976198,0,0,'64bafd861b20b',31,''),
(359,2,'appdata_ocvxa5c1ugz1/js/files','c04e89e2e483cb676a9c3e042531ff3b',155,'files',2,1,0,1689976250,1689976250,0,0,'64bafdba576fb',31,''),
(360,2,'appdata_ocvxa5c1ugz1/js/files/merged-index.js','ac2575d1a321e451201c4b7f6d6eb53c',359,'merged-index.js',18,5,415795,1689976250,1689976250,0,0,'8221f8f9dc983510f7db8d93cd4f6bf2',27,''),
(361,2,'appdata_ocvxa5c1ugz1/js/files/merged-index.js.deps','a219aba267c86f21218c4438a676539e',359,'merged-index.js.deps',8,5,1962,1689976250,1689976250,0,0,'fb92b3a3d1ce22ec38c921bf361f5ce5',27,''),
(362,2,'appdata_ocvxa5c1ugz1/js/files/merged-index.js.gzip','36da8e69ed782722958cdc0f1fb439fe',359,'merged-index.js.gzip',19,5,94347,1689976250,1689976250,0,0,'459739960124615bd3bf0b4c6351ce8b',27,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `timestamp` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(4) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_versions`
--

DROP TABLE IF EXISTS `oc_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `mimetype` bigint(20) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_versions_uniq_index` (`file_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES
(1,7,1689973669,3963036,4,'[]'),
(2,9,1689973669,13653,6,'[]'),
(3,10,1689973670,13441,7,'[]'),
(4,11,1689973670,38605,8,'[]'),
(5,12,1689973670,326,10,'[]'),
(6,13,1689973670,15961,11,'[]'),
(7,14,1689973670,573,10,'[]'),
(8,15,1689973670,16988,6,'[]'),
(9,16,1689973670,14810,12,'[]'),
(10,17,1689973670,13878,6,'[]'),
(11,18,1689973670,14316,12,'[]'),
(12,19,1689973670,11836,6,'[]'),
(13,20,1689973670,13378,7,'[]'),
(14,21,1689973670,52674,8,'[]'),
(15,22,1689973670,17276,11,'[]'),
(16,23,1689973670,554,10,'[]'),
(17,24,1689973670,50598,14,'[]'),
(18,26,1689973670,427030,15,'[]'),
(19,27,1689973670,474653,15,'[]'),
(20,28,1689973670,567689,15,'[]'),
(21,29,1689973670,593508,15,'[]'),
(22,30,1689973670,457744,15,'[]'),
(23,31,1689973670,167989,15,'[]'),
(24,32,1689973670,797325,15,'[]'),
(25,33,1689973670,2170375,15,'[]'),
(26,34,1689973670,150,10,'[]'),
(27,35,1689973670,976625,16,'[]'),
(28,36,1689973670,15004539,16,'[]'),
(29,38,1689973670,1095,10,'[]'),
(30,39,1689973670,136,10,'[]'),
(31,40,1689973670,1083339,16,'[]'),
(32,41,1689973670,24295,17,'[]'),
(33,42,1689973670,206,10,'[]'),
(34,119,1689975927,3963036,4,'[]'),
(35,121,1689975927,13653,6,'[]'),
(36,122,1689975927,13441,7,'[]'),
(37,123,1689975927,38605,8,'[]'),
(38,124,1689975927,326,10,'[]'),
(39,125,1689975927,15961,11,'[]'),
(40,126,1689975927,573,10,'[]'),
(41,127,1689975927,16988,6,'[]'),
(42,128,1689975927,14810,12,'[]'),
(43,129,1689975927,13878,6,'[]'),
(44,130,1689975927,14316,12,'[]'),
(45,131,1689975927,11836,6,'[]'),
(46,132,1689975927,13378,7,'[]'),
(47,133,1689975927,52674,8,'[]'),
(48,134,1689975927,17276,11,'[]'),
(49,135,1689975927,554,10,'[]'),
(50,136,1689975927,50598,14,'[]'),
(51,138,1689975927,427030,15,'[]'),
(52,139,1689975927,474653,15,'[]'),
(53,140,1689975927,567689,15,'[]'),
(54,141,1689975927,593508,15,'[]'),
(55,142,1689975927,457744,15,'[]'),
(56,143,1689975927,167989,15,'[]'),
(57,144,1689975927,797325,15,'[]'),
(58,145,1689975927,2170375,15,'[]'),
(59,146,1689975927,150,10,'[]'),
(60,147,1689975927,976625,16,'[]'),
(61,148,1689975927,15004539,16,'[]'),
(62,150,1689975927,1095,10,'[]'),
(63,151,1689975927,136,10,'[]'),
(64,152,1689975927,1083339,16,'[]'),
(65,153,1689975927,24295,17,'[]'),
(66,154,1689975927,206,10,'[]'),
(67,239,1689976092,3963036,4,'[]'),
(68,241,1689976092,13653,6,'[]'),
(69,242,1689976092,13441,7,'[]'),
(70,243,1689976092,38605,8,'[]'),
(71,244,1689976092,326,10,'[]'),
(72,245,1689976092,15961,11,'[]'),
(73,246,1689976092,573,10,'[]'),
(74,247,1689976092,16988,6,'[]'),
(75,248,1689976092,14810,12,'[]'),
(76,249,1689976092,13878,6,'[]'),
(77,250,1689976092,14316,12,'[]'),
(78,251,1689976092,11836,6,'[]'),
(79,252,1689976092,13378,7,'[]'),
(80,253,1689976092,52674,8,'[]'),
(81,254,1689976092,17276,11,'[]'),
(82,255,1689976092,554,10,'[]'),
(83,256,1689976092,50598,14,'[]'),
(84,258,1689976092,427030,15,'[]'),
(85,259,1689976092,474653,15,'[]'),
(86,260,1689976092,567689,15,'[]'),
(87,261,1689976092,593508,15,'[]'),
(88,262,1689976092,457744,15,'[]'),
(89,263,1689976092,167989,15,'[]'),
(90,264,1689976092,797325,15,'[]'),
(91,265,1689976092,2170375,15,'[]'),
(92,266,1689976092,150,10,'[]'),
(93,267,1689976092,976625,16,'[]'),
(94,268,1689976092,15004539,16,'[]'),
(95,270,1689976092,1095,10,'[]'),
(96,271,1689976092,136,10,'[]'),
(97,272,1689976092,1083339,16,'[]'),
(98,273,1689976092,24295,17,'[]'),
(99,274,1689976092,206,10,'[]');
/*!40000 ALTER TABLE `oc_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `operator` varchar(16) NOT NULL DEFAULT '',
  `value` longtext DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) DEFAULT '',
  `checks` longtext DEFAULT NULL,
  `operation` longtext DEFAULT NULL,
  `entity` varchar(256) NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_global_scale_users`
--

DROP TABLE IF EXISTS `oc_global_scale_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_global_scale_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `displayname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `gss_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_global_scale_users`
--

LOCK TABLES `oc_global_scale_users` WRITE;
/*!40000 ALTER TABLE `oc_global_scale_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_global_scale_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES
('admin','admin');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES
('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL DEFAULT '',
  `argument` varchar(4000) NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  `argument_hash` varchar(32) DEFAULT NULL,
  `time_sensitive` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`),
  KEY `job_lastcheck_reserved` (`last_checked`,`reserved_at`),
  KEY `job_argument_hash` (`class`,`argument_hash`),
  KEY `jobs_time_sensitive` (`time_sensitive`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES
(1,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1689973681,1689973681,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(2,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',1689973689,1689973689,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(3,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',1689973785,1689973785,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(4,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',1689975934,1689975934,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(5,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',1689975940,1689975940,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(6,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',1689975947,1689975947,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(7,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',1689975969,1689975969,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(8,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',1689975982,1689975982,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(9,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',1689975990,1689975990,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(10,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',1689975993,1689975993,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(11,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1689976082,1689976082,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(12,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',1689976094,1689976094,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(13,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',1689976108,1689976108,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(14,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',1689976164,1689976164,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(15,'OCA\\Activity\\BackgroundJob\\DigestMail','null',1689976177,1689976177,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(16,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',1689976190,1689976190,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(17,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',1689976197,1689976197,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(18,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',1689976204,1689976204,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(19,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',1689976234,1689976234,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(20,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',1689976271,1689976271,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(21,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',1689976277,1689976277,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(22,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',1689976292,1689976292,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(23,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',1689976300,1689976300,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(24,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',1689976312,1689976312,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(25,'OCA\\Federation\\SyncJob','null',1689976384,1689976384,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(26,'OCA\\Circles\\Cron\\Maintenance','null',0,1689973668,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(27,'OCA\\Text\\Cron\\Cleanup','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(28,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(29,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(30,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(31,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(32,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(33,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1689975926,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(34,'OC\\Log\\Rotate','null',0,1689975926,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(35,'OC\\Preview\\BackgroundCleanupJob','null',0,1689975926,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(36,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[24]',0,1689973670,0,0,'99aa1d832e305a88104d7843ebe22c6b',1),
(37,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[26]',0,1689973670,0,0,'bd3b31fe7703d38d1de17e15e60a3fa0',1),
(38,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[27]',0,1689973670,0,0,'58fada4e93b9598d69062c39f488b9cc',1),
(39,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[28]',0,1689973670,0,0,'f39cd082a2cc6b3cea21cc70942d8a4e',1),
(40,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[29]',0,1689973670,0,0,'2d7a5fe4ae1457dcd4f00cd5e9494ede',1),
(41,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[30]',0,1689973670,0,0,'0b4e4af1e96181c3a3aa3401ed4b1996',1),
(42,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[31]',0,1689973670,0,0,'c379e3500d43aba727fe11c198f0ec6f',1),
(43,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[32]',0,1689973670,0,0,'191034da65d057b87a6a773781fb22a8',1),
(44,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[33]',0,1689973670,0,0,'1dc72169358ccb5ee7667fdab19a0d80',1),
(45,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin\"}',0,1689973688,0,0,'b974bbc90ef800c3b1539ac4f2aeddb7',1),
(46,'OCA\\GlobalSiteSelector\\BackgroundJobs\\UpdateLookupServer','null',0,1689973794,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(47,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[136]',0,1689975927,0,0,'a8def98c708bc7cdb504ea0eee1d7449',1),
(48,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[138]',0,1689975927,0,0,'dc044b236ace8c8376ab72801b5e13a9',1),
(49,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[139]',0,1689975927,0,0,'a6de6c519c60443e4a6bf26e4c1b8c0a',1),
(50,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[140]',0,1689975927,0,0,'ab601d915ec29623e7bc8dcd9ea35d09',1),
(51,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[141]',0,1689975927,0,0,'b0c8088620b07ae8f7c5ef802ab6301f',1),
(52,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[142]',0,1689975927,0,0,'5324d11bdcd305b496dbee595c50fe2e',1),
(53,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[143]',0,1689975927,0,0,'2be1dbc56ddf6567bdbe573896b842aa',1),
(54,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[144]',0,1689975927,0,0,'163ff677048f58944be0566cf5efe967',1),
(55,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[145]',0,1689975927,0,0,'61494d7df08604c325a4220b975c8ac2',1),
(56,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin2\"}',0,1689975939,0,0,'082bcb047d11622d3a71caac212e2435',1),
(57,'OCA\\Settings\\BackgroundJobs\\VerifyUserData','{\"verificationCode\":\"\",\"data\":\"\",\"type\":\"email\",\"uid\":\"user\",\"try\":0,\"lastRun\":1689976074}',0,1689976074,0,0,'e088f85ed326eb76a599aa0ae92240af',1),
(58,'OCA\\LookupServerConnector\\BackgroundJobs\\RetryJob','{\"userId\":\"user\"}',0,1689976074,0,0,'797b8785c0d77ac407dd10ca2461d9e3',1),
(59,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[256]',0,1689976092,0,0,'b134b498f0d07d794e5900e879e42c89',1),
(60,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[258]',0,1689976092,0,0,'dc97fdeba31b1b1758335e5bfe5f660a',1),
(61,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[259]',0,1689976092,0,0,'516b238d9dfc05fd6e0bcc2b83bc92c0',1),
(62,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[260]',0,1689976092,0,0,'a51d75dc5a495bd11674a95a68993e46',1),
(63,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[261]',0,1689976092,0,0,'f81838bd489516b9270b4c98f08d5e00',1),
(64,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[262]',0,1689976092,0,0,'521ad625081cb16a922357e77388952b',1),
(65,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[263]',0,1689976092,0,0,'4404548e28534af39cca175ecaaef17f',1),
(66,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[264]',0,1689976092,0,0,'6e093f6ec5a98f43d3e0738de84fbf7f',1),
(67,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[265]',0,1689976092,0,0,'bbb51029c2d1853a85d279a1f85432ec',1),
(68,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"user\"}',0,1689976093,0,0,'f5fc75cc9ac39e4bbb52155f37c24a15',1);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) NOT NULL,
  `known_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `app_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES
('activity','2006Date20170808154933'),
('activity','2006Date20170808155040'),
('activity','2006Date20170919095939'),
('activity','2007Date20181107114613'),
('activity','2008Date20181011095117'),
('activity','2010Date20190416112817'),
('activity','2011Date20201006132544'),
('activity','2011Date20201006132545'),
('activity','2011Date20201006132546'),
('activity','2011Date20201006132547'),
('activity','2011Date20201207091915'),
('circles','0022Date20220526111723'),
('circles','0022Date20220526113601'),
('circles','0022Date20220703115023'),
('circles','0023Date20211216113101'),
('circles','0024Date20220203123901'),
('circles','0024Date20220203123902'),
('circles','0024Date20220317190331'),
('contactsinteraction','010000Date20200304152605'),
('core','13000Date20170705121758'),
('core','13000Date20170718121200'),
('core','13000Date20170814074715'),
('core','13000Date20170919121250'),
('core','13000Date20170926101637'),
('core','14000Date20180129121024'),
('core','14000Date20180404140050'),
('core','14000Date20180516101403'),
('core','14000Date20180518120534'),
('core','14000Date20180522074438'),
('core','14000Date20180626223656'),
('core','14000Date20180710092004'),
('core','14000Date20180712153140'),
('core','15000Date20180926101451'),
('core','15000Date20181015062942'),
('core','15000Date20181029084625'),
('core','16000Date20190207141427'),
('core','16000Date20190212081545'),
('core','16000Date20190427105638'),
('core','16000Date20190428150708'),
('core','17000Date20190514105811'),
('core','18000Date20190920085628'),
('core','18000Date20191014105105'),
('core','18000Date20191204114856'),
('core','19000Date20200211083441'),
('core','20000Date20201109081915'),
('core','20000Date20201109081918'),
('core','20000Date20201109081919'),
('core','20000Date20201111081915'),
('core','21000Date20201120141228'),
('core','21000Date20201202095923'),
('core','21000Date20210119195004'),
('core','21000Date20210309185126'),
('core','21000Date20210309185127'),
('core','22000Date20210216080825'),
('core','23000Date20210721100600'),
('core','23000Date20210906132259'),
('core','23000Date20210930122352'),
('core','23000Date20211203110726'),
('core','23000Date20211213203940'),
('core','24000Date20211210141942'),
('core','24000Date20211213081506'),
('core','24000Date20211213081604'),
('core','24000Date20211222112246'),
('core','24000Date20211230140012'),
('core','24000Date20220131153041'),
('core','24000Date20220202150027'),
('core','24000Date20220404230027'),
('core','24000Date20220425072957'),
('core','25000Date20220515204012'),
('core','25000Date20220602190540'),
('core','25000Date20220905140840'),
('core','25000Date20221007010957'),
('core','27000Date20220613163520'),
('core','27000Date20230309104325'),
('core','27000Date20230309104802'),
('dav','1004Date20170825134824'),
('dav','1004Date20170919104507'),
('dav','1004Date20170924124212'),
('dav','1004Date20170926103422'),
('dav','1005Date20180413093149'),
('dav','1005Date20180530124431'),
('dav','1006Date20180619154313'),
('dav','1006Date20180628111625'),
('dav','1008Date20181030113700'),
('dav','1008Date20181105104826'),
('dav','1008Date20181105104833'),
('dav','1008Date20181105110300'),
('dav','1008Date20181105112049'),
('dav','1008Date20181114084440'),
('dav','1011Date20190725113607'),
('dav','1011Date20190806104428'),
('dav','1012Date20190808122342'),
('dav','1016Date20201109085907'),
('dav','1017Date20210216083742'),
('dav','1018Date20210312100735'),
('dav','1024Date20211221144219'),
('federatedfilesharing','1010Date20200630191755'),
('federatedfilesharing','1011Date20201120125158'),
('federation','1010Date20200630191302'),
('files','11301Date20191205150729'),
('files','12101Date20221011153334'),
('files_sharing','11300Date20201120141438'),
('files_sharing','21000Date20201223143245'),
('files_sharing','22000Date20210216084241'),
('files_sharing','24000Date20220208195521'),
('files_sharing','24000Date20220404142216'),
('files_trashbin','1010Date20200630192639'),
('files_versions','1020Date20221114144058'),
('globalsiteselector','0110Date20180925143400'),
('notifications','2004Date20190107135757'),
('notifications','2010Date20210218082811'),
('notifications','2010Date20210218082855'),
('notifications','2011Date20210930134607'),
('notifications','2011Date20220826074907'),
('oauth2','010401Date20181207190718'),
('oauth2','010402Date20190107124745'),
('photos','20000Date20220727125801'),
('photos','20001Date20220830131446'),
('photos','20003Date20221102170153'),
('photos','20003Date20221103094628'),
('privacy','100Date20190217131943'),
('text','010000Date20190617184535'),
('text','030001Date20200402075029'),
('text','030201Date20201116110353'),
('text','030201Date20201116123153'),
('text','030501Date20220202101853'),
('text','030701Date20230207131313'),
('twofactor_backupcodes','1002Date20170607104347'),
('twofactor_backupcodes','1002Date20170607113030'),
('twofactor_backupcodes','1002Date20170919123342'),
('twofactor_backupcodes','1002Date20170926101419'),
('twofactor_backupcodes','1002Date20180821043638'),
('user_saml','3001Date20200630193443'),
('user_saml','5000Date20211025124248'),
('user_status','0001Date20200602134824'),
('user_status','0002Date20200902144824'),
('user_status','1000Date20201111130204'),
('user_status','2301Date20210809144824'),
('workflowengine','2000Date20190808074233'),
('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES
(5,'application'),
(19,'application/gzip'),
(18,'application/javascript'),
(20,'application/json'),
(8,'application/octet-stream'),
(16,'application/pdf'),
(6,'application/vnd.oasis.opendocument.graphics'),
(12,'application/vnd.oasis.opendocument.presentation'),
(7,'application/vnd.oasis.opendocument.spreadsheet'),
(11,'application/vnd.oasis.opendocument.text'),
(17,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),
(1,'httpd'),
(2,'httpd/unix-directory'),
(13,'image'),
(15,'image/jpeg'),
(14,'image/png'),
(21,'image/svg+xml'),
(9,'text'),
(10,'text/markdown'),
(3,'video'),
(4,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mount_point` varchar(4000) NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  `mount_provider_class` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`),
  KEY `mounts_user_root_path_index` (`user_id`,`root_id`,`mount_point`(128)),
  KEY `mounts_class_index` (`mount_provider_class`),
  KEY `mount_user_storage` (`storage_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES
(1,1,1,'admin','/admin/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) NOT NULL,
  `object_id` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `subject_parameters` longtext DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `icon` varchar(4000) DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES
(1,'firstrunwizard','admin',1689973685,'app','recognize','apphint-recognize','[]','','[]','','','[]'),
(2,'firstrunwizard','admin',1689973685,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),
(3,'firstrunwizard','admin',1689973685,'app','forms','apphint-forms','[]','','[]','','','[]'),
(4,'firstrunwizard','admin',1689973685,'app','deck','apphint-deck','[]','','[]','','','[]'),
(5,'firstrunwizard','admin',1689973685,'app','tasks','apphint-tasks','[]','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) NOT NULL,
  `devicepublickey` varchar(512) NOT NULL,
  `devicepublickeyhash` varchar(128) NOT NULL,
  `pushtokenhash` varchar(128) NOT NULL,
  `proxyserver` varchar(256) NOT NULL,
  `apptype` varchar(32) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_settings`
--

DROP TABLE IF EXISTS `oc_notifications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `batch_time` int(11) NOT NULL DEFAULT 0,
  `last_send_id` bigint(20) NOT NULL DEFAULT 0,
  `next_send_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notset_user` (`user_id`),
  KEY `notset_nextsend` (`next_send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES
(1,'admin',0,0,0),
(2,'admin2',0,0,0),
(3,'user',0,0,0);
/*!40000 ALTER TABLE `oc_notifications_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) NOT NULL,
  `encrypted_token` varchar(786) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `client_identifier` varchar(64) NOT NULL,
  `secret` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_open_local_editor`
--

DROP TABLE IF EXISTS `oc_open_local_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_open_local_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openlocal_user_path_token` (`user_id`,`path_hash`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_open_local_editor`
--

LOCK TABLES `oc_open_local_editor` WRITE;
/*!40000 ALTER TABLE `oc_open_local_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_open_local_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums`
--

DROP TABLE IF EXISTS `oc_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `last_added_photo` bigint(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `pa_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums`
--

LOCK TABLES `oc_photos_albums` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_collabs`
--

DROP TABLE IF EXISTS `oc_photos_albums_collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_collabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `collaborator_id` varchar(64) NOT NULL,
  `collaborator_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_collabs_uniq_collab` (`album_id`,`collaborator_id`,`collaborator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_collabs`
--

LOCK TABLES `oc_photos_albums_collabs` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_files`
--

DROP TABLE IF EXISTS `oc_photos_albums_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_files` (
  `album_file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `added` bigint(20) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_file_id`),
  UNIQUE KEY `paf_album_file` (`album_id`,`file_id`),
  KEY `paf_folder` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_files`
--

LOCK TABLES `oc_photos_albums_files` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) NOT NULL DEFAULT '',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`),
  KEY `preferences_app_key` (`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES
('admin','activity','configured','yes'),
('admin','avatar','generated','true'),
('admin','core','lang','en'),
('admin','core','templateDirectory','Templates/'),
('admin','core','timezone','Europe/Stockholm'),
('admin','dashboard','firstRun','0'),
('admin','firstrunwizard','apphint','18'),
('admin','firstrunwizard','show','0'),
('admin','login','lastLogin','1689976196'),
('admin','login_token','v0waug+JNLT1S6XJY4yyBdErIXIUfxQm','1689976196'),
('admin','notifications','sound_notification','no'),
('admin','notifications','sound_talk','no'),
('admin','password_policy','failedLoginAttempts','0');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_profile_config`
--

DROP TABLE IF EXISTS `oc_profile_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_profile_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_config_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_profile_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL,
  `valuetype` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`),
  KEY `properties_path_index` (`userid`,`propertypath`),
  KEY `properties_pathonly_index` (`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(128) NOT NULL,
  `delete_after` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reactions`
--

DROP TABLE IF EXISTS `oc_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `reaction` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_reaction_unique` (`parent_id`,`actor_type`,`actor_id`,`reaction`),
  KEY `comment_reaction` (`reaction`),
  KEY `comment_reaction_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reactions`
--

LOCK TABLES `oc_reactions` WRITE;
/*!40000 ALTER TABLE `oc_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) NOT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `federated_cloud_id` varchar(255) DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_source` varchar(255) DEFAULT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `password_expiration_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  `share_token` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `mountpoint` varchar(4000) NOT NULL,
  `mountpoint_hash` varchar(32) NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES
(1,'home::admin',1,NULL),
(2,'local::/var/www/html/data/',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) NOT NULL,
  `credentials` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) NOT NULL DEFAULT '',
  `objecttype` varchar(64) NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) DEFAULT '',
  `base_version_etag` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `guest_name` varchar(64) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  `last_awareness_message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_lastcontact` (`last_contact`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `url_hash` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(128) DEFAULT NULL,
  `shared_secret` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES
('backup_codes','admin',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_saml_auth_token`
--

DROP TABLE IF EXISTS `oc_user_saml_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_saml_auth_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `name` longtext NOT NULL,
  `token` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_saml_auth_token`
--

LOCK TABLES `oc_user_saml_auth_token` WRITE;
/*!40000 ALTER TABLE `oc_user_saml_auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_saml_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_saml_configurations`
--

DROP TABLE IF EXISTS `oc_user_saml_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_saml_configurations` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT '',
  `configuration` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_saml_configurations`
--

LOCK TABLES `oc_user_saml_configurations` WRITE;
/*!40000 ALTER TABLE `oc_user_saml_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_saml_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_saml_users`
--

DROP TABLE IF EXISTS `oc_user_saml_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_saml_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT '',
  `home` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_saml_users`
--

LOCK TABLES `oc_user_saml_users` WRITE;
/*!40000 ALTER TABLE `oc_user_saml_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_saml_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `custom_message` longtext DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  `is_backup` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES
(1,'admin','online',1689975990,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) NOT NULL,
  `target_user` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid_lower` varchar(64) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES
('admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$dGMzZjBCVGdQR3Jwc3JKZQ$CHDPoUKe6MKrpVbinHfByGjiDd2bxWZnqzmgS0t7bsA','admin');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `public_key_credential_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '11',
  `etag` varchar(64) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-21 21:53:31