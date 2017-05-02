-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datamanager
-- ------------------------------------------------------
-- Server version	5.5.54

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
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES (1,44925.07999999999,'HDFC');
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CATEGORY_NAME_UNIQUE` (`CATEGORY_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (9,'AUTOMOBILES'),(18,'BEAUTY AND SALON'),(15,'DOCTOR CONSULTANT'),(2,'DRESSES'),(14,'ELECTRICITY BILLS'),(8,'FUELS'),(1,'GOLD & SILVER'),(20,'HOTELS AND RESTURANTS'),(13,'HOUSE EXPENSES'),(11,'INVESTEMENTS'),(12,'LIFE INSURANCE'),(7,'LOAN & EMI'),(16,'MEDICAL TREATMENT'),(17,'MEDICALS'),(21,'MISC'),(5,'MOVIE'),(10,'ONLINE SHOPPING'),(6,'RECHARGE'),(3,'SWEETS & SNACKS & FRUITS & JUICE'),(4,'TRAVEL'),(19,'XEROX AND PRINTOUT');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_expense`
--

DROP TABLE IF EXISTS `tbl_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_expense` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  `EXPENSE_DATE` int(10) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `BANK_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CATEGORY_ID_idx` (`CATEGORY_ID`),
  KEY `BANK_ID_idx` (`BANK_ID`),
  CONSTRAINT `BANK_ID` FOREIGN KEY (`BANK_ID`) REFERENCES `bank_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `tbl_category` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_expense`
--

LOCK TABLES `tbl_expense` WRITE;
/*!40000 ALTER TABLE `tbl_expense` DISABLE KEYS */;
INSERT INTO `tbl_expense` VALUES (1,'CREDIT CARD BILL',1491817875,23103.49,7,NULL),(2,'Jayashri tablets',1491817963,2000,17,NULL),(3,'Pavithra Specs',1491818000,1795,17,NULL),(4,'Prasanna',1491818043,500,13,NULL),(5,'Shirts and Trousers - Stitch',1491818082,500,2,NULL),(6,'Sweets and Snacks maraimalai nagar function',1491818139,413,3,NULL),(7,'JIO Recharge',1491818540,303,6,NULL),(8,'Appa drinks',1491818577,170,13,NULL),(9,'Temple',1491818620,188,13,NULL),(10,'Naturals pavithra',1491818672,58,18,NULL),(11,'XEROX - DOCUMENTS',1491818730,23,19,NULL),(12,'Maruthani Cone',1491818758,7,13,NULL),(13,'Appa Recharge',1491818788,16,6,NULL),(14,'Bike Waterwash',1491818816,100,9,NULL),(15,'Fruits',1491818858,100,3,NULL),(16,'Maraimalai nagar function - CAR',1491818920,3000,4,NULL),(17,'Maraimalai nagar - CAR - Driver batta',1491818941,400,4,NULL),(18,'Amma - on maraimalai nagar function',1491818988,500,13,NULL),(19,'Marimalai nagar function checkpost',1491819026,85,4,NULL),(20,'Seetu kasu - APRIL',1491819062,11000,11,NULL),(21,'Amma - house expenses',1491819085,8000,13,NULL),(22,'Pavithra - Recharge',1491819344,50,6,NULL),(23,'Sundal, Bajji and Samosa',1491819387,60,3,NULL),(24,'Tata Sky Recharge',1491819415,765,6,NULL),(25,'Mushroom',1491819470,40,3,NULL),(26,'Redmi Note 4 new mobile',1491819509,10999,10,NULL),(27,'Personal Loan EMI',1491819536,10846,7,NULL),(28,'Amma',1491819553,20,13,NULL),(29,'Petrol',1491819553,100,8,NULL),(30,'Petrol',1491819553,50,8,NULL),(31,'Milk - temple and donation',1491819624,20,13,NULL),(32,'Temple',1491819641,160,13,NULL),(33,'Juice',1491819656,40,13,NULL),(34,'Appa',1491819670,200,13,NULL),(35,'Biscuits',1491819670,20,13,NULL),(36,'Pavithra',1491819707,500,13,NULL),(37,'Cocount oil and Rasakarpuram',1491819707,74,13,NULL),(38,'Movie cooldrinks and snacks',1491819770,280,5,NULL),(39,'Kolathur - Dinesh house',1491819809,180,3,NULL),(40,'Movie bike parking',1491819874,30,5,NULL),(41,'Medplus - surpcal and revillus tablets',1491819918,292,17,NULL),(42,'Credit card bill',1491820025,80180.86,7,NULL),(43,'Redmi note 4 temper glass',1491843489,50,13,NULL),(44,'Bought Eggs for lunch',1491913839,20,20,NULL),(45,'Bought Medimix Soap',1491913839,7,13,NULL),(46,'Metro train',1491913839,40,4,NULL),(47,'Bhadam milk',1491913839,10,3,NULL),(48,'Panruti Bus cost',1491913839,330,4,NULL),(49,'Coffee',1491913839,20,3,NULL),(50,'Bhadam milk',1491913839,35,3,NULL),(51,'donation',1491913839,10,21,NULL),(52,'Restroom',1491913839,5,21,NULL),(53,'Medical Panruti',1492105679,463,17,NULL),(54,'Kumbakonam Bus',1492191580,225,4,NULL),(55,'Kumbakonam Bus',1492191580,200,4,NULL),(56,'Temple donation',1492191580,20,21,NULL),(57,'Chappel Stand',1492191580,10,21,NULL),(58,'Juice - Kumbakonam Temple',1492191580,120,3,NULL),(59,'Restroom',1492191580,10,21,NULL),(60,'Cuddalore - pondy Bus',1492191580,48,4,NULL),(61,'Hospital',1492191580,100,15,NULL),(62,'Mazza',1492191580,32,3,NULL),(63,'Bajji',1492191580,48,3,NULL),(64,'Pondy - cuddalore bus',1492191580,22,4,NULL),(65,'Badham juice',1492191580,50,3,NULL),(66,'Cuddalore - Panruti bus',1492191580,20,4,NULL),(67,'Restroom',1492191580,5,21,NULL),(68,'Pavithra - MOM',1492191580,2000,13,NULL),(69,'Panruti - chennai',1492191580,200,4,NULL),(70,'call taxi - office',1492191580,300,4,NULL),(71,'waterbottle',1492191580,20,3,NULL),(72,'juice',1492191580,40,3,NULL),(73,'ice cream and chocolates',1492191580,100,3,NULL),(74,'mom tablets',1492191580,70,17,NULL),(75,'Pavithra - Vodafone - Recharge',1492434320,94,6,NULL),(80,'Mushroom and Pani puri',1492500825,40,3,NULL),(81,'Idea Mobile booster & full talk time',1492500825,159,6,NULL),(82,'Electricity bill - April month',1492500825,4484,14,NULL),(83,'biscuits and barbi',1492500825,18,3,NULL),(84,'Face Shavings',1492500825,50,18,NULL),(85,'Lunch Egg',1492500825,20,3,NULL),(86,'Mushroom',1492500825,105,3,NULL),(87,'Coconut water',1492500825,40,3,NULL),(88,'Petrol',1492671011,100,8,NULL),(89,'Pavithra - Savings',1492671011,150,13,NULL),(90,'Sugar',1492777073,5,13,NULL),(91,'Amma',1492777073,200,13,NULL),(92,'Saravana Treat',1492777073,500,20,NULL),(93,'Nosha devi',1492870060,12000,13,NULL),(94,'Fruit Juice',1492870060,55,3,NULL),(95,'Ice Creams',1492870060,220,3,NULL),(96,'Mom - Ration',1492870060,100,13,NULL),(97,'Good day biscuit',1492870060,20,3,NULL),(98,'Appa',1492870060,180,13,NULL),(99,'Renuka Doctor Consultant',1492870060,150,15,NULL),(100,'Fruit Juice - Porur',1492918138,80,3,NULL),(101,'Sweets and Snacks - Kundrathur',1492918138,216,3,NULL),(102,'Makup - Pavithra - Kundrathur',1492918138,500,18,NULL),(103,'Pavithra - Bangles',1492918138,150,18,NULL),(104,'Amar- Facecream',1492918138,25,18,NULL),(105,'Amar - Face powder',1492918138,10,18,NULL),(106,'Amar - Water bottle',1492918138,20,3,NULL),(107,'Kundrathur Geetha marriage',1492918138,500,21,NULL),(108,'Marriage Moi Cover',1492918138,5,21,NULL),(109,'Tablets',1492918140,30,17,NULL),(110,'Egg lunch',1493198186,30,20,NULL),(111,'Anbu',1493198186,50,20,NULL),(112,'Sundal - snacks',1493213400,40,3,NULL),(113,'Coconut water',1493272961,40,3,NULL),(114,'Egg office lunch',1493272961,20,20,NULL),(116,'Mouse Battery',1493308704,24,21,NULL),(117,'Ice cream',1493308704,95,3,NULL),(118,'Coconut water',1493357336,40,3,NULL),(119,'Lunch Egg',1493357336,20,20,NULL),(120,'Petrol',1493365688,100,8,NULL),(121,'Theatre Snack',1493365688,220,5,NULL),(122,'Night Dinner',1493365688,110,20,NULL),(123,'Hair Cut and Shavings',1493452228,160,18,NULL),(124,'Belt',1493452228,130,21,NULL),(125,'Juice',1493452228,40,3,NULL),(126,'Pavithra Icecream',1493452228,40,3,NULL),(127,'Appa',1493452228,160,13,NULL),(128,'Withdraw amount ',1493452228,20000,21,1),(129,'Mobile Recharge',1493452228,50,6,1),(130,'LIC',1493452228,588,12,1),(131,'Parking',1493365688,40,21,NULL),(132,'Credit Card Bill',1493452228,9188.44,7,1),(133,'Bike Parking',1493455763,20,21,NULL),(134,'Jiuce and Water bottle',1493455763,94,3,NULL),(135,'Bus Ticket - Panruti',1493455763,276,4,NULL),(136,'House Warming Function',1493542163,501,21,NULL),(137,'Moi Cover',1493542163,1,21,NULL),(138,'Bus Ticket - Chennai',1493542163,222,4,NULL),(139,'Lays',1493542163,60,3,NULL),(140,'Bathroom',1493542163,5,21,NULL),(141,'Samosa',1493542163,20,3,NULL),(142,'Bike Parking',1493542163,20,21,NULL),(143,'Dress Stitch',1493629222,200,2,NULL),(144,'Bovanto',1493629222,130,3,NULL),(145,'DTH Recharge - Vinothini',1493629222,164,6,1),(146,'Amma - House Expenses',1493629222,500,13,NULL),(147,'MOM Mobile recharge',1493455763,120,6,1);
/*!40000 ALTER TABLE `tbl_expense` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER EXPENSE_TRIG_STATEMENT AFTER INSERT ON tbl_expense 
FOR EACH ROW
BEGIN
 INSERT INTO TBL_STATEMENT (AMOUNT,DESCRIPTION,AMOUNT_TYPE,DATETIME) VALUES (NEW.AMOUNT,NEW.DESCRIPTION,'DEBIT',NEW.EXPENSE_DATE);
 IF NEW.BANK_ID IS NOT NULL THEN
	UPDATE bank_account SET BALANCE=BALANCE-NEW.AMOUNT WHERE ID=NEW.BANK_ID;
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_income`
--

