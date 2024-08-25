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
-- Table structure for table `direcciones_proveedores`
--

DROP TABLE IF EXISTS `direcciones_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones_proveedores` (
  `id_direccion_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la dirección del proveedor',
  `id_proveedor` int NOT NULL COMMENT 'Identificador del proveedor',
  `direccion` text NOT NULL COMMENT 'Dirección del proveedor',
  PRIMARY KEY (`id_direccion_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `direcciones_proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las direcciones de los proveedores. Restricción: Si se elimina un proveedor, también se eliminarán sus direcciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_proveedores`
--

LOCK TABLES `direcciones_proveedores` WRITE;
/*!40000 ALTER TABLE `direcciones_proveedores` DISABLE KEYS */;
INSERT INTO `direcciones_proveedores` VALUES (1,1,'Calle Mayor 10, Ciudad Real'),(2,2,'Avenida del Comercio 22, Ciudad Real'),(3,3,'Plaza Central 15, Ciudad Real'),(4,4,'Calle del Mercado 30, Ciudad Real'),(5,5,'Avenida de la Industria 5, Ciudad Real'),(6,6,'Calle de la Luna 22, Astro City'),(7,7,'Avenida Estrella 45, Astro City'),(8,8,'Plaza Galaxia 10, Astro City'),(9,9,'Calle Cometa 33, Astro City'),(10,10,'Avenida Nebulosa 55, Astro City'),(11,11,'Calle Nueva 21, Ciudad Vista'),(12,12,'Avenida Central 12, Ciudad Vista'),(13,13,'Plaza del Comercio 34, Ciudad Vista'),(14,14,'Calle de la Esperanza 45, Ciudad Vista'),(15,15,'Avenida Libertad 56, Ciudad Vista'),(16,16,'Calle de la Alegría 67, Ciudad Vista');
/*!40000 ALTER TABLE `direcciones_proveedores` ENABLE KEYS */;
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
