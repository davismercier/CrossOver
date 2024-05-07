CREATE DATABASE  IF NOT EXISTS `CrossOver` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CrossOver`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: CrossOver
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add class',1,'add_class'),(2,'Can change class',1,'change_class'),(3,'Can delete class',1,'delete_class'),(4,'Can view class',1,'view_class'),(5,'Can add benchmark',2,'add_benchmark'),(6,'Can change benchmark',2,'change_benchmark'),(7,'Can delete benchmark',2,'delete_benchmark'),(8,'Can view benchmark',2,'view_benchmark'),(9,'Can add current score',3,'add_currentscore'),(10,'Can change current score',3,'change_currentscore'),(11,'Can delete current score',3,'delete_currentscore'),(12,'Can view current score',3,'view_currentscore'),(13,'Can add workout',4,'add_workout'),(14,'Can change workout',4,'change_workout'),(15,'Can delete workout',4,'delete_workout'),(16,'Can view workout',4,'view_workout'),(17,'Can add log entry',5,'add_logentry'),(18,'Can change log entry',5,'change_logentry'),(19,'Can delete log entry',5,'delete_logentry'),(20,'Can view log entry',5,'view_logentry'),(21,'Can add permission',6,'add_permission'),(22,'Can change permission',6,'change_permission'),(23,'Can delete permission',6,'delete_permission'),(24,'Can view permission',6,'view_permission'),(25,'Can add group',7,'add_group'),(26,'Can change group',7,'change_group'),(27,'Can delete group',7,'delete_group'),(28,'Can view group',7,'view_group'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add content type',9,'add_contenttype'),(34,'Can change content type',9,'change_contenttype'),(35,'Can delete content type',9,'delete_contenttype'),(36,'Can view content type',9,'view_contenttype'),(37,'Can add session',10,'add_session'),(38,'Can change session',10,'change_session'),(39,'Can delete session',10,'delete_session'),(40,'Can view session',10,'view_session'),(41,'Can add membership',11,'add_membership'),(42,'Can change membership',11,'change_membership'),(43,'Can delete membership',11,'delete_membership'),(44,'Can view membership',11,'view_membership'),(45,'Can add member',12,'add_member'),(46,'Can change member',12,'change_member'),(47,'Can delete member',12,'delete_member'),(48,'Can view member',12,'view_member'),(49,'Can add past score',13,'add_pastscore'),(50,'Can change past score',13,'change_pastscore'),(51,'Can delete past score',13,'delete_pastscore'),(52,'Can view past score',13,'view_pastscore'),(53,'Can add sign up',14,'add_signup'),(54,'Can change sign up',14,'change_signup'),(55,'Can delete sign up',14,'delete_signup'),(56,'Can view sign up',14,'view_signup'),(57,'Can add scheduled class',15,'add_scheduledclass'),(58,'Can change scheduled class',15,'change_scheduledclass'),(59,'Can delete scheduled class',15,'delete_scheduledclass'),(60,'Can view scheduled class',15,'view_scheduledclass');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$AZmreP15jMnkeyIB9OyskR$1LYIqNL8Zu1zoVZQ/tDYXQHc997oTgZPLHGIS9lOsEY=','2022-04-14 00:42:00.378094',1,'davismercier','Davis','Mercier','davis.mercier0224@gmail.com',1,1,'2022-03-20 17:26:35.000000'),(14,'pbkdf2_sha256$320000$zEjMqMC9gRiVkBrJ1ZIwyT$PsmkrwP2Jg8ZK8cQF1t/OSsYxqZvMlJmcYOhDvxnZHw=','2022-03-27 20:45:02.379277',0,'n.cousins','Nick','Cousins','nick.cousins@gmail.com',0,1,'2022-03-27 20:44:20.318696'),(15,'pbkdf2_sha256$320000$IkB5cNmhEnqfNLCwHMAwr9$0c4zIZOHeaLbvgNZJATn8uBAOjDpINb0C9PchIXo4hI=','2022-04-10 20:34:09.598816',0,'k.mercier','Katie','Mercier','k.mercier@crossover.com',0,1,'2022-04-10 19:19:36.749527');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benchmarks_benchmark`
--

