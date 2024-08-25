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
-- Final view structure for view `productos_stock_bajo`
--

/*!50001 DROP VIEW IF EXISTS `productos_stock_bajo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_stock_bajo` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,`i`.`cantidad_stock` AS `cantidad_stock` from (`productos` `p` join `inventario` `i` on((`p`.`id_producto` = `i`.`id_producto`))) where (`i`.`cantidad_stock` < 250) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidos_cliente_especifico`
--

/*!50001 DROP VIEW IF EXISTS `pedidos_cliente_especifico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidos_cliente_especifico` AS select `pedidos`.`id_pedido` AS `id_pedido`,`pedidos`.`fecha_pedido` AS `fecha_pedido`,`pedidos`.`id_empleado` AS `id_empleado` from `pedidos` where (`pedidos`.`id_cliente` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'empresa_ferretera'
--

--
-- Dumping routines for database 'empresa_ferretera'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_contar_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contar_clientes`(
OUT numero_clientes INT 
)
BEGIN
		SELECT COUNT(id_cliente) INTO numero_clientes
        FROM clientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_detalle_factura_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalle_factura_por_id`(
    IN p_factura_id INT
)
BEGIN
    -- Declarar una variable para almacenar el mensaje
    DECLARE v_mensaje VARCHAR(255);
    
    -- Verificar si el parámetro es válido
    IF p_factura_id IS NULL OR p_factura_id <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID de factura inválido.';
    END IF;

    -- Seleccionar detalles de la factura por el ID proporcionado
    IF EXISTS (
        SELECT 1
        FROM facturas
        WHERE id_factura = p_factura_id
    ) THEN
        SELECT *
        FROM facturas
        WHERE id_factura = p_factura_id;
    ELSE
        -- Establece el mensaje de error si no se encuentra la factura
        SET v_mensaje = CONCAT('No se encontró información para la Factura con ID: ', p_factura_id);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_empleados_departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_empleados_departamento`(
    IN departamento_nombre VARCHAR(100)
)
BEGIN
    -- Verificar si el departamento existe
    DECLARE v_departamento_id INT;
    
    -- Obtener el ID del departamento dado su nombre
    SELECT id_departamento INTO v_departamento_id
    FROM departamentos
    WHERE nombre_departamento = departamento_nombre;
    
    -- Si no se encuentra el departamento, mostrar un mensaje
    IF v_departamento_id IS NULL THEN
        SELECT 'No se encontró el departamento con el nombre proporcionado.' AS Mensaje;
    ELSE
        -- Seleccionar empleados del departamento
        SELECT 
            e.id_empleado,
            e.nombre AS Empleado,
            e.puesto AS Puesto,
            e.salario AS Salario,
            d.nombre_departamento AS Nombre_Departamento
        FROM empleados e
        LEFT JOIN departamentos d
            ON e.id_departamento = d.id_departamento
        WHERE d.id_departamento = v_departamento_id;
    END IF;
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_productos_categoria`(
    IN categoria_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_categoria_id INT;
    
    SELECT id_categoria INTO v_categoria_id
    FROM categoria_producto
    WHERE nombre_categoria = categoria_nombre;
    
    IF v_categoria_id IS NULL THEN
        SELECT 'No se encontró la categoría con el nombre proporcionado.' AS Mensaje;
    ELSE
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 20:21:27
