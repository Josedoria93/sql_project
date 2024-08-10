USE empresa_ferretera;

DROP PROCEDURE IF EXISTS sp_ventas_producto;
DROP PROCEDURE IF EXISTS sp_agregar_cliente;
Drop procedure IF EXISTS sp_puesto;

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

-- Crear el Procedimiento para añadir un nuevo cliente

DELIMITER //
CREATE PROCEDURE sp_agregar_cliente(
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
END //
DELIMITER ;

-- Procedimiento Almacenado para obtener estadísticas salariales de un puesto

DELIMITER //
CREATE PROCEDURE sp_puesto(
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
END //
DELIMITER ;
