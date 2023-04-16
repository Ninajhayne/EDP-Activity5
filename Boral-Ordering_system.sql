CREATE DATABASE  IF NOT EXISTS `ordering_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ordering_system`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ordering_system
-- ------------------------------------------------------
-- Server version	8.0.32

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nina Jhayne','9676298084','Fatima','Tabaco City',4511),(2,'Ichi','9125864875','Balading','Malinao',4510),(3,'Joyce Hannah','9595713118','Tigbi','Tiwi',4513),(4,'Audrey','9589415724','Fatima','Tabaco City',4511),(5,'Clarise','9783158451','San Carlos','Tabaco City',4511),(6,'Barbhea','9479318523','Cararayan','Albay',4513),(7,'Nikki','9896173121','Ilawod','Camalig',4502),(8,'Nissa','9886341121','San Francisco','Malilipot',4512),(9,'Ruella','9974601434','San Francisco','Malilipot',4512),(10,'Maria Hannah','9793472345','Pawa','Legazpi',4500),(11,'Princess Therese','9856375126','Fatima','Tabaco City',4511),(14,'Maria Jean','9567103496','Fatima','Tabaco City',4511),(15,'Trixie','9567810365','San Lorenzo','Tabaco',4511);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,3,2,219.00,'2023-01-09 00:00:00'),(2,2,2,2,209.00,'2023-01-21 00:00:00'),(3,3,1,2,150.00,'2023-02-14 00:00:00'),(4,4,4,3,219.00,'2023-01-24 00:00:00'),(5,5,3,4,219.00,'2023-02-18 00:00:00'),(6,6,5,3,199.00,'2023-02-15 00:00:00'),(7,7,1,1,150.00,'2023-02-20 00:00:00'),(8,8,2,4,209.00,'2023-01-24 00:00:00'),(9,9,1,1,150.00,'2023-02-08 00:00:00'),(10,10,4,1,219.00,'2023-02-14 00:00:00'),(11,11,2,1,209.00,'2023-02-24 00:00:00'),(12,14,5,2,199.00,'2023-03-10 21:47:28'),(34,15,5,2,199.00,'2023-03-13 11:49:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'Gcash','2023-01-08 00:00:00'),(2,2,2,'Gcash','2023-01-21 00:00:00'),(3,3,3,'Gcash','2023-02-14 00:00:00'),(4,4,4,'Gcash','2023-01-24 00:00:00'),(5,5,5,'Gcash','2023-02-18 00:00:00'),(6,6,6,'Gcash','2023-02-15 00:00:00'),(7,7,7,'Gcash','2023-02-20 00:00:00'),(8,8,8,'Gcash','2023-01-24 00:00:00'),(9,9,9,'Gcash','2023-02-08 00:00:00'),(10,10,10,'Gcash','2023-02-14 00:00:00'),(11,11,11,'Gcash','2023-02-24 00:00:00'),(41,14,12,'Gcash','2023-03-10 21:47:28'),(42,15,34,NULL,'2023-03-13 11:49:29');
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
INSERT INTO `users` VALUES ('admin','58acb7acccce58ffa8b953b12b5a7702bd42dae441c1ad85057fa70b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ordering_system'
--

--
-- Dumping routines for database 'ordering_system'
--
/*!50003 DROP FUNCTION IF EXISTS `sale_discount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sale_discount`(  
    product_price decimal(12,2)  
) RETURNS decimal(12,2)
    DETERMINISTIC
BEGIN  
    DECLARE sale_discount decimal(12,2); 
    IF product_price = 150 THEN  
        SET sale_discount = 140;  
	ELSEIF product_price = 199 THEN  
        SET sale_discount = 189;  
    ELSEIF product_price = 209 THEN  
        SET sale_discount = 199;  
    ELSEIF product_price = 219 THEN  
        SET sale_discount = 209;  
    END IF;  
    RETURN (sale_discount);  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_total_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_total_revenue`(IN product DECIMAL(12,2))
BEGIN
update product_total_revenue
set total_revenue = (select sum(price_per_item * QTY) 
from order_details where product_id = product)
where product_id = product;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_transaction_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_transaction_details`()
BEGIN
	select c.customer_name, c.address, c.city, c.postal_code, p.product_name, o.price_per_item, o.QTY, (o.Price_Per_Item * o.QTY) AS total_amount , y.payment_method, y.date 
    from customers c, transaction_report t, products p, payment y, order_details o
    where t.customer_ID = c.customer_ID AND t.product_ID = p.product_ID AND t.payment_ID = y.payment_ID AND t.order_ID = o.order_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

-- Dump completed on 2023-03-13 14:20:29
