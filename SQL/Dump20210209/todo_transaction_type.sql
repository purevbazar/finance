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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'Цалин','',1,0,'2021-01-23 13:28:17'),(2,'Оффис','',1,0,'2021-01-23 13:29:02'),(3,'ICS','',1,1,'2021-01-23 13:29:10'),(4,'AWS CONSULTING','',0,1,'2021-01-23 13:29:27'),(5,'Тоног төхөөрөмж худалдан авалт','Компьютер, ширээ сандал г.м',0,0,'2021-02-08 15:26:09'),(6,'Буцаалт','Байршуулсан байсан төлбөрийг ашиглаагүй тул тухайн компани руу буцаах.',0,0,'2021-02-08 15:26:34'),(7,'AWS CERTIFICATION FEE','Зарим үед хөнгөлөлттэй нөхцөлөөр шалгалт өгөхөд ашиглана.',0,0,'2021-02-08 15:28:18'),(8,'AWS-д ТӨЛБӨР ТӨЛСӨН','Зарим үед өөрсдийн төгрөгийн данснаас төлбөр төлсөн бол',1,0,'2021-02-08 15:29:16'),(9,'Бонус цалин','Зарим үед төслийн нөхцлөөс хамаарч ажилтанд бонус цалин олгох',0,0,'2021-02-08 15:33:40'),(10,'Хүнээр ажил гүйцэтгүүслэн','Нягтлан, төсөл дээр хамтран орсон гэх мэт',0,0,'2021-02-08 15:35:08'),(11,'Зөвлөх үйлчилгээний төлбөр','Kubernetes, container etc.',0,1,'2021-02-08 15:46:07');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
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
