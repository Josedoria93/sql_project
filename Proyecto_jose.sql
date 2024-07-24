DROP DATABASE IF EXISTS empresa_ferretera;

-- Creación de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS empresa_ferretera;
USE empresa_ferretera;

-- Tabla Departamentos
CREATE TABLE IF NOT EXISTS Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Metodo_Pago
CREATE TABLE IF NOT EXISTS Metodo_Pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre_metodo_pago VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Categoria_Producto
CREATE TABLE IF NOT EXISTS Categoria_Producto (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    id_departamento INT NOT NULL,
    puesto VARCHAR(100),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
        ON DELETE RESTRICT  -- Evita eliminar un departamento con empleados
);

-- Tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,  
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categoria_Producto(id_categoria)
        ON DELETE RESTRICT  -- Evita eliminar una categoría con productos
);

-- Tabla Direcciones_Clientes
CREATE TABLE IF NOT EXISTS Direcciones_Clientes (
    id_direccion_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    direccion TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE  -- Elimina direcciones si se elimina un cliente
);

-- Tabla Direcciones_Proveedores
CREATE TABLE IF NOT EXISTS Direcciones_Proveedores (
    id_direccion_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    direccion TEXT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
        ON DELETE CASCADE  -- Elimina direcciones si se elimina un proveedor
);

-- Tabla Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE,  -- Elimina pedidos si se elimina un cliente
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_Pago(id_metodo_pago)
        ON DELETE RESTRICT  -- Evita eliminar un método de pago usado en pedidos
);

-- Tabla Detalle_Pedidos
CREATE TABLE IF NOT EXISTS Detalle_Pedidos (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,  
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
        ON DELETE CASCADE,  -- Elimina detalles si se elimina un pedido
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
        ON DELETE RESTRICT  -- Evita eliminar un producto usado en detalles de pedidos
);

-- Tabla Facturas
CREATE TABLE IF NOT EXISTS Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha_factura DATE NOT NULL,
    id_pedido INT NOT NULL,
    total_factura DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
        ON DELETE CASCADE  -- Elimina facturas si se elimina un pedido
);

-- Tabla Comentario_Cliente
CREATE TABLE IF NOT EXISTS Comentario_Cliente (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    comentario TEXT NOT NULL,  
    fecha_comentario DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE  -- Elimina comentarios si se elimina un cliente
);

-- Tabla Devolucion_Cliente
CREATE TABLE IF NOT EXISTS Devolucion_Cliente (
    id_devolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    motivo TEXT NOT NULL,
    fecha_devolucion DATE NOT NULL,
    cantidad_devolucion INT NOT NULL,  
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
        ON DELETE CASCADE,  -- Elimina devoluciones si se elimina un pedido
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
        ON DELETE RESTRICT  -- Evita eliminar un producto usado en devoluciones
);

-- Tabla Inventario
CREATE TABLE IF NOT EXISTS Inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad_stock INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
        ON DELETE RESTRICT  -- Evita eliminar un producto con existencias en inventario
);

-- Tabla Compras_Proveedores
CREATE TABLE IF NOT EXISTS Compras_Proveedores (
    id_compra_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    fecha_compra DATE NOT NULL,
    id_proveedor INT NOT NULL,
    total_compra DECIMAL(10,2) NOT NULL,
    estado_pago VARCHAR(50),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
        ON DELETE RESTRICT  -- Evita eliminar un proveedor con compras asociadas
);

-- Tabla Detalles_Compras_Proveedores
CREATE TABLE IF NOT EXISTS Detalles_Compras_Proveedores (
    id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra_proveedor INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,  
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra_proveedor) REFERENCES Compras_Proveedores(id_compra_proveedor)
        ON DELETE CASCADE,  -- Elimina detalles si se elimina una compra
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
        ON DELETE RESTRICT  -- Evita eliminar un producto usado en detalles de compras
);
