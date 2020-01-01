-- MySQL dump 10.16  Distrib 10.3.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db40
-- ------------------------------------------------------
-- Server version	5.5.25a

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
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (10,'培优部','北京'),(20,'就业部','上海'),(30,'大数据部','广州'),(40,'销售部','深圳');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `topid` int(11) DEFAULT NULL,
  `hdate` date DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1001,'王克晶','办事员',1007,'1980-12-17',800,500,20),(1003,'齐雷','分析员',1011,'1981-02-20',1900,300,10),(1005,'王海涛','推销员',1011,'1981-02-22',2450,600,10),(1007,'刘苍松','经理',1017,'1981-04-02',3675,700,20),(1009,'张慎政','推销员',1011,'1981-09-28',1250,1400,10),(1011,'陈子枢','经理',1017,'1981-05-01',3450,400,10),(1013,'张久军','办事员',1011,'1981-06-09',1250,800,10),(1015,'程祖红','分析员',1007,'1987-04-19',3000,1000,20),(1017,'韩少云','董事长',NULL,'1981-11-17',5000,NULL,NULL),(1019,'刘沛霞','推销员',1011,'1981-09-08',1500,500,10),(1021,'范传奇','办事员',1007,'1987-05-23',1100,1000,20),(1023,'赵栋','经理',1017,'1981-12-03',950,NULL,30),(1025,'朴乾','分析员',1023,'1981-12-03',3000,600,30),(1027,'叶尚青','办事员',1023,'1982-01-23',1300,400,30);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 11:50:51
