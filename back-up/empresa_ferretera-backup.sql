mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: empresa_ferretera
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `id_categoria` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico de la categorÃ­a del producto',
  `nombre_categoria` varchar(100) NOT NULL COMMENT 'Nombre de la categorÃ­a del producto',
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre_categoria` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las categorÃ­as de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (5,'Construccion'),(8,'Decoracion'),(1,'Electrodomesticos'),(6,'Electrodomesticos de Cocina'),(12,'Electronica'),(10,'Equipo Deportivo'),(2,'Herramientas'),(7,'Herramientas Electricas'),(4,'Jardineria'),(16,'Juguetes'),(11,'Mantenimiento del Hogar'),(3,'Muebles'),(13,'Oficina'),(15,'Ropa'),(9,'Seguridad'),(14,'Tecnologia');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del cliente',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo del cliente',
  `telefono` varchar(20) NOT NULL COMMENT 'NÃºmero de telÃ©fono del cliente',
  `email` varchar(100) NOT NULL COMMENT 'Correo electrÃ³nico del cliente',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena la informaciÃ³n de los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan PÃ©rez','551-1234','juan.perez@example.com'),(2,'Ana GÃ³mez','552-5678','ana.gomez@example.com'),(3,'Pedro MartÃ­nez','553-8765','pedro.martinez@example.com'),(4,'Laura FernÃ¡ndez','554-4321','laura.fernandez@example.com'),(5,'Carlos Ruiz','555-6789','carlos.ruiz@example.com'),(6,'Elena Morales','556-1230','elena.morales@example.com'),(7,'Oscar Ruiz','557-1231','oscar.ruiz@example.com'),(8,'Sofia Castro','558-1232','sofia.castro@example.com'),(9,'David Vargas','559-1233','david.vargas@example.com'),(10,'Isabel Ortega','510-1235','isabel.ortega@example.com'),(11,'MartÃ­n Silva','511-2233','martin.silva@example.com'),(12,'Natalia Ortega','512-2234','natalia.ortega@example.com'),(13,'Roberto Castillo','513-2235','roberto.castillo@example.com'),(14,'Jessica MartÃ­nez','514-2236','jessica.martinez@example.com'),(15,'Francisco Ruiz','515-2237','francisco.ruiz@example.com'),(16,'VerÃ³nica LÃ³pez','516-2238','veronica.lopez@example.com'),(17,'Alberto GÃ³mez','517-3344','alberto.gomez@example.com'),(18,'Carmen DÃ­az','518-3345','carmen.diaz@example.com'),(19,'Lucas MartÃ­nez','519-3346','lucas.martinez@example.com'),(20,'Patricia FernÃ¡ndez','520-3347','patricia.fernandez@example.com'),(21,'Esteban GÃ³mez','521-3348','esteban.gomez@example.com'),(22,'Liliana Moreno','522-3349','liliana.moreno@example.com'),(23,'NicolÃ¡s Castro','523-3350','nicolas.castro@example.com'),(24,'Andrea Silva','524-3351','andrea.silva@example.com'),(25,'MarÃ­a LÃ³pez','525-3401','maria.lopez@example.com'),(26,'JosÃ© FernÃ¡ndez','526-3402','jose.fernandez@example.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_cliente`
--

