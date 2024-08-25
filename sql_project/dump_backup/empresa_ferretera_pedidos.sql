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
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del pedido',
  `fecha_pedido` date NOT NULL COMMENT 'Fecha en que se realizó el pedido',
  `id_cliente` int NOT NULL COMMENT 'Identificador del cliente que realizó el pedido',
  `id_metodo_pago` int NOT NULL COMMENT 'Identificador del método de pago utilizado',
  `id_empleado` int NOT NULL COMMENT 'Identificador del empleado que gestionó el pedido',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE RESTRICT,
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los pedidos realizados. Restricción: Si se elimina un cliente, se eliminarán sus pedidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2024-07-01',1,1,3),(2,'2024-07-02',2,2,7),(3,'2024-07-03',3,3,12),(4,'2024-07-04',4,4,18),(5,'2024-07-05',5,5,23),(6,'2024-07-06',6,1,3),(7,'2024-07-07',7,2,7),(8,'2024-07-08',8,3,12),(9,'2024-07-09',9,4,18),(10,'2024-07-10',10,5,23),(11,'2024-07-11',11,1,3),(12,'2024-07-12',12,2,7),(13,'2024-07-13',13,3,12),(14,'2024-07-14',14,4,18),(15,'2024-07-15',15,5,23),(16,'2024-07-16',16,1,3),(17,'2024-07-17',17,1,7),(18,'2024-07-18',18,2,12),(19,'2024-07-19',19,3,18),(20,'2024-07-20',20,4,23),(21,'2024-07-21',21,5,23),(22,'2024-07-22',22,1,18),(23,'2024-07-23',23,2,12),(24,'2024-07-24',24,3,7),(25,'2024-08-01',17,2,3),(26,'2024-08-02',18,3,3),(27,'2024-08-03',19,4,7),(28,'2024-08-04',20,5,12),(29,'2024-08-05',21,1,18),(30,'2024-08-06',22,2,23),(31,'2024-08-07',23,3,3),(32,'2024-08-08',24,4,7),(33,'2024-08-09',17,5,12),(34,'2024-08-10',18,1,18),(35,'2024-08-11',19,2,23),(36,'2024-08-12',20,3,3),(37,'2024-08-13',21,4,7),(38,'2024-08-14',22,5,12),(39,'2024-08-15',23,1,18),(40,'2024-08-16',24,2,23),(41,'2024-08-17',18,1,3),(42,'2024-08-18',19,2,7),(43,'2024-08-19',20,3,12),(44,'2024-08-20',21,4,18),(45,'2024-08-21',22,5,23),(46,'2024-08-22',23,1,3),(47,'2024-08-23',24,2,7);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
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