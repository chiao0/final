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
-- Table structure for table `contact_zone`
--

DROP TABLE IF EXISTS `contact_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_zone` (
  `Contact_Zone_Name` varchar(45) NOT NULL,
  `Phone_Number` int NOT NULL,
  `Gmail` varchar(45) NOT NULL,
  `Frequency_Asked_Questions` longtext NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Facebook` varchar(45) NOT NULL,
  `Instagram` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_zone`
--

LOCK TABLES `contact_zone` WRITE;
/*!40000 ALTER TABLE `contact_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons_holder`
--

DROP TABLE IF EXISTS `coupons_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons_holder` (
  `MembershipID` int NOT NULL,
  `Discount_Coupon` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons_holder`
--

LOCK TABLES `coupons_holder` WRITE;
/*!40000 ALTER TABLE `coupons_holder` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons_holder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `MembershipID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `PhoneNumber` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Birthday` date NOT NULL,
  `Membership_Join_Date` date NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new product`
--

DROP TABLE IF EXISTS `new product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new product` (
  `id` int NOT NULL,
  `imgstyle` longtext NOT NULL,
  `src` longtext NOT NULL,
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

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Top-selling_Products_Ranking` int NOT NULL,
  `Products_Name` varchar(45) NOT NULL,
  `Features` varchar(45) NOT NULL,
  `Materials` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Colour` varchar(45) NOT NULL,
  `Product_Selling_Price` int NOT NULL,
  `Inventory_Quantity` int NOT NULL,
  `Shopping_Cart` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_introduce`
--

DROP TABLE IF EXISTS `product_introduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_introduce` (
  `id` int NOT NULL,
  `imgstyle` longtext NOT NULL,
  `src1` longtext NOT NULL,
  `src2` longtext NOT NULL,
  `src3` longtext NOT NULL,
  `product_note` longtext NOT NULL,
  `productname` varchar(45) NOT NULL,
  `style` longtext NOT NULL,
  `product_quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_introduce`
--

LOCK TABLES `product_introduce` WRITE;
/*!40000 ALTER TABLE `product_introduce` DISABLE KEYS */;
INSERT INTO `product_introduce` VALUES (1,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/SmallSofa1.png','final-main/assets/product_images/SmallSofa2.png','final-main/assets/product_images/SmallSofa3.png','頂級意大利嚴謹挑選的牛皮、雙層坐墊，可自行抽取、高級回彈坐墊，硬度舒適。易清潔、復古風。尺寸：80*80*80公分','皮質單人沙發','font-size: 18px;margin-top: -30px;padding: 15px;',83),(2,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/DoubleSofa1.png','final-main/assets/product_images/DoubleSofa2.png','final-main/assets/product_images/DoubleSofa3.png','養寵物專用推薦、防水防塵、清潔簡易、特殊彈簧。注意：圖片和實物可能含有色差，請確認後再購買。尺寸：70*180*100公分','貓抓皮雙人沙發','font-size: 18px;margin-top: -30px;padding: 15px;',13),(3,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/BigSofa1.png','final-main/assets/product_images/BigSofa2.png','final-main/assets/product_images/BigSofa3.png','躺椅可自行選擇要放在哪一側、座椅組合可隨時變換、收納空間中有躺椅部件可換成床板型式。注意：此沙發為皮革材質。尺寸：150*200*100公分(全開)','皮質轉角沙發床(附收納空間)','font-size: 18px;margin-top: -30px;padding: 15px;',52),(4,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/FoldSofa1.png','final-main/assets/product_images/FoldSofa2.png','final-main/assets/product_images/FoldSofa3.png','有摺疊功能、簡易組裝空間節省、輕巧容易移動、多種顏色提供選擇。注意：墊子較薄，較不適合當床墊使用。尺寸：70*180*20公分(全開)','亞麻折疊式沙發床','font-size: 18px;margin-top: -30px;padding: 15px;',72),(5,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/BlueSofa1.png','final-main/assets/product_images/BlueSofa2.png','final-main/assets/product_images/BlueSofa3.png','椅背可放平、高級麂皮特製、柔軟度十分、尺寸固定。注意：沙發材質特殊，清潔時須加倍注意。尺寸：120*160*50公分(全開)','麂皮可調式椅背沙發','font-size: 18px;margin-top: -30px;padding: 15px;',39),(6,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/SmallTable1.png','final-main/assets/product_images/SmallTable2.png','final-main/assets/product_images/SmallTable3.png','適合床上辦公、可承受重量達5公斤、有附帶電線孔。尺寸：50*30*20公分','塑膠折疊式小書桌','font-size: 18px;margin-top: -30px;padding: 15px;',16),(7,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/MetalTable1.png','final-main/assets/product_images/MetalTable2.png','final-main/assets/product_images/MetalTable3.png','簡易優雅風、擁有左右收納空間、手工製造。尺寸：50*90*70公分','金屬框架木書桌(含抽屜)','font-size: 18px;margin-top: -30px;padding: 15px;',26),(8,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/ZTable1.png','final-main/assets/product_images/ZTable2.png','final-main/assets/product_images/ZTable3.png','可承重500斤、Z型結構穩固無比、硬化玻璃厚度為10mm、空間大、易打理。尺寸：50*100*70公分','鋼化玻璃辦公書桌','font-size: 18px;margin-top: -30px;padding: 15px;',15),(9,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/AdjustTable1.png','final-main/assets/product_images/AdjustTable2.png','final-main/assets/product_images/AdjustTable3.png','可調節書桌找到最適合的高度、桌子下方附有小型收納空間、材質堅固，承重力強、提供桌上架，供擺放物件或書籍。尺寸：50*100*高50～100公分','高密度纖維板可調式書桌（附桌上架）','font-size: 18px;margin-top: -30px;padding: 15px;',38),(10,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/BigTable1.png','final-main/assets/product_images/BigTable2.png','final-main/assets/product_images/BigTable3.png','多重收納空間、邊緣增加擋板防止物件掉落、邊個平滑，安全防撞。注意：桌子可自行決定大小（可在備注說明，若沒有明確表示，則用原定的尺寸大小）。尺寸：70*120*70公分','實木複合式書桌','font-size: 18px;margin-top: -30px;padding: 15px;',29),(11,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/FoldChair1.png','final-main/assets/product_images/FoldChair2.png','final-main/assets/product_images/FoldChair3.png','打造休閒風格、可摺疊，易於收納。尺寸：40*40*70公分','原木風格折疊椅','font-size: 18px;margin-top: -30px;padding: 15px;',41),(12,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/CompuChair1.png','final-main/assets/product_images/CompuChair2.png','final-main/assets/product_images/CompuChair3.png','材質柔軟舒適、能自行調節椅背45度、能自行調整小腳墊，不需要時可收回椅子底部。尺寸：50*50公分','高背辦公椅','font-size: 18px;margin-top: -30px;padding: 15px;',61),(13,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/SoftChair1.png','final-main/assets/product_images/SoftChair2.png','final-main/assets/product_images/SoftChair3.png','最適合冬天使用、附加小枕頭可以用來小睡一下、或是當小抱枕使用。尺寸：70*170*厚20公分(躺平)','絨布懶人沙發椅','font-size: 18px;margin-top: -30px;padding: 15px;',52),(14,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/NoBackChair1.png','final-main/assets/product_images/NoBackChair2.png','final-main/assets/product_images/NoBackChair3.png','現代風、文青風、舒適極致、無靠背。尺寸：30*30*50公分','原木無靠背椅子','font-size: 18px;margin-top: -30px;padding: 15px;',95),(15,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/HighChair1.png','final-main/assets/product_images/HighChair2.png','final-main/assets/product_images/HighChair3.png','本商品由意大利進口，符合現代裝潢設計理念。材質：鐵製、皮質。注意：不適用於小孩使用。尺寸：40*40*100公分','現代金屬網格椅','font-size: 18px;margin-top: -30px;padding: 15px;',77),(16,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/SmallCabinet1.png','final-main/assets/product_images/SmallCabinet2.png','final-main/assets/product_images/SmallCabinet3.png','現代簡易風、提供收納空間、符合人體工學結構、最上層材質為大理石。注意：不要把過重的物件放在最上層。尺寸：40*70*高60公分','木質沙發邊櫃','font-size: 18px;margin-top: -30px;padding: 15px;',31),(17,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/TallCabinet1.png','final-main/assets/product_images/TallCabinet2.png','final-main/assets/product_images/TallCabinet3.png','含防震結構、不易破損、經久耐用。注意：限定四層空間。尺寸：30*50*高180公分','亞克力四層展示櫃','font-size: 18px;margin-top: -30px;padding: 15px;',45),(18,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/BlackCabinet1.png','final-main/assets/product_images/BlackCabinet2.png','final-main/assets/product_images/BlackCabinet3.png','專門容納大型物件、玻璃門為兩層結構打開、堅固耐用、內部含發光功能。尺寸：50*70*190公分','鋼化玻璃四層收納櫃','font-size: 18px;margin-top: -30px;padding: 15px;',13),(19,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/BrownCabinet1.png','final-main/assets/product_images/BrownCabinet2.png','final-main/assets/product_images/BrownCabinet3.png','復古風、簡約風、底部有輪子方便推動、多個小型收納空間。注意：位置固定後要鎖好輪子。尺寸：40*70*100公分','木質簡約茶水櫃','font-size: 18px;margin-top: -30px;padding: 15px;',61),(20,'height: 450px;width: 450px;margin-right: 50px;border-radius: 10px;margin-left: 200px;float: left;','final-main/assets/product_images/WhiteCabinet1.png','final-main/assets/product_images/WhiteCabinet2.png','final-main/assets/product_images/WhiteCabinet3.png','大型空間收納抽屜、附帶輪子、櫃子可上鎖。注意：顏色可能和圖片有一些差異。尺寸：50*90*100公分','木質三層收納櫃','font-size: 18px;margin-top: -30px;padding: 15px;',50);
/*!40000 ALTER TABLE `product_introduce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `MembershipID` int NOT NULL,
  `Purchase_Records` varchar(45) NOT NULL,
  `Discount_Coupon` varchar(45) NOT NULL,
  `Purchase_Quantity` int NOT NULL,
  `Unit_Price` int NOT NULL,
  `Total_Price` int NOT NULL,
  `Product_Name` varchar(45) NOT NULL,
  `Product_Image` blob NOT NULL,
  `ProductID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information`
--

DROP TABLE IF EXISTS `user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_information` (
  `MembershipID` int NOT NULL,
  `Frequently_Asked_Questions` longtext NOT NULL,
  `Comments` longtext NOT NULL,
  `Ratings` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information`
--

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-04 20:03:11
