USE empresa_ferretera;

-- Eliminar la vista productos_stock_bajo si existe
DROP VIEW IF EXISTS productos_stock_bajo;

-- Eliminar la vista pedidos_cliente_especifico si existe
DROP VIEW IF EXISTS pedidos_cliente_especifico;

-- Eliminar la vista vista_pedidos_empleado_estado_pago
DROP VIEW IF EXISTS vista_pedidos_empleado_estado_pago

       
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
CREATE OR REPLACE VIEW pedidos_cliente_especifico AS
SELECT 
       id_pedido, 
       fecha_pedido, 
       id_empleado
FROM pedidos
WHERE id_cliente = 2; 

-- Crear la vista de Pedidos por Empleado y Estado de Pago
CREATE OR REPLACE VIEW vista_pedidos_empleado_estado_pago AS
SELECT
    e.id_empleado,
    e.nombre AS nombre_empleado,
    COUNT(p.id_pedido) AS num_pedidos,
    SUM(f.total_factura) AS total_ventas,
    mp.nombre_metodo_pago AS metodo_pago
FROM empleados e
JOIN pedidos p 
       ON e.id_empleado = p.id_empleado
JOIN facturas f 
       ON p.id_pedido = f.id_pedido
JOIN metodo_pago mp 
       ON p.id_metodo_pago = mp.id_metodo_pago
GROUP BY e.id_empleado, e.nombre, mp.nombre_metodo_pago;

