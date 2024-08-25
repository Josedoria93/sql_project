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
-- Table structure for table `direcciones_clientes`
--

DROP TABLE IF EXISTS `direcciones_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones_clientes` (
  `id_direccion_cliente` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la dirección del cliente',
  `id_cliente` int NOT NULL COMMENT 'Identificador del cliente',
  `direccion` text NOT NULL COMMENT 'Dirección del cliente',
  PRIMARY KEY (`id_direccion_cliente`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `direcciones_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las direcciones de los clientes. Restricción: Si se elimina un cliente, también se eliminarán sus direcciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_clientes`
--

LOCK TABLES `direcciones_clientes` WRITE;
/*!40000 ALTER TABLE `direcciones_clientes` DISABLE KEYS */;
INSERT INTO `direcciones_clientes` VALUES (1,1,'Avenida Siempre Viva 742, Springfield'),(2,2,'Calle Falsa 123, Springfield'),(3,3,'Avenida Libertad 456, Springfield'),(4,4,'Calle Esperanza 789, Springfield'),(5,5,'Calle del Sol 101, Springfield'),(6,6,'Calle del Lago 12, Springfield'),(7,7,'Calle del Norte 20, Springfield'),(8,8,'Avenida del Río 34, Springfield'),(9,9,'Calle del Centro 50, Springfield'),(10,10,'Avenida del Sol 66, Springfield'),(11,11,'Calle del Valle 88, Springfield'),(12,12,'Avenida del Parque 77, Springfield'),(13,13,'Calle del Río 66, Springfield'),(14,14,'Avenida del Cielo 55, Springfield'),(15,15,'Calle del Sol 44, Springfield'),(16,16,'Calle de la Luna 33, Springfield'),(17,17,'Calle Primavera 11, Springfield'),(18,18,'Avenida del Bosque 22, Springfield'),(19,19,'Calle de la Paz 33, Springfield'),(20,20,'Avenida del Comercio 44, Springfield'),(21,21,'Calle de los Rosales 55, Springfield'),(22,22,'Avenida del Sol 66, Springfield'),(23,23,'Calle del Mar 77, Springfield'),(24,24,'Avenida del Valle 88, Springfield'),(25,25,'Calle de los Tulipanes 99, Springfield'),(26,26,'Avenida de la Libertad 101, Springfield');
/*!40000 ALTER TABLE `direcciones_clientes` ENABLE KEYS */;
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
