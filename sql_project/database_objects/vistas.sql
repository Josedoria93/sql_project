USE empresa_ferretera;

-- Eliminar la vista productos_stock_bajo si existe
DROP VIEW IF EXISTS productos_stock_bajo;

-- Eliminar la vista pedidos_cliente_especifico si existe
DROP VIEW IF EXISTS pedidos_cliente_especifico;

-- Crear la vista productos_stock_bajo
CREATE VIEW productos_stock_bajo AS
SELECT 
       p.id_producto, 
       p.nombre, 
       i.cantidad_stock
FROM productos p
JOIN inventario i 
     ON p.id_producto = i.id_producto
WHERE i.cantidad_stock < 250;

-- Crear la vista pedidos_cliente_especifico
CREATE VIEW pedidos_cliente_especifico AS
SELECT 
       id_pedido, 
       fecha_pedido, 
       id_empleado
FROM pedidos
WHERE id_cliente = 1; 
