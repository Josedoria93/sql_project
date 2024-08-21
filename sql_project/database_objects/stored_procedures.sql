USE empresa_ferretera;

-- Eliminar el procedimiento almacenado 
DROP PROCEDURE IF EXISTS sp_ventas_producto;
DROP PROCEDURE IF EXISTS sp_agregar_cliente;
DROP PROCEDURE IF EXISTS sp_puesto;
DROP PROCEDURE IF EXISTS sp_listar_productos_categoria;

-- Crear el Procedimiento Almacenado sp_ventas_producto

-- Cambiar el delimitador temporalmente 
DELIMITER //
CREATE PROCEDURE `sp_ventas_producto`( IN producto_id INT)
BEGIN
    -- Recuperar todos los detalles de `detalle_pedidos` para el `producto_id` dado
    SELECT *
    FROM detalle_pedidos
    WHERE id_producto = producto_id;
END //
-- Restaurar el delimitador 
DELIMITER ;

-- Crear el Procedimiento para añadir un nuevo cliente

-- Cambiar el delimitador temporalmente 
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
-- Restaurar el delimitador 
DELIMITER ;

-- Procedimiento Almacenado para obtener estadísticas salariales de un puesto

-- Cambiar el delimitador temporalmente 
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
-- Restaurar el delimitador 
DELIMITER ;


-- Crear el Procedimiento Almacenado sp_listar_productos_categoria:

-- Cambiar el delimitador temporalmente 
DELIMITER //

-- Creación del procedimiento almacenado 
CREATE PROCEDURE sp_listar_productos_categoria(
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
END //

-- Restaurar el delimitador 
DELIMITER ;

-- Llamar al procedimiento almacenado 
CALL sp_listar_productos_categoria('Herramientas');

