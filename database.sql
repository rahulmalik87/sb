-- MySQL dump 10.13  Distrib 8.0.33, for macos13.4 (arm64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
--

--
-- Table structure for table `tt_1`
--

DROP TABLE IF EXISTS `tt_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_1` (
  `ipkey` int NOT NULL,
  `v1` varchar(18) DEFAULT NULL,
  `f2` float DEFAULT NULL,
  `i3` int NOT NULL AUTO_INCREMENT,
  `c4` char(30) DEFAULT NULL,
  `i5` int DEFAULT NULL,
  `i6` int DEFAULT NULL,
  `i7` int DEFAULT NULL,
  `v8` varchar(29) DEFAULT NULL,
  `f9` float DEFAULT NULL,
  `f10` float DEFAULT NULL,
  `v11` varchar(11) DEFAULT NULL,
  `i12` int DEFAULT NULL,
  `i13` int DEFAULT NULL,
  PRIMARY KEY (`ipkey`),
  KEY `tt_1i1` (`i3`,`v8` DESC),
  KEY `tt_1i0` (`ipkey`,`c4` DESC,`i12`),
  KEY `tt_1i2` (`i13`,`v8`,`i7` DESC,`v1` DESC,`i6` DESC,`f10`,`i5` DESC,`f9`,`i12`,`i3`)
) ENGINE=InnoDB AUTO_INCREMENT=15000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_1_fk`
--

DROP TABLE IF EXISTS `tt_1_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_1_fk` (
  `ifk_col` int DEFAULT NULL,
  `f0` float DEFAULT NULL,
  `t1` tinyint(1) DEFAULT NULL,
  `i2` int NOT NULL AUTO_INCREMENT,
  `f3` float DEFAULT NULL,
  `i4` int DEFAULT NULL,
  `v5` varchar(30) DEFAULT NULL,
  `i6` int DEFAULT NULL,
  KEY `tt_1_fki0` (`i2`,`ifk_col` DESC,`i4`),
  KEY `tt_1_fki1` (`ifk_col` DESC,`v5` DESC,`t1`,`i4` DESC,`i2`,`f0`),
  KEY `tt_1_fki2` (`f3`,`i2`,`v5`,`f0`,`t1`,`i6`,`ifk_col` DESC,`i4`),
  KEY `tt_1_fk_tt_1` (`ifk_col`),
  CONSTRAINT `tt_1_fk_tt_1` FOREIGN KEY (`ifk_col`) REFERENCES `tt_1` (`ipkey`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_2`
--

DROP TABLE IF EXISTS `tt_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_2` (
  `ipkey` int NOT NULL AUTO_INCREMENT,
  `d1` double DEFAULT NULL,
  `v2` varchar(24) DEFAULT NULL,
  `d3` double DEFAULT NULL,
  `v4` varchar(24) DEFAULT NULL,
  `c5` char(10) DEFAULT NULL,
  `v6` varchar(12) DEFAULT NULL,
  `v7` varchar(27) DEFAULT NULL,
  `t8` tinyint(1) DEFAULT NULL,
  `t9` tinyint(1) DEFAULT NULL,
  `i10` int DEFAULT NULL,
  `v11` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ipkey`),
  KEY `tt_2i1` (`ipkey` DESC),
  KEY `tt_2i0` (`v11`,`v7`,`ipkey` DESC,`t9`,`i10`,`d1`),
  KEY `tt_2i2` (`d1` DESC,`t8`,`c5`,`t9`)
) ENGINE=InnoDB AUTO_INCREMENT=30000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_2_fk`
--

DROP TABLE IF EXISTS `tt_2_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_2_fk` (
  `ifk_col` int DEFAULT NULL,
  `d0` double DEFAULT NULL,
  `c1` char(27) DEFAULT NULL,
  `t2` tinyint(1) DEFAULT NULL,
  `t3` tinyint(1) DEFAULT NULL,
  `i4` int DEFAULT NULL,
  `i5` int DEFAULT NULL,
  `i6` int DEFAULT NULL,
  KEY `tt_2_fki1` (`i5`,`i4`,`ifk_col` DESC),
  KEY `tt_2_fki0` (`i4`,`ifk_col` DESC,`t3`,`i5` DESC,`c1`),
  KEY `tt_2_fki2` (`i6`,`ifk_col` DESC,`d0` DESC,`c1`,`i4`,`t3` DESC,`i5`),
  KEY `tt_2_fk_tt_2` (`ifk_col`),
  CONSTRAINT `tt_2_fk_tt_2` FOREIGN KEY (`ifk_col`) REFERENCES `tt_2` (`ipkey`) ON DELETE CASCADE ON UPDATE SET DEFAULT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_3`
--

DROP TABLE IF EXISTS `tt_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_3` (
  `ipkey` int NOT NULL AUTO_INCREMENT,
  `i1` int DEFAULT NULL,
  `v2` varchar(25) DEFAULT NULL,
  `c3` char(30) DEFAULT NULL,
  `f4` float DEFAULT NULL,
  `i5` int DEFAULT NULL,
  `v6` varchar(14) DEFAULT NULL,
  `t7` tinyint(1) DEFAULT NULL,
  `v8` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ipkey`),
  KEY `tt_3i2` (`ipkey` DESC,`v2`,`t7`,`c3`,`i1`),
  KEY `tt_3i0` (`v2`,`v6`),
  KEY `tt_3i1` (`i5` DESC,`v2`,`v8`,`t7` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=30000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_3_fk`
--

DROP TABLE IF EXISTS `tt_3_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_3_fk` (
  `ifk_col` int DEFAULT NULL,
  `i0` int DEFAULT NULL,
  `d1` double DEFAULT NULL,
  `c2` char(13) DEFAULT NULL,
  `c3` char(25) DEFAULT NULL,
  `v4` varchar(16) DEFAULT NULL,
  `i5` int NOT NULL AUTO_INCREMENT,
  `i6` int DEFAULT NULL,
  `i7` int DEFAULT NULL,
  `v8` varchar(22) DEFAULT NULL,
  `c9` char(29) DEFAULT NULL,
  `v10` varchar(22) DEFAULT NULL,
  KEY `tt_3_fki0` (`i5` DESC,`d1`,`c9`),
  KEY `tt_3_fki1` (`c9` DESC,`c2` DESC,`ifk_col`,`v4`),
  KEY `tt_3_fki2` (`i0` DESC,`i5`,`d1`),
  KEY `tt_3_fk_tt_3` (`ifk_col`),
  CONSTRAINT `tt_3_fk_tt_3` FOREIGN KEY (`ifk_col`) REFERENCES `tt_3` (`ipkey`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_4`
--

DROP TABLE IF EXISTS `tt_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_4` (
  `ipkey` int NOT NULL,
  `t1` tinyint(1) DEFAULT NULL,
  `d2` double DEFAULT NULL,
  `d3` double DEFAULT NULL,
  `c4` char(25) DEFAULT NULL,
  `v5` varchar(27) DEFAULT NULL,
  `i6` int DEFAULT NULL,
  `f7` float DEFAULT NULL,
  `i8` int DEFAULT NULL,
  `c9` char(12) DEFAULT NULL,
  `v10` varchar(10) DEFAULT NULL,
  `i11` int NOT NULL AUTO_INCREMENT,
  `t12` tinyint(1) DEFAULT NULL,
  `c13` char(26) DEFAULT NULL,
  `c14` char(19) DEFAULT NULL,
  PRIMARY KEY (`ipkey`),
  KEY `tt_4i2` (`i11`,`t12`,`ipkey`,`d3`),
  KEY `tt_4i0` (`v10`,`d3`,`v5`),
  KEY `tt_4i1` (`d3` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=15000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_4_fk`
--

DROP TABLE IF EXISTS `tt_4_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_4_fk` (
  `ifk_col` int DEFAULT NULL,
  `i0` int NOT NULL AUTO_INCREMENT,
  `d1` double DEFAULT NULL,
  `v2` varchar(29) DEFAULT NULL,
  `v3` varchar(14) DEFAULT NULL,
  `i4` int DEFAULT NULL,
  `v5` varchar(24) DEFAULT NULL,
  `d6` double DEFAULT NULL,
  `c7` char(15) DEFAULT NULL,
  `i8` int DEFAULT NULL,
  `d9` double DEFAULT NULL,
  `d10` double DEFAULT NULL,
  `c11` char(22) DEFAULT NULL,
  `d12` double DEFAULT NULL,
  `c13` char(19) DEFAULT NULL,
  `d14` double DEFAULT NULL,
  KEY `tt_4_fki2` (`i0`,`d6`),
  KEY `tt_4_fki0` (`c11`,`i0` DESC,`d1`,`c13` DESC,`v5`),
  KEY `tt_4_fki1` (`v3`,`d12`,`c7`,`ifk_col` DESC,`d10`,`c11`,`d6` DESC,`i4`,`i8` DESC,`d1`),
  KEY `tt_4_fk_tt_4` (`ifk_col`),
  CONSTRAINT `tt_4_fk_tt_4` FOREIGN KEY (`ifk_col`) REFERENCES `tt_4` (`ipkey`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_5`
--

DROP TABLE IF EXISTS `tt_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_5` (
  `ipkey` int NOT NULL AUTO_INCREMENT,
  `v1` varchar(20) DEFAULT NULL,
  `v2` varchar(24) DEFAULT NULL,
  `d3` double DEFAULT NULL,
  `f4` float DEFAULT NULL,
  PRIMARY KEY (`ipkey`),
  KEY `tt_5i0` (`ipkey`,`v1`),
  KEY `tt_5i1` (`v2`,`v1`,`f4`),
  KEY `tt_5i2` (`v2` DESC,`v1`)
) ENGINE=InnoDB AUTO_INCREMENT=30000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_5_fk`
--

DROP TABLE IF EXISTS `tt_5_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt_5_fk` (
  `ifk_col` int DEFAULT NULL,
  `i0` int DEFAULT NULL,
  `f1` float DEFAULT NULL,
  `i2` int DEFAULT NULL,
  `c3` char(20) DEFAULT NULL,
  `i4` int NOT NULL AUTO_INCREMENT,
  `v5` varchar(20) DEFAULT NULL,
  `i6` int DEFAULT NULL,
  `i7` int DEFAULT NULL,
  `i8` int DEFAULT NULL,
  `f9` float DEFAULT NULL,
  `i10` int DEFAULT NULL,
  KEY `tt_5_fki2` (`i4`,`ifk_col` DESC,`i0`,`c3` DESC,`f1`,`i7`,`i8`,`v5` DESC,`i2` DESC,`f9`),
  KEY `tt_5_fki0` (`i7`,`i8`,`f9`,`i0`,`c3` DESC,`i10`),
  KEY `tt_5_fki1` (`ifk_col`,`i2`,`i4` DESC,`i8`,`i6` DESC),
  CONSTRAINT `tt_5_fk_tt_5` FOREIGN KEY (`ifk_col`) REFERENCES `tt_5` (`ipkey`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-03 16:15:04
