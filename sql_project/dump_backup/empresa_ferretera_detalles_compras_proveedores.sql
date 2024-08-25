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
-- Table structure for table `detalles_compras_proveedores`
--

DROP TABLE IF EXISTS `detalles_compras_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_compras_proveedores` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del detalle de la compra al proveedor',
  `id_compra_proveedor` int NOT NULL COMMENT 'Identificador de la compra al proveedor',
  `id_producto` int NOT NULL COMMENT 'Identificador del producto comprado',
  `cantidad` int NOT NULL COMMENT 'Cantidad del producto en la compra',
  `precio_compra` decimal(10,2) NOT NULL COMMENT 'Precio unitario del producto en la compra',
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_compra_proveedor` (`id_compra_proveedor`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalles_compras_proveedores_ibfk_1` FOREIGN KEY (`id_compra_proveedor`) REFERENCES `compras_proveedores` (`id_compra_proveedor`) ON DELETE CASCADE,
  CONSTRAINT `detalles_compras_proveedores_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT,
  CONSTRAINT `detalles_compras_proveedores_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los detalles de las compras realizadas a proveedores. Restricción: No se puede eliminar un producto si hay detalles de compras asociados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_compras_proveedores`
--

LOCK TABLES `detalles_compras_proveedores` WRITE;
/*!40000 ALTER TABLE `detalles_compras_proveedores` DISABLE KEYS */;
INSERT INTO `detalles_compras_proveedores` VALUES (1,1,1,20,15.00),(2,1,2,30,9.00),(3,2,3,10,80.00),(4,3,4,40,5.75),(5,4,5,50,1.50),(6,6,6,30,550.00),(7,7,7,60,90.00),(8,8,8,80,25.00),(9,9,9,25,100.00),(10,10,10,100,10.00),(11,11,11,20,80.00),(12,12,12,15,150.00),(13,13,13,10,100.00),(14,14,14,5,900.00),(15,15,15,50,5.00),(16,16,16,25,25.00);
/*!40000 ALTER TABLE `detalles_compras_proveedores` ENABLE KEYS */;
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
