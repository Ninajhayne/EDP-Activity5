-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ordering_system
-- ------------------------------------------------------
-- Server version	8.0.32

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

--
-- Temporary view structure for view `above200_price_view`
--

DROP TABLE IF EXISTS `above200_price_view`;
/*!50001 DROP VIEW IF EXISTS `above200_price_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `above200_price_view` AS SELECT 
 1 AS `customer_name`,
 1 AS `product_name`,
 1 AS `total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_view`
--

DROP TABLE IF EXISTS `customer_view`;
/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_view` AS SELECT 
 1 AS `Customer_name`,
 1 AS `address`,
 1 AS `city`,
 1 AS `postal_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_name` varchar(45) NOT NULL,
  `Contact_num` varchar(15) NOT NULL,
  `Address` varchar(15) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Postal_code` int NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nina Jhayne','9676298084','Fatima','Tabaco City',4511),(2,'Ichi','9125864875','Balading','Malinao',4510),(3,'Joyce Hannah','9595713118','Tigbi','Tiwi',4513),(4,'Audrey','9589415724','Fatima','Tabaco City',4511),(5,'Clarise','9783158451','San Carlos','Tabaco City',4511),(6,'Barbhea','9479318523','Cararayan','Albay',4513),(7,'Nikki','9896173121','Ilawod','Camalig',4502),(8,'Nissa','9886341121','San Francisco','Malilipot',4512),(9,'Ruella','9974601434','San Francisco','Malilipot',4512),(10,'Maria Hannah','9793472345','Pawa','Legazpi',4500),(11,'Princess Therese','9856375126','Fatima','Tabaco City',4511),(14,'Maria Jean','9567103496','Fatima','Tabaco City',4511),(15,'Trixie','9567810365','San Lorenzo','Tabaco',4511),(16,'Armie','9864782136','Hindi','Bacacay',4509),(17,'Hazel','9215634789','Pawa','Malinao',4512),(18,'Raphael','9526748920','Sogod','Bacacay',4511),(19,'Marife','9478134561','San Fernando','Sto. Domingo',4508),(20,'Lyka','9745631025','Estancia','Malinao',4512);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customers_AFTER_INSERT` AFTER INSERT ON `customers` FOR EACH ROW BEGIN
	INSERT INTO order_details (customer_id, date)
	VALUES(NEW.customer_id, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int NOT NULL,
  `Product_ID` int DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `Price_Per_Item` decimal(12,2) NOT NULL DEFAULT '0.00',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Order_ID`),
  KEY `Fk_customerID_order` (`Customer_ID`),
  CONSTRAINT `Fk_customerID_order` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,3,2,219.00,'2023-01-09 00:00:00'),(2,2,2,2,209.00,'2023-01-21 00:00:00'),(3,3,1,2,150.00,'2023-02-14 00:00:00'),(4,4,4,3,219.00,'2023-01-24 00:00:00'),(5,5,3,4,219.00,'2023-02-18 00:00:00'),(6,6,5,3,199.00,'2023-02-15 00:00:00'),(7,7,1,1,150.00,'2023-02-20 00:00:00'),(8,8,2,4,209.00,'2023-01-24 00:00:00'),(9,9,1,1,150.00,'2023-02-08 00:00:00'),(10,10,4,1,219.00,'2023-02-14 00:00:00'),(11,11,2,1,209.00,'2023-02-24 00:00:00'),(12,14,5,2,199.00,'2023-03-10 21:47:28'),(34,15,5,2,199.00,'2023-03-13 11:49:29'),(35,16,NULL,NULL,0.00,'2023-04-12 17:42:01'),(36,17,NULL,NULL,0.00,'2023-04-12 17:42:01'),(37,18,NULL,NULL,0.00,'2023-04-12 17:42:01'),(38,19,NULL,NULL,0.00,'2023-04-12 17:42:01'),(39,20,NULL,NULL,0.00,'2023-04-12 17:42:01'),(40,16,NULL,NULL,0.00,'2023-04-15 22:19:07'),(41,17,NULL,NULL,0.00,'2023-04-15 22:19:07'),(42,18,NULL,NULL,0.00,'2023-04-15 22:19:07'),(43,19,NULL,NULL,0.00,'2023-04-15 22:19:07'),(44,20,NULL,NULL,0.00,'2023-04-15 22:19:07'),(45,16,NULL,NULL,0.00,'2023-04-15 23:51:44'),(46,17,NULL,NULL,0.00,'2023-04-15 23:51:44'),(47,18,NULL,NULL,0.00,'2023-04-15 23:51:44'),(48,19,NULL,NULL,0.00,'2023-04-15 23:51:44'),(49,20,NULL,NULL,0.00,'2023-04-15 23:51:44'),(50,16,NULL,NULL,0.00,'2023-04-15 23:58:11'),(51,17,NULL,NULL,0.00,'2023-04-15 23:58:11'),(52,18,NULL,NULL,0.00,'2023-04-15 23:58:11'),(53,19,NULL,NULL,0.00,'2023-04-15 23:58:11'),(54,20,NULL,NULL,0.00,'2023-04-15 23:58:11'),(55,16,NULL,NULL,0.00,'2023-04-16 00:12:52'),(56,17,NULL,NULL,0.00,'2023-04-16 00:12:52'),(57,18,NULL,NULL,0.00,'2023-04-16 00:12:52'),(58,19,NULL,NULL,0.00,'2023-04-16 00:12:52'),(59,20,NULL,NULL,0.00,'2023-04-16 00:12:52'),(60,16,NULL,NULL,0.00,'2023-04-16 00:19:20'),(61,17,NULL,NULL,0.00,'2023-04-16 00:19:20'),(62,18,NULL,NULL,0.00,'2023-04-16 00:19:20'),(63,19,NULL,NULL,0.00,'2023-04-16 00:19:20'),(64,20,NULL,NULL,0.00,'2023-04-16 00:19:20');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_AFTER_INSERT` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
	INSERT INTO payment (customer_id, order_id, date)
	VALUES(NEW.customer_id, NEW.order_id, NOW());
 	
	if new.product_id is not null then
		update product_total_revenue
		set total_revenue = total_revenue + (new.price_per_item * new.QTY)
		where product_id = new.product_id;
		end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_AFTER_UPDATE` AFTER UPDATE ON `order_details` FOR EACH ROW BEGIN
	if old.product_id is not null then
		update product_total_revenue
        set total_revenue = total_revenue - (old.price_per_item * old.QTY)
		where product_id = old.product_id;
	end if;
	if new.product_id is not null then
		update product_total_revenue
        set total_revenue = total_revenue + (new.price_per_item * new.QTY)
		where product_id = new.product_id;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_BEFORE_DELETE` BEFORE DELETE ON `order_details` FOR EACH ROW BEGIN
	if (old.product_id is not null) then
		update product_total_revenue
        set total_revenue = total_revenue - (old.price_per_item * old.QTY)
		where product_id = old.product_id;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int NOT NULL,
  `Order_ID` int NOT NULL,
  `Payment_method` varchar(20) DEFAULT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Payment_ID`),
  KEY `Fk_customerID_payment` (`Customer_ID`),
  KEY `Fk_orderID_payment` (`Order_ID`),
  CONSTRAINT `Fk_customerID_payment` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  CONSTRAINT `Fk_orderID_payment` FOREIGN KEY (`Order_ID`) REFERENCES `order_details` (`Order_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'Gcash','2023-01-08 00:00:00'),(2,2,2,'Gcash','2023-01-21 00:00:00'),(3,3,3,'Gcash','2023-02-14 00:00:00'),(4,4,4,'Gcash','2023-01-24 00:00:00'),(5,5,5,'Gcash','2023-02-18 00:00:00'),(6,6,6,'Gcash','2023-02-15 00:00:00'),(7,7,7,'Gcash','2023-02-20 00:00:00'),(8,8,8,'Gcash','2023-01-24 00:00:00'),(9,9,9,'Gcash','2023-02-08 00:00:00'),(10,10,10,'Gcash','2023-02-14 00:00:00'),(11,11,11,'Gcash','2023-02-24 00:00:00'),(41,14,12,'Gcash','2023-03-10 21:47:28'),(42,15,34,NULL,'2023-03-13 11:49:29'),(43,16,35,NULL,'2023-04-12 17:42:01'),(44,17,36,NULL,'2023-04-12 17:42:01'),(45,18,37,NULL,'2023-04-12 17:42:01'),(46,19,38,NULL,'2023-04-12 17:42:01'),(47,20,39,NULL,'2023-04-12 17:42:01'),(48,16,40,NULL,'2023-04-15 22:19:07'),(49,17,41,NULL,'2023-04-15 22:19:07'),(50,18,42,NULL,'2023-04-15 22:19:07'),(51,19,43,NULL,'2023-04-15 22:19:07'),(52,20,44,NULL,'2023-04-15 22:19:07'),(53,16,45,NULL,'2023-04-15 23:51:44'),(54,17,46,NULL,'2023-04-15 23:51:44'),(55,18,47,NULL,'2023-04-15 23:51:44'),(56,19,48,NULL,'2023-04-15 23:51:44'),(57,20,49,NULL,'2023-04-15 23:51:44'),(58,16,50,NULL,'2023-04-15 23:58:11'),(59,17,51,NULL,'2023-04-15 23:58:11'),(60,18,52,NULL,'2023-04-15 23:58:11'),(61,19,53,NULL,'2023-04-15 23:58:11'),(62,20,54,NULL,'2023-04-15 23:58:11'),(63,16,55,NULL,'2023-04-16 00:12:52'),(64,17,56,NULL,'2023-04-16 00:12:52'),(65,18,57,NULL,'2023-04-16 00:12:52'),(66,19,58,NULL,'2023-04-16 00:12:52'),(67,20,59,NULL,'2023-04-16 00:12:52'),(68,16,60,NULL,'2023-04-16 00:19:20'),(69,17,61,NULL,'2023-04-16 00:19:20'),(70,18,62,NULL,'2023-04-16 00:19:20'),(71,19,63,NULL,'2023-04-16 00:19:20'),(72,20,64,NULL,'2023-04-16 00:19:20');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_total_revenue`
--

DROP TABLE IF EXISTS `product_total_revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_total_revenue` (
  `product_id` int NOT NULL DEFAULT '0',
  `total_revenue` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_total_revenue`
--

LOCK TABLES `product_total_revenue` WRITE;
/*!40000 ALTER TABLE `product_total_revenue` DISABLE KEYS */;
INSERT INTO `product_total_revenue` VALUES (1,600.00),(2,1463.00),(3,1314.00),(4,876.00),(5,1393.00);
/*!40000 ALTER TABLE `product_total_revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(20) NOT NULL,
  `Product_price` decimal(12,2) NOT NULL,
  `Product_status` varchar(20) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Tote Bag',150.00,'In stock',99),(2,'Tsuno Bag',209.00,'In stock',59),(3,'Corduroy Bag',219.00,'In stock',80),(4,'Sierra Bag',219.00,'In stock',99),(5,'Bucket Hat',199.00,'In stock',99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tabaco_customer_view`
--

DROP TABLE IF EXISTS `tabaco_customer_view`;
/*!50001 DROP VIEW IF EXISTS `tabaco_customer_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tabaco_customer_view` AS SELECT 
 1 AS `Customer_ID`,
 1 AS `Customer_name`,
 1 AS `address`,
 1 AS `city`,
 1 AS `postal_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaction_report`
--

DROP TABLE IF EXISTS `transaction_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_report` (
  `Report_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Order_ID` int NOT NULL,
  `Payment_ID` int NOT NULL,
  PRIMARY KEY (`Report_ID`),
  KEY `Fk_customerID_report` (`Customer_ID`),
  KEY `Fk_orderID_report` (`Order_ID`),
  KEY `Fk_paymentID_report` (`Payment_ID`),
  KEY `Fk_productID_repory_idx` (`Product_ID`),
  CONSTRAINT `Fk_customerID_report` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  CONSTRAINT `Fk_orderID_report` FOREIGN KEY (`Order_ID`) REFERENCES `order_details` (`Order_ID`),
  CONSTRAINT `Fk_paymentID_report` FOREIGN KEY (`Payment_ID`) REFERENCES `payment` (`Payment_ID`),
  CONSTRAINT `Fk_productID_repory` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_report`
--

LOCK TABLES `transaction_report` WRITE;
/*!40000 ALTER TABLE `transaction_report` DISABLE KEYS */;
INSERT INTO `transaction_report` VALUES (1,1,3,1,1),(2,2,2,2,2),(3,3,1,3,3),(4,4,4,4,4),(5,5,3,5,5),(6,6,5,6,6),(7,7,1,7,7),(8,8,2,8,8),(9,9,1,9,9),(10,10,4,10,10),(11,11,2,11,11),(12,14,5,12,41);
/*!40000 ALTER TABLE `transaction_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` longtext,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','58acb7acccce58ffa8b953b12b5a7702bd42dae441c1ad85057fa70b'),('nin','nin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `above200_price_view`
--

/*!50001 DROP VIEW IF EXISTS `above200_price_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `above200_price_view` AS select `c`.`Customer_name` AS `customer_name`,`p`.`Product_name` AS `product_name`,(`o`.`Price_Per_Item` * `o`.`QTY`) AS `total_amount` from (((`customers` `c` join `transaction_report` `t`) join `products` `p`) join `order_details` `o`) where ((`t`.`Customer_ID` = `c`.`Customer_ID`) and (`t`.`Product_ID` = `p`.`Product_ID`) and (`t`.`Order_ID` = `o`.`Order_ID`) and ((`o`.`Price_Per_Item` * `o`.`QTY`) > 200)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_view` AS select `customers`.`Customer_name` AS `Customer_name`,`customers`.`Address` AS `address`,`customers`.`City` AS `city`,`customers`.`Postal_code` AS `postal_code` from `customers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tabaco_customer_view`
--

/*!50001 DROP VIEW IF EXISTS `tabaco_customer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tabaco_customer_view` AS select `customers`.`Customer_ID` AS `Customer_ID`,`customers`.`Customer_name` AS `Customer_name`,`customers`.`Address` AS `address`,`customers`.`City` AS `city`,`customers`.`Postal_code` AS `postal_code` from `customers` where (`customers`.`City` = 'Tabaco City') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-16  0:21:11
