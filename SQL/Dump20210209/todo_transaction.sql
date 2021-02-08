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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,58000,'2021-01-03','Partner болохын тулд төлөв.',8,1,'bazar','2021-02-08 15:29:45','Бүртгэсэн','mnt',1,0),(2,3000000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:30:24','Бүртгэсэн','mnt',1,0),(3,3000000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:30:51','Бүртгэсэн','mnt',1,0),(4,2900000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:31:11','Бүртгэсэн','mnt',1,0),(5,2800000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:31:40','Бүртгэсэн','mnt',1,0),(6,1368000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:32:06','Бүртгэсэн','mnt',1,0),(7,1452000,'2021-01-06','6ш компьютер худалдан авахад ',5,1,'bazar','2021-02-08 15:49:29','Бүртгэсэн','mnt',1,0),(8,253000,'2021-01-08','Чихэвч steelseries 3',5,1,'bazar','2021-02-08 15:33:00','Бүртгэсэн','mnt',1,0),(9,750000,'2021-01-10','Болдбаярт хичээл заасны бонус цалин болгож олгов',9,1,'bazar','2021-02-08 15:49:15','Бүртгэсэн','mnt',1,0),(10,300000,'2021-01-13','Нягтлан Уранчимэгт 2020 оны санхүүгийн жилин эцсийн тайлангийн ажлын хөлс',10,1,'bazar','2021-02-08 15:49:15','Бүртгэсэн','mnt',1,0),(11,8707260,'2021-01-15','1-р сар урьдчилгаа цалин',1,1,'bazar','2021-02-08 15:43:05','Бүртгэсэн','mnt',1,0),(12,309456,'2021-01-20','Эрчим сүлжээ ',4,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(13,361921,'2021-01-20','Эрчим сүлжээ',4,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(14,1493280,'2021-01-21','MCS International AWS ашиглаагүй тул буцаав',6,1,'bazar','2021-02-08 15:48:54','Бүртгэсэн','mnt',1,0),(15,9983924,'2021-01-22','СЭЗИС 12-р сар ',4,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(16,1221000,'2021-01-25','3ш Монитор худалдаж авав',5,1,'bazar','2021-02-08 15:48:54','Бүртгэсэн','mnt',1,0),(17,1100000,'2021-01-27','DATABANK',11,1,'bazar','2021-02-08 17:53:27','Бүртгэсэн','mnt',1,1),(18,1000000,'2021-01-28','6ш дэлгэц',5,1,'bazar','2021-02-08 15:47:17','Бүртгэсэн','mnt',1,0),(19,2432000,'2021-01-28','6ш дэлгэц',5,1,'bazar','2021-02-08 15:47:36','Бүртгэсэн','mnt',1,0),(20,7130000,'2021-01-30','AWS PARTNER',8,1,'bazar','2021-02-08 15:48:10','Бүртгэсэн','mnt',1,0);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-09  2:33:09
