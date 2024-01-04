-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sofabed
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `new product`
--

DROP TABLE IF EXISTS `new product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new product` (
  `id` int NOT NULL,
  `imgstyle` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  `productname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new product`
--

LOCK TABLES `new product` WRITE;
/*!40000 ALTER TABLE `new product` DISABLE KEYS */;
INSERT INTO `new product` VALUES (1,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/SmallSofa1.png','皮質單人沙發'),(2,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/DoubleSofa1.png','貓抓皮雙人沙發'),(3,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/BigSofa1.png','皮質轉角沙發床(附收納空間)'),(4,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/FoldSofa1.png','亞麻折疊式沙發床'),(5,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/BlueSofa1.png','麂皮可調式椅背沙發'),(6,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/SmallTable1.png','塑膠折疊式小書桌'),(7,'border-radius: 20%; width: 500px; height: auto;text-align: center;','assets/product_images/MetalTable1.png','金屬框架木書桌(含抽屜)'),(8,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/ZTable1.png','鋼化玻璃辦公書桌'),(9,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/AdjustTable1.png','高密度纖維板可調式書桌（附桌上架）'),(10,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/BigTable1.png','實木複合式書桌'),(11,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/FoldChair1.png','原木風格折疊椅'),(12,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/CompuChair1.png','高背辦公椅'),(13,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/SoftChair1.png','絨布懶人沙發椅'),(14,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/NoBackChair1.png','原木無靠背椅子'),(15,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/HighChair1.png','現代金屬網格椅'),(16,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/SmallCabinet1.png','木質沙發邊櫃'),(17,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/TallCabinet1.png','亞克力四層展示櫃'),(18,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/BlackCabinet1.png','鋼化玻璃四層收納櫃'),(19,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/BrownCabinet1.png','木質簡約茶水櫃'),(20,'border-radius: 20%; width: 500px; height: auto;','assets/product_images/WhiteCabinet1.png','木質三層收納櫃');
/*!40000 ALTER TABLE `new product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-04 20:17:00
