-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: todo
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int NOT NULL,
  `bank` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'1415117142','Төгрөг харилцах','mnt','2021-01-25 14:20:17','2021-01-25 14:20:17',1,'Голомт Банк');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_express`
--

DROP TABLE IF EXISTS `accounts_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_express` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_express`
--

LOCK TABLES `accounts_express` WRITE;
/*!40000 ALTER TABLE `accounts_express` DISABLE KEYS */;
INSERT INTO `accounts_express` VALUES (1,'bazar','test','test@test.com');
/*!40000 ALTER TABLE `accounts_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Get my beer please23213','Yes bitchfsfsdfd','2021-01-02 17:05:11','2021-01-02 17:05:27'),(2,'safsa','fsafsa','2021-01-03 06:54:55','2021-01-03 06:54:55'),(3,'sfa','1','2021-01-03 06:54:59','2021-01-03 06:55:02'),(4,'fsafa','fsafafa','2021-01-03 08:17:55','2021-01-03 08:17:55'),(5,'sfasaf','fafassfa','2021-01-03 08:18:02','2021-01-03 08:18:02'),(6,'asdasd','asdasds','2021-01-03 08:20:55','2021-01-03 08:20:55'),(7,'sfssffsdf','sfdsfsdf','2021-01-03 08:47:59','2021-01-03 08:47:59'),(8,'sfasfa','fsasfasfa','2021-01-03 08:54:25','2021-01-03 08:54:25'),(9,'21f312f3121f23','21f31f2','2021-01-03 09:04:30','2021-01-03 09:04:30'),(10,'123f12f312','1f231f23f123','2021-01-03 09:04:40','2021-01-03 09:04:40');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'saf','fasfsa','2021-01-05');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_amount` int NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_description` varchar(545) DEFAULT NULL,
  `transaction_type` int NOT NULL,
  `transaction_account` int NOT NULL,
  `transaction_username` varchar(545) NOT NULL,
  `transaction_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `transaction_status` varchar(245) NOT NULL,
  `transaction_currency` varchar(45) NOT NULL,
  `transaction_cash` int NOT NULL,
  `income` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,58000,'2021-01-03','Partner болохын тулд төлөв.',8,1,'bazar','2021-02-08 15:29:45','Бүртгэсэн','mnt',1,0),(2,3000000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:30:24','Бүртгэсэн','mnt',1,0),(3,3000000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:30:51','Бүртгэсэн','mnt',1,0),(4,2900000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:31:11','Бүртгэсэн','mnt',1,0),(5,2800000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:31:40','Бүртгэсэн','mnt',1,0),(6,1368000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:32:06','Бүртгэсэн','mnt',1,0),(7,1452000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:49:29','Бүртгэсэн','mnt',1,0),(8,253000,'2021-01-08','Чихэвч steelseries 3',5,1,'bazar','2021-02-08 15:33:00','Бүртгэсэн','mnt',1,0),(9,750000,'2021-01-10','Болдбаярт хичээл заасны бонус цалин болгож олгов',9,1,'bazar','2021-02-08 15:49:15','Бүртгэсэн','mnt',1,0),(10,300000,'2021-01-13','Нягтлан Уранчимэгт 2020 оны санхүүгийн жилин эцсийн тайлангийн ажлын хөлс',10,1,'bazar','2021-02-08 15:49:15','Бүртгэсэн','mnt',1,0),(11,8707260,'2021-01-15','1-р сар урьдчилгаа цалин',1,1,'bazar','2021-02-08 15:43:05','Бүртгэсэн','mnt',1,0),(12,309456,'2021-01-20','Эрчим сүлжээ ',4,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(13,361921,'2021-01-20','Эрчим сүлжээ',4,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(14,1493280,'2021-01-21','MCS International AWS ашиглаагүй тул буцаав',6,1,'bazar','2021-02-08 15:48:54','Бүртгэсэн','mnt',1,0),(15,9983924,'2021-01-22','СЭЗИС 12-р сар ',4,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(16,1221000,'2021-01-25','3ш Монитор худалдаж авав',5,1,'bazar','2021-02-08 15:48:54','Бүртгэсэн','mnt',1,0),(17,11000000,'2021-01-27','DATABANK',11,1,'bazar','2021-02-13 11:10:00','Бүртгэсэн','mnt',1,1),(18,1000000,'2021-01-28','6ш дэлгэц',5,1,'bazar','2021-02-08 15:47:17','Бүртгэсэн','mnt',1,0),(19,2432000,'2021-01-28','6ш дэлгэц',5,1,'bazar','2021-02-08 15:47:36','Бүртгэсэн','mnt',1,0),(20,7130000,'2021-01-30','AWS PARTNER',8,1,'bazar','2021-02-08 15:48:10','Бүртгэсэн','mnt',1,0),(23,8585110,'2021-02-01','ФИБО 1-р сарын сүүл цалин',1,1,'bazar','2021-02-13 11:00:06','Бүртгэсэн','mnt',1,0),(24,15000,'2021-02-04','fibo.cn',12,1,'bazar','2021-02-13 13:00:24','Бүртгэсэн','mnt',1,0),(25,4209552,'2021-02-04','fibo.cn',12,1,'bazar','2021-02-13 13:01:16','Бүртгэсэн','mnt',1,0),(26,85560,'2021-02-04','fibo.cn',12,1,'bazar','2021-02-13 13:01:44','Бүртгэсэн','mnt',1,0),(27,198000,'2021-02-04','Ikon - NDC мэдээ',13,1,'bazar','2021-02-13 13:03:04','Бүртгэсэн','mnt',1,0),(28,285200,'2021-02-04','MCS International',8,1,'bazar','2021-02-13 13:05:05','Бүртгэсэн','mnt',1,0),(29,7022,'2021-02-04','Мобиком төлбөр',14,1,'bazar','2021-02-13 13:07:24','Бүртгэсэн','mnt',1,0),(30,1547409,'2021-02-04','AWS Monitron',5,1,'bazar','2021-02-13 13:08:17','Бүртгэсэн','mnt',1,0),(31,154920,'2021-02-04','AWS UFE дутуу төлбөр',8,1,'bazar','2021-02-13 13:09:20','Бүртгэсэн','mnt',1,0),(32,8617532,'2021-02-10','UFE 2021/01',4,1,'bazar','2021-02-13 13:10:51','Бүртгэсэн','mnt',1,1),(33,6700000,'2021-02-11','EXA STUDIO',11,1,'bazar','2021-02-13 13:11:14','Бүртгэсэн','mnt',1,1),(35,9242627,'2021-02-16','Хоёрдугаар сарын эхний цалин',1,1,'bazar','2021-02-28 17:16:45','Бүртгэсэн','mnt',1,0),(36,550000,'2021-02-19','Resort World Terelj 1 хоног амрах',15,1,'bazar','2021-02-28 17:18:11','Бүртгэсэн','mnt',1,0),(37,700000,'2021-02-23','Аудит',10,1,'bazar','2021-02-28 17:18:42','Бүртгэсэн','mnt',1,0);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(345) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(345) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `constant` int NOT NULL,
  `type` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'Цалин','',1,0,'2021-01-23 13:28:17'),(2,'Оффис','',1,0,'2021-01-23 13:29:02'),(3,'ICS','',1,1,'2021-01-23 13:29:10'),(4,'AWS CONSULTING','',0,1,'2021-01-23 13:29:27'),(5,'Тоног төхөөрөмж худалдан авалт','Компьютер, ширээ сандал г.м',0,0,'2021-02-08 15:26:09'),(6,'Буцаалт','Байршуулсан байсан төлбөрийг ашиглаагүй тул тухайн компани руу буцаах.',0,0,'2021-02-08 15:26:34'),(7,'AWS CERTIFICATION FEE','Зарим үед хөнгөлөлттэй нөхцөлөөр шалгалт өгөхөд ашиглана.',0,0,'2021-02-08 15:28:18'),(8,'AWS-д ТӨЛБӨР ТӨЛСӨН','Зарим үед өөрсдийн төгрөгийн данснаас төлбөр төлсөн бол',1,0,'2021-02-08 15:29:16'),(9,'Бонус цалин','Зарим үед төслийн нөхцлөөс хамаарч ажилтанд бонус цалин олгох',0,0,'2021-02-08 15:33:40'),(10,'Хүнээр ажил гүйцэтгүүслэн','Нягтлан, төсөл дээр хамтран орсон гэх мэт',0,0,'2021-02-08 15:35:08'),(11,'Зөвлөх үйлчилгээний төлбөр','Kubernetes, container etc.',0,1,'2021-02-08 15:46:07'),(12,'Домайн','Домайн нэр худалдан авах төлбөр гэх мэт',0,0,'2021-02-13 12:52:22'),(13,'Marketing','Мэдээ тавиулах, fb boost г.м',0,0,'2021-02-13 13:02:17'),(14,'Утас','75105585',1,0,'2021-02-13 13:06:50'),(15,'Үйл ажиллагаа','Хоол идэх, entertainment гэх мэт',0,0,'2021-02-28 17:17:29');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(16) NOT NULL,
  `account_id` int NOT NULL,
  `transaction_amount` int NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` int NOT NULL,
  `transaction_description` varchar(545) NOT NULL,
  `edited_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(45) NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-15 16:37:35
