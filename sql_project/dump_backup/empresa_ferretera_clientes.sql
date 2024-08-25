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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cliente',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo del cliente',
  `telefono` varchar(20) NOT NULL COMMENT 'Número de teléfono del cliente',
  `email` varchar(100) NOT NULL COMMENT 'Correo electrónico del cliente',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena la información de los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Pérez','551-1234','juan.perez@example.com'),(2,'Ana Gómez','552-5678','ana.gomez@example.com'),(3,'Pedro Martínez','553-8765','pedro.martinez@example.com'),(4,'Laura Fernández','554-4321','laura.fernandez@example.com'),(5,'Carlos Ruiz','555-6789','carlos.ruiz@example.com'),(6,'Elena Morales','556-1230','elena.morales@example.com'),(7,'Oscar Ruiz','557-1231','oscar.ruiz@example.com'),(8,'Sofia Castro','558-1232','sofia.castro@example.com'),(9,'David Vargas','559-1233','david.vargas@example.com'),(10,'Isabel Ortega','510-1235','isabel.ortega@example.com'),(11,'Martín Silva','511-2233','martin.silva@example.com'),(12,'Natalia Ortega','512-2234','natalia.ortega@example.com'),(13,'Roberto Castillo','513-2235','roberto.castillo@example.com'),(14,'Jessica Martínez','514-2236','jessica.martinez@example.com'),(15,'Francisco Ruiz','515-2237','francisco.ruiz@example.com'),(16,'Verónica López','516-2238','veronica.lopez@example.com'),(17,'Alberto Gómez','517-3344','alberto.gomez@example.com'),(18,'Carmen Díaz','518-3345','carmen.diaz@example.com'),(19,'Lucas Martínez','519-3346','lucas.martinez@example.com'),(20,'Patricia Fernández','520-3347','patricia.fernandez@example.com'),(21,'Esteban Gómez','521-3348','esteban.gomez@example.com'),(22,'Liliana Moreno','522-3349','liliana.moreno@example.com'),(23,'Nicolás Castro','523-3350','nicolas.castro@example.com'),(24,'Andrea Silva','524-3351','andrea.silva@example.com'),(25,'María López','525-3401','maria.lopez@example.com'),(26,'José Fernández','526-3402','jose.fernandez@example.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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