CREATE DATABASE  IF NOT EXISTS `empresa_ferretera` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `empresa_ferretera`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empresa_ferretera
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
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la factura',
  `fecha_factura` date NOT NULL COMMENT 'Fecha en que se emitió la factura',
  `id_pedido` int NOT NULL COMMENT 'Identificador del pedido asociado a la factura',
  `id_empleado` int NOT NULL COMMENT 'Identificador del empleado que emitió la factura',
  `total_factura` decimal(10,2) NOT NULL COMMENT 'Monto total de la factura',
  PRIMARY KEY (`id_factura`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT,
  CONSTRAINT `facturas_chk_1` CHECK ((`total_factura` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las facturas emitidas. Restricción: Si se elimina un pedido, se eliminará la factura asociada';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2024-07-01',1,3,66.00),(2,'2024-07-02',2,23,100.00),(3,'2024-07-03',3,3,8.75),(4,'2024-07-04',4,23,43.75),(5,'2024-07-05',5,3,35.00),(6,'2024-07-06',6,23,750.00),(7,'2024-07-07',7,3,240.00),(8,'2024-07-08',8,23,135.00),(9,'2024-07-09',9,3,800.00),(10,'2024-07-10',10,23,150.00),(11,'2024-07-11',11,3,180.00),(12,'2024-07-12',12,23,700.00),(13,'2024-07-13',13,3,200.00),(14,'2024-07-14',14,23,1200.00),(15,'2024-07-15',15,3,100.00),(16,'2024-07-16',16,23,135.00),(17,'2024-07-17',17,3,220.00),(18,'2024-07-18',18,23,1600.00),(19,'2024-07-19',19,3,450.00),(20,'2024-07-20',20,23,500.00),(21,'2024-07-21',21,3,240.00),(22,'2024-07-22',22,23,170.00),(23,'2024-07-23',23,23,400.00),(24,'2024-07-24',24,3,270.00),(25,'2024-08-01',25,23,1600.00),(26,'2024-08-02',26,3,500.00),(27,'2024-08-03',27,23,180.00),(28,'2024-08-04',28,3,340.00),(29,'2024-08-05',29,23,340.00),(30,'2024-08-06',30,23,180.00),(31,'2024-08-07',31,3,220.00),(32,'2024-08-08',32,23,2400.00),(33,'2024-08-09',33,3,300.00),(34,'2024-08-10',34,23,500.00),(35,'2024-08-11',35,3,120.00),(36,'2024-08-12',36,23,85.00),(37,'2024-08-13',37,3,1200.00),(38,'2024-08-14',38,23,180.00),(39,'2024-08-15',39,3,880.00),(40,'2024-08-16',40,23,1600.00),(41,'2024-08-17',41,3,1000.00),(42,'2024-08-18',42,23,60.00),(43,'2024-08-19',43,3,255.00),(44,'2024-08-20',44,23,400.00),(45,'2024-08-21',45,23,180.00),(46,'2024-08-22',46,3,880.00),(47,'2024-08-23',47,23,4000.00);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 20:21:27