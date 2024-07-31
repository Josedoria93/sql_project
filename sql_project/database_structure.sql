DROP DATABASE IF EXISTS empresa_ferretera;

CREATE DATABASE IF NOT EXISTS empresa_ferretera;
USE empresa_ferretera;

-- Tabla Departamentos
CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del departamento',
    nombre_departamento VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre del departamento'
) COMMENT = 'Tabla que almacena los departamentos de la empresa';

-- Tabla Metodo_Pago
CREATE TABLE IF NOT EXISTS metodo_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del método de pago',
    nombre_metodo_pago VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre del método de pago'
) COMMENT = 'Tabla que almacena los métodos de pago disponibles';

-- Tabla Categoria_Producto
CREATE TABLE IF NOT EXISTS categoria_producto (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la categoría del producto',
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre de la categoría del producto'
) COMMENT = 'Tabla que almacena las categorías de productos';

-- Tabla Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del cliente',
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre completo del cliente',
    telefono VARCHAR(20) NOT NULL UNIQUE COMMENT 'Número de teléfono del cliente',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Correo electrónico del cliente'
) COMMENT = 'Tabla que almacena la información de los clientes';

-- Tabla Proveedores
CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del proveedor',
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del proveedor',
    telefono VARCHAR(20) NOT NULL UNIQUE COMMENT 'Número de teléfono del proveedor',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Correo electrónico del proveedor'
) COMMENT = 'Tabla que almacena la información de los proveedores';

-- Tabla Empleados
CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del empleado',
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre completo del empleado',
    telefono VARCHAR(20) NOT NULL UNIQUE COMMENT 'Número de teléfono del empleado',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Correo electrónico del empleado',
    id_departamento INT NOT NULL COMMENT 'Identificador del departamento al que pertenece el empleado',
    puesto VARCHAR(100) COMMENT 'Puesto del empleado en la empresa',
    salario DECIMAL(10,2) NOT NULL CHECK (salario > 0) COMMENT 'Salario del empleado',
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
        ON DELETE RESTRICT -- Evita eliminar un departamento con empleados
) COMMENT = 'Tabla que almacena la información de los empleados. Restricción: No se puede eliminar un departamento si hay empleados asignados';

-- Tabla Productos
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del producto',
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del producto',
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0) COMMENT 'Precio unitario del producto',
    id_categoria INT NOT NULL COMMENT 'Identificador de la categoría del producto',
    FOREIGN KEY (id_categoria) REFERENCES categoria_producto(id_categoria)
        ON DELETE RESTRICT -- Evita eliminar una categoría con productos
) COMMENT = 'Tabla que almacena los productos. Restricción: No se puede eliminar una categoría si hay productos asignados';

-- Tabla Direcciones_Clientes
CREATE TABLE IF NOT EXISTS direcciones_clientes (
    id_direccion_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la dirección del cliente',
    id_cliente INT NOT NULL COMMENT 'Identificador del cliente',
    direccion TEXT NOT NULL COMMENT 'Dirección del cliente',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE -- Elimina direcciones si se elimina un cliente
) COMMENT = 'Tabla que almacena las direcciones de los clientes. Restricción: Si se elimina un cliente, también se eliminarán sus direcciones';

-- Tabla Direcciones_Proveedores
CREATE TABLE IF NOT EXISTS direcciones_proveedores (
    id_direccion_proveedor INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la dirección del proveedor',
    id_proveedor INT NOT NULL COMMENT 'Identificador del proveedor',
    direccion TEXT NOT NULL COMMENT 'Dirección del proveedor',
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
        ON DELETE CASCADE -- Elimina direcciones si se elimina un proveedor
) COMMENT = 'Tabla que almacena las direcciones de los proveedores. Restricción: Si se elimina un proveedor, también se eliminarán sus direcciones';

-- Tabla Pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del pedido',
    fecha_pedido DATE NOT NULL COMMENT 'Fecha en que se realizó el pedido',
    id_cliente INT NOT NULL COMMENT 'Identificador del cliente que realizó el pedido',
    id_metodo_pago INT NOT NULL COMMENT 'Identificador del método de pago utilizado',
    id_empleado INT NOT NULL COMMENT 'Identificador del empleado que gestionó el pedido',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE, -- Elimina pedidos si se elimina un cliente
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
        ON DELETE RESTRICT, -- Evita eliminar un método de pago usado en pedidos
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
        ON DELETE RESTRICT -- evita la eliminación de empleados que están asignados a pedidos.
) COMMENT = 'Tabla que almacena los pedidos realizados. Restricción: Si se elimina un cliente, se eliminarán sus pedidos';

