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
-- Table structure for table `compras_proveedores`
--

DROP TABLE IF EXISTS `compras_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_proveedores` (
  `id_compra_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la compra al proveedor',
  `fecha_compra` date NOT NULL COMMENT 'Fecha en que se realizó la compra',
  `id_proveedor` int NOT NULL COMMENT 'Identificador del proveedor',
  `total_compra` decimal(10,2) NOT NULL COMMENT 'Monto total de la compra',
  `estado_pago` varchar(50) DEFAULT NULL COMMENT 'Estado del pago (e.g., pagado, pendiente)',
  PRIMARY KEY (`id_compra_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `compras_proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT,
  CONSTRAINT `compras_proveedores_chk_1` CHECK ((`total_compra` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las compras realizadas a proveedores. Restricción: No se puede eliminar un proveedor si hay compras asociadas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_proveedores`
--

LOCK TABLES `compras_proveedores` WRITE;
/*!40000 ALTER TABLE `compras_proveedores` DISABLE KEYS */;
INSERT INTO `compras_proveedores` VALUES (1,'2024-07-01',1,300.00,'Pagado'),(2,'2024-07-02',2,270.00,'Pendiente'),(3,'2024-07-03',3,800.00,'Pagado'),(4,'2024-07-04',4,230.00,'Pagado'),(5,'2024-07-05',5,75.00,'Pendiente'),(6,'2024-07-06',6,16500.00,'Pagado'),(7,'2024-07-07',7,5400.00,'Pendiente'),(8,'2024-07-08',8,2000.00,'Pagado'),(9,'2024-07-09',9,2500.00,'Pagado'),(10,'2024-07-10',10,1000.00,'Pendiente'),(11,'2024-07-11',11,1600.00,'Pagado'),(12,'2024-07-12',12,2250.00,'Pendiente'),(13,'2024-07-13',13,1000.00,'Pagado'),(14,'2024-07-14',14,4500.00,'Pagado'),(15,'2024-07-15',15,250.00,'Pendiente'),(16,'2024-07-16',16,625.00,'Pagado');
/*!40000 ALTER TABLE `compras_proveedores` ENABLE KEYS */;
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