DROP TABLE IF EXISTS `tbl_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_income` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `INCOME_DATE` int(10) DEFAULT NULL,
  `BANK_ID` int(11) DEFAULT NULL,
  `WITHDRAW_TYPE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BNK_ID_idx` (`BANK_ID`),
  CONSTRAINT `BNK_ID` FOREIGN KEY (`BANK_ID`) REFERENCES `bank_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_income`
--

LOCK TABLES `tbl_income` WRITE;
/*!40000 ALTER TABLE `tbl_income` DISABLE KEYS */;
INSERT INTO `tbl_income` VALUES (1,'Bank Savings - HDFC',181361.67,1491817311,NULL,NULL),(2,'Home Savings',10500,1491817346,NULL,NULL),(3,'FlipKart Wallet',163,1491817376,NULL,NULL),(4,'Pavithra - Home ',150,1492191580,NULL,NULL),(5,'Snacks Amount Refund',319,1492501856,NULL,NULL),(6,'Anbu lunch',50,1493198186,NULL,NULL),(7,'Salary April month',65426.2,1493357336,1,NULL),(8,'Pavithra',300,1493365688,NULL,NULL),(9,'Home Savings',5000,1493365688,NULL,NULL),(10,'Withdraw amount',20000,1493452228,NULL,NULL),(11,'Recharge Amount',50,1493452228,NULL,NULL),(12,'Pavithra Purse',50,1493542163,NULL,NULL);
/*!40000 ALTER TABLE `tbl_income` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER INCOME_TRIG_STATEMENT AFTER INSERT ON tbl_income 
FOR EACH ROW
BEGIN
 INSERT INTO TBL_STATEMENT (AMOUNT,DESCRIPTION,AMOUNT_TYPE,DATETIME) VALUES (NEW.AMOUNT,NEW.DESCRIPTION,'CREDIT',NEW.INCOME_DATE);
 IF NEW.BANK_ID IS NOT NULL THEN
    UPDATE bank_account SET BALANCE = BALANCE+NEW.AMOUNT WHERE ID=NEW.BANK_ID;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_outstanding`
--

DROP TABLE IF EXISTS `tbl_outstanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_outstanding` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `OUTSTANDING_DATE` int(10) DEFAULT NULL,
  `CLEARED_YN` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_outstanding`
--

LOCK TABLES `tbl_outstanding` WRITE;
/*!40000 ALTER TABLE `tbl_outstanding` DISABLE KEYS */;
INSERT INTO `tbl_outstanding` VALUES (1,'Ramya - Petrol Bunk Swipe',6020,1489986141,'N'),(2,'Nosha Devi',12000,1492837341,'N'),(3,'Jayashri',5000,1490687288,'N'),(4,'DTH recharge - Vionthini',164,1493542163,'N');
/*!40000 ALTER TABLE `tbl_outstanding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_statement`
--

DROP TABLE IF EXISTS `tbl_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_statement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` double DEFAULT NULL,
  `DESCRIPTION` varchar(45) DEFAULT NULL,
  `AMOUNT_TYPE` varchar(45) DEFAULT NULL,
  `DATETIME` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_statement`
--

LOCK TABLES `tbl_statement` WRITE;
/*!40000 ALTER TABLE `tbl_statement` DISABLE KEYS */;
INSERT INTO `tbl_statement` VALUES (1,181361.67,'Bank Savings - HDFC','CREDIT',1491817311),(2,10500,'Home Savings','CREDIT',1491817346),(3,163,'FlipKart Wallet','CREDIT',1491817376),(5,23103.49,'CREDIT CARD BILL','DEBIT',1491817875),(6,2000,'Jayashri tablets','DEBIT',1491817963),(7,1795,'Pavithra Specs','DEBIT',1491818000),(8,500,'Prasanna','DEBIT',1491818043),(9,500,'Shirts and Trousers - Stitch','DEBIT',1491818082),(10,413,'Sweets and Snacks maraimalai nagar function','DEBIT',1491818139),(11,303,'JIO Recharge','DEBIT',1491818540),(12,170,'Appa drinks','DEBIT',1491818577),(13,188,'Temple','DEBIT',1491818620),(14,58,'Naturals pavithra','DEBIT',1491818672),(15,23,'XEROX - DOCUMENTS','DEBIT',1491818730),(16,7,'Maruthani Cone','DEBIT',1491818758),(17,16,'Appa Recharge','DEBIT',1491818788),(18,100,'Bike Waterwash','DEBIT',1491818816),(19,100,'Fruits','DEBIT',1491818858),(20,3000,'Maraimalai nagar function - CAR','DEBIT',1491818920),(21,400,'Maraimalai nagar - CAR - Driver batta','DEBIT',1491818941),(22,500,'Amma - on maraimalai nagar function','DEBIT',1491818988),(23,85,'Marimalai nagar function checkpost','DEBIT',1491819026),(24,11000,'Seetu kasu - APRIL','DEBIT',1491819062),(25,8000,'Amma - house expenses','DEBIT',1491819085),(26,50,'Pavithra - Recharge','DEBIT',1491819344),(27,60,'Sundal, Bajji and Samosa','DEBIT',1491819387),(28,765,'Tata Sky Recharge','DEBIT',1491819415),(29,40,'Mushroom','DEBIT',1491819470),(30,10999,'Redmi Note 4 new mobile','DEBIT',1491819509),(31,10846,'Personal Loan EMI','DEBIT',1491819536),(32,20,'Amma','DEBIT',1491819553),(33,100,'Petrol','DEBIT',1491819553),(34,50,'Petrol','DEBIT',1491819553),(35,20,'Milk - temple and donation','DEBIT',1491819624),(36,160,'Temple','DEBIT',1491819641),(37,40,'Juice','DEBIT',1491819656),(38,200,'Appa','DEBIT',1491819670),(39,20,'Biscuits','DEBIT',1491819670),(40,500,'Pavithra','DEBIT',1491819707),(41,74,'cocount oil and Rasakarpuram','DEBIT',1491819707),(42,280,'Movie cooldrinks and snacks','DEBIT',1491819770),(43,180,'Kolathur - Dinesh house','DEBIT',1491819809),(44,30,'Movie bike parking','DEBIT',1491819874),(45,292,'Medplus - surpcal and revillus tablets','DEBIT',1491819918),(46,80180.86,'Credit card bill','DEBIT',1491820025),(47,50,'Redmi note 4 temper glass','DEBIT',1491843489),(48,20,'Bought Eggs for lunch','DEBIT',1491913839),(49,7,'Bought Medimix Soap','DEBIT',1491913839),(50,40,'Metro train','DEBIT',1491913839),(51,10,'Bhadam milk','DEBIT',1491913839),(52,330,'Panruti Bus cost','DEBIT',1491913839),(53,20,'Coffee','DEBIT',1491913839),(54,35,'Bhadam milk','DEBIT',1491913839),(55,10,'donation','DEBIT',1491913839),(56,5,'Restroom','DEBIT',29527),(57,463,'Medical Panruti','DEBIT',1492105679),(58,225,'Kumbakonam Bus','DEBIT',1492191580),(59,200,'Kumbakonam Bus','DEBIT',1492191580),(60,20,'Temple donation','DEBIT',1492191580),(61,10,'Chappel Stand','DEBIT',1492191580),(62,120,'Juice - Kumbakonam Temple','DEBIT',1492191580),(63,10,'Restroom','DEBIT',1492191580),(64,48,'Cuddalore - pondy Bus','DEBIT',1492191580),(65,100,'Hospital','DEBIT',1492191580),(66,32,'Mazza','DEBIT',1492191580),(67,48,'Bajji','DEBIT',1492191580),(68,22,'Pondy - cuddalore bus','DEBIT',1492191580),(69,50,'Badham juice','DEBIT',1492191580),(70,20,'Cuddalore - Panruti bus','DEBIT',1492191580),(71,5,'Restroom','DEBIT',1492191580),(72,2000,'Pavithra - MOM','DEBIT',1492191580),(73,200,'Panruti - chennai','DEBIT',1492191580),(74,300,'call taxi - office','DEBIT',1492191580),(75,20,'waterbottle','DEBIT',1492191580),(76,40,'juice','DEBIT',1492191580),(77,100,'ice cream and chocolates','DEBIT',1492191580),(78,70,'mom tablets','DEBIT',1492191580),(79,150,'Pavithra - Home ','CREDIT',1492191580),(80,94,'Pavithra - Vodafone - Recharge','DEBIT',1492434320),(85,40,'Mushroom and Pani puri','DEBIT',1492500825),(86,159,'Idea Mobile booster & full talk time','DEBIT',1492500825),(87,4484,'Electricity bill - April month','DEBIT',1492500825),(88,319,'Snacks Amount Refund','CREDIT',1492501856),(89,18,'biscuits and barbi','DEBIT',1492500825),(90,50,'Face Shavings','DEBIT',1492500825),(91,20,'Lunch Egg','DEBIT',1492500825),(92,105,'Mushroom','DEBIT',1492500825),(93,40,'Coconut water','DEBIT',1492500825),(94,100,'Petrol','DEBIT',1492671011),(95,150,'Pavithra - Savings','DEBIT',1492671011),(96,5,'Sugar','DEBIT',1492777073),(97,200,'Amma','DEBIT',1492777073),(98,500,'Saravana Treat','DEBIT',1492777073),(99,12000,'Nosha devi','DEBIT',1492870060),(100,55,'Fruit Juice','DEBIT',1492870060),(101,220,'Ice Creams','DEBIT',1492870060),(102,100,'Mom - Ration','DEBIT',1492870060),(103,20,'Good day biscuit','DEBIT',1492870060),(104,180,'Appa','DEBIT',1492870060),(105,150,'Renuka Doctor Consultant','DEBIT',1492870060),(106,80,'Fruit Juice - Porur','DEBIT',1492918138),(107,216,'Sweets and Snacks - Kundrathur','DEBIT',1492918138),(108,500,'Makup - Pavithra - Kundrathur','DEBIT',1492918138),(109,150,'Pavithra - Bangles','DEBIT',1492918138),(110,25,'Amar- Facecream','DEBIT',1492918138),(111,10,'Amar - Face powder','DEBIT',1492918138),(112,20,'Amar - Water bottle','DEBIT',1492918138),(113,500,'Kundrathur Geetha marriage','DEBIT',1492918138),(114,5,'Marriage Moi Cover','DEBIT',1492918138),(115,30,'Tablets','DEBIT',1492918138),(116,50,'Anbu lunch','CREDIT',1493198186),(117,30,'Egg lunch','DEBIT',1493198186),(118,50,'Anbu','DEBIT',1493198186),(119,40,'Sundal - snacks','DEBIT',1493213400),(120,40,'Coconut water','DEBIT',1493272961),(121,20,'Egg office lunch','DEBIT',1493272961),(124,24,'Mouse Battery','DEBIT',1493308704),(125,95,'Ice cream','DEBIT',1493308704),(126,65426.2,'Salary April month','CREDIT',1493357336),(127,40,'Coconut water','DEBIT',1493357336),(128,20,'Lunch Egg','DEBIT',1493357336),(129,100,'Petrol','DEBIT',1493365688),(130,220,'Theatre Snack','DEBIT',1493365688),(131,110,'Night Dinner','DEBIT',1493365688),(132,160,'Hair Cut and Shavings','DEBIT',1493452228),(133,130,'Belt','DEBIT',1493452228),(134,40,'Juice','DEBIT',1493452228),(135,40,'Pavithra Icecream','DEBIT',1493452228),(136,160,'Appa','DEBIT',1493452228),(137,300,'Pavithra','CREDIT',1493365688),(138,5000,'Home Savings','CREDIT',1493365688),(139,20000,'Withdraw amount ','DEBIT',1493452228),(140,20000,'Withdraw amount','CREDIT',1493452228),(141,50,'Mobile Recharge','DEBIT',1493452228),(142,50,'Recharge Amount','CREDIT',1493452228),(143,588,'LIC','DEBIT',1493452228),(144,40,'Parking','DEBIT',1493365688),(145,9188.44,'Credit Card Bill','DEBIT',1493365688),(146,50,'Pavithra Purse','CREDIT',1493542163),(147,20,'Bike Parking','DEBIT',1493455763),(148,94,'Jiuce and Water bottle','DEBIT',1493455763),(149,276,'Bus Ticket - Panruti','DEBIT',1493455763),(150,501,'House Warming Function','DEBIT',1493542163),(151,1,'Moi Cover','DEBIT',1493542163),(152,222,'Bus Ticket - Chennai','DEBIT',1493542163),(153,60,'Lays','DEBIT',1493542163),(154,5,'Bathroom','DEBIT',1493542163),(155,20,'Samosa','DEBIT',1493542163),(156,20,'Bike Parking','DEBIT',1493542163),(157,200,'Dress Stitch','DEBIT',1493629222),(158,130,'Bovanto','DEBIT',1493629222),(159,164,'DTH Recharge - Vinothini','DEBIT',1493629222),(160,500,'Amma - House Expenses','DEBIT',1493629222),(161,120,'MOM Mobile recharge','DEBIT',1493455763);
/*!40000 ALTER TABLE `tbl_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `datevalue` date DEFAULT NULL,
  `test` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'test','2017-04-25',NULL),(2,'test1','2017-04-30',NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'datamanager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-02 12:46:51
