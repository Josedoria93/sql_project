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
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle del pedido',
  `id_pedido` int NOT NULL COMMENT 'Identificador del pedido',
  `id_producto` int NOT NULL COMMENT 'Identificador del producto',
  `cantidad` int NOT NULL COMMENT 'Cantidad del producto en el pedido',
  `precio_venta` decimal(10,2) NOT NULL COMMENT 'Precio unitario del producto en el pedido',
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT,
  CONSTRAINT `detalle_pedidos_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los detalles de cada pedido. Restricción: No se puede eliminar un producto si hay detalles de pedidos asociados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_pedidos` VALUES (1,1,1,2,25.50),(2,1,2,1,15.00),(3,2,3,1,100.00),(4,3,4,5,8.75),(5,4,5,10,3.50),(6,6,6,1,750.00),(7,7,7,2,120.00),(8,8,8,3,45.00),(9,9,9,4,200.00),(10,10,10,5,30.00),(11,11,11,1,180.00),(12,12,12,2,350.00),(13,13,13,1,200.00),(14,14,14,1,1200.00),(15,15,15,4,25.00),(16,16,16,3,45.00),(17,17,17,1,220.00),(18,18,18,2,800.00),(19,19,19,3,150.00),(20,20,20,1,500.00),(21,21,21,4,60.00),(22,22,22,2,85.00),(23,23,23,1,400.00),(24,24,24,3,90.00),(25,25,18,2,800.00),(26,26,20,1,500.00),(27,27,21,3,60.00),(28,28,22,4,85.00),(29,29,23,1,400.00),(30,30,24,2,90.00),(31,31,17,1,220.00),(32,32,18,3,800.00),(33,33,19,2,150.00),(34,34,20,1,500.00),(35,35,21,2,60.00),(36,36,22,1,85.00),(37,37,23,3,400.00),(38,38,24,2,90.00),(39,39,17,4,220.00),(40,40,18,2,800.00),(41,41,20,2,500.00),(42,42,21,1,60.00),(43,43,22,3,85.00),(44,44,23,1,400.00),(45,45,24,2,90.00),(46,46,17,4,220.00),(47,47,18,5,800.00);
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 20:21:26
