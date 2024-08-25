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
-- Table structure for table `comentario_cliente`
--

DROP TABLE IF EXISTS `comentario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario_cliente` (
  `id_comentario` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del comentario del cliente',
  `id_cliente` int NOT NULL COMMENT 'Identificador del cliente que hizo el comentario',
  `comentario` text NOT NULL COMMENT 'Texto del comentario del cliente',
  `fecha_comentario` date NOT NULL COMMENT 'Fecha en que se realizó el comentario',
  PRIMARY KEY (`id_comentario`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `comentario_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los comentarios realizados por los clientes. Restricción: Si se elimina un cliente, se eliminarán sus comentarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_cliente`
--

LOCK TABLES `comentario_cliente` WRITE;
/*!40000 ALTER TABLE `comentario_cliente` DISABLE KEYS */;
INSERT INTO `comentario_cliente` VALUES (1,1,'Excelente servicio y productos','2024-07-01'),(2,2,'La entrega fue muy rápida','2024-07-02'),(3,3,'Los precios son muy competitivos','2024-07-03'),(4,4,'Me gusta la variedad de productos','2024-07-04'),(5,5,'La atención al cliente es excelente','2024-07-05'),(6,6,'El producto llegó en perfectas condiciones','2024-07-06'),(7,7,'La atención al cliente es muy buena','2024-07-07'),(8,8,'El envío fue rápido','2024-07-08'),(9,9,'La calidad del producto es excelente','2024-07-09'),(10,10,'Me gustó mucho el servicio','2024-07-10'),(11,11,'El microondas llegó a tiempo y en perfectas condiciones','2024-07-11'),(12,12,'Excelente cámara, superó mis expectativas','2024-07-12'),(13,13,'El escritorio llegó bien embalado, pero con un pequeño rasguño','2024-07-13'),(14,14,'El ordenador portátil funciona perfecto','2024-07-14'),(15,15,'La camiseta es de buena calidad y llegó rápido','2024-07-15'),(16,16,'La muñeca es hermosa, mi hija está encantada','2024-07-16'),(17,17,'La aspiradora funciona perfectamente','2024-07-17'),(18,18,'El smartphone llegó rápido, pero la caja estaba dañada','2024-07-18'),(19,19,'La silla es muy cómoda y se ve robusta','2024-07-19'),(20,20,'La tableta es increíble, pero el envío fue lento','2024-07-20'),(21,21,'El jersey es de buena calidad y el color es hermoso','2024-07-21'),(22,22,'El triciclo llegó justo a tiempo para el cumpleaños de mi hijo','2024-07-22'),(23,23,'El proyector tiene una excelente resolución','2024-07-23'),(24,24,'El altavoz Bluetooth tiene un sonido muy claro','2024-07-24'),(25,17,'El producto llegó en excelente estado','2024-08-01'),(26,18,'El servicio al cliente fue muy eficiente','2024-08-02'),(27,19,'El embalaje estaba dañado, pero el producto estaba bien','2024-08-03'),(28,20,'La entrega fue más rápida de lo esperado','2024-08-04'),(29,21,'La calidad del producto es muy buena','2024-08-05'),(30,22,'El seguimiento del pedido fue muy bueno','2024-08-06'),(31,23,'El producto no corresponde a la descripción','2024-08-07'),(32,24,'Todo perfecto, volveré a comprar','2024-08-08'),(33,17,'El artículo llegó antes de la fecha estimada','2024-08-09'),(34,18,'Me gustaría que mejoraran el embalaje','2024-08-10'),(35,19,'La atención telefónica fue muy amable','2024-08-11'),(36,20,'El precio es excelente para la calidad del producto','2024-08-12'),(37,21,'No recibí toda la cantidad solicitada','2024-08-13'),(38,22,'La entrega fue puntual y el producto está bien','2024-08-14'),(39,23,'Tuve problemas con el seguimiento del pedido','2024-08-15'),(40,24,'El producto llegó defectuoso y se hizo el cambio rápidamente','2024-08-16'),(41,18,'El pedido llegó en excelentes condiciones','2024-08-17'),(42,19,'El producto cumplió con las expectativas','2024-08-18'),(43,20,'Hubo un error con la cantidad entregada','2024-08-19'),(44,21,'La entrega fue muy rápida y sin problemas','2024-08-20'),(45,22,'El producto llegó bien embalado','2024-08-21'),(46,23,'Excelente calidad del producto y servicio','2024-08-22'),(47,24,'El precio fue muy competitivo','2024-08-23');
/*!40000 ALTER TABLE `comentario_cliente` ENABLE KEYS */;
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