-- Tabla Detalle_Pedidos
CREATE TABLE IF NOT EXISTS detalle_pedidos (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del detalle del pedido',
    id_pedido INT NOT NULL COMMENT 'Identificador del pedido',
    id_producto INT NOT NULL COMMENT 'Identificador del producto',
    cantidad INT NOT NULL CHECK (cantidad > 0) COMMENT 'Cantidad del producto en el pedido',
    precio_venta DECIMAL(10,2) NOT NULL COMMENT 'Precio unitario del producto en el pedido',
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE RESTRICT
) COMMENT = 'Tabla que almacena los detalles de cada pedido. Restricción: No se puede eliminar un producto si hay detalles de pedidos asociados';

-- Tabla Facturas
CREATE TABLE IF NOT EXISTS facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la factura',
    fecha_factura DATE NOT NULL COMMENT 'Fecha en que se emitió la factura',
    id_pedido INT NOT NULL COMMENT 'Identificador del pedido asociado a la factura',
    id_empleado INT NOT NULL COMMENT 'Identificador del empleado que emitió la factura',
    total_factura DECIMAL(10,2) NOT NULL CHECK (total_factura >= 0) COMMENT 'Monto total de la factura',
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON DELETE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
        ON DELETE RESTRICT
) COMMENT = 'Tabla que almacena las facturas emitidas. Restricción: Si se elimina un pedido, se eliminará la factura asociada';

-- Tabla Comentario_Cliente
CREATE TABLE IF NOT EXISTS comentario_cliente (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del comentario del cliente',
    id_cliente INT NOT NULL COMMENT 'Identificador del cliente que hizo el comentario',
    comentario TEXT NOT NULL COMMENT 'Texto del comentario del cliente',
    fecha_comentario DATE NOT NULL COMMENT 'Fecha en que se realizó el comentario',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
) COMMENT = 'Tabla que almacena los comentarios realizados por los clientes. Restricción: Si se elimina un cliente, se eliminarán sus comentarios';

-- Tabla Devolucion_Cliente
CREATE TABLE IF NOT EXISTS devolucion_cliente (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la devolución del cliente',
    id_pedido INT NOT NULL COMMENT 'Identificador del pedido asociado a la devolución',
    id_producto INT NOT NULL COMMENT 'Identificador del producto devuelto',
    motivo TEXT NOT NULL COMMENT 'Motivo de la devolución',
    fecha_devolucion DATE NOT NULL COMMENT 'Fecha en que se realizó la devolución',
    cantidad_devolucion INT NOT NULL CHECK (cantidad_devolucion > 0) COMMENT 'Cantidad de producto devuelto',
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE RESTRICT
) COMMENT = 'Tabla que almacena las devoluciones realizadas por los clientes. Restricción: No se puede eliminar un producto si hay devoluciones asociadas';

-- Tabla Inventario
CREATE TABLE IF NOT EXISTS inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del inventario',
    id_producto INT NOT NULL COMMENT 'Identificador del producto en inventario',
    cantidad_stock INT NOT NULL CHECK (cantidad_stock >= 0) COMMENT 'Cantidad en stock del producto',
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE RESTRICT
) COMMENT = 'Tabla que almacena el inventario de productos. Restricción: No se puede eliminar un producto si hay stock asociado';

-- Tabla Compras_Proveedores
CREATE TABLE IF NOT EXISTS compras_proveedores (
    id_compra_proveedor INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único de la compra al proveedor',
    fecha_compra DATE NOT NULL COMMENT 'Fecha en que se realizó la compra',
    id_proveedor INT NOT NULL COMMENT 'Identificador del proveedor',
    total_compra DECIMAL(10,2) NOT NULL CHECK (total_compra >= 0) COMMENT 'Monto total de la compra',
    estado_pago VARCHAR(50) COMMENT 'Estado del pago (e.g., pagado, pendiente)',
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
        ON DELETE RESTRICT
) COMMENT = 'Tabla que almacena las compras realizadas a proveedores. Restricción: No se puede eliminar un proveedor si hay compras asociadas';

-- Tabla Detalles_Compras_Proveedores
CREATE TABLE IF NOT EXISTS detalles_compras_proveedores (
    id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Identificador único del detalle de la compra al proveedor',
    id_compra_proveedor INT NOT NULL COMMENT 'Identificador de la compra al proveedor',
    id_producto INT NOT NULL COMMENT 'Identificador del producto comprado',
    cantidad INT NOT NULL CHECK (cantidad > 0) COMMENT 'Cantidad del producto en la compra',
    precio_compra DECIMAL(10,2) NOT NULL COMMENT 'Precio unitario del producto en la compra',
    FOREIGN KEY (id_compra_proveedor) REFERENCES compras_proveedores(id_compra_proveedor)
        ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE RESTRICT
) COMMENT = 'Tabla que almacena los detalles de las compras realizadas a proveedores. Restricción: No se puede eliminar un producto si hay detalles de compras asociados';

