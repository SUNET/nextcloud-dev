-- MariaDB dump 10.19-11.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB-1:11.0.2+maria~ubu2204
USE nextcloud;

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES
(1,1689936523,30,'file_created','admin','admin','files','created_self','[{\"7\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8000/index.php/apps/files/?dir=/','files',7),
(2,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"7\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8000/index.php/apps/files/?dir=/','files',7),
(3,1689936523,30,'file_created','admin','admin','files','created_self','[{\"8\":\"\\/Templates\"}]','','[]','/Templates','http://localhost:8000/index.php/apps/files/?dir=/','files',8),
(4,1689936523,30,'file_created','admin','admin','files','created_self','[{\"9\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',9),
(5,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"9\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',9),
(6,1689936523,30,'file_created','admin','admin','files','created_self','[{\"10\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',10),
(7,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"10\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',10),
(8,1689936523,30,'file_created','admin','admin','files','created_self','[{\"11\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',11),
(9,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"11\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',11),
(10,1689936523,30,'file_created','admin','admin','files','created_self','[{\"12\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',12),
(11,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"12\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',12),
(12,1689936523,30,'file_created','admin','admin','files','created_self','[{\"13\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',13),
(13,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"13\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',13),
(14,1689936523,30,'file_created','admin','admin','files','created_self','[{\"14\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',14),
(15,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"14\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',14),
(16,1689936523,30,'file_created','admin','admin','files','created_self','[{\"15\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',15),
(17,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"15\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',15),
(18,1689936523,30,'file_created','admin','admin','files','created_self','[{\"16\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',16),
(19,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"16\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',16),
(20,1689936523,30,'file_created','admin','admin','files','created_self','[{\"17\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',17),
(21,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"17\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',17),
(22,1689936523,30,'file_created','admin','admin','files','created_self','[{\"18\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',18),
(23,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"18\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',18),
(24,1689936523,30,'file_created','admin','admin','files','created_self','[{\"19\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',19),
(25,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"19\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',19),
(26,1689936523,30,'file_created','admin','admin','files','created_self','[{\"20\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',20),
(27,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"20\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',20),
(28,1689936523,30,'file_created','admin','admin','files','created_self','[{\"21\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',21),
(29,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"21\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',21),
(30,1689936523,30,'file_created','admin','admin','files','created_self','[{\"22\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',22),
(31,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"22\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',22),
(32,1689936523,30,'file_created','admin','admin','files','created_self','[{\"23\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',23),
(33,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"23\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/Templates','files',23),
(34,1689936523,30,'file_created','admin','admin','files','created_self','[{\"24\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8000/index.php/apps/files/?dir=/','files',24),
(35,1689936523,30,'file_changed','admin','admin','files','changed_self','[{\"24\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8000/index.php/apps/files/?dir=/','files',24),
(36,1689936523,30,'file_created','admin','admin','files','created_self','[{\"25\":\"\\/Photos\"}]','','[]','/Photos','http://localhost:8000/index.php/apps/files/?dir=/','files',25),
(37,1689936523,30,'file_created','admin','admin','files','created_self','[{\"26\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',26),
(38,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"26\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',26),
(39,1689936524,30,'file_created','admin','admin','files','created_self','[{\"27\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',27),
(40,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"27\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',27),
(41,1689936524,30,'file_created','admin','admin','files','created_self','[{\"28\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',28),
(42,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"28\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',28),
(43,1689936524,30,'file_created','admin','admin','files','created_self','[{\"29\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',29),
(44,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"29\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',29),
(45,1689936524,30,'file_created','admin','admin','files','created_self','[{\"30\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',30),
(46,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"30\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',30),
(47,1689936524,30,'file_created','admin','admin','files','created_self','[{\"31\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',31),
(48,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"31\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',31),
(49,1689936524,30,'file_created','admin','admin','files','created_self','[{\"32\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',32),
(50,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"32\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',32),
(51,1689936524,30,'file_created','admin','admin','files','created_self','[{\"33\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',33),
(52,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"33\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',33),
(53,1689936524,30,'file_created','admin','admin','files','created_self','[{\"34\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',34),
(54,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"34\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/Photos','files',34),
(55,1689936524,30,'file_created','admin','admin','files','created_self','[{\"35\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8000/index.php/apps/files/?dir=/','files',35),
(56,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"35\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8000/index.php/apps/files/?dir=/','files',35),
(57,1689936524,30,'file_created','admin','admin','files','created_self','[{\"36\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8000/index.php/apps/files/?dir=/','files',36),
(58,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"36\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8000/index.php/apps/files/?dir=/','files',36),
(59,1689936524,30,'file_created','admin','admin','files','created_self','[{\"37\":\"\\/Documents\"}]','','[]','/Documents','http://localhost:8000/index.php/apps/files/?dir=/','files',37),
(60,1689936524,30,'file_created','admin','admin','files','created_self','[{\"38\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',38),
(61,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"38\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',38),
(62,1689936524,30,'file_created','admin','admin','files','created_self','[{\"39\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',39),
(63,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"39\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',39),
(64,1689936524,30,'file_created','admin','admin','files','created_self','[{\"40\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',40),
(65,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"40\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',40),
(66,1689936524,30,'file_created','admin','admin','files','created_self','[{\"41\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',41),
(67,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"41\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://localhost:8000/index.php/apps/files/?dir=/Documents','files',41),
(68,1689936524,30,'file_created','admin','admin','files','created_self','[{\"42\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/','files',42),
(69,1689936524,30,'file_changed','admin','admin','files','changed_self','[{\"42\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/','files',42),
(70,1689936524,30,'calendar','admin','admin','dav','calendar_add_self','{\"actor\":\"admin\",\"calendar\":{\"id\":1,\"uri\":\"personal\",\"name\":\"Personal\"}}','','[]','','','calendar',1),
(71,1689936524,30,'contacts','admin','admin','dav','addressbook_add_self','{\"actor\":\"admin\",\"addressbook\":{\"id\":1,\"uri\":\"contacts\",\"name\":\"Contacts\"}}','','[]','','','addressbook',1),
(72,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"25\":\"\\/Photos\"}]','','[]','/Photos','http://localhost:8000/index.php/apps/files/?dir=/','files',25),
(73,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"37\":\"\\/Documents\"}]','','[]','/Documents','http://localhost:8000/index.php/apps/files/?dir=/','files',37),
(74,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"24\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8000/index.php/apps/files/?dir=/','files',24),
(75,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"8\":\"\\/Templates\"}]','','[]','/Templates','http://localhost:8000/index.php/apps/files/?dir=/','files',8),
(76,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"7\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8000/index.php/apps/files/?dir=/','files',7),
(77,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"36\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8000/index.php/apps/files/?dir=/','files',36),
(78,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"42\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8000/index.php/apps/files/?dir=/','files',42),
(79,1689937208,30,'file_deleted','admin','admin','files','deleted_self','[{\"35\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8000/index.php/apps/files/?dir=/','files',35);
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
('backgroundjob','lastjob','7'),
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
('core','installedat','1689936517.0705'),
('core','lastcron','1689937213'),
('core','lastupdatedat','1689936517.0716'),
('core','oc.integritycheck.checker','{\"core\":{\"EXTRA_FILE\":{\"ignore_and_warn_on_non_numeric_version_timestamp.patch\":{\"expected\":\"\",\"current\":\"20d0cec4e3780b6ddfa3494f027bb82c57f05543fe84661287857c6c64d3d63cc523cd7d6aaa4e356ce869552109b4311bdbe479ca739aad4170f9f657a5795d\"}}},\"files_versions\":{\"INVALID_HASH\":{\"lib\\/Storage.php\":{\"expected\":\"349786745e52f64d64d1004c0602fbc7777bf034bd5556f119bfbd682a80d4a5a2bb1334718557a45ceb13b2bb11f6caec9ee6fb5bb59d6ab12b55cbe318dba6\",\"current\":\"67afa13876c1f4cabeffc7fb79c117887ae0dbc42cedadb77e03455dbff075feccabc1f63a1c4f3f1b3b7c185d603c61c89a765fc05d7ebcbde3ff9dbb238a36\"}}},\"globalsiteselector\":{\"EXCEPTION\":{\"class\":\"OC\\\\IntegrityCheck\\\\Exceptions\\\\InvalidSignatureException\",\"message\":\"Signature data not found.\"}}}'),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES
(1,'admin','admin','WNMIy2AUTqx7euql/aYQtEoVkGKh7AcFuagTw0DtGzCoDr0XlwPW6NFFlX11uLfUaL75gTz2ETQ+hVVu3za4/05/RaRjZ9svFa0D9OZ98jKFLn6SErpWmYYKj8+rGAkmjAAATAYzgdVzQcEjJExmAdCopSjM6vjvgU1gdQUAjEcWXF8WmkEYXtjj4s/vQiwxlhceam0+BC+O1dL12QWhljQVhSyJkjEBTVOst2tB1ioNI9ig59Rz8Un+tUK/4uYVPc111qDeu99/qdbdeG2Lb2xzoOSKZemn0jbVm4zgijBpQNgm+26WDkVZXb2yg2xdSbbv+ofeDcYLQI6SYaFDeg==','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0','f9a95a5b88c401bfacfe3e8f833342bca7d4945f8fa8836ae5f8116a85db0817bed90e3866d71e909816c6e48beaea811ad6f4d6f4c45d9e7543e3104f7bb4f8',0,0,1689936779,1689936839,NULL,NULL,'f51f0d2311a6e4f00f633b8db3d4ae21e9461d99645da606a1dc4ce077a0e45c852f2ad04576f83da3a32a0631b16aa283693a775b99ff17c32ee435d79b230bd2fb31c71a91d7dcbe586459180215ba6c464489dec7fd191b984d30e4d85fff4692efd8b55ec8b2348bd9a27486fe576ef998905cbf2aed56527cbc1d3c564c31c3e25865522d466feb823082e4d6edee032977eeb38da2fc964c578cb1c7b13f03a207c060fe7517a54953746975e3af60ef9c3ffeaba8b5713fc49bb441317893f66d500787c184a171f57950813f4c70e9a3356658035785c64fcf789868070da44204250fd689ac1089f7df74af60de488e88d5813d291041847b8cd0b88760fb32d591c7db15cfeb1d17bfa1f3587e8498bce110ea8c18d22baf31549eccb89ead8e85256a5f4de85ef3150f0efb8ac4f6d7ffc4091797b5395ec0ac248ceeb23f4eb90c2587de401e6bdf3d14a3f2143e45ddfe19ea6e775f3d0267cbf89c530c7320f0dc3ac32b545d46e092be1406eb21720a118d38f0432e7f7d4644210e696e1b1198cb874b536f23a66cc6e89f4d687c8b2bc32220eb6f946ad6552a0e25af701b0141806272c268dc05d87e4395a96cd1969e92a27e71f11d66bea30c510bf75d1082c7d0b41f9a4f47c17a8716e0b1bf092047825f98901df04b29281dbf178215aac9ac653d9a2f27dbeb00b6256595e588d50e7d1de5b98a91bbcb15eb2710b1ed87d882be27c7603ac464ee5e772454bd802f2edc8d20363962e15e32b464ebbee994c21655575141716b93ccb83a0eb582148e842ce681eabadf1276c231a02740c71180207dbec388b8c28b29b2797b2e2f8866b5b9f6496d0147c28aebdb84116b56ce09fb13a73aa25b54d1fd743080e373c601fc97b6a65de862756dc0500866c06e0e9066ac322a5b2c7988cb2a64fd9a475ee6a89c537f31945b2e09bf3879cfaff415c1c0ac2054b899f55a34423a511c03bb92b87fd0314e255ba5f37d83c1cef1e3f604aabfeacf0e8f450fd06b9d3dd0481a135cb42ced7e42dc827e6d2cd28a437121f1c04e691b0f1ee18888998c72dda0a6c6d265a4e7044426aa49df2d55707b3ebc6d283205897c752d56da210cb971e7ab77ccde5639e8a2092c10d90974fa7998aee61a34cfecda60ba02e38d4feae1f9063153ec00163302beba00d7a74f4bf70705e3e9b670c1cd2319076f3cd62fe58a5c2407e7c24c7488fe797cb4d6d8e87c4c5c1b0b33c775afc013a5c3ee618de530c2f4c8896a29284cdc62a3222e725610bb119542ef6edfd6a37023f6129902b3254e834be9424f5ccd54ca23e8eec9209bc4780451030c1d9d2af76b34d7ab0c129a11399b8810502e0fb1de657786d4d01959ef29445fe5f047a3e305d63634ec06bb4c35057e4785bed6facc792afcaf93fa2151bc86eb538a5389d699f8d877640e78e4656222a22d33b0daac5cbcff3cd33281568d2480910b54d49aafd067fc2a980431fae279e4b34fae50f2e4e46b34a56347244a16280378507fb0105a51952af526798cf2a8696158e544de44547c06484e8098a18f1ecfded3a650d15f2cd42af9588f81939511b47b18793b24d80898957df77c133dd893b9c25900f45916d3a9360b7cae5a93b24449783d8be407ce07b07bf1bd0161f20db818c79f1eaa6940d7f92409ec49f8c166cb968d63c989f9516a5efab445387c7a7688f28114a3bcfc2de1e36b14c4110e9975382d0a11ceba6f36a171e33c9bd3a7a5419757e44612f254f980726629d64bd78d6d9532b2f73adc76eba6a50876b47fff8c423094b6559402fa06eff9206f09cf5c39f2c309d33ce6fe4ebeff6017631ca563c4b65bbf7ab3a775a33dc37c277f9ffdb9620ac9587479a619c98c57269e22bc8c29eab0536fb93e66189824a56bbdd39148f810316d3824e1e2ecc4c8028fd3d0b299cc77c7b6ebd809b604019656ace772c63856abb995c67dad69c258aac4cceecdc59e7339d3eea42cd129d5d0fc411ccbb69c10971b6be166ce86a45ffd21d1543e6454bd28ebe66a902ff2e5a27e1f034a93bb12d59c39dcfa4ba8a76d1a0a8ce44515cba5863921a95fcbeb46bd012a05469d7b35a356e41656ad54f61b172943e497090ab8efefc779385f54add0a8826e5c350532a95ebe0a279b054ef07a8be43bebfba0be6f0c2272b4c1246e9b48b6cd56657c6aaeee16d3da77db806cc94759a89dd670a81ebfa7fabfd654a3841144ede7977eae6679188e68562b5ddc936da97e2b0692e7cdbf026b6703922ce8b66267372c52d12b2aaedfb61622ed0aaed7df003f761c76d9ba4d400990418bf894c95d030c10bddfb6d785d590f681426c3bd7760aca21f9c6c13adcc0fce2b189870381f541f1192791cb696738401ef97c|dd2ed9699ac1c95af4f18c178b602258|41834c36b2649893a8c7481f1996876432fe5850cd2efa13748814cf88c17ec27424fff0ddb3c648f04e952c75c4385b7bafd3fb1dc6f6ba7c41f97576a91c29|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq9bpxmujvP92J2Sdemvo\nm7z2tkPfrueUvdLO4RTrPi1C/n0jRzg9nTcZGcyAvuHf46mRKKsdiSSoSwFEuyvQ\nNSeOGjHwKdxWP4NaR2qBsH8JKT1Qp4WJP8Bp16/l1mH+sSeWS3OPx1LkrF8N7sf6\nvC4IuxsuaqrxgL9ERVJySXH8RMPI7dHOoFAlHT6G8MdtEE3/6wtQrl7xrvaZg+O3\nNZgzLfdsfzPW9YAyaLFn4ZM3hlBr+YuoF2lFwpOMy1Afg8oKYchtZAYaptDoKp+l\nkNjrDuzYQGQa7gXdq+PxZnRSTP+8QCPkX+99f/UMfXu091rNitHOvXUNR3tXfmxk\niQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$MHhqY3lmQ2E4Y242WS45VQ$zFJaBg/uPTFLWCpD5Gwa8J8g3705A7X9fBm5LzF9Qxc'),
(2,'admin','admin','j9itGYUZCiKSFo58nrTCAgAMDmaQBDz+zGcAez9IWsTbOMRw3kM093v9pk4urNB2uSZx9b3DrL7cibYcV4cnI3MmuGxcijClvgLhxmie+m7xh0RE146nOyPTn6IEL1SKMZW1PR2xNbZxHl4EwsLKQtNgpFjsJRsWN1bbprOxBp9FL0R3P6l++iP7rwoXPsr1AVxnZaWWyxtweswACfDZ6LJT5WIt8BcRAtLiX+w0qiAOiCzd/mx/qbpY+hcp92IdhpgNa39b8Y4sgqljh+KV7rt7MYHCAKQILZRChIzpn4RUiwfZgY2LP8zfGU2t5RI/Di4N6cCnwOQLGpPAMfKAHg==','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0','e916ad6bc3a3cb8800438f05843248a1ad1985e54555174a716a17d057bbec58fad4873a0a70ca274761a4497c4441ff306f094c3dbdfa5aebee3ddb0f139bb1',0,1,1689937187,1689937121,NULL,NULL,'7421ed8f92dde2c9198975d325ac362a75f1118a5069a8d2202ef9f9ae5caa0020451cbeef962bf234c2085a70032269a275fb244ba1eafebb41f458604cb66b20f3e8a8affaa34e0fe3eb1b224821ebbde2de1d1e7987c9022f253af3cc12a193af23c0f85da041155ed449cd1e7dd27ec28bc6629cea711960fa2413347deb56c01a91cc7d6cbbf291dcccc8dd2a2f139a60c6dbdceff74ffefbd3dda102e31a8a77aee7f97d8840070637dedf802a5e9a7bb763e0025d941d9bc4bd1e888fa405291951e42f6e318da116e26e495b0533030e9130aae387fcf7a88d89cfb219a0b54ab36c0723a2a7437d06140d7060b4b1cb6e6736e14427d23388ba22a7709e656370fd48515674c1ce6e50c78ba1775c03622ac4a600287cbefc03177edc22106fa696dea6ba24b5a7a82aad67b652f6eb520743a6c4630eab09fcb71d4f64b9414f01c32ed15a0786e1ea6dbe88eeae934916ed863b4ad44a5479a62caa666e180ff8b8a87342cb261e187497272d8b8cd50a9dcbf853903e6d555837ab19f795d3fc7ec6bb8a36b1d4d9515196869db1f9be198448cbca15fdae2e7ba0af85d3ff7d1d6969c0bdf009669215bf800cbaf952f29cbd378c1b3e963543bce82a67979dddbea1148d0c73e3ccac87a3ab2216902a87a4c25e9462a1ed785a00a754fbc00a7a6d2fdfeee9287e77ec9fe16f84d53a47e276bbaa5cb4f2f24abb4580301c30b591545c979ebc4081a8c9bd46511fd6384a3a070db90ecd691f3be72e29934458cc5f379b1bc0fc8629c0ac86e14f35d896bf4b12ea01e07c7dcaed7651d5a3c9d2c6b73c096056d277fb61751f32b08917b8b3994d322c0b12cefc44bbfb9c86f8aebb7aeb502a23f1fbd8b9a760c65f6cc1a24a45ce0ebbb8928adfbae8fb7fc50f3f5de71ab52d79b2149a8fcfaaab52a3c14c5983a9df86bd651dbf013f39a2757bffe44bb963bb4baed8ae637cfdd026b5f7f0444de45204a363d01f0ba116216addb05259c914300beb4aad0a9948fb1604a2543f9d29780bcd97c88734f175d01d43c40609580b994314e8374384502c93e56c11626ddf2a752e591ce313bf8b9e17736bae672e8a0b81fbada357e46bb023185fbb38e4c1aed830914238b52bc3788ece0d375ab999b73670d88593f39ad643e968479b7b8324ac30b074bc00fe7a0f8a3593207cd7049c01a2625e476c66a7ffaa400623b04c73e6212e439dddff8662a661a5e5a300bf68a0a48cd0fc69f9b90ef6da0fe9c6a56b43bb346c37bc54afcece75260b3637ab9b2ea5dc62ff5324af713c600a7e6f5e26abd4ceb430cafda0bd5c0be8c9e44000dc5df16311d05357526b2edf3118f9611523bd333c37eb0dd2af0312b94379faf552a8bfbc9b5916f459c34f8131ec6a0b096561352f47150b5927c72e5c5c8663e3a1bbfa4e27a9d57e311de7ca819cdb80d9420785708f6f672f605f8e6d07559b30668d834528915c069fb134ce6fedbfcd66797352e1ec5797bfd7c4d0574f292498b191200060a56f06e26f0e21f3e90107431f3459534d55538630c50502efd34986d922dbcead56e35fd9e4f55a014a1332f432007fc47b060de28516b1b097f51e1b2e2512007911f4e382069fcbf82c8666cbfffc6b8fc75c5fdd837fd4f1786e9ab98cd3e291ec0f9466d47f14ab1ac33aab1e75ab14d117feeefab5d9fb4342d83bbaa2ca2ef8f34f0bd883b972f03eb1c8826093ba34c346609f85f25388075f086ba8260bdba1b83ea475c2ba432a61e732c4de4c5d97c92571f3b8d94ff964a1c0bf7a2859d89c812bdd75bf17e8df16670d5fe9d1271a1055bdc6cb89b20bcbf7c366dd4372c4adb276981866d719d066d3f78fbaf9793f303471101a524705d4fcad50743970a143588a5b68206f257c6edcf4c0edca8cfda3799e39fd67062c989af7c9262d350decc930590a6dad26f26e1f211d8561b3753ddc57e3aca3c47bd8856ae572ccd1deeb5c955f5c0e84eb65b8760a5f6a8136c9afcc691abf977ef392cfc61079ad7c66c16f2d645681b3776433d6e892051854835f6b5d5a3960b3bab35115ab20e3c691f1c3d7cf0645bb24a461fa76bcf2fdbe534689dab94acf060942427092ba9973a520554cdb8fa7220fde9335cbeb8ea77913e924539be702957edcc2e62394402ed574e0b26c69a192e95dabc2814681f05f9d01c26e78c39d50a49a3c4149f9512b1696ca839358af74f36d281b7debf3298d55c513d50c5f9a2a57d54057d705e2dc41b7b5ecba8c3beff2d32d2771dd283d92a97afcb1bfa4e0e3a02c96fffdf29d57574ddf9c2a546382644aeac6129ff248ba31821ce571dd1cf368b5f1ddd53fe7807c3695a970981ae4f8aebf32b827cf7b80ed04b9f8b24ca45a570e909b15652b|6b444935f58eed0e2acac0a1603e563a|37577c98f2d2be81f7cc5029a25933efeb5e1b70e59b6c6645792af96f70120b1a7c86f93d5c5a109c0dd844694bd25df158bb302228aa1938a78e97f08211f4|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtF+o+OqtHtncB416Gfkg\nEpCAV+RH590joQ+yPihMen4/jq0ouwlKhxJai9BF5dztwzvFGr/IhsKLwzh9cctn\n+yuLz+E2+8EAw+/nvkLsIFlJWfJOvixKKB/fpXjL8JkDeU/Dy9iOoivWa1x06AYJ\np5dK9PpU/Etp/J9WmdHjq+o38N6QtgqcnhXZ5UEakB+nIpXaFK/hh6u3Q4xB40I6\nQ4nqmstdJGMvdgLUwMCgoHD2OyWGQPWWY24ZPkpHvBDf97IDQacpMYWhQ3e1Qvmn\n2XhlPQEbyPB8KnuGvR2Aub1eJBlpN0ohgNuoyJLD1PVtrWDiataezS0yMQL1YP8l\niQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$MHhqY3lmQ2E4Y242WS45VQ$zFJaBg/uPTFLWCpD5Gwa8J8g3705A7X9fBm5LzF9Qxc');
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
(1,'suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','user:admin:suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','admin','','',1,1,'[]','','2023-07-21 10:48:43',0,''),
(2,'VtA59RE78DNEbsSSD5HiYH85tYbelTv','app:circles:VtA59RE78DNEbsSSD5HiYH85tYbelTv','Circles','','',8193,10001,'[]','','2023-07-21 10:48:43',0,'');
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
(1,'VtA59RE78DNEbsSSD5HiYH85tYbelTv','VtA59RE78DNEbsSSD5HiYH85tYbelTv','VtA59RE78DNEbsSSD5HiYH85tYbelTv','circles',10000,'',NULL,9,'Member','[]','Circles','2023-07-21 10:48:43','',NULL,'2023-07-21 10:48:43'),
(2,'suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','admin',1,'','VtA59RE78DNEbsSSD5HiYH85tYbelTv',9,'Member','[]','admin','2023-07-21 10:48:43','',NULL,'2023-07-21 10:48:43');
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
('VtA59RE78DNEbsSSD5HiYH85tYbelTv','VtA59RE78DNEbsSSD5HiYH85tYbelTv',9,'VtA59RE78DNEbsSSD5HiYH85tYbelTv','VtA59RE78DNEbsSSD5HiYH85tYbelTv',1,'[\"VtA59RE78DNEbsSSD5HiYH85tYbelTv\"]'),
('suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT',9,'suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT','suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT',1,'[\"suNMgx2xqQGEnm2A9ZwoFkb2hUKR1nT\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES
(1,0,'files/c0a24e5b4e63955a47c71b917b2808c7',1689940128),
(2,0,'files/acb1d6a86247c8b0f899e884ea32feae',1689940788),
(3,0,'files/0af7b01e880ae26aed37291271869519',1689940139),
(5,0,'files/a85129d8ea386cf59f6cf571f97ff56b',1689940788),
(6,0,'files/7cdfe0cd3922471c81ede2068bdbb5dd',1689940808),
(7,0,'files/3461372b35c60b8cdebf5daa2deaea99',1689940139),
(9,0,'files/a68f9e7c555bf9260af47eeedd971613',1689940139),
(11,0,'files/f034570f00c0978ec3ac6af88f8f59cd',1689940139),
(19,0,'files/be5f7827c98020e3dbfd140b2060bae5',1689940139),
(21,0,'files/11cf73b513e5452aadcba982a131403c',1689940139),
(27,0,'files/6e8fb0201353844ed2a9cf1319b342d3',1689940140),
(31,0,'files/3a1334180a756504d22e4ba1d94868c6',1689940808),
(34,0,'files/8e6a0430a068483a6a77db8c850e774d',1689940808),
(41,0,'files/22863f4c0fc5447258c457cef5236cb5',1689940808),
(56,0,'files/5560fc6765d5361fc1305aa8efcf95fe',1689940808),
(58,0,'files/d8f2b93587431f4a0f35819472dc7e3b',1689940808),
(60,0,'files/2b0b732a390032dd9e3f771c8d6e148e',1689940808),
(61,0,'files/73deea3314903b15a5287f94b641895a',1689940808),
(62,0,'files/f9ec1ea25aeb10e9526715c5c7eb3ad7',1689940808),
(63,0,'files/357cf13447311cab69edcda2fa22c3a4',1689940808),
(64,0,'files/392657166cbb967b6832d3b2c0207988',1689940808),
(65,0,'files/8c7a395fb45c07f260b6c796bca06c82',1689940808),
(66,0,'files/728229e37c79d8e28c479eddef71ac9e',1689940808),
(68,0,'files/43b0975525e2a546381ca73fbd5a4f2a',1689940808),
(69,0,'files/5425a9e63191e986da988cce584c124c',1689940808),
(70,0,'files/f17272a1a5afef862563cdb60a2ff8da',1689940808);
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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES
(1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,5200114,1689936528,1689936523,0,0,'64ba62905becf',31,NULL),
(2,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,26998601,1689937208,1689937208,0,0,'64ba6538a0d6e',31,NULL),
(3,2,'files','45b963397aa40d4a0063e0d85e4fe7a1',2,'files',2,1,0,1689937208,1689937208,0,0,'64ba6538a0d6e',31,NULL),
(4,1,'appdata_octoue9ym05u','141a158a3305a75e572238700d5c0717',1,'appdata_octoue9ym05u',2,1,4984212,1689936523,1689936523,0,0,'64ba628b4929c',31,NULL),
(5,1,'appdata_octoue9ym05u/photos','fa70f4a7c721afea450176bfc926450e',4,'photos',2,1,0,1689936523,1689936523,0,0,'64ba628b49f29',31,NULL),
(6,1,'appdata_octoue9ym05u/photos/geonames','62ab3ee60462f9ef507f0d0252d64d9b',5,'geonames',2,1,0,1689936523,1689936523,0,0,'64ba628b4a945',31,NULL),
(7,2,'files_trashbin/files/Nextcloud intro.mp4.d1689937208','1ecc6cb0e928386bc70d69e406deee1b',150,'Nextcloud intro.mp4.d1689937208',4,3,3963036,1689936523,1689936523,0,0,'64ba628b61393',27,''),
(8,2,'files_trashbin/files/Templates.d1689937208','f766c5ea0e7da0f45c11b520852417ed',150,'Templates.d1689937208',2,1,238269,1689936523,1689936523,0,0,'64ba628be33bd',31,NULL),
(9,2,'files_trashbin/files/Templates.d1689937208/Mindmap.odg','02bed28e1a5789de261975bd5c3247bc',8,'Mindmap.odg',6,5,13653,1689936523,1689936523,0,0,'64ba628b76af2',27,''),
(10,2,'files_trashbin/files/Templates.d1689937208/Expense report.ods','c016df46ff72c41a77ee3bc904ccf03f',8,'Expense report.ods',7,5,13441,1689936523,1689936523,0,0,'64ba628b7df00',27,''),
(11,2,'files_trashbin/files/Templates.d1689937208/SWOT analysis.whiteboard','6cbfb5345684c05bd490775e532f5d22',8,'SWOT analysis.whiteboard',8,5,38605,1689936523,1689936523,0,0,'64ba628b850b9',27,''),
(12,2,'files_trashbin/files/Templates.d1689937208/Meeting notes.md','92bae3259526ec34997a4f24cb110acf',8,'Meeting notes.md',10,9,326,1689936523,1689936523,0,0,'64ba628b8c7a0',27,''),
(13,2,'files_trashbin/files/Templates.d1689937208/Letter.odt','24a3d46d088066c5671b8ad758f17b25',8,'Letter.odt',11,5,15961,1689936523,1689936523,0,0,'64ba628b94412',27,''),
(14,2,'files_trashbin/files/Templates.d1689937208/Product plan.md','161743f59aa891f3371361e6715e3884',8,'Product plan.md',10,9,573,1689936523,1689936523,0,0,'64ba628b9c6d6',27,''),
(15,2,'files_trashbin/files/Templates.d1689937208/Business model canvas.odg','fadef36a4f9c6e61ddc803b0a8d5b9f4',8,'Business model canvas.odg',6,5,16988,1689936523,1689936523,0,0,'64ba628ba4741',27,''),
(16,2,'files_trashbin/files/Templates.d1689937208/Simple.odp','52eb4b519cd3762c55be37b002a37f32',8,'Simple.odp',12,5,14810,1689936523,1689936523,0,0,'64ba628bac792',27,''),
(17,2,'files_trashbin/files/Templates.d1689937208/Org chart.odg','036a9f22d08adbd863ed2a8cd9b002bd',8,'Org chart.odg',6,5,13878,1689936523,1689936523,0,0,'64ba628bb4c01',27,''),
(18,2,'files_trashbin/files/Templates.d1689937208/Elegant.odp','e3732faf3b19c6dfb51774b51a5a3eb9',8,'Elegant.odp',12,5,14316,1689936523,1689936523,0,0,'64ba628bbcdd9',27,''),
(19,2,'files_trashbin/files/Templates.d1689937208/Flowchart.odg','b0bacc777c8b0799dac5ccb75ff49600',8,'Flowchart.odg',6,5,11836,1689936523,1689936523,0,0,'64ba628bc4fb0',27,''),
(20,2,'files_trashbin/files/Templates.d1689937208/Diagram & table.ods','d7ca38ff394b3a28d3014484cda96689',8,'Diagram & table.ods',7,5,13378,1689936523,1689936523,0,0,'64ba628bcc6c7',27,''),
(21,2,'files_trashbin/files/Templates.d1689937208/Impact effort matrix.whiteboard','1e3e4fddd133d3fdef14414ed4b5cee8',8,'Impact effort matrix.whiteboard',8,5,52674,1689936523,1689936523,0,0,'64ba628bd3a29',27,''),
(22,2,'files_trashbin/files/Templates.d1689937208/Invoice.odt','06aae6d3e4a32c78f412ab877c350d9a',8,'Invoice.odt',11,5,17276,1689936523,1689936523,0,0,'64ba628bdac6a',27,''),
(23,2,'files_trashbin/files/Templates.d1689937208/Readme.md','7a312d8f2880fe186771d1dea0b439e2',8,'Readme.md',10,9,554,1689936523,1689936523,0,0,'64ba628be1e85',27,''),
(24,2,'files_trashbin/files/Nextcloud.png.d1689937208','722db4635d4288f22438ed9cc5b32bbf',150,'Nextcloud.png.d1689937208',14,13,50598,1689936523,1689936523,0,0,'64ba628be8c68',27,''),
(25,2,'files_trashbin/files/Photos.d1689937208','fa65623f87055b482b8e8e1bce8c60b2',150,'Photos.d1689937208',2,1,5656463,1689936524,1689936524,0,0,'64ba628c602db',31,NULL),
(26,2,'files_trashbin/files/Photos.d1689937208/Vineyard.jpg','8e4e0f41a0e67b286be77f9461c7b6b2',25,'Vineyard.jpg',15,13,427030,1689936523,1689936523,0,0,'64ba628bf3a0d',27,''),
(27,2,'files_trashbin/files/Photos.d1689937208/Gorilla.jpg','09b63c0ce6ee8bae5ce8c0de3dbec273',25,'Gorilla.jpg',15,13,474653,1689936524,1689936524,0,0,'64ba628c0986a',27,''),
(28,2,'files_trashbin/files/Photos.d1689937208/Steps.jpg','b5e633f3c5f0a5ef82e519cfa9d8451b',25,'Steps.jpg',15,13,567689,1689936524,1689936524,0,0,'64ba628c13ff2',27,''),
(29,2,'files_trashbin/files/Photos.d1689937208/Birdie.jpg','6bababd820ef85a5022ce4c231ce501e',25,'Birdie.jpg',15,13,593508,1689936524,1689936524,0,0,'64ba628c1ef1b',27,''),
(30,2,'files_trashbin/files/Photos.d1689937208/Frog.jpg','5fef2e15d0cbaa6119a163c57bc25ffb',25,'Frog.jpg',15,13,457744,1689936524,1689936524,0,0,'64ba628c2a092',27,''),
(31,2,'files_trashbin/files/Photos.d1689937208/Toucan.jpg','c36e145070a70affb9eb71023286abb7',25,'Toucan.jpg',15,13,167989,1689936524,1689936524,0,0,'64ba628c34343',27,''),
(32,2,'files_trashbin/files/Photos.d1689937208/Nextcloud community.jpg','f4f03eb3b017d17766432ea8ae55046a',25,'Nextcloud community.jpg',15,13,797325,1689936524,1689936524,0,0,'64ba628c3eebd',27,''),
(33,2,'files_trashbin/files/Photos.d1689937208/Library.jpg','533cda3c2a919c37a0497efe1ee17ba1',25,'Library.jpg',15,13,2170375,1689936524,1689936524,0,0,'64ba628c4cf05',27,''),
(34,2,'files_trashbin/files/Photos.d1689937208/Readme.md','9566cb922982f3b656dafaf041e10c6a',25,'Readme.md',10,9,150,1689936524,1689936524,0,0,'64ba628c5ed47',27,''),
(35,2,'files_trashbin/files/Reasons to use Nextcloud.pdf.d1689937208','7aa0e1bc98feb4b69f75292e7f0ece11',150,'Reasons to use Nextcloud.pdf.d1689937208',16,5,976625,1689936524,1689936524,0,0,'64ba628c66984',27,''),
(36,2,'files_trashbin/files/Nextcloud Manual.pdf.d1689937208','9b6a9f2196a14bf35ce5c3437d4f9578',150,'Nextcloud Manual.pdf.d1689937208',16,5,15004539,1689936524,1689936524,0,0,'64ba628c74814',27,''),
(37,2,'files_trashbin/files/Documents.d1689937208','b7b44b7d1e99b296978341c77eff9fa3',150,'Documents.d1689937208',2,1,1108865,1689936524,1689936524,0,0,'64ba628ccce5a',31,NULL),
(38,2,'files_trashbin/files/Documents.d1689937208/Example.md','d48c37d16ce50c85a33fa58989b209bf',37,'Example.md',10,9,1095,1689936524,1689936524,0,0,'64ba628cb1d05',27,''),
(39,2,'files_trashbin/files/Documents.d1689937208/Readme.md','8210a7a27615333b3caca1c57e12b83b',37,'Readme.md',10,9,136,1689936524,1689936524,0,0,'64ba628cb899d',27,''),
(40,2,'files_trashbin/files/Documents.d1689937208/Nextcloud flyer.pdf','9caf8dbb58fb27d25a1f1223e79a5b5d',37,'Nextcloud flyer.pdf',16,5,1083339,1689936524,1689936524,0,0,'64ba628cbf66a',27,''),
(41,2,'files_trashbin/files/Documents.d1689937208/Welcome to Nextcloud Hub.docx','4640f84b4cacdcf5c5d8807aa7cab698',37,'Welcome to Nextcloud Hub.docx',17,5,24295,1689936524,1689936524,0,0,'64ba628ccad62',27,''),
(42,2,'files_trashbin/files/Readme.md.d1689937208','3234dc8992d3460b20dda6feac2f04c1',150,'Readme.md.d1689937208',10,9,206,1689936524,1689936524,0,0,'64ba628cd1d26',27,''),
(43,1,'appdata_octoue9ym05u/js','a53eff1f9f84e513fbe3df41716c526d',4,'js',2,1,527686,1689936528,1689936528,0,0,'64ba62900e1df',31,NULL),
(44,1,'appdata_octoue9ym05u/js/core','6165e5af82646d8d136ae44ef0e75929',43,'core',2,1,15582,1689936528,1689936528,0,0,'64ba62900ef05',31,NULL),
(45,1,'appdata_octoue9ym05u/js/core/merged-template-prepend.js','7c91ae550a8db7486d97a9f4c214b922',44,'merged-template-prepend.js',18,5,12238,1689937114,1689937114,0,0,'64ba64dadad83',27,''),
(46,1,'appdata_octoue9ym05u/js/core/merged-template-prepend.js.deps','2f77012e6b4365b12ecaf5c039db9819',44,'merged-template-prepend.js.deps',8,5,246,1689937114,1689937114,0,0,'64ba64dade70c',27,''),
(47,1,'appdata_octoue9ym05u/js/core/merged-template-prepend.js.gzip','dca3749a8486f1c32fcac738e8a9414f',44,'merged-template-prepend.js.gzip',19,5,3098,1689937114,1689937114,0,0,'64ba64dae032a',27,''),
(48,1,'appdata_octoue9ym05u/appstore','07bd921da901bbeee302460fe64ac64e',4,'appstore',2,1,2308839,1689936528,1689936528,0,0,'64ba629053954',31,NULL),
(49,1,'files_external','c270928b685e7946199afdfb898d27ea',1,'files_external',2,1,215902,1689936528,1689936528,0,0,'64ba62905becf',31,NULL),
(50,1,'files_external/rootcerts.crt','96f0eb1b0b28e846975c98dbeb5e734d',49,'rootcerts.crt',8,5,215902,1689936528,1689936528,0,0,'64ba6290574f6',27,''),
(51,1,'appdata_octoue9ym05u/appstore/apps.json','749eb0b4563fdf74edd24effb18a607c',48,'apps.json',20,5,2308839,1689936529,1689936529,0,0,'64ba629137359',27,''),
(52,1,'appdata_octoue9ym05u/preview','cd7f6d9f1676ef56a63c3a36c69c123f',4,'preview',2,1,2147687,1689936539,1689936539,0,0,'64ba629bae1ef',31,NULL),
(55,1,'appdata_octoue9ym05u/preview/c','23512252ace5964a8b87393f65a30916',52,'c',2,1,151708,1689936539,1689936539,0,0,'64ba629baf258',31,NULL),
(56,1,'appdata_octoue9ym05u/preview/6','7df3c91457ef30c39c317269d917c64f',52,'6',2,1,1008692,1689936539,1689936539,0,0,'64ba629baf33d',31,NULL),
(57,1,'appdata_octoue9ym05u/preview/c/1','893563ec22aacd0d7e1af7aabc286699',55,'1',2,1,151708,1689936539,1689936539,0,0,'64ba629bb0038',31,NULL),
(58,1,'appdata_octoue9ym05u/preview/6/3','4f9c9337fd26b97ce602813de3d1f61a',56,'3',2,1,829527,1689936539,1689936539,0,0,'64ba629bb0045',31,NULL),
(59,1,'appdata_octoue9ym05u/preview/c/1/6','4471b337f0eebe69c4057ef783d11049',57,'6',2,1,151708,1689936539,1689936539,0,0,'64ba629bb0442',31,NULL),
(60,1,'appdata_octoue9ym05u/preview/6/3/6','25969f08ce85779bfb31de57fb8f3567',58,'6',2,1,829527,1689936539,1689936539,0,0,'64ba629bb057e',31,NULL),
(61,1,'appdata_octoue9ym05u/preview/c/1/6/a','11276be6fd5ebe1e935bd7a8a3d9e2bf',59,'a',2,1,151708,1689936539,1689936539,0,0,'64ba629bb0793',31,NULL),
(62,1,'appdata_octoue9ym05u/preview/6/3/6/4','4e08389eb067c26110e9fd62ff16aefa',60,'4',2,1,829527,1689936539,1689936539,0,0,'64ba629bb095d',31,NULL),
(63,1,'appdata_octoue9ym05u/preview/c/1/6/a/5','3db8c5aaa4714f438f33542de7b06ff2',61,'5',2,1,151708,1689936539,1689936539,0,0,'64ba629bb0b38',31,NULL),
(64,1,'appdata_octoue9ym05u/preview/6/3/6/4/d','e93f70618ecbd7c8373a826a0df41161',62,'d',2,1,829527,1689936539,1689936539,0,0,'64ba629bb0d26',31,NULL),
(65,1,'appdata_octoue9ym05u/preview/c/1/6/a/5/3','593b46212d934d447e4ceff0773a10a0',63,'3',2,1,151708,1689936539,1689936539,0,0,'64ba629bb1017',31,NULL),
(66,1,'appdata_octoue9ym05u/preview/6/3/6/4/d/3','1c4f519485df662af97762c8dbe651e1',64,'3',2,1,829527,1689936539,1689936539,0,0,'64ba629bb1129',31,NULL),
(67,1,'appdata_octoue9ym05u/preview/6/e','6b5baab6782e8767c87b2c0a1ab7e831',56,'e',2,1,179165,1689936539,1689936539,0,0,'64ba629bb13bf',31,NULL),
(68,1,'appdata_octoue9ym05u/preview/c/1/6/a/5/3/2','9c4899898b0a57a6d95d00d7aecea9fb',65,'2',2,1,151708,1689936539,1689936539,0,0,'64ba629bb139d',31,NULL),
(69,1,'appdata_octoue9ym05u/preview/6/3/6/4/d/3/f','a6ef5e74564fc520ca4dc59e8d5e071c',66,'f',2,1,829527,1689936539,1689936539,0,0,'64ba629bb14bd',31,NULL),
(70,1,'appdata_octoue9ym05u/preview/6/e/a','4e795e2020f89cd7ab26043684eb326b',67,'a',2,1,179165,1689936539,1689936539,0,0,'64ba629bb173e',31,NULL),
(71,1,'appdata_octoue9ym05u/preview/c/1/6/a/5/3/2/31','46999cadfce90f3810750cf4022338f8',68,'31',2,1,151708,1689936539,1689936539,0,0,'64ba629bb182c',31,NULL),
(72,1,'appdata_octoue9ym05u/preview/6/3/6/4/d/3/f/32','ebbfa6fdd4920d45c373c35dfb1ac5ac',69,'32',2,1,829527,1689936539,1689936539,0,0,'64ba629bb1835',31,NULL),
(73,1,'appdata_octoue9ym05u/preview/6/e/a/9','f5f224c3077c1dff99549b7988084541',70,'9',2,1,179165,1689936539,1689936539,0,0,'64ba629bb1be2',31,NULL),
(74,1,'appdata_octoue9ym05u/preview/0','e84410086482a1f8e0359740404eb9d6',52,'0',2,1,246258,1689936539,1689936539,0,0,'64ba629bb1bb1',31,NULL),
(75,1,'appdata_octoue9ym05u/preview/3','b5dbfd8605c6c6ef066aa1b4b0e6a5d6',52,'3',2,1,371833,1689936539,1689936539,0,0,'64ba629bb1e98',31,NULL),
(76,1,'appdata_octoue9ym05u/preview/6/e/a/9/a','d5b2bab3de7ec71af61d3ed34e8ec7d5',73,'a',2,1,179165,1689936539,1689936539,0,0,'64ba629bb1f4e',31,NULL),
(77,1,'appdata_octoue9ym05u/preview/0/2','80a07fe1acd7b6523e7959e8ede2bcb7',74,'2',2,1,246258,1689936539,1689936539,0,0,'64ba629bb2071',31,NULL),
(78,1,'appdata_octoue9ym05u/preview/3/3','88e7e13fbf0b9ea67de38f672374b96a',75,'3',2,1,215639,1689936539,1689936539,0,0,'64ba629bb2089',31,NULL),
(79,1,'appdata_octoue9ym05u/preview/3/4','3e36db9ff0a9ae7dc4331c39d686b6fd',75,'4',2,1,156194,1689936539,1689936539,0,0,'64ba629bb223f',31,NULL),
(80,1,'appdata_octoue9ym05u/preview/6/e/a/9/a/b','20bc3f443d6804cb76a3f97bbcd6489a',76,'b',2,1,179165,1689936539,1689936539,0,0,'64ba629bb22d8',31,NULL),
(81,1,'appdata_octoue9ym05u/preview/0/2/e','8765eb87e23149a4f969a41f69f922ca',77,'e',2,1,246258,1689936539,1689936539,0,0,'64ba629bb252d',31,NULL),
(82,1,'appdata_octoue9ym05u/preview/6/e/a/9/a/b/1','dc3371dc02477079eea4968e0a5a2893',80,'1',2,1,179165,1689936539,1689936539,0,0,'64ba629bb2647',31,NULL),
(83,1,'appdata_octoue9ym05u/preview/3/3/e','ae9f0bc8b139b3f4365241e699074c7c',78,'e',2,1,215639,1689936539,1689936539,0,0,'64ba629bb264f',31,NULL),
(84,1,'appdata_octoue9ym05u/preview/3/4/1','7b95429b3516794d5e7bf62ea6e2484a',79,'1',2,1,156194,1689936539,1689936539,0,0,'64ba629bb2670',31,NULL),
(85,1,'appdata_octoue9ym05u/preview/6/e/a/9/a/b/1/29','311b7ed9505a0af1cd0e4f677fd4b9ac',82,'29',2,1,179165,1689936539,1689936539,0,0,'64ba629bb29da',31,NULL),
(86,1,'appdata_octoue9ym05u/preview/0/2/e/7','8f9c7bbc89ed9389051aad69ac6279d7',81,'7',2,1,246258,1689936539,1689936539,0,0,'64ba629bb28b7',31,NULL),
(87,1,'appdata_octoue9ym05u/preview/3/4/1/7','b0f2ab68615814481213629b61d4cc0c',84,'7',2,1,156194,1689936539,1689936539,0,0,'64ba629bb2ea4',31,NULL),
(88,1,'appdata_octoue9ym05u/preview/3/3/e/7','de9a68696ea65beb8933a36c003bf65e',83,'7',2,1,215639,1689936539,1689936539,0,0,'64ba629bb2fc2',31,NULL),
(89,1,'appdata_octoue9ym05u/preview/0/2/e/7/4','c625a8c0712e70fb080fade36e15afac',86,'4',2,1,246258,1689936539,1689936539,0,0,'64ba629bb2fcb',31,NULL),
(90,1,'appdata_octoue9ym05u/preview/3/4/1/7/3','3ad708da030f7a227b5be30bbf9be372',87,'3',2,1,156194,1689936539,1689936539,0,0,'64ba629bb3270',31,NULL),
(91,1,'appdata_octoue9ym05u/preview/3/3/e/7/5','9fc0125a10532ed0e8fcbc8a1a816bc5',88,'5',2,1,215639,1689936539,1689936539,0,0,'64ba629bb3393',31,NULL),
(92,1,'appdata_octoue9ym05u/preview/0/2/e/7/4/f','c6e297f1c81bfba8380fcab4c9ce5e54',89,'f',2,1,246258,1689936539,1689936539,0,0,'64ba629bb3646',31,NULL),
(93,1,'appdata_octoue9ym05u/preview/3/4/1/7/3/c','c8962ec37ea6c57221d0933935f049cc',90,'c',2,1,156194,1689936539,1689936539,0,0,'64ba629bb376a',31,NULL),
(94,1,'appdata_octoue9ym05u/preview/3/3/e/7/5/f','4192a66e7514d5fbd2a41fba2d0a4bfb',91,'f',2,1,215639,1689936539,1689936539,0,0,'64ba629bb376a',31,NULL),
(95,1,'appdata_octoue9ym05u/preview/0/2/e/7/4/f/1','7abb4b1f52d2a04424b1824a04485d48',92,'1',2,1,246258,1689936539,1689936539,0,0,'64ba629bb3a3b',31,NULL),
(96,1,'appdata_octoue9ym05u/preview/3/4/1/7/3/c/b','838138d7d4ea63d0b9cd8b6bbd59a1d4',93,'b',2,1,156194,1689936539,1689936539,0,0,'64ba629bb3b6e',31,NULL),
(97,1,'appdata_octoue9ym05u/preview/3/3/e/7/5/f/f','30a2e66771db74bfc740635668d6547a',94,'f',2,1,215639,1689936539,1689936539,0,0,'64ba629bb3e1b',31,NULL),
(98,1,'appdata_octoue9ym05u/preview/0/2/e/7/4/f/1/27','7c931291608d23f0747a27947c7393c3',95,'27',2,1,246258,1689936539,1689936539,0,0,'64ba629bb41ac',31,NULL),
(99,1,'appdata_octoue9ym05u/preview/3/4/1/7/3/c/b/30','a872327a3ddae0aeac16bcd74abff917',96,'30',2,1,156194,1689936539,1689936539,0,0,'64ba629bb40f0',31,NULL),
(100,1,'appdata_octoue9ym05u/preview/3/3/e/7/5/f/f/28','36fe1e280294611294aa95d493ca3a90',97,'28',2,1,215639,1689936539,1689936539,0,0,'64ba629bb4309',31,NULL),
(101,1,'appdata_octoue9ym05u/preview/3/4/1/7/3/c/b/30/1600-1067-max.jpg','d415c0cd97fb9d9e28eaae7b331d1768',99,'1600-1067-max.jpg',15,13,147631,1689936539,1689936539,0,0,'64ba629bca2f5',27,''),
(102,1,'appdata_octoue9ym05u/preview/c/1/6/a/5/3/2/31/1600-1067-max.jpg','6359327cdda5e7f70b6e6b4118a58ee6',71,'1600-1067-max.jpg',15,13,137923,1689936539,1689936539,0,0,'64ba629bd3622',27,''),
(103,1,'appdata_octoue9ym05u/preview/6/e/a/9/a/b/1/29/1600-1067-max.jpg','83ef82afc0192a2420a2182b8a91c176',85,'1600-1067-max.jpg',15,13,165982,1689936539,1689936539,0,0,'64ba629bd5a38',27,''),
(104,1,'appdata_octoue9ym05u/preview/0/2/e/7/4/f/1/27/1600-1067-max.jpg','a404047cb3f76ee66b011b6fbeb0c0e6',98,'1600-1067-max.jpg',15,13,232378,1689936539,1689936539,0,0,'64ba629bd91d4',27,''),
(105,1,'appdata_octoue9ym05u/preview/3/3/e/7/5/f/f/28/1200-1800-max.jpg','9e820290baf7c40bd9771e4b83ca8920',100,'1200-1800-max.jpg',15,13,207095,1689936539,1689936539,0,0,'64ba629bdd80a',27,''),
(106,1,'appdata_octoue9ym05u/preview/3/4/1/7/3/c/b/30/256-256-crop.jpg','1980fd353bc4eaa074921981c1a7fc8e',99,'256-256-crop.jpg',15,13,8563,1689936539,1689936539,0,0,'64ba629beb394',27,''),
(107,1,'appdata_octoue9ym05u/preview/c/1/6/a/5/3/2/31/256-256-crop.jpg','cd567fc1a3bb578cd8f2b0f7196baa96',71,'256-256-crop.jpg',15,13,13785,1689936539,1689936539,0,0,'64ba629bf0197',27,''),
(108,1,'appdata_octoue9ym05u/preview/6/e/a/9/a/b/1/29/256-256-crop.jpg','8eab68cfc211e1a0f9859cda1721665d',85,'256-256-crop.jpg',15,13,13183,1689936540,1689936540,0,0,'64ba629c03903',27,''),
(109,1,'appdata_octoue9ym05u/preview/0/2/e/7/4/f/1/27/256-256-crop.jpg','7b3b1ccada0b3d3bae40d2b7b8f45387',98,'256-256-crop.jpg',15,13,13880,1689936540,1689936540,0,0,'64ba629c05c7e',27,''),
(110,1,'appdata_octoue9ym05u/preview/6/3/6/4/d/3/f/32/3000-2000-max.jpg','5bc0f287d247d818931905174250764d',72,'3000-2000-max.jpg',15,13,808212,1689936540,1689936540,0,0,'64ba629c08d1b',27,''),
(111,1,'appdata_octoue9ym05u/preview/3/3/e/7/5/f/f/28/256-256-crop.jpg','c1cf4c6c40276b4ce60a52701b3c7de4',100,'256-256-crop.jpg',15,13,8544,1689936540,1689936540,0,0,'64ba629c0b37f',27,''),
(112,1,'appdata_octoue9ym05u/preview/1','054f8ecc496cc9a958d02f420f082fae',52,'1',2,1,369196,1689936540,1689936540,0,0,'64ba629c0e9ba',31,NULL),
(113,1,'appdata_octoue9ym05u/preview/1/8','c9aca3e9ed205fdb9d989d842aa04212',112,'8',2,1,369196,1689936540,1689936540,0,0,'64ba629c0ed90',31,NULL),
(114,1,'appdata_octoue9ym05u/preview/1/8/2','44ba3069b5b6d27fd47ff9ed635d8393',113,'2',2,1,369196,1689936540,1689936540,0,0,'64ba629c0f172',31,NULL),
(115,1,'appdata_octoue9ym05u/preview/1/8/2/b','1d445baf7eea70a601c6179ded98e7a3',114,'b',2,1,369196,1689936540,1689936540,0,0,'64ba629c0f678',31,NULL),
(116,1,'appdata_octoue9ym05u/preview/1/8/2/b/e','3097f03bd2c169a6a1f458cb036e83b6',115,'e',2,1,369196,1689936540,1689936540,0,0,'64ba629c0f979',31,NULL),
(117,1,'appdata_octoue9ym05u/preview/1/8/2/b/e/0','b62f017cb7bd93185cd336b931610c8b',116,'0',2,1,369196,1689936540,1689936540,0,0,'64ba629c0fc3a',31,NULL),
(118,1,'appdata_octoue9ym05u/preview/1/8/2/b/e/0/c','d3313a05323a7c2cbca971724ab22099',117,'c',2,1,369196,1689936540,1689936540,0,0,'64ba629c10109',31,NULL),
(119,1,'appdata_octoue9ym05u/preview/1/8/2/b/e/0/c/33','f0328e399cd1b4aec973c9c91d1757de',118,'33',2,1,369196,1689936540,1689936540,0,0,'64ba629c10456',31,NULL),
(120,1,'appdata_octoue9ym05u/preview/1/8/2/b/e/0/c/33/1600-1066-max.jpg','879b9308bc2ca5804df2cc8676c7c10f',119,'1600-1066-max.jpg',15,13,351167,1689936540,1689936540,0,0,'64ba629c308df',27,''),
(121,1,'appdata_octoue9ym05u/preview/6/3/6/4/d/3/f/32/256-256-crop.jpg','9b33cc231224387801d4b34cd2e35f23',72,'256-256-crop.jpg',15,13,21315,1689936540,1689936540,0,0,'64ba629c38b93',27,''),
(122,1,'appdata_octoue9ym05u/preview/1/8/2/b/e/0/c/33/256-256-crop.jpg','47e4741588c3b1932ad8d0acaaea834a',119,'256-256-crop.jpg',15,13,18029,1689936540,1689936540,0,0,'64ba629c4602a',27,''),
(123,2,'cache','0fea6a13c52b4d4725368f24b045ca84',2,'cache',2,1,0,1689937120,1689937120,0,0,'64ba64e0eff6a',31,NULL),
(124,1,'appdata_octoue9ym05u/js/files','62cf46cd2bf35be7b6ea3e55c245c1ae',43,'files',2,1,512104,1689937127,1689937127,0,0,'64ba64e72080d',31,NULL),
(125,1,'appdata_octoue9ym05u/js/files/merged-index.js','c3ddb87d88a795567d77c9d40d0c8a65',124,'merged-index.js',18,5,415795,1689937127,1689937127,0,0,'64ba64e722094',27,''),
(126,1,'appdata_octoue9ym05u/js/files/merged-index.js.deps','527071d3b1d3c2781e093fa2f6a4f839',124,'merged-index.js.deps',8,5,1962,1689937127,1689937127,0,0,'64ba64e72707e',27,''),
(127,1,'appdata_octoue9ym05u/js/files/merged-index.js.gzip','a94486621b6c7232db18266250e0e8bb',124,'merged-index.js.gzip',19,5,94347,1689937127,1689937127,0,0,'64ba64e7309a1',27,''),
(128,1,'appdata_octoue9ym05u/preview/1/f','e598f6f5c23b84c919d2e7052fb76286',112,'f',2,1,0,1689937128,1689937128,0,0,'64ba64e8533ca',31,NULL),
(129,1,'appdata_octoue9ym05u/preview/1/f/f','6214dfbe131667431022d06258dd9dea',128,'f',2,1,0,1689937128,1689937128,0,0,'64ba64e855005',31,NULL),
(130,1,'appdata_octoue9ym05u/preview/1/f/f/1','4269831b355ca2048bd7eb599fe17390',129,'1',2,1,0,1689937128,1689937128,0,0,'64ba64e85542f',31,NULL),
(131,1,'appdata_octoue9ym05u/preview/1/f/f/1/d','10fb6f5a89c56517b6bfc9b58571e827',130,'d',2,1,0,1689937128,1689937128,0,0,'64ba64e8557a6',31,NULL),
(132,1,'appdata_octoue9ym05u/preview/1/f/f/1/d/e','d639b7e7f4a96568b0a4e47247d6befe',131,'e',2,1,0,1689937128,1689937128,0,0,'64ba64e855c1c',31,NULL),
(133,1,'appdata_octoue9ym05u/preview/1/f/f/1/d/e/7','e92caef901ffa434957fcdb37b532761',132,'7',2,1,0,1689937128,1689937128,0,0,'64ba64e856117',31,NULL),
(134,1,'appdata_octoue9ym05u/preview/1/f/f/1/d/e/7/24','88a525386f768ced9d73893b76648f54',133,'24',2,1,0,1689937128,1689937128,0,0,'64ba64e8565e9',31,NULL),
(135,1,'appdata_octoue9ym05u/preview/a','7ad86cba7d09ccb4e71f123ac5aee3b1',52,'a',2,1,0,1689937128,1689937128,0,0,'64ba64e860240',31,NULL),
(136,1,'appdata_octoue9ym05u/preview/a/1','658dda6eb5faf499d8709f24fd464530',135,'1',2,1,0,1689937128,1689937128,0,0,'64ba64e860713',31,NULL),
(137,1,'appdata_octoue9ym05u/preview/a/1/d','468cbd5aa70fe49029d01f88e4819daf',136,'d',2,1,0,1689937128,1689937128,0,0,'64ba64e860bf6',31,NULL),
(138,1,'appdata_octoue9ym05u/preview/a/1/d/0','a19d781c4d8b6eeda7876b4d6f2c7270',137,'0',2,1,0,1689937128,1689937128,0,0,'64ba64e86100a',31,NULL),
(139,1,'appdata_octoue9ym05u/preview/a/1/d/0/c','682a66c6fbb6d3dc5e5596ce647a433e',138,'c',2,1,0,1689937128,1689937128,0,0,'64ba64e86134e',31,NULL),
(140,1,'appdata_octoue9ym05u/preview/a/1/d/0/c/6','c970d26912b6baa8f8ffd0f09ce23b4e',139,'6',2,1,0,1689937128,1689937128,0,0,'64ba64e861884',31,NULL),
(141,1,'appdata_octoue9ym05u/preview/a/1/d/0/c/6/e','00239d2ee3cc2da6c8b8b06261658547',140,'e',2,1,0,1689937128,1689937128,0,0,'64ba64e861b63',31,NULL),
(142,1,'appdata_octoue9ym05u/preview/a/1/d/0/c/6/e/42','5c76157c3eaf96de0bdb29b20a494e80',141,'42',2,1,0,1689937128,1689937128,0,0,'64ba64e861dec',31,NULL),
(143,1,'appdata_octoue9ym05u/text','964ebfe7f7da255c213813487e379fc0',4,'text',2,1,0,1689937128,1689937128,0,0,'64ba64e896b05',31,NULL),
(144,1,'appdata_octoue9ym05u/text/documents','57f3fc34126dbc9a73d6eeaa5ce91066',143,'documents',2,1,0,1689937128,1689937128,0,0,'64ba64e899c20',31,NULL),
(145,2,'files_trashbin','fb66dca5f27af6f15c1d1d81e6f8d28b',2,'files_trashbin',2,1,26998601,1689937208,1689937208,0,0,'64ba65389fb11',31,NULL),
(150,2,'files_trashbin/files','3014a771cbe30761f2e9ff3272110dbf',145,'files',2,1,26998601,1689937208,1689937208,0,0,'64ba65389fb11',31,NULL),
(151,2,'files_trashbin/versions','c639d144d3f1014051e14a98beac5705',145,'versions',2,1,0,1689937208,1689937208,0,0,'64ba653886e6b',31,NULL),
(152,2,'files_trashbin/keys','9195c7cfc1b867f229ac78cc1b6a0be3',145,'keys',2,1,0,1689937208,1689937208,0,0,'64ba653887608',31,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
INSERT INTO `oc_files_trash` VALUES
(1,'Nextcloud.png','admin','1689937208','.',NULL,NULL),
(2,'Nextcloud intro.mp4','admin','1689937208','.',NULL,NULL),
(3,'Templates','admin','1689937208','.',NULL,NULL),
(4,'Documents','admin','1689937208','.',NULL,NULL),
(5,'Photos','admin','1689937208','.',NULL,NULL),
(6,'Nextcloud Manual.pdf','admin','1689937208','.',NULL,NULL),
(7,'Readme.md','admin','1689937208','.',NULL,NULL),
(8,'Reasons to use Nextcloud.pdf','admin','1689937208','.',NULL,NULL);
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
(2,9,1689936523,13653,6,'[]'),
(3,10,1689936523,13441,7,'[]'),
(4,11,1689936523,38605,8,'[]'),
(5,12,1689936523,326,10,'[]'),
(6,13,1689936523,15961,11,'[]'),
(7,14,1689936523,573,10,'[]'),
(8,15,1689936523,16988,6,'[]'),
(9,16,1689936523,14810,12,'[]'),
(10,17,1689936523,13878,6,'[]'),
(11,18,1689936523,14316,12,'[]'),
(12,19,1689936523,11836,6,'[]'),
(13,20,1689936523,13378,7,'[]'),
(14,21,1689936523,52674,8,'[]'),
(15,22,1689936523,17276,11,'[]'),
(16,23,1689936523,554,10,'[]'),
(18,26,1689936523,427030,15,'[]'),
(19,27,1689936524,474653,15,'[]'),
(20,28,1689936524,567689,15,'[]'),
(21,29,1689936524,593508,15,'[]'),
(22,30,1689936524,457744,15,'[]'),
(23,31,1689936524,167989,15,'[]'),
(24,32,1689936524,797325,15,'[]'),
(25,33,1689936524,2170375,15,'[]'),
(26,34,1689936524,150,10,'[]'),
(29,38,1689936524,1095,10,'[]'),
(30,39,1689936524,136,10,'[]'),
(31,40,1689936524,1083339,16,'[]'),
(32,41,1689936524,24295,17,'[]');
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
(1,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1689936528,1689936528,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(2,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',1689936539,1689936539,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(3,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',1689937115,1689937115,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(4,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',1689937122,1689937122,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(5,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',1689937127,1689937127,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),
(6,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',1689937187,1689937187,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(7,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',1689937213,1689937213,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(8,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1689936517,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(9,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',0,1689936518,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(10,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1689936518,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(11,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(12,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(13,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(14,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(15,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(16,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(17,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(18,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(19,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(20,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(21,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',0,1689936519,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(22,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1689936520,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(23,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1689936521,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(24,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1689936521,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(25,'OCA\\Federation\\SyncJob','null',0,1689936521,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(26,'OCA\\Circles\\Cron\\Maintenance','null',0,1689936521,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(27,'OCA\\Text\\Cron\\Cleanup','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(28,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(29,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(30,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(31,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(32,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(33,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(34,'OC\\Log\\Rotate','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(35,'OC\\Preview\\BackgroundCleanupJob','null',0,1689936522,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),
(36,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[24]',0,1689936523,0,0,'99aa1d832e305a88104d7843ebe22c6b',1),
(37,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[26]',0,1689936524,0,0,'bd3b31fe7703d38d1de17e15e60a3fa0',1),
(38,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[27]',0,1689936524,0,0,'58fada4e93b9598d69062c39f488b9cc',1),
(39,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[28]',0,1689936524,0,0,'f39cd082a2cc6b3cea21cc70942d8a4e',1),
(40,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[29]',0,1689936524,0,0,'2d7a5fe4ae1457dcd4f00cd5e9494ede',1),
(41,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[30]',0,1689936524,0,0,'0b4e4af1e96181c3a3aa3401ed4b1996',1),
(42,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[31]',0,1689936524,0,0,'c379e3500d43aba727fe11c198f0ec6f',1),
(43,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[32]',0,1689936524,0,0,'191034da65d057b87a6a773781fb22a8',1),
(44,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[33]',0,1689936524,0,0,'1dc72169358ccb5ee7667fdab19a0d80',1),
(45,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin\"}',0,1689936538,0,0,'b974bbc90ef800c3b1539ac4f2aeddb7',1),
(46,'OC\\Command\\CommandJob','\"O:33:\\\"OCA\\\\Files_Trashbin\\\\Command\\\\Expire\\\":1:{s:39:\\\"\\u0000OCA\\\\Files_Trashbin\\\\Command\\\\Expire\\u0000user\\\";s:5:\\\"admin\\\";}\"',0,1689937208,0,0,'ca04d14eddadbe79d239365e539f2a65',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
(1,2,2,'admin','/admin/',NULL,'OC\\Files\\Mount\\ObjectHomeMountProvider');
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
(1,'firstrunwizard','admin',1689936536,'app','recognize','apphint-recognize','[]','','[]','','','[]'),
(2,'firstrunwizard','admin',1689936536,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),
(3,'firstrunwizard','admin',1689936536,'app','forms','apphint-forms','[]','','[]','','','[]'),
(4,'firstrunwizard','admin',1689936536,'app','deck','apphint-deck','[]','','[]','','','[]'),
(5,'firstrunwizard','admin',1689936536,'app','tasks','apphint-tasks','[]','','[]','','','[]');
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
('admin','core','lang','en'),
('admin','core','templateDirectory','Templates/'),
('admin','core','timezone','Europe/Stockholm'),
('admin','dashboard','firstRun','0'),
('admin','firstrunwizard','apphint','18'),
('admin','firstrunwizard','show','0'),
('admin','login','lastLogin','1689937120'),
('admin','login_token','3ajQfRMmNseJGgU7M8896v06/dXMkXrV','1689937121'),
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
(1,'object::store:amazon::nextcloud',1,NULL),
(2,'object::user:admin',1,NULL);
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
INSERT INTO `oc_text_documents` VALUES
(42,0,0,1689936524,'64ba628cd1d26','64ba628cd1d26');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
INSERT INTO `oc_text_sessions` VALUES
(1,'admin',NULL,'#d09e6d','K9jfsPiv02+RpGFXnt/2JmwejyzHFDvfF4g9oTFLvQBIaW07C+au2srVIg8Omht0',42,1689937128,NULL),
(2,'admin',NULL,'#d09e6d','SwbtbYgX2x9S7EM1m5Jr/Kw7lVyNxfs6ejunAHPN5Lb0HzSyOWaW92WPlaOe1B/K',42,1689937188,NULL);
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
(1,'admin','online',1689936539,0,NULL,NULL,NULL,NULL,0);
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
('admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$blBoejBjY3BXMUQ2M2p3aQ$ITQ65mRaiWXcsCQBabrLxcM5VGix2Y/kwktcfste5hk','admin');
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

-- Dump completed on 2023-07-21 11:00:46