DROP TABLE IF EXISTS `benchmarks_benchmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benchmarks_benchmark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benchmarks_benchmark`
--

LOCK TABLES `benchmarks_benchmark` WRITE;
/*!40000 ALTER TABLE `benchmarks_benchmark` DISABLE KEYS */;
INSERT INTO `benchmarks_benchmark` VALUES (1,'benchmark #1'),(2,'benchmark #2');
/*!40000 ALTER TABLE `benchmarks_benchmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benchmarks_currentscore`
--

DROP TABLE IF EXISTS `benchmarks_currentscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benchmarks_currentscore` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `workout_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `benchmarks_currentsc_workout_id_b3c75ab6_fk_benchmark` (`workout_id`),
  KEY `benchmarks_currentscore_user_id_ae563c4d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `benchmarks_currentsc_workout_id_b3c75ab6_fk_benchmark` FOREIGN KEY (`workout_id`) REFERENCES `benchmarks_workout` (`id`),
  CONSTRAINT `benchmarks_currentscore_user_id_ae563c4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benchmarks_currentscore`
--

LOCK TABLES `benchmarks_currentscore` WRITE;
/*!40000 ALTER TABLE `benchmarks_currentscore` DISABLE KEYS */;
INSERT INTO `benchmarks_currentscore` VALUES (19,'400','2022-03-23',1,1),(20,'500','2022-03-23',1,2),(21,'333','2022-03-24',1,1),(22,'666','2022-03-24',1,2),(23,'40','2022-03-29',1,1),(24,'21','2022-03-29',1,2),(25,'none','2022-04-10',1,3),(26,'none','2022-04-10',1,4),(27,'24','2022-04-10',15,1),(28,'35','2022-04-10',15,2);
/*!40000 ALTER TABLE `benchmarks_currentscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benchmarks_workout`
--

DROP TABLE IF EXISTS `benchmarks_workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benchmarks_workout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benchmarks_workout`
--

LOCK TABLES `benchmarks_workout` WRITE;
/*!40000 ALTER TABLE `benchmarks_workout` DISABLE KEYS */;
INSERT INTO `benchmarks_workout` VALUES (1,'Workout #1'),(2,'Workout #2'),(3,'Workout #3'),(4,'Workout #4');
/*!40000 ALTER TABLE `benchmarks_workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benchmarks_workout_benchmarks`
--

DROP TABLE IF EXISTS `benchmarks_workout_benchmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benchmarks_workout_benchmarks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workout_id` bigint(20) NOT NULL,
  `benchmark_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `benchmarks_workout_bench_workout_id_benchmark_id_eba75bb1_uniq` (`workout_id`,`benchmark_id`),
  KEY `benchmarks_workout_b_benchmark_id_235fc3fb_fk_benchmark` (`benchmark_id`),
  CONSTRAINT `benchmarks_workout_b_benchmark_id_235fc3fb_fk_benchmark` FOREIGN KEY (`benchmark_id`) REFERENCES `benchmarks_benchmark` (`id`),
  CONSTRAINT `benchmarks_workout_b_workout_id_0ebb00c8_fk_benchmark` FOREIGN KEY (`workout_id`) REFERENCES `benchmarks_workout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benchmarks_workout_benchmarks`
--

LOCK TABLES `benchmarks_workout_benchmarks` WRITE;
/*!40000 ALTER TABLE `benchmarks_workout_benchmarks` DISABLE KEYS */;
INSERT INTO `benchmarks_workout_benchmarks` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2);
/*!40000 ALTER TABLE `benchmarks_workout_benchmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_class`
--

DROP TABLE IF EXISTS `classes_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `start_time` varchar(64) NOT NULL,
  `end_time` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_class`
--

LOCK TABLES `classes_class` WRITE;
/*!40000 ALTER TABLE `classes_class` DISABLE KEYS */;
INSERT INTO `classes_class` VALUES (1,'WOD','05:45:00','06:45:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(2,'WOD','07:30:00','08:30:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(3,'WOD','08:45:00','09:45:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(4,'WOD','14:45:00','15:45:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(5,'WOD','15:00:00','16:00:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(6,'WOD','17:30:00','18:30:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(7,'WOD','08:00:00','09:00:00','Our \"Workout of the Day\" that is accessible to all and different every day'),(8,'WOD','09:30:00','10:30:00','Our \"Workout of the Day\" that is accessible to all and different every day');
/*!40000 ALTER TABLE `classes_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_membership`
--

DROP TABLE IF EXISTS `classes_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_membership` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `membership_type` varchar(64) NOT NULL,
  `cost` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_membership`
--

LOCK TABLES `classes_membership` WRITE;
/*!40000 ALTER TABLE `classes_membership` DISABLE KEYS */;
INSERT INTO `classes_membership` VALUES (6,'single visit',15,'Single Class Pass','Access to a single class of your choice'),(7,'ten visit',75,'Student 10 Class Pass','Access to 10 individual classes (must be under 18)'),(8,'ten visit',100,'10 Class Pass','Access to 10 individual classes'),(9,'monthly membership',150,'Unlimited Monthly Membership','Access to an unlimited number of classes - expires 30 days after purchase');
/*!40000 ALTER TABLE `classes_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_scheduledclass`
--

DROP TABLE IF EXISTS `classes_scheduledclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_scheduledclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `class_option_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_scheduledcla_class_option_id_c22f447e_fk_classes_c` (`class_option_id`),
  CONSTRAINT `classes_scheduledcla_class_option_id_c22f447e_fk_classes_c` FOREIGN KEY (`class_option_id`) REFERENCES `classes_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_scheduledclass`
--

LOCK TABLES `classes_scheduledclass` WRITE;
/*!40000 ALTER TABLE `classes_scheduledclass` DISABLE KEYS */;
INSERT INTO `classes_scheduledclass` VALUES (13,'2022-04-15',4),(14,'2022-04-15',6);
/*!40000 ALTER TABLE `classes_scheduledclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_signup`
--

DROP TABLE IF EXISTS `classes_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_signup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `selected_class_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchased_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_signup_selected_class_id_e30c62a9_fk_classes_class_id` (`selected_class_id`),
  KEY `classes_signup_user_id_1771f40c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `classes_signup_selected_class_id_e30c62a9_fk_classes_class_id` FOREIGN KEY (`selected_class_id`) REFERENCES `classes_class` (`id`),
  CONSTRAINT `classes_signup_user_id_1771f40c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_signup`
--

LOCK TABLES `classes_signup` WRITE;
/*!40000 ALTER TABLE `classes_signup` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-20 17:27:38.868154','1','davismercier',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',8,1),(2,'2022-03-20 17:28:09.337596','1','benchmark #1',1,'[{\"added\": {}}]',2,1),(3,'2022-03-20 17:28:17.046374','2','benchmark #2',1,'[{\"added\": {}}]',2,1),(4,'2022-03-20 17:28:25.650012','1','Workout #1',1,'[{\"added\": {}}]',4,1),(5,'2022-03-20 17:28:33.024756','2','Workout #2',1,'[{\"added\": {}}]',4,1),(6,'2022-03-20 17:28:36.858751','3','Workout #3',1,'[{\"added\": {}}]',4,1),(7,'2022-03-20 17:28:41.414360','4','Workout #4',1,'[{\"added\": {}}]',4,1),(8,'2022-03-20 17:30:14.942964','2','Davis Mercier | Workout #1 | 2022-03-15 | 100',1,'[{\"added\": {}}]',3,1),(9,'2022-03-20 17:30:31.182176','3','Davis Mercier | Workout #2 | 2022-03-15 | 200',1,'[{\"added\": {}}]',3,1),(10,'2022-03-20 17:30:43.039837','4','Davis Mercier | Workout #3 | 2022-03-16 | 300',1,'[{\"added\": {}}]',3,1),(11,'2022-03-20 17:30:50.700458','5','Davis Mercier | Workout #4 | 2022-03-16 | 400',1,'[{\"added\": {}}]',3,1),(12,'2022-03-20 17:31:02.912947','2','Davis Mercier | Workout #1 | 2022-03-15 | 100',2,'[]',3,1),(13,'2022-03-20 17:31:37.240791','1','WOD - 5:45 am',1,'[{\"added\": {}}]',1,1),(14,'2022-03-20 17:31:45.470421','2','WOD - 7:30 am',1,'[{\"added\": {}}]',1,1),(15,'2022-03-20 17:31:54.861658','3','WOD - 8:45 am',1,'[{\"added\": {}}]',1,1),(16,'2022-03-20 17:32:05.319247','4','WOD - 2:45 pm',1,'[{\"added\": {}}]',1,1),(17,'2022-03-20 17:32:19.036918','5','WOD - 3:00 pm',1,'[{\"added\": {}}]',1,1),(18,'2022-03-20 17:32:39.581152','6','WOD - 5:30 pm',1,'[{\"added\": {}}]',1,1),(19,'2022-03-20 17:32:54.440390','7','WOD - 8:00 am',1,'[{\"added\": {}}]',1,1),(20,'2022-03-20 17:33:08.984989','8','WOD - 9:30 am',1,'[{\"added\": {}}]',1,1),(21,'2022-03-20 18:57:22.928738','1','Membership object (1)',1,'[{\"added\": {}}]',11,1),(22,'2022-03-20 18:57:41.782232','2','Membership object (2)',1,'[{\"added\": {}}]',11,1),(23,'2022-03-20 18:58:27.583670','3','Single Visit Pass',1,'[{\"added\": {}}]',11,1),(24,'2022-03-20 18:59:05.551195','3','Single Visit Pass',3,'',11,1),(25,'2022-03-20 18:59:05.559963','2','Free Day Pass',3,'',11,1),(26,'2022-03-20 18:59:05.561363','1','None',3,'',11,1),(27,'2022-03-20 18:59:20.341185','4','No Membership',1,'[{\"added\": {}}]',11,1),(28,'2022-03-20 18:59:30.579917','5','Free Day Pass',1,'[{\"added\": {}}]',11,1),(29,'2022-03-20 18:59:46.964043','6','Single Class Pass',1,'[{\"added\": {}}]',11,1),(30,'2022-03-20 19:00:08.202779','7','Student 10 Class Punch Pass',1,'[{\"added\": {}}]',11,1),(31,'2022-03-20 19:00:20.731403','8','10 Visit Punch Pass',1,'[{\"added\": {}}]',11,1),(32,'2022-03-20 19:00:35.168362','9','Unlimited Monthly Membership',1,'[{\"added\": {}}]',11,1),(33,'2022-03-20 19:07:44.534979','1','Member object (1)',1,'[{\"added\": {}}]',12,1),(34,'2022-03-20 19:09:25.949239','1','Davis Mercier',3,'',12,1),(35,'2022-03-21 01:25:57.230479','4','No Membership',3,'',11,1),(36,'2022-03-21 01:37:31.875736','5','Free Day Pass',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',11,1),(37,'2022-03-21 01:37:50.661822','6','Single Class Pass',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',11,1),(38,'2022-03-21 01:38:23.699386','7','Student 10 Class Pass',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',11,1),(39,'2022-03-21 01:38:40.556127','8','10 Visit Pass',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',11,1),(40,'2022-03-21 01:38:57.911542','9','Unlimited Monthly Membership',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',11,1),(41,'2022-03-21 01:40:44.765498','9','Unlimited Monthly Membership',2,'[]',11,1),(42,'2022-03-21 01:40:51.063034','9','Unlimited Monthly Membership',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',11,1),(43,'2022-03-21 01:45:18.474144','8','10 Class Pass',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(44,'2022-03-21 01:49:27.504018','2','Davis Mercier',1,'[{\"added\": {}}]',12,1),(45,'2022-03-23 21:34:34.445548','10','Davis Mercier | Workout #2 | 2022-03-23 | 292',3,'',3,1),(46,'2022-03-23 21:34:34.462161','9','Davis Mercier | Workout #1 | 2022-03-23 | 191',3,'',3,1),(47,'2022-03-23 21:34:34.466953','8','Davis Mercier | Workout #2 | 2022-03-23 | 223',3,'',3,1),(48,'2022-03-23 21:34:34.469726','7','Davis Mercier | Workout #1 | 2022-03-23 | 112',3,'',3,1),(49,'2022-03-23 21:34:34.472083','6','Davis Mercier | Workout #1 | 2022-01-01 | 4',3,'',3,1),(50,'2022-03-23 21:34:34.474484','5','Davis Mercier | Workout #4 | 2022-03-16 | 400',3,'',3,1),(51,'2022-03-23 21:34:34.478682','4','Davis Mercier | Workout #3 | 2022-03-16 | 300',3,'',3,1),(52,'2022-03-23 21:34:34.482195','3','Davis Mercier | Workout #2 | 2022-03-23 | 2000',3,'',3,1),(53,'2022-03-23 21:34:34.484451','2','Davis Mercier | Workout #1 | 2022-03-23 | 1000',3,'',3,1),(54,'2022-03-23 21:51:54.267915','18','Davis Mercier | Workout #2 | 2022-03-23 | 600',3,'',3,1),(55,'2022-03-23 21:51:54.275978','17','Davis Mercier | Workout #1 | 2022-03-23 | 500',3,'',3,1),(56,'2022-03-23 21:51:54.278149','16','Davis Mercier | Workout #2 | 2022-03-23 | 400',3,'',3,1),(57,'2022-03-23 21:51:54.280126','15','Davis Mercier | Workout #1 | 2022-03-23 | 300',3,'',3,1),(58,'2022-03-23 21:51:54.282914','14','Davis Mercier | Workout #2 | 2022-03-23 | 200',3,'',3,1),(59,'2022-03-23 21:51:54.286378','13','Davis Mercier | Workout #1 | 2022-03-23 | 100',3,'',3,1),(60,'2022-03-23 21:51:54.292190','12','Davis Mercier | Workout #2 | 2022-03-23 | none',3,'',3,1),(61,'2022-03-23 21:51:54.293414','11','Davis Mercier | Workout #1 | 2022-03-23 | none',3,'',3,1),(62,'2022-03-25 13:33:12.833160','1','SignUp object (1)',2,'[]',14,1),(63,'2022-03-25 13:34:28.025154','2','SignUp object (2)',3,'',14,1),(64,'2022-03-25 13:34:30.860056','1','SignUp object (1)',3,'',14,1),(65,'2022-03-27 19:19:52.853069','8','10 Class Pass',2,'[{\"changed\": {\"fields\": [\"Membership type\"]}}]',11,1),(66,'2022-03-27 19:19:57.417789','7','Student 10 Class Pass',2,'[{\"changed\": {\"fields\": [\"Membership type\"]}}]',11,1),(67,'2022-03-27 19:20:07.871896','6','Single Class Pass',2,'[]',11,1),(68,'2022-03-27 19:20:10.935124','5','Free Day Pass',2,'[]',11,1),(69,'2022-03-27 19:21:22.898257','9','Unlimited Monthly Membership',2,'[]',11,1),(70,'2022-03-27 19:30:36.222043','5','Free Day Pass',3,'',11,1),(71,'2022-03-27 19:43:52.885092','2','Davis Mercier',2,'[{\"changed\": {\"fields\": [\"Passes\"]}}]',12,1),(72,'2022-03-27 19:44:19.561738','2','Davis Mercier',2,'[]',12,1),(73,'2022-03-27 19:48:15.276158','2','andre.mercier',3,'',8,1),(74,'2022-03-27 19:48:15.279838','3','n.cousins',3,'',8,1),(75,'2022-03-27 19:51:03.168501','4','n.cousins',3,'',8,1),(76,'2022-03-27 19:52:32.774845','5','n.cousins',3,'',8,1),(77,'2022-03-27 19:58:51.720013','9','Unlimited Monthly Membership',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',11,1),(78,'2022-03-27 20:08:09.979159','6','n.cousins',3,'',8,1),(79,'2022-03-27 20:09:37.746135','7','n.cousins',3,'',8,1),(80,'2022-03-27 20:14:33.707891','8','n.cousins',3,'',8,1),(81,'2022-03-27 20:29:40.449245','10','andremercier',3,'',8,1),(82,'2022-03-27 20:29:40.453340','9','n.cousins',3,'',8,1),(83,'2022-03-27 20:36:55.521969','3','Nick Cousins',3,'',12,1),(84,'2022-03-27 20:37:03.513903','11','n.cousins',3,'',8,1),(85,'2022-03-27 20:40:02.189469','12','n.cousins',3,'',8,1),(86,'2022-03-27 20:43:58.884958','13','n.cousins',3,'',8,1),(87,'2022-03-29 21:11:42.165001','1','ScheduledClass object (1)',1,'[{\"added\": {}}]',15,1),(88,'2022-03-29 21:11:47.283320','2','ScheduledClass object (2)',1,'[{\"added\": {}}]',15,1),(89,'2022-03-29 21:21:29.678431','2','WOD - 7:30 am on 2022-03-29',3,'',15,1),(90,'2022-03-29 21:21:29.685638','1','WOD - 5:45 am on 2022-03-29',3,'',15,1),(91,'2022-03-29 21:21:37.195982','3','WOD - 5:30 pm on 2022-03-29',1,'[{\"added\": {}}]',15,1),(92,'2022-03-29 21:30:54.279456','4','WOD - 5:45 am on 2022-03-30',1,'[{\"added\": {}}]',15,1),(93,'2022-03-29 21:31:01.306264','5','WOD - 7:30 am on 2022-03-30',1,'[{\"added\": {}}]',15,1),(94,'2022-03-29 21:31:02.396263','5','WOD - 7:30 am on 2022-03-30',2,'[]',15,1),(95,'2022-04-10 15:22:11.418846','5','WOD - 7:30 am on 2022-03-30',3,'',15,1),(96,'2022-04-10 15:22:11.427849','4','WOD - 5:45 am on 2022-03-30',3,'',15,1),(97,'2022-04-10 15:22:11.430094','3','WOD - 5:30 pm on 2022-03-29',3,'',15,1),(98,'2022-04-10 15:22:21.692515','6','WOD - 5:45 am on 2022-04-11',1,'[{\"added\": {}}]',15,1),(99,'2022-04-10 15:22:27.587751','7','WOD - 7:30 am on 2022-04-11',1,'[{\"added\": {}}]',15,1),(100,'2022-04-10 15:22:38.246466','8','WOD - 8:45 am on 2022-04-11',1,'[{\"added\": {}}]',15,1),(101,'2022-04-10 15:22:44.602292','9','WOD - 2:45 pm on 2022-04-11',1,'[{\"added\": {}}]',15,1),(102,'2022-04-10 15:22:51.783928','10','WOD - 5:30 pm on 2022-04-11',1,'[{\"added\": {}}]',15,1),(103,'2022-04-10 16:49:23.047066','7','WOD - 7:30 am on 2022-04-11',3,'',14,1),(104,'2022-04-10 16:49:23.053479','6','WOD - 8:45 am on 2022-04-11',3,'',14,1),(105,'2022-04-10 16:49:23.056034','4','WOD - 7:30 am on 2022-03-30',3,'',14,1),(106,'2022-04-10 16:49:23.058807','3','WOD - 7:30 am on 2022-03-28',3,'',14,1),(107,'2022-04-10 16:50:24.798888','2','Davis Mercier',2,'[{\"changed\": {\"fields\": [\"Membership expiration date\"]}}]',12,1),(108,'2022-04-10 16:50:28.048735','2','Davis Mercier',2,'[]',12,1),(109,'2022-04-10 16:55:32.627487','2','Davis Mercier',2,'[{\"changed\": {\"fields\": [\"Passes\"]}}]',12,1),(110,'2022-04-10 17:22:54.430798','10','WOD - 2:45 pm on 2022-04-11',3,'',14,1),(111,'2022-04-10 17:23:01.960808','9','WOD - 8:45 am on 2022-04-11',3,'',14,1),(112,'2022-04-10 17:23:01.966174','8','WOD - 7:30 am on 2022-04-11',3,'',14,1),(113,'2022-04-10 17:23:01.969215','5','WOD - 5:45 am on 2022-04-11',3,'',14,1),(114,'2022-04-10 20:15:11.553222','2','Davis Mercier',2,'[{\"changed\": {\"fields\": [\"Membership expiration date\"]}}]',12,1),(115,'2022-04-10 20:16:01.288396','2','Davis Mercier',2,'[{\"changed\": {\"fields\": [\"Membership expiration date\"]}}]',12,1),(116,'2022-04-10 20:32:00.066520','15','WOD - 5:45 am on 2022-04-11',3,'',14,1),(117,'2022-04-10 20:32:14.773525','11','WOD - 9:30 am on 2022-04-10',1,'[{\"added\": {}}]',15,1),(118,'2022-04-10 20:33:04.877354','11','WOD - 9:30 am on 2022-04-10',3,'',15,1),(119,'2022-04-10 20:33:11.736450','12','WOD - 5:30 pm on 2022-04-10',1,'[{\"added\": {}}]',15,1),(120,'2022-04-15 14:18:53.679418','12','WOD - 5:30 pm on 2022-04-10',3,'',15,1),(121,'2022-04-15 14:18:53.705793','10','WOD - 5:30 pm on 2022-04-11',3,'',15,1),(122,'2022-04-15 14:18:53.709686','9','WOD - 2:45 pm on 2022-04-11',3,'',15,1),(123,'2022-04-15 14:18:53.713788','8','WOD - 8:45 am on 2022-04-11',3,'',15,1),(124,'2022-04-15 14:18:53.717818','7','WOD - 7:30 am on 2022-04-11',3,'',15,1),(125,'2022-04-15 14:18:53.722099','6','WOD - 5:45 am on 2022-04-11',3,'',15,1),(126,'2022-04-15 14:19:05.078117','13','WOD - 2:45 pm on 2022-04-15',1,'[{\"added\": {}}]',15,1),(127,'2022-04-15 14:19:11.700053','14','WOD - 5:30 pm on 2022-04-15',1,'[{\"added\": {}}]',15,1),(128,'2022-04-15 14:25:06.107657','18','WOD - 5:45 am on 2022-04-11',3,'',14,1),(129,'2022-04-15 14:25:06.112379','17','WOD - 5:30 pm on 2022-04-10',3,'',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(7,'auth','group'),(6,'auth','permission'),(8,'auth','user'),(2,'benchmarks','benchmark'),(3,'benchmarks','currentscore'),(13,'benchmarks','pastscore'),(4,'benchmarks','workout'),(1,'classes','class'),(11,'classes','membership'),(15,'classes','scheduledclass'),(14,'classes','signup'),(9,'contenttypes','contenttype'),(10,'sessions','session'),(12,'users','member');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-20 17:24:19.347710'),(2,'auth','0001_initial','2022-03-20 17:24:19.473212'),(3,'admin','0001_initial','2022-03-20 17:24:19.502478'),(4,'admin','0002_logentry_remove_auto_add','2022-03-20 17:24:19.509880'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-20 17:24:19.513944'),(6,'contenttypes','0002_remove_content_type_name','2022-03-20 17:24:19.535391'),(7,'auth','0002_alter_permission_name_max_length','2022-03-20 17:24:19.546495'),(8,'auth','0003_alter_user_email_max_length','2022-03-20 17:24:19.557077'),(9,'auth','0004_alter_user_username_opts','2022-03-20 17:24:19.560363'),(10,'auth','0005_alter_user_last_login_null','2022-03-20 17:24:19.572638'),(11,'auth','0006_require_contenttypes_0002','2022-03-20 17:24:19.574482'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-20 17:24:19.580084'),(13,'auth','0008_alter_user_username_max_length','2022-03-20 17:24:19.597617'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-20 17:24:19.615679'),(15,'auth','0010_alter_group_name_max_length','2022-03-20 17:24:19.625752'),(16,'auth','0011_update_proxy_permissions','2022-03-20 17:24:19.629098'),(17,'auth','0012_alter_user_first_name_max_length','2022-03-20 17:24:19.640688'),(18,'benchmarks','0001_initial','2022-03-20 17:24:19.694003'),(19,'classes','0001_initial','2022-03-20 17:24:19.699294'),(20,'sessions','0001_initial','2022-03-20 17:24:19.707079'),(21,'classes','0002_membership','2022-03-20 18:37:24.763057'),(22,'classes','0003_alter_membership_membership_type','2022-03-20 18:44:10.919334'),(23,'classes','0004_remove_membership_expiration_date_membership_cost','2022-03-20 18:47:57.410418'),(24,'classes','0005_remove_membership_user','2022-03-20 18:51:12.240116'),(25,'classes','0006_remove_membership_purchase_date_membership_name','2022-03-20 18:55:56.631080'),(26,'classes','0007_alter_membership_membership_type','2022-03-20 19:06:48.557303'),(27,'users','0001_initial','2022-03-20 19:06:48.639125'),(28,'classes','0008_membership_description','2022-03-21 01:36:56.445699'),(29,'classes','0009_alter_membership_description','2022-03-21 01:40:34.918251'),(30,'benchmarks','0002_pastscore','2022-03-23 01:13:58.280438'),(31,'benchmarks','0003_delete_pastscore','2022-03-23 01:15:33.549082'),(32,'benchmarks','0004_pastscore_alter_workout_users_pastscore_workout','2022-03-23 01:26:42.834366'),(33,'benchmarks','0005_alter_workout_users_delete_pastscore','2022-03-23 01:28:06.559835'),(34,'benchmarks','0006_pastscore_remove_workout_users_workout_users_cs_and_more','2022-03-23 01:40:33.318464'),(35,'benchmarks','0007_remove_workout_users_cs_remove_workout_users_ps_and_more','2022-03-23 01:44:58.415253'),(36,'classes','0010_signup_class_user_signup_selected_class_signup_user','2022-03-25 09:54:09.980690'),(37,'classes','0011_alter_membership_membership_type','2022-03-27 19:43:24.730664'),(38,'users','0002_member_has_monthly_membership_and_more','2022-03-27 19:43:24.923921'),(39,'classes','0012_scheduledclass','2022-03-29 21:10:17.041624'),(40,'classes','0013_remove_class_days_of_week','2022-03-29 21:36:33.062054'),(41,'classes','0014_signup_purchased_type','2022-04-10 17:26:35.307576');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('103xxwfl5by429vxxifv0bd2gu4gsdsu','.eJxVzMEOwiAQBNB_4WyIgGyJR-9-A9llt1I1kJT21Pjv0qQHvc68mU1FXJcc1yZznFhdlVGn34wwvaTsBT-xPKpOtSzzRHon-mibvleW9-2wfwcZW-5r8YmFKMBlBGTjiMgzwYCJySMAWDCWzgGTEweIwVk7dm4Hb6Br9fkCG484qw:1nenYe:qUxeXoWMOwKKosU5LeQGIPPdr2YCb9eFY-oFWbnFTPg','2022-04-28 00:42:00.383866'),('znp56txie1k9d4trr02sau5zs8id0wed','.eJxVzMEOwiAQBNB_4WyIgGyJR-9-A9llt1I1kJT21Pjv0qQHvc68mU1FXJcc1yZznFhdlVGn34wwvaTsBT-xPKpOtSzzRHon-mibvleW9-2wfwcZW-5r8YmFKMBlBGTjiMgzwYCJySMAWDCWzgGTEweIwVk7dm4Hb6Br9fkCG484qw:1ndapz:FhmS6tSLobZx233KQUBDBMrWW2M17_tSSms7Hl60XL4','2022-04-24 16:54:55.825600');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_member`
--

DROP TABLE IF EXISTS `users_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passes` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `has_monthly_membership` tinyint(1) NOT NULL,
  `membership_expiration_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_member_user_id_b4cd9a3f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_member`
--

LOCK TABLES `users_member` WRITE;
/*!40000 ALTER TABLE `users_member` DISABLE KEYS */;
INSERT INTO `users_member` VALUES (2,10,1,1,'2022-05-10'),(4,1,14,0,'2022-03-27'),(5,0,15,0,'2022-04-10');
/*!40000 ALTER TABLE `users_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 10:26:39
