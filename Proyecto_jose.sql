-- Creación de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS FerreteriaDB;

-- Usar la base de datos FerreteriaDB
USE FerreteriaDB;

-- Tabla de Métodos de Pago
CREATE TABLE IF NOT EXISTS Metodos_Pago (
    ID_Metodo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

-- Tabla de Categorías de Productos
CREATE TABLE IF NOT EXISTS Categorias_Productos (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);

-- Tabla de Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    Correo_Electronico VARCHAR(255) UNIQUE,
    Telefono VARCHAR(20)
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Correo_Electronico VARCHAR(255) UNIQUE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

-- Tabla de Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Rol VARCHAR(100),
    Fecha_Inicio DATE,
    Salario DECIMAL(10, 2)
);

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Ultima_Actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS Ventas (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Producto INT NOT NULL,
    ID_Cliente INT NOT NULL,
    Precio_Total DECIMAL(10, 2) NOT NULL,
    ID_Metodo INT,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Metodo) REFERENCES Metodos_Pago(ID_Metodo)
);

-- Tabla de Compras
CREATE TABLE IF NOT EXISTS Compras (
    ID_Compra INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Producto INT NOT NULL,
    ID_Proveedor INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);

-- Tabla de Relación Productos_Categorias
CREATE TABLE IF NOT EXISTS Productos_Categorias (
    ID_Productos_Categorias INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias_Productos(ID_Categoria)
);

-- Tabla de Detalles de Ventas
CREATE TABLE IF NOT EXISTS Detalles_Ventas (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Tabla de Historial de Precios
CREATE TABLE IF NOT EXISTS Historial_Precios (
    ID_Historial INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT NOT NULL,
    Fecha_Cambio DATE NOT NULL,
    Precio_Anterior DECIMAL(10, 2) NOT NULL,
    Precio_Nuevo DECIMAL(10, 2) NOT NULL,
    Razon_Cambio VARCHAR(255),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Tabla de Transacciones de Inventario
CREATE TABLE IF NOT EXISTS Transacciones_Inventario (
    ID_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Transaccion VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad_Afectada INT NOT NULL,
    Id_Empleado INT NOT NULL,
    Motivo VARCHAR(255),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (Id_Empleado) REFERENCES Empleados(ID_Empleado)
);

-- Tabla de Opiniones y Feedback de Clientes
CREATE TABLE IF NOT EXISTS Opiniones_Clientes (
    ID_Opinion INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Fecha DATE NOT NULL,
    Calificacion INT NOT NULL,
    Comentario TEXT,
    Producto_Evaluado VARCHAR(255),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabla de Historial de Clientes
CREATE TABLE IF NOT EXISTS Historial_Clientes (
    ID_Registro INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Fecha_Transaccion DATE NOT NULL,
    Tipo_Transaccion VARCHAR(50) NOT NULL,
    Total_Gastado DECIMAL(10, 2),
    Productos_Comprados TEXT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabla de Detalles de Compras
CREATE TABLE IF NOT EXISTS Detalles_Compras (
    ID_Detalle_Compra INT AUTO_INCREMENT PRIMARY KEY,
    ID_Compra INT NOT NULL,
    ID_Producto INT NOT NULL,
    ID_Proveedor INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Compra) REFERENCES Compras(ID_Compra),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);
