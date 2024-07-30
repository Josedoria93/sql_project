USE empresa_ferretera;

-- Crear el Porcedimiento Alamacenado sp_ventas_producto
DELIMITER //
CREATE PROCEDURE `sp_ventas_producto`( IN producto_id INT)
BEGIN
    -- Recuperar todos los detalles de `detalle_pedidos` para el `producto_id` dado
    SELECT *
    FROM detalle_pedidos
    WHERE id_producto = producto_id;
END //
DELIMITER ;
