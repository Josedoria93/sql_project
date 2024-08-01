USE empresa_ferretera;

-- Borrar el trigger que actualiza el inventario al insertar un detalle de pedido
DROP TRIGGER IF EXISTS after_insert_detalle_pedido;

-- Borrar el trigger que evita la inserción de productos con precio negativo
DROP TRIGGER IF EXISTS before_insert_producto;


-- Trigger para Actualizar el Inventario al Insertar un Pedido
DELIMITER //

CREATE TRIGGER after_insert_detalle_pedido
AFTER INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    UPDATE inventario
    SET cantidad_stock = cantidad_stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END//

DELIMITER ;

-- Trigger para Evitar la Inserción de Productos con Precio Negativo
DELIMITER //

CREATE TRIGGER before_insert_producto
BEFORE INSERT ON productos
FOR EACH ROW
BEGIN
    IF NEW.precio_unitario < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio unitario del producto no puede ser negativo.';
    END IF;
END//

DELIMITER ;
