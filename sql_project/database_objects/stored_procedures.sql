USE empresa_ferretera;

Drop procedure sp_ventas_producto;
Drop procedure sp_agregar_cliente;

    
-- Crear el Procedimiento Almacenado sp_ventas_producto
DELIMITER //
CREATE PROCEDURE `sp_ventas_producto`( IN producto_id INT)
BEGIN
    -- Recuperar todos los detalles de `detalle_pedidos` para el `producto_id` dado
    SELECT *
    FROM detalle_pedidos
    WHERE id_producto = producto_id;
END //
DELIMITER ;

-- Crear el Procedimiento Almacenado sp_agregar_cliente
DELIMITER //
-- Sp para agregar un Cliente Nuevo
CREATE PROCEDURE sp_agregar_cliente(
    IN p_nombre VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO clientes (nombre, telefono, email)
    VALUES (p_nombre, p_telefono, p_email);
END //

DELIMITER ;
