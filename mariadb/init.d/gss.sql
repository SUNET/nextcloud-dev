-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gss
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB-1:11.0.2+maria~ubu2204

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
(71,1689973670,30,'contacts','admin','admin','dav','addressbook_add_self','{\"actor\":\"admin\",\"addressbook\":{\"id\":1,\"uri\":\"contacts\",\"name\":\"Contacts\"}}','','[]','','','addressbook',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES
(1,'principals/users/admin','Contacts','contacts',NULL,1);
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
('backgroundjob','lastjob','3'),
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
('core','installedat','1689973663.8306'),
('core','lastcron','1689973785'),
('core','lastupdatedat','1689973663.8325');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES
(1,'admin','admin','P1a/hoYm8oOx7fAVwxT/CApDWT1IX0NqzhMGuXF/cMENQYPgHXmOqYC0V6yBQr27yNW7K97iJ0NBwjNnKZEo77H1jMDxdbSHK1dIeTDV7Bke7i67H35Fb0vlmQS4Y57xqrin+Njz60OfGiVRCCdJLVSzAU31w8vV6Z8p0CYFehnOPZN8VCdgWplaJgh89dvcdhbCZDTN1VHwIMPFAJUoO7I91EOHfC54asJMDSBeKa7nWvxPHDG+1batMwK/vehF84xQJM8LJir5R4LyVGQucUa5U4RyYFESqE2ANwBBGODo2k7lrEBACKSG0Tx3vm6vVP14pH7SjPBXX477bZnRlA==','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0','b1be43d23bb328b2ba421b46b8152ba11bad74ce44f93da1a4b48de4f8b8cfeb47bc5d55d08d9529f2c60b45320b60228c6925f7fca21fae6fa698cb6e22c94f',0,0,1689973815,1689973670,NULL,NULL,'7be3846699a21d12076df83d4ca303ced65d66530cbf574d672e606b54439731fb77f36efa87aa1a1fd3dc5e2d3199e263ebf48d2d1381cdc49f2869adc4f5bc311366adf19c61f7cc47a5aad986821a2dc52e54f7035a001a36291b8120019666597d5317106c6df855e91f934edc0d139941fb20f1a3917a5c6e9972899e66f0519beedb15a2ad10e9947d101c696a6bf413bae0c45d414c9b1fa190ff595e5a8ed9e96e49ace470bdccbfa9d9965613f1a9b530c2832d955f64643c70b28d6fcc1132f5b5d194a60495ffbe7e53b052d25b25d4c07c4fec4155c2098eda8a21a0369ff9c5d64279f92d74e8f2d40fd720d6ad7adc49f135a45bc4131d539d637948572cf3ac80aa6cd9f8bb6163c1e9283ab5047ab993ee1b3bc731edab90c3845718ef6a448cc508f2991af21094e497c74129b9608fb0f722aac7c18dfcf9842e50ee73f7d7a95b49f917a675f2d3b19b778d2c789473719a0a954f6b0958e5921121ba65278a2fe30bf1cc80fad46272007b1042b1395fab1986206ffc50d831d691606729b19e64b91581d65bfc4ee1e2996ade2710020a0ec16192405992a2c85b3d4b0e4e28709379ce3bf6d2e097adf71322151deeabb0c02e53070fab106e83d80434d0a38f1fcc9c0826a9af22d9c78e0c7ed9db76833e738297030c2da8167cb2a78700e016714758ce64b67442c6f4c2d3d0a08781252c4f1bd98289fd9348d31c5dc4a36b4406266b85040f93e2aeaf50d35edeea8b4b473aa6ff02311dd85e20d02132556baed99f0af88e5d38c8569f3edee1847f38030abcb1352c148b5deb6fc456af537edd89000a6125c785e46ee8e644a31865689e486d0c118205e9bffc6863e31b356447f3fadc9d5422847d4ad5e3dc55426c62359c60bfdc1e395c601596b47317a986651eeb485c06d4b7298ef21c27193a6079375e365006322f4c21262e1708f8552067b9981861c6a627d9e4a4f37c43836ca98e66a41fc2d94eebc77b421a96a49a31d7ca8cb3f6ccfdd25acbdcb1a97f01d828d88949b882de089b7dd41ea721d10db28345dfde86b4316266f38b987e739cbac085257399378694b5892378355c2b0ceb4c0bf129a55d54afdc17ad3025b9bc887d7decb10011e2e2334f2df0569ff0dab0da36370e5b100b3f312e7e070179039131c8b5d2c069cc31dd0e58af3e0a1de21cf5737c3573ef6e98787773d371bde5ba9f8a2ecbc8e7497d8981a7d1673ddc40b8abfccd7d28c2a73010bf4c4db25327f7f520de9140b61db08d8cf1aa26f774ec049f28b9c89de07885897620b8071a99ba652fefb32114a284e7f0d646cfe56cb06d49cd2680c5e95e467b0ee5edee8ae693586106264e26f6694b78e02e185e9c440e857ade7a1d7c13d82126cdc906879e4ea4414e97f41964b1b51088c4a377043d1f207bb5981888df968511b22ffe53aead8de9d04518a111e6dbeffbcc1f451c1a6e8994fda429cd34e4132097e8c482933e88267568166419c02bce42d85a7922376c7c1284223dc2bb3f23684f42b31c0b88b7250ae55c35f30caf9cf7d302ca1e18200b4cea8157f228243d1c3394ee8361d58571038b913042bb812013ad7f99aba20bb87798b399a93953d28df580df0c233968f8338643c2a1a89e850b9374de6dda01bacb02a4b3555ba9aabe31126ebc624be3d0aad7450872e6e1b89ce9ac16d0d3c4a39c55a9338662f8d1b2174737164ff047632d722baf4c3d6a9127e6222a9e8ea6e419e1725ac2f1f338b011dc058cab6f579e8650cb88671192fe3b9d740815ebe93131b5722312a604426bcfa0c1eb67da2533f113390993005b4f480d974edbc4d538f06beb6af3c55c4c996933df22bf31390e0965e2466878456c733db72c39d23fee80ddede8fcdf7223b489b91e227d642e9da63651c95710c69a09f863331c3ada20b0bc077144d1a7d8a58aa17d5cb6602552402f4bcb3f18828ea4ba1a9fee57c833c7bfcaaf4811c0c51f29e0f21350534faff8f1fdb20fb0492922d3c697e3a860a3c9c8a6765d7116ecb503d6c007529e7af18cdbc9a1fe1aa481b02eb2905c29ba3532bdf7fe2fd2b51e2af5c001295cfd8b12e323f919f3ffd70eaa011c42cce9ae1b065be2fd1d561b610e026102f7a89817ec2e51802360d09bee232749d91ed413149271a6c48324e0ce2fc03c90728208d250338dbda4b6cf9c7a1d7ecd639a18d629d169d20dac4e74203f4d0afe7bd9610965456c15da72c27dd6a2d47add7e751bd6134964b5a19dc8204dfd1cfe588e2fd15ca1ba301e4ab7c6333a3a5ff64467f53e64b5556b27dfcb51f4997aae9e19c727b906300023d84a79de757f48303d7b43722373a55b3b11dafdf94887d59ca5486163a8100ce68f20e01c50ce1bb82baa1b|251b35e9ed07ccef96091b828fa040f8|8151276c6c8d3357ae8e96b5e79d6410881b4088107daaf979aba58e7dff081b152f69c98adafe23ad7f77ee6c82447eb15b8e85f00062ec7bd3ee5b64093bd2|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4LrXiWPMC1roI6trjsKk\ndMNPsRHY52kixbOoHjJtpzTXnlX8WO5xn11Evwalqj4VsX4MmDPp8Oes4CAnFE0P\nvseo1eXHUi5o9+1zhrEWR6DjEtssZxyu2GD5hLpBOVA6NBEZyJMuFyN8aXb0mcTb\n0ZHhwd1g/w8ZfF4uQSHUqN8/FysFew/4twCXyrlVbb2k8fH5nCZPIDxz1bbsI4Ah\nZVIa3/xyP3gvZmgsJ4eri2HrXa1Dp8K/s8N+JooGu37Ow/7y+cwNuD28b6qrLeKt\nkXZ/hvZdcBugsQDRDaiB3yDjTTqvcN22kBFmDcTamCWD8ZmbYzyhzbSBRRtKGG1K\nowIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$VG41MlhNTG9VWmV2MWlNVw$Tw+kfl74b48VAS+4rowB51cvmpkuMzqhxn+XtjJU3os');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES
(1,'principals/users/admin','Personal','personal',1,NULL,0,'#0082c9',NULL,'VEVENT',0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES
(1,'rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','user:admin:rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','admin','','',1,1,'[]','','2023-07-21 21:07:49',0,''),
(2,'G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','app:circles:G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','Circles','','',8193,10001,'[]','','2023-07-21 21:07:49',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES
(1,'G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx','circles',10000,'',NULL,9,'Member','[]','Circles','2023-07-21 21:07:49','',NULL,'2023-07-21 21:07:49'),
(2,'rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','rJZ75vJtWqgSAKSI6tNzYuFrg4RogN7','admin',1,'','G4kI1tkvnudm9jXAsucIyJ29Uj9FGxx',9,'Member','[]','admin','2023-07-21 21:07:49','',NULL,'2023-07-21 21:07:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES
(1,0,'files/0bcf776322b017bc4dd9e9ec9c78aa73',1689977281),
(2,0,'files/38d3fc13a505a341da34815c5ccc8b3d',1689977290),
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
(30,0,'files/b6ef755cfc70b5eb94f5d3aad8ba833d',1689977290),
(31,0,'files/2b7e5de9afe8b3f7b056c0ba2a04af46',1689977290),
(32,0,'files/cdff7cca41f3f905de0c60387e63dbf3',1689977290),
(33,0,'files/d7f93e169178cf12e2d72f9d6f2f7631',1689977290),
(40,0,'files/57a6d6929059470e4152598fb95ccef4',1689977290),
(41,0,'files/fcc3c752b44f26f0dda744025c8e56d4',1689977290),
(42,0,'files/3a5a54a89135de9b7ef442ae2877c63e',1689977290),
(43,0,'files/03daab5f4f7f6bf65b7eb37c659af020',1689977290),
(44,0,'files/86f9af2b10a98ac0d55a01a4af09c807',1689977290),
(45,0,'files/f4807b788884712b295eea25defd4fac',1689977290),
(46,0,'files/a7cbbe2af620c21a0c8834e23b08d024',1689977290);
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
(33,'size','{\"width\":1600,\"height\":1066}');
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES
(1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,26998601,1689973670,1689973669,0,0,'64baf3a67cf3d',23,''),
(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,26998601,1689973670,1689973670,0,0,'64baf3a67cf3d',31,''),
(3,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1689973681,1689973681,0,0,'64baf3b1a689f',23,''),
(4,2,'appdata_ocv97i5mvjzf','925dff74b915485d8fdab566fe35d7a3',3,'appdata_ocv97i5mvjzf',2,1,0,1689973690,1689973690,0,0,'64baf3a5e03bb',31,''),
(5,2,'appdata_ocv97i5mvjzf/photos','cdd390341d43bd862c55800ab7623587',4,'photos',2,1,0,1689973669,1689973669,0,0,'64baf3a5e13d9',31,''),
(6,2,'appdata_ocv97i5mvjzf/photos/geonames','33ddfc1453059b2fba6c3cd6933a6031',5,'geonames',2,1,0,1689973669,1689973669,0,0,'64baf3a5e1c86',31,''),
(7,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',4,3,3963036,1689973669,1689973669,0,0,'bf2c0d16677e3c3386525bc035b09eb6',27,''),
(8,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,238269,1689973670,1689973670,0,0,'64baf3a63047f',31,''),
(9,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',8,'Mindmap.odg',6,5,13653,1689973669,1689973669,0,0,'09ce7feab6ec8ddeab073f91bb0a2d98',27,''),
(10,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',8,'Expense report.ods',7,5,13441,1689973670,1689973670,0,0,'f49e67bf89e98c2eb658e0468179528d',27,''),
(11,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',8,'SWOT analysis.whiteboard',8,5,38605,1689973670,1689973670,0,0,'fe4eb0f9a34ec5bdabb5eeb17a5f8438',27,''),
(12,1,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',8,'Meeting notes.md',10,9,326,1689973670,1689973670,0,0,'116742d47ddc6b91a3089b07a66d7595',27,''),
(13,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',8,'Letter.odt',11,5,15961,1689973670,1689973670,0,0,'a8accc7d918036153a1373bf208aaa6d',27,''),
(14,1,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',8,'Product plan.md',10,9,573,1689973670,1689973670,0,0,'ee39fcc7ed63c4e903fe9e153d0cefae',27,''),
(15,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',8,'Business model canvas.odg',6,5,16988,1689973670,1689973670,0,0,'0ab4d20abf72cffe387e23b6ccb2b7a3',27,''),
(16,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',8,'Simple.odp',12,5,14810,1689973670,1689973670,0,0,'cdaae024ec6d8793abc4feb24e9ebe5f',27,''),
(17,1,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',8,'Org chart.odg',6,5,13878,1689973670,1689973670,0,0,'bc882b69c52291a06f2e161e07eb59e5',27,''),
(18,1,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',8,'Elegant.odp',12,5,14316,1689973670,1689973670,0,0,'c7ea6b34b185407c938bb281407aa63d',27,''),
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
(113,2,'appdata_ocv97i5mvjzf/js/files/merged-index.js.gzip','5a26eac8fac214f1d6b59298fbffe1fc',110,'merged-index.js.gzip',19,5,94347,1689973794,1689973794,0,0,'bca292e8b6456ddd860cb0c92d3dbe0a',27,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
(33,42,1689973670,206,10,'[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
(4,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1689973664,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(5,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1689973664,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(6,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',0,1689973664,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(7,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',0,1689973664,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(8,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1689973664,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(9,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',0,1689973664,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(10,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1689973665,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(11,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1689973665,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(12,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(13,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(14,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(15,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(16,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(17,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(18,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(19,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(20,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(21,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',0,1689973666,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(22,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1689973667,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(23,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1689973667,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(24,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1689973667,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(25,'OCA\\Federation\\SyncJob','null',0,1689973668,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(26,'OCA\\Circles\\Cron\\Maintenance','null',0,1689973668,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(27,'OCA\\Text\\Cron\\Cleanup','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(28,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(29,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(30,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(31,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(32,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(33,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(34,'OC\\Log\\Rotate','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(35,'OC\\Preview\\BackgroundCleanupJob','null',0,1689973669,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
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
(46,'OCA\\GlobalSiteSelector\\BackgroundJobs\\UpdateLookupServer','null',0,1689973794,0,0,'37a6259cc0c1dae299a7866489dff0bd',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES
(1,'admin',0,0,0);
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
('admin','dashboard','firstRun','0'),
('admin','firstrunwizard','apphint','18'),
('admin','firstrunwizard','show','0'),
('admin','login','lastLogin','1689973669'),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES
(1,'admin','online',1689973689,0,NULL,NULL,NULL,NULL,0);
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

-- Dump completed on 2023-07-21 21:10:56