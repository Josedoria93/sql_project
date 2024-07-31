
USE empresa_ferretera;

-- Eliminar la función total_ventas_cliente si existe
DROP FUNCTION IF EXISTS total_ventas_cliente;

-- Eliminar la función total_compras_proveedor si existe
DROP FUNCTION IF EXISTS total_compras_proveedor;

-- Función para Calcular el Total de Ventas por Cliente
DELIMITER //

CREATE FUNCTION total_ventas_cliente(cliente_id INT)
RETURNS DECIMAL(10,2)
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
END //
DELIMITER ;

-- Función para Obtener el Total de Compras Realizadas a un Proveedor
CREATE FUNCTION total_compras_proveedor(proveedor_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    -- Calcular el total de compras realizadas al proveedor dado
    SELECT SUM(c.total_compra) INTO total
    FROM compras_proveedores c
    WHERE c.id_proveedor = proveedor_id;

    RETURN IFNULL(total, 0); -- Retorna 0 si no hay compras
END //

DELIMITER ;