DROP TABLE IF EXISTS `comentario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario_cliente` (
  `id_comentario` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del comentario del cliente',
  `id_cliente` int NOT NULL COMMENT 'Identificador del cliente que hizo el comentario',
  `comentario` text NOT NULL COMMENT 'Texto del comentario del cliente',
  `fecha_comentario` date NOT NULL COMMENT 'Fecha en que se realizÃ³ el comentario',
  PRIMARY KEY (`id_comentario`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `comentario_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los comentarios realizados por los clientes. RestricciÃ³n: Si se elimina un cliente, se eliminarÃ¡n sus comentarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_cliente`
--

LOCK TABLES `comentario_cliente` WRITE;
/*!40000 ALTER TABLE `comentario_cliente` DISABLE KEYS */;
INSERT INTO `comentario_cliente` VALUES (1,1,'Excelente servicio y productos','2024-07-01'),(2,2,'La entrega fue muy rÃ¡pida','2024-07-02'),(3,3,'Los precios son muy competitivos','2024-07-03'),(4,4,'Me gusta la variedad de productos','2024-07-04'),(5,5,'La atenciÃ³n al cliente es excelente','2024-07-05'),(6,6,'El producto llegÃ³ en perfectas condiciones','2024-07-06'),(7,7,'La atenciÃ³n al cliente es muy buena','2024-07-07'),(8,8,'El envÃ­o fue rÃ¡pido','2024-07-08'),(9,9,'La calidad del producto es excelente','2024-07-09'),(10,10,'Me gustÃ³ mucho el servicio','2024-07-10'),(11,11,'El microondas llegÃ³ a tiempo y en perfectas condiciones','2024-07-11'),(12,12,'Excelente cÃ¡mara, superÃ³ mis expectativas','2024-07-12'),(13,13,'El escritorio llegÃ³ bien embalado, pero con un pequeÃ±o rasguÃ±o','2024-07-13'),(14,14,'El ordenador portÃ¡til funciona perfecto','2024-07-14'),(15,15,'La camiseta es de buena calidad y llegÃ³ rÃ¡pido','2024-07-15'),(16,16,'La muÃ±eca es hermosa, mi hija estÃ¡ encantada','2024-07-16'),(17,17,'La aspiradora funciona perfectamente','2024-07-17'),(18,18,'El smartphone llegÃ³ rÃ¡pido, pero la caja estaba daÃ±ada','2024-07-18'),(19,19,'La silla es muy cÃ³moda y se ve robusta','2024-07-19'),(20,20,'La tableta es increÃ­ble, pero el envÃ­o fue lento','2024-07-20'),(21,21,'El jersey es de buena calidad y el color es hermoso','2024-07-21'),(22,22,'El triciclo llegÃ³ justo a tiempo para el cumpleaÃ±os de mi hijo','2024-07-22'),(23,23,'El proyector tiene una excelente resoluciÃ³n','2024-07-23'),(24,24,'El altavoz Bluetooth tiene un sonido muy claro','2024-07-24'),(25,17,'El producto llegÃ³ en excelente estado','2024-08-01'),(26,18,'El servicio al cliente fue muy eficiente','2024-08-02'),(27,19,'El embalaje estaba daÃ±ado, pero el producto estaba bien','2024-08-03'),(28,20,'La entrega fue mÃ¡s rÃ¡pida de lo esperado','2024-08-04'),(29,21,'La calidad del producto es muy buena','2024-08-05'),(30,22,'El seguimiento del pedido fue muy bueno','2024-08-06'),(31,23,'El producto no corresponde a la descripciÃ³n','2024-08-07'),(32,24,'Todo perfecto, volverÃ© a comprar','2024-08-08'),(33,17,'El artÃ­culo llegÃ³ antes de la fecha estimada','2024-08-09'),(34,18,'Me gustarÃ­a que mejoraran el embalaje','2024-08-10'),(35,19,'La atenciÃ³n telefÃ³nica fue muy amable','2024-08-11'),(36,20,'El precio es excelente para la calidad del producto','2024-08-12'),(37,21,'No recibÃ­ toda la cantidad solicitada','2024-08-13'),(38,22,'La entrega fue puntual y el producto estÃ¡ bien','2024-08-14'),(39,23,'Tuve problemas con el seguimiento del pedido','2024-08-15'),(40,24,'El producto llegÃ³ defectuoso y se hizo el cambio rÃ¡pidamente','2024-08-16'),(41,18,'El pedido llegÃ³ en excelentes condiciones','2024-08-17'),(42,19,'El producto cumpliÃ³ con las expectativas','2024-08-18'),(43,20,'Hubo un error con la cantidad entregada','2024-08-19'),(44,21,'La entrega fue muy rÃ¡pida y sin problemas','2024-08-20'),(45,22,'El producto llegÃ³ bien embalado','2024-08-21'),(46,23,'Excelente calidad del producto y servicio','2024-08-22'),(47,24,'El precio fue muy competitivo','2024-08-23');
/*!40000 ALTER TABLE `comentario_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_proveedores`
--

DROP TABLE IF EXISTS `compras_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_proveedores` (
  `id_compra_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico de la compra al proveedor',
  `fecha_compra` date NOT NULL COMMENT 'Fecha en que se realizÃ³ la compra',
  `id_proveedor` int NOT NULL COMMENT 'Identificador del proveedor',
  `total_compra` decimal(10,2) NOT NULL COMMENT 'Monto total de la compra',
  `estado_pago` varchar(50) DEFAULT NULL COMMENT 'Estado del pago (e.g., pagado, pendiente)',
  PRIMARY KEY (`id_compra_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `compras_proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT,
  CONSTRAINT `compras_proveedores_chk_1` CHECK ((`total_compra` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las compras realizadas a proveedores. RestricciÃ³n: No se puede eliminar un proveedor si hay compras asociadas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_proveedores`
--

LOCK TABLES `compras_proveedores` WRITE;
/*!40000 ALTER TABLE `compras_proveedores` DISABLE KEYS */;
INSERT INTO `compras_proveedores` VALUES (1,'2024-07-01',1,300.00,'Pagado'),(2,'2024-07-02',2,270.00,'Pendiente'),(3,'2024-07-03',3,800.00,'Pagado'),(4,'2024-07-04',4,230.00,'Pagado'),(5,'2024-07-05',5,75.00,'Pendiente'),(6,'2024-07-06',6,16500.00,'Pagado'),(7,'2024-07-07',7,5400.00,'Pendiente'),(8,'2024-07-08',8,2000.00,'Pagado'),(9,'2024-07-09',9,2500.00,'Pagado'),(10,'2024-07-10',10,1000.00,'Pendiente'),(11,'2024-07-11',11,1600.00,'Pagado'),(12,'2024-07-12',12,2250.00,'Pendiente'),(13,'2024-07-13',13,1000.00,'Pagado'),(14,'2024-07-14',14,4500.00,'Pagado'),(15,'2024-07-15',15,250.00,'Pendiente'),(16,'2024-07-16',16,625.00,'Pagado');
/*!40000 ALTER TABLE `compras_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del departamento',
  `nombre_departamento` varchar(100) NOT NULL COMMENT 'Nombre del departamento',
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `nombre_departamento` (`nombre_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los departamentos de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Administracion'),(4,'Compras'),(5,'Logistica'),(2,'Recursos Humanos'),(3,'Ventas');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del detalle del pedido',
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los detalles de cada pedido. RestricciÃ³n: No se puede eliminar un producto si hay detalles de pedidos asociados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_pedidos` VALUES (1,1,1,2,25.50),(2,1,2,1,15.00),(3,2,3,1,100.00),(4,3,4,5,8.75),(5,4,5,10,3.50),(6,6,6,1,750.00),(7,7,7,2,120.00),(8,8,8,3,45.00),(9,9,9,4,200.00),(10,10,10,5,30.00),(11,11,11,1,180.00),(12,12,12,2,350.00),(13,13,13,1,200.00),(14,14,14,1,1200.00),(15,15,15,4,25.00),(16,16,16,3,45.00),(17,17,17,1,220.00),(18,18,18,2,800.00),(19,19,19,3,150.00),(20,20,20,1,500.00),(21,21,21,4,60.00),(22,22,22,2,85.00),(23,23,23,1,400.00),(24,24,24,3,90.00),(25,25,18,2,800.00),(26,26,20,1,500.00),(27,27,21,3,60.00),(28,28,22,4,85.00),(29,29,23,1,400.00),(30,30,24,2,90.00),(31,31,17,1,220.00),(32,32,18,3,800.00),(33,33,19,2,150.00),(34,34,20,1,500.00),(35,35,21,2,60.00),(36,36,22,1,85.00),(37,37,23,3,400.00),(38,38,24,2,90.00),(39,39,17,4,220.00),(40,40,18,2,800.00),(41,41,20,2,500.00),(42,42,21,1,60.00),(43,43,22,3,85.00),(44,44,23,1,400.00),(45,45,24,2,90.00),(46,46,17,4,220.00),(47,47,18,5,800.00);
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_detalle_pedido` AFTER INSERT ON `detalle_pedidos` FOR EACH ROW BEGIN
    UPDATE inventario
    SET cantidad_stock = cantidad_stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalles_compras_proveedores`
--

DROP TABLE IF EXISTS `detalles_compras_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_compras_proveedores` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del detalle de la compra al proveedor',
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los detalles de las compras realizadas a proveedores. RestricciÃ³n: No se puede eliminar un producto si hay detalles de compras asociados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_compras_proveedores`
--

LOCK TABLES `detalles_compras_proveedores` WRITE;
/*!40000 ALTER TABLE `detalles_compras_proveedores` DISABLE KEYS */;
INSERT INTO `detalles_compras_proveedores` VALUES (1,1,1,20,15.00),(2,1,2,30,9.00),(3,2,3,10,80.00),(4,3,4,40,5.75),(5,4,5,50,1.50),(6,6,6,30,550.00),(7,7,7,60,90.00),(8,8,8,80,25.00),(9,9,9,25,100.00),(10,10,10,100,10.00),(11,11,11,20,80.00),(12,12,12,15,150.00),(13,13,13,10,100.00),(14,14,14,5,900.00),(15,15,15,50,5.00),(16,16,16,25,25.00);
/*!40000 ALTER TABLE `detalles_compras_proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_detalles_compras_proveedores` AFTER INSERT ON `detalles_compras_proveedores` FOR EACH ROW BEGIN
    -- Verificar si el producto ya existe en el inventario
    DECLARE v_existe INT;

    -- Comprobar la existencia del producto en la tabla inventario
    SELECT COUNT(*)
    INTO v_existe
    FROM inventario
    WHERE id_producto = NEW.id_producto;

    -- Si el producto ya existe en inventario, actualizar la cantidad en stock
    IF v_existe > 0 THEN
        UPDATE inventario
        SET cantidad_stock = cantidad_stock + NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    -- Si el producto no existe en inventario, insertarlo
    ELSE
        INSERT INTO inventario (id_producto, cantidad_stock)
        VALUES (NEW.id_producto, NEW.cantidad);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `devolucion_cliente`
--

DROP TABLE IF EXISTS `devolucion_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion_cliente` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico de la devoluciÃ³n del cliente',
  `id_pedido` int NOT NULL COMMENT 'Identificador del pedido asociado a la devoluciÃ³n',
  `id_producto` int NOT NULL COMMENT 'Identificador del producto devuelto',
  `motivo` text NOT NULL COMMENT 'Motivo de la devoluciÃ³n',
  `fecha_devolucion` date NOT NULL COMMENT 'Fecha en que se realizÃ³ la devoluciÃ³n',
  `cantidad_devolucion` int NOT NULL COMMENT 'Cantidad de producto devuelto',
  PRIMARY KEY (`id_devolucion`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `devolucion_cliente_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `devolucion_cliente_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT,
  CONSTRAINT `devolucion_cliente_chk_1` CHECK ((`cantidad_devolucion` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las devoluciones realizadas por los clientes. RestricciÃ³n: No se puede eliminar un producto si hay devoluciones asociadas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion_cliente`
--

LOCK TABLES `devolucion_cliente` WRITE;
/*!40000 ALTER TABLE `devolucion_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones_clientes`
--

DROP TABLE IF EXISTS `direcciones_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones_clientes` (
  `id_direccion_cliente` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico de la direcciÃ³n del cliente',
  `id_cliente` int NOT NULL COMMENT 'Identificador del cliente',
  `direccion` text NOT NULL COMMENT 'DirecciÃ³n del cliente',
  PRIMARY KEY (`id_direccion_cliente`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `direcciones_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las direcciones de los clientes. RestricciÃ³n: Si se elimina un cliente, tambiÃ©n se eliminarÃ¡n sus direcciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_clientes`
--

LOCK TABLES `direcciones_clientes` WRITE;
/*!40000 ALTER TABLE `direcciones_clientes` DISABLE KEYS */;
INSERT INTO `direcciones_clientes` VALUES (1,1,'Avenida Siempre Viva 742, Springfield'),(2,2,'Calle Falsa 123, Springfield'),(3,3,'Avenida Libertad 456, Springfield'),(4,4,'Calle Esperanza 789, Springfield'),(5,5,'Calle del Sol 101, Springfield'),(6,6,'Calle del Lago 12, Springfield'),(7,7,'Calle del Norte 20, Springfield'),(8,8,'Avenida del RÃ­o 34, Springfield'),(9,9,'Calle del Centro 50, Springfield'),(10,10,'Avenida del Sol 66, Springfield'),(11,11,'Calle del Valle 88, Springfield'),(12,12,'Avenida del Parque 77, Springfield'),(13,13,'Calle del RÃ­o 66, Springfield'),(14,14,'Avenida del Cielo 55, Springfield'),(15,15,'Calle del Sol 44, Springfield'),(16,16,'Calle de la Luna 33, Springfield'),(17,17,'Calle Primavera 11, Springfield'),(18,18,'Avenida del Bosque 22, Springfield'),(19,19,'Calle de la Paz 33, Springfield'),(20,20,'Avenida del Comercio 44, Springfield'),(21,21,'Calle de los Rosales 55, Springfield'),(22,22,'Avenida del Sol 66, Springfield'),(23,23,'Calle del Mar 77, Springfield'),(24,24,'Avenida del Valle 88, Springfield'),(25,25,'Calle de los Tulipanes 99, Springfield'),(26,26,'Avenida de la Libertad 101, Springfield');
/*!40000 ALTER TABLE `direcciones_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones_proveedores`
--

DROP TABLE IF EXISTS `direcciones_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones_proveedores` (
  `id_direccion_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico de la direcciÃ³n del proveedor',
  `id_proveedor` int NOT NULL COMMENT 'Identificador del proveedor',
  `direccion` text NOT NULL COMMENT 'DirecciÃ³n del proveedor',
  PRIMARY KEY (`id_direccion_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `direcciones_proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las direcciones de los proveedores. RestricciÃ³n: Si se elimina un proveedor, tambiÃ©n se eliminarÃ¡n sus direcciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_proveedores`
--

LOCK TABLES `direcciones_proveedores` WRITE;
/*!40000 ALTER TABLE `direcciones_proveedores` DISABLE KEYS */;
INSERT INTO `direcciones_proveedores` VALUES (1,1,'Calle Mayor 10, Ciudad Real'),(2,2,'Avenida del Comercio 22, Ciudad Real'),(3,3,'Plaza Central 15, Ciudad Real'),(4,4,'Calle del Mercado 30, Ciudad Real'),(5,5,'Avenida de la Industria 5, Ciudad Real'),(6,6,'Calle de la Luna 22, Astro City'),(7,7,'Avenida Estrella 45, Astro City'),(8,8,'Plaza Galaxia 10, Astro City'),(9,9,'Calle Cometa 33, Astro City'),(10,10,'Avenida Nebulosa 55, Astro City'),(11,11,'Calle Nueva 21, Ciudad Vista'),(12,12,'Avenida Central 12, Ciudad Vista'),(13,13,'Plaza del Comercio 34, Ciudad Vista'),(14,14,'Calle de la Esperanza 45, Ciudad Vista'),(15,15,'Avenida Libertad 56, Ciudad Vista'),(16,16,'Calle de la AlegrÃ­a 67, Ciudad Vista');
/*!40000 ALTER TABLE `direcciones_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del empleado',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo del empleado',
  `telefono` varchar(20) NOT NULL COMMENT 'NÃºmero de telÃ©fono del empleado',
  `email` varchar(100) NOT NULL COMMENT 'Correo electrÃ³nico del empleado',
  `id_departamento` int NOT NULL COMMENT 'Identificador del departamento al que pertenece el empleado',
  `puesto` varchar(100) DEFAULT NULL COMMENT 'Puesto del empleado en la empresa',
  `salario` decimal(10,2) NOT NULL COMMENT 'Salario del empleado',
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE RESTRICT,
  CONSTRAINT `empleados_chk_1` CHECK ((`salario` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena la informaciÃ³n de los empleados. RestricciÃ³n: No se puede eliminar un departamento si hay empleados asignados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Mario LÃ³pez','555-0001','mario.lopez@example.com',1,'Director General',5000.00),(2,'Patricia GÃ³mez','555-0002','patricia.gomez@example.com',2,'HR Specialist',3000.00),(3,'AndrÃ©s Morales','555-0003','andres.morales@example.com',3,'Sales Manager',4000.00),(4,'Elena RodrÃ­guez','555-0004','elena.rodriguez@example.com',4,'Purchasing Agent',3500.00),(5,'JosÃ© MartÃ­nez','555-0005','jose.martinez@example.com',5,'Logistics Coordinator',3200.00),(6,'Marta GÃ³mez','555-0006','marta.gomez@example.com',2,'Recruiter',2800.00),(7,'RaÃºl FernÃ¡ndez','555-0007','raul.fernandez@example.com',3,'Account Executive',3700.00),(8,'Victoria Torres','555-0008','victoria.torres@example.com',4,'Supply Chain Manager',4000.00),(9,'Roberto Morales','555-0009','roberto.morales@example.com',5,'Warehouse Supervisor',3300.00),(10,'Claudia PÃ©rez','555-0010','claudia.perez@example.com',1,'Chief Financial Officer',5500.00),(11,'Fabiola MartÃ­nez','555-0011','fabiola.martinez@example.com',2,'Payroll Specialist',2900.00),(12,'AdriÃ¡n Torres','555-0012','adrian.torres@example.com',3,'Sales Coordinator',3500.00),(13,'Carla RamÃ­rez','555-0013','carla.ramirez@example.com',4,'Procurement Specialist',3800.00),(14,'Marcos GarcÃ­a','555-0014','marcos.garcia@example.com',5,'Inventory Control Manager',3400.00),(15,'Daniela PÃ©rez','555-0015','daniela.perez@example.com',1,'Financial Analyst',3100.00),(16,'Ricardo LÃ³pez','555-0016','ricardo.lopez@example.com',2,'HR Manager',3200.00),(17,'Daniel Soto','555-0021','daniel.soto@example.com',2,'Training Specialist',3100.00),(18,'Paola Vargas','555-0022','paola.vargas@example.com',3,'Product Manager',3700.00),(19,'Marcelo Paredes','555-0023','marcelo.paredes@example.com',4,'Logistics Coordinator',3900.00),(20,'Silvia MuÃ±oz','555-0024','silvia.munoz@example.com',5,'Operations Director',4200.00),(21,'Javier RamÃ­rez','555-0025','javier.ramirez@example.com',1,'Chief Executive Officer',6000.00),(22,'MÃ³nica GÃ³mez','555-0026','monica.gomez@example.com',2,'Marketing Director',3500.00),(23,'Sergio MartÃ­nez','555-0027','sergio.martinez@example.com',3,'Sales Manager',3400.00),(24,'VerÃ³nica FernÃ¡ndez','555-0028','veronica.fernandez@example.com',4,'Supply Chain Analyst',3300.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico de la factura',
  `fecha_factura` date NOT NULL COMMENT 'Fecha en que se emitiÃ³ la factura',
  `id_pedido` int NOT NULL COMMENT 'Identificador del pedido asociado a la factura',
  `id_empleado` int NOT NULL COMMENT 'Identificador del empleado que emitiÃ³ la factura',
  `total_factura` decimal(10,2) NOT NULL COMMENT 'Monto total de la factura',
  PRIMARY KEY (`id_factura`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT,
  CONSTRAINT `facturas_chk_1` CHECK ((`total_factura` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena las facturas emitidas. RestricciÃ³n: Si se elimina un pedido, se eliminarÃ¡ la factura asociada';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2024-07-01',1,3,66.00),(2,'2024-07-02',2,23,100.00),(3,'2024-07-03',3,3,8.75),(4,'2024-07-04',4,23,43.75),(5,'2024-07-05',5,3,35.00),(6,'2024-07-06',6,23,750.00),(7,'2024-07-07',7,3,240.00),(8,'2024-07-08',8,23,135.00),(9,'2024-07-09',9,3,800.00),(10,'2024-07-10',10,23,150.00),(11,'2024-07-11',11,3,180.00),(12,'2024-07-12',12,23,700.00),(13,'2024-07-13',13,3,200.00),(14,'2024-07-14',14,23,1200.00),(15,'2024-07-15',15,3,100.00),(16,'2024-07-16',16,23,135.00),(17,'2024-07-17',17,3,220.00),(18,'2024-07-18',18,23,1600.00),(19,'2024-07-19',19,3,450.00),(20,'2024-07-20',20,23,500.00),(21,'2024-07-21',21,3,240.00),(22,'2024-07-22',22,23,170.00),(23,'2024-07-23',23,23,400.00),(24,'2024-07-24',24,3,270.00),(25,'2024-08-01',25,23,1600.00),(26,'2024-08-02',26,3,500.00),(27,'2024-08-03',27,23,180.00),(28,'2024-08-04',28,3,340.00),(29,'2024-08-05',29,23,340.00),(30,'2024-08-06',30,23,180.00),(31,'2024-08-07',31,3,220.00),(32,'2024-08-08',32,23,2400.00),(33,'2024-08-09',33,3,300.00),(34,'2024-08-10',34,23,500.00),(35,'2024-08-11',35,3,120.00),(36,'2024-08-12',36,23,85.00),(37,'2024-08-13',37,3,1200.00),(38,'2024-08-14',38,23,180.00),(39,'2024-08-15',39,3,880.00),(40,'2024-08-16',40,23,1600.00),(41,'2024-08-17',41,3,1000.00),(42,'2024-08-18',42,23,60.00),(43,'2024-08-19',43,3,255.00),(44,'2024-08-20',44,23,400.00),(45,'2024-08-21',45,23,180.00),(46,'2024-08-22',46,3,880.00),(47,'2024-08-23',47,23,4000.00);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del inventario',
  `id_producto` int NOT NULL COMMENT 'Identificador del producto en inventario',
  `cantidad_stock` int NOT NULL COMMENT 'Cantidad en stock del producto',
  PRIMARY KEY (`id_inventario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT,
  CONSTRAINT `inventario_chk_1` CHECK ((`cantidad_stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena el inventario de productos. RestricciÃ³n: No se puede eliminar un producto si hay stock asociado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,300),(2,2,250),(3,3,450),(4,4,600),(5,5,800),(6,6,500),(7,7,600),(8,8,800),(9,9,250),(10,10,1000),(11,11,200),(12,12,150),(13,13,100),(14,14,500),(15,15,500),(16,16,258),(17,17,300),(18,18,500),(19,19,650),(20,20,210),(21,21,220),(22,22,230),(23,23,320),(24,24,500),(25,25,505),(26,26,306);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del mÃ©todo de pago',
  `nombre_metodo_pago` varchar(100) NOT NULL COMMENT 'Nombre del mÃ©todo de pago',
  PRIMARY KEY (`id_metodo_pago`),
  UNIQUE KEY `nombre_metodo_pago` (`nombre_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los mÃ©todos de pago disponibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (5,'Cheque'),(3,'Efectivo'),(2,'Tarjeta de Credito'),(4,'Tarjeta de Debito'),(1,'Transferencia Bancaria');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del pedido',
  `fecha_pedido` date NOT NULL COMMENT 'Fecha en que se realizÃ³ el pedido',
  `id_cliente` int NOT NULL COMMENT 'Identificador del cliente que realizÃ³ el pedido',
  `id_metodo_pago` int NOT NULL COMMENT 'Identificador del mÃ©todo de pago utilizado',
  `id_empleado` int NOT NULL COMMENT 'Identificador del empleado que gestionÃ³ el pedido',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON DELETE RESTRICT,
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los pedidos realizados. RestricciÃ³n: Si se elimina un cliente, se eliminarÃ¡n sus pedidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2024-07-01',1,1,3),(2,'2024-07-02',2,2,7),(3,'2024-07-03',3,3,12),(4,'2024-07-04',4,4,18),(5,'2024-07-05',5,5,23),(6,'2024-07-06',6,1,3),(7,'2024-07-07',7,2,7),(8,'2024-07-08',8,3,12),(9,'2024-07-09',9,4,18),(10,'2024-07-10',10,5,23),(11,'2024-07-11',11,1,3),(12,'2024-07-12',12,2,7),(13,'2024-07-13',13,3,12),(14,'2024-07-14',14,4,18),(15,'2024-07-15',15,5,23),(16,'2024-07-16',16,1,3),(17,'2024-07-17',17,1,7),(18,'2024-07-18',18,2,12),(19,'2024-07-19',19,3,18),(20,'2024-07-20',20,4,23),(21,'2024-07-21',21,5,23),(22,'2024-07-22',22,1,18),(23,'2024-07-23',23,2,12),(24,'2024-07-24',24,3,7),(25,'2024-08-01',17,2,3),(26,'2024-08-02',18,3,3),(27,'2024-08-03',19,4,7),(28,'2024-08-04',20,5,12),(29,'2024-08-05',21,1,18),(30,'2024-08-06',22,2,23),(31,'2024-08-07',23,3,3),(32,'2024-08-08',24,4,7),(33,'2024-08-09',17,5,12),(34,'2024-08-10',18,1,18),(35,'2024-08-11',19,2,23),(36,'2024-08-12',20,3,3),(37,'2024-08-13',21,4,7),(38,'2024-08-14',22,5,12),(39,'2024-08-15',23,1,18),(40,'2024-08-16',24,2,23),(41,'2024-08-17',18,1,3),(42,'2024-08-18',19,2,7),(43,'2024-08-19',20,3,12),(44,'2024-08-20',21,4,18),(45,'2024-08-21',22,5,23),(46,'2024-08-22',23,1,3),(47,'2024-08-23',24,2,7);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidos_cliente_especifico`
--

DROP TABLE IF EXISTS `pedidos_cliente_especifico`;
/*!50001 DROP VIEW IF EXISTS `pedidos_cliente_especifico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidos_cliente_especifico` AS SELECT 
 1 AS `id_pedido`,
 1 AS `fecha_pedido`,
 1 AS `id_empleado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del producto',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del producto',
  `precio_unitario` decimal(10,2) NOT NULL COMMENT 'Precio unitario del producto',
  `id_categoria` int NOT NULL COMMENT 'Identificador de la categorÃ­a del producto',
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id_categoria`) ON DELETE RESTRICT,
  CONSTRAINT `productos_chk_1` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los productos. RestricciÃ³n: No se puede eliminar una categorÃ­a si hay productos asignados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Martillo',25.50,2),(2,'Destornillador',15.00,2),(3,'Silla',100.00,3),(4,'Maceta',8.75,4),(5,'Clavos',3.50,2),(6,'Refrigerador',750.00,6),(7,'Taladro',120.00,7),(8,'Lampara',45.00,8),(9,'Camara de Seguridad',200.00,9),(10,'Pelota de Futbol',30.00,10),(11,'Microondas',180.00,11),(12,'Camara Digital',350.00,12),(13,'Escritorio',200.00,13),(14,'Ordenador Portatil',1200.00,14),(15,'Camiseta',25.00,15),(16,'MuÃ±eca',45.00,16),(17,'Aspiradora',220.00,11),(18,'Smartphone',800.00,12),(19,'Silla de Oficina',150.00,13),(20,'Tableta',500.00,14),(21,'Jersey',60.00,15),(22,'Triciclo',85.00,16),(23,'Proyector',400.00,12),(24,'Altavoz Bluetooth',90.00,12),(25,'Teclado Mecanico',120.00,14),(26,'Monitor 24 pulgadas',250.00,14);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_producto` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
    IF NEW.precio_unitario < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio unitario del producto no puede ser negativo.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `productos_stock_bajo`
--

DROP TABLE IF EXISTS `productos_stock_bajo`;
/*!50001 DROP VIEW IF EXISTS `productos_stock_bajo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productos_stock_bajo` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `cantidad_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador Ãºnico del proveedor',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del proveedor',
  `telefono` varchar(20) NOT NULL COMMENT 'NÃºmero de telÃ©fono del proveedor',
  `email` varchar(100) NOT NULL COMMENT 'Correo electrÃ³nico del proveedor',
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena la informaciÃ³n de los proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor A','555-1111','proveedor.a@example.com'),(2,'Proveedor B','555-2222','proveedor.b@example.com'),(3,'Proveedor C','555-3333','proveedor.c@example.com'),(4,'Proveedor D','555-4444','proveedor.d@example.com'),(5,'Proveedor E','555-5555','proveedor.e@example.com'),(6,'Proveedor F','555-6666','proveedor.f@example.com'),(7,'Proveedor G','555-7777','proveedor.g@example.com'),(8,'Proveedor H','555-8888','proveedor.h@example.com'),(9,'Proveedor I','555-9999','proveedor.i@example.com'),(10,'Proveedor J','555-0000','proveedor.j@example.com'),(11,'Proveedor K','655-1112','proveedor.k@example.com'),(12,'Proveedor L','655-1113','proveedor.l@example.com'),(13,'Proveedor M','655-1114','proveedor.m@example.com'),(14,'Proveedor N','655-1115','proveedor.n@example.com'),(15,'Proveedor O','655-1116','proveedor.o@example.com'),(16,'Proveedor P','655-1117','proveedor.p@example.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'empresa_ferretera'
--
/*!50003 DROP FUNCTION IF EXISTS `total_compras_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_compras_proveedor`(proveedor_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    -- Calcular el total de compras realizadas al proveedor dado
    SELECT SUM(c.total_compra) INTO total
    FROM compras_proveedores c
    WHERE c.id_proveedor = proveedor_id;

    RETURN IFNULL(total, 0); -- Retorna 0 si no hay compras
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_ventas_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_ventas_cliente`(cliente_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    -- Calcular el total de ventas para el cliente dado
    SELECT SUM(f.total_factura) INTO total
    FROM facturas f
    JOIN pedidos p 
         ON f.id_pedido = p.id_pedido
    WHERE p.id_cliente = cliente_id;

    RETURN IFNULL(total, 0); -- Retorna 0 si no hay ventas
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cliente`(
    IN p_nombre VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_direccion TEXT
)
BEGIN
    -- Declarar una variable para almacenar el ID del cliente recién insertado
    DECLARE v_id_cliente INT;

    -- Insertar el nuevo cliente en la tabla clientes
    INSERT INTO clientes (nombre, telefono, email)
    VALUES (p_nombre, p_telefono, p_email);
    
    -- Obtener el ID del cliente recién insertado
    SET v_id_cliente = LAST_INSERT_ID();

    -- Insertar la dirección en la tabla direcciones_clientes
    INSERT INTO direcciones_clientes (id_cliente, direccion)
    VALUES (v_id_cliente, p_direccion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_productos_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_productos_categoria`(
    IN categoria_nombre VARCHAR(100)  -- Parámetro de entrada que recibe el nombre de la categoría
)
BEGIN
    -- Declaración de una variable local para almacenar el ID de la categoría
    DECLARE v_categoria_id INT;
    
    -- Seleccionar el ID de la categoría basada en el nombre proporcionado y almacenar el valor en v_categoria_id
    SELECT id_categoria INTO v_categoria_id
    FROM categoria_producto
    WHERE nombre_categoria = categoria_nombre;
    
    -- Verificar si se encontró una categoría con el nombre proporcionado
    IF v_categoria_id IS NULL THEN
        -- Si no se encontró, seleccionar un mensaje indicando que la categoría no fue encontrada
        SELECT 'No se encontró la categoría con el nombre proporcionado.' AS Mensaje;
    ELSE
        -- Si se encontró la categoría, seleccionar la información de los productos asociados a esa categoría
        SELECT 
            p.id_producto,  
            p.nombre AS Producto,  
            p.precio_unitario AS Precio_Unitario,  
            c.nombre_categoria AS Categoria  
        FROM productos p
        LEFT JOIN categoria_producto c
            ON p.id_categoria = c.id_categoria  
        WHERE c.id_categoria = v_categoria_id;  
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_puesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_puesto`(
    IN p_puesto VARCHAR(100), 
    OUT p_promedio FLOAT, 
    OUT p_mayor FLOAT, 
    OUT p_menor FLOAT
)
BEGIN
    -- Calcular el salario promedio
    SELECT AVG(salario) INTO p_promedio
    FROM empleados 
    WHERE puesto = p_puesto;

    -- Calcular el salario máximo
    SELECT MAX(salario) INTO p_mayor
    FROM empleados 
    WHERE puesto = p_puesto;

    -- Calcular el salario mínimo
    SELECT MIN(salario) INTO p_menor
    FROM empleados 
    WHERE puesto = p_puesto;

    -- Mostrar los valores para depuración
    SELECT p_promedio AS Promedio, p_mayor AS Mayor, p_menor AS Menor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ventas_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ventas_producto`( IN producto_id INT)
BEGIN
    -- Recuperar todos los detalles de `detalle_pedidos` para el `producto_id` dado
    SELECT *
    FROM detalle_pedidos
    WHERE id_producto = producto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `pedidos_cliente_especifico`
--

/*!50001 DROP VIEW IF EXISTS `pedidos_cliente_especifico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidos_cliente_especifico` AS select `pedidos`.`id_pedido` AS `id_pedido`,`pedidos`.`fecha_pedido` AS `fecha_pedido`,`pedidos`.`id_empleado` AS `id_empleado` from `pedidos` where (`pedidos`.`id_cliente` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productos_stock_bajo`
--

/*!50001 DROP VIEW IF EXISTS `productos_stock_bajo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_stock_bajo` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,`i`.`cantidad_stock` AS `cantidad_stock` from (`productos` `p` join `inventario` `i` on((`p`.`id_producto` = `i`.`id_producto`))) where (`i`.`cantidad_stock` < 250) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-26 23:55:21
