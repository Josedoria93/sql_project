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
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del empleado',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo del empleado',
  `telefono` varchar(20) NOT NULL COMMENT 'Número de teléfono del empleado',
  `email` varchar(100) NOT NULL COMMENT 'Correo electrónico del empleado',
  `id_departamento` int NOT NULL COMMENT 'Identificador del departamento al que pertenece el empleado',
  `puesto` varchar(100) DEFAULT NULL COMMENT 'Puesto del empleado en la empresa',
  `salario` decimal(10,2) NOT NULL COMMENT 'Salario del empleado',
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE RESTRICT,
  CONSTRAINT `empleados_chk_1` CHECK ((`salario` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena la información de los empleados. Restricción: No se puede eliminar un departamento si hay empleados asignados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Mario López','555-0001','mario.lopez@example.com',1,'Director General',5000.00),(2,'Patricia Gómez','555-0002','patricia.gomez@example.com',2,'Especialista en Recursos Humanos',3000.00),(3,'Andrés Morales','555-0003','andres.morales@example.com',3,'Gerente de Ventas',4000.00),(4,'Elena Rodríguez','555-0004','elena.rodriguez@example.com',4,'Agente de Compras',3500.00),(5,'José Martínez','555-0005','jose.martinez@example.com',5,'Coordinador de Logística',3200.00),(6,'Marta Gómez','555-0006','marta.gomez@example.com',2,'Reclutadora',2800.00),(7,'Raúl Fernández','555-0007','raul.fernandez@example.com',3,'Ejecutivo de Cuentas',3700.00),(8,'Victoria Torres','555-0008','victoria.torres@example.com',4,'Gerente de Cadena de Suministro',4000.00),(9,'Roberto Morales','555-0009','roberto.morales@example.com',5,'Supervisor de Almacén',3300.00),(10,'Claudia Pérez','555-0010','claudia.perez@example.com',1,'Directora Financiera',5500.00),(11,'Fabiola Martínez','555-0011','fabiola.martinez@example.com',2,'Especialista en Nómina',2900.00),(12,'Adrián Torres','555-0012','adrian.torres@example.com',3,'Coordinador de Ventas',3500.00),(13,'Carla Ramírez','555-0013','carla.ramirez@example.com',4,'Especialista en Adquisiciones',3800.00),(14,'Marcos García','555-0014','marcos.garcia@example.com',5,'Gerente de Control de Inventarios',3400.00),(15,'Daniela Pérez','555-0015','daniela.perez@example.com',1,'Analista Financiera',3100.00),(16,'Ricardo López','555-0016','ricardo.lopez@example.com',2,'Gerente de Recursos Humanos',3200.00),(17,'Daniel Soto','555-0021','daniel.soto@example.com',2,'Especialista en Capacitación',3100.00),(18,'Paola Vargas','555-0022','paola.vargas@example.com',3,'Gerente de Producto',3700.00),(19,'Marcelo Paredes','555-0023','marcelo.paredes@example.com',4,'Coordinador de Logística',3900.00),(20,'Silvia Muñoz','555-0024','silvia.munoz@example.com',5,'Directora de Operaciones',4200.00),(21,'Javier Ramírez','555-0025','javier.ramirez@example.com',1,'Director Ejecutivo',6000.00),(22,'Mónica Gómez','555-0026','monica.gomez@example.com',2,'Directora de Marketing',3500.00),(23,'Sergio Martínez','555-0027','sergio.martinez@example.com',3,'Gerente de Ventas',3400.00),(24,'Verónica Fernández','555-0028','veronica.fernandez@example.com',4,'Analista de Cadena de Suministro',3300.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
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
