-- Creación de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS FerreteriaDB;

-- Usar la base de datos FerreteriaDB
USE FerreteriaDB;

-- Tabla de Métodos de Pago
CREATE TABLE IF NOT EXISTS Metodos_Pago (
    ID_Metodo INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del método de pago
    Nombre VARCHAR(50) NOT NULL -- Nombre descriptivo del método de pago
);

-- Tabla de Categorías de Productos
CREATE TABLE IF NOT EXISTS Categorias_Productos (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la categoría de productos
    Nombre VARCHAR(100) NOT NULL, -- Nombre de la categoría
    Descripcion TEXT -- Breve descripción de la categoría
);

-- Tabla de Proveedores
CREATE TABLE IF NOT EXISTS Proveedores (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    Correo_Electronico VARCHAR(255) UNIQUE, -- Asegura que el correo electrónico sea único
    Telefono VARCHAR(20)
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Correo_Electronico VARCHAR(255) UNIQUE, -- Asegura que el correo electrónico sea único
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

-- Tabla de Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Rol VARCHAR(100), -- Rol o cargo del empleado
    Fecha_Inicio DATE, -- Fecha de inicio de empleo del empleado
    Salario DECIMAL(10, 2)
);

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT, -- Descripción detallada del producto
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL, -- Cantidad disponible en inventario
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro del producto
    Ultima_Actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Fecha de la última actualización del producto
);

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS Ventas (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Producto INT NOT NULL,
    ID_Cliente INT NOT NULL,
    Precio_Total DECIMAL(10, 2) NOT NULL,
    ID_Metodo INT,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto), -- Clave foránea a la tabla Productos
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente), -- Clave foránea a la tabla Clientes
    FOREIGN KEY (ID_Metodo) REFERENCES Metodos_Pago(ID_Metodo) -- Clave foránea a la tabla Metodos_Pago
);

-- Tabla de Compras
CREATE TABLE IF NOT EXISTS Compras (
    ID_Compra INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL, -- Fecha en la que se realizó la compra
    ID_Producto INT NOT NULL,
    ID_Proveedor INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL, -- Precio unitario del producto en la compra
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto), -- Clave foránea a la tabla Productos
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor) -- Clave foránea a la tabla Proveedores
);

-- Tabla de Relación Productos_Categorias
CREATE TABLE IF NOT EXISTS Productos_Categorias (
    ID_Productos_Categorias INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de la relación producto-categoría
    ID_Producto INT, -- Producto relacionado
    ID_Categoria INT, -- Categoría a la que pertenece el producto
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto), -- Clave foránea a la tabla Productos
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias_Productos(ID_Categoria) -- Clave foránea a la tabla Categorias_Productos
);

-- Tabla de Detalles de Ventas
CREATE TABLE IF NOT EXISTS Detalles_Ventas (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venta INT NOT NULL, -- Venta asociada
    ID_Producto INT NOT NULL, -- Producto vendido
    Cantidad INT NOT NULL, 
    Precio_Unitario DECIMAL(10, 2) NOT NULL, -- Precio unitario del producto en la venta
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta), -- Clave foránea a la tabla Ventas
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto) -- Clave foránea a la tabla Productos
);

-- Tabla de Historial de Precios
CREATE TABLE IF NOT EXISTS Historial_Precios (
    ID_Historial INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT NOT NULL, -- Producto al que se refiere el historial de precios
    Fecha_Cambio DATE NOT NULL, -- Fecha en la que se realizó el cambio de precio
    Precio_Anterior DECIMAL(10, 2) NOT NULL, -- Precio anterior del producto
    Precio_Nuevo DECIMAL(10, 2) NOT NULL, -- Nuevo precio del producto
    Razon_Cambio VARCHAR(255), -- Razón por la cual se realizó el cambio de precio
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto) -- Clave foránea a la tabla Productos
);

-- Tabla de Transacciones de Inventario
CREATE TABLE IF NOT EXISTS Transacciones_Inventario (
    ID_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Transaccion VARCHAR(50) NOT NULL, -- Tipo de transacción (entrada o salida de inventario)
    Fecha DATE NOT NULL, -- Fecha en la que se realizó la transacción
    ID_Producto INT NOT NULL, -- Producto afectado por la transacción
    Cantidad_Afectada INT NOT NULL, -- Cantidad de unidades afectadas por la transacción
    Id_Empleado INT NOT NULL,
    Motivo VARCHAR(255), -- Razón o motivo de la transacción
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto), -- Clave foránea a la tabla Productos
    FOREIGN KEY (Id_Empleado) REFERENCES Empleados(ID_Empleado) -- Clave foránea a la tabla Empleados
);

-- Tabla de Opiniones y Feedback de Clientes
CREATE TABLE IF NOT EXISTS Opiniones_Clientes (
    ID_Opinion INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Fecha DATE NOT NULL,
    Calificacion INT NOT NULL, -- Calificación numérica asignada por el cliente
    Comentario TEXT, -- Comentario del cliente sobre su experiencia
    Producto_Evaluado VARCHAR(255), -- Producto sobre el cual se hace la evaluación
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) -- Clave foránea a la tabla Clientes
);

-- Tabla de Historial de Clientes
CREATE TABLE IF NOT EXISTS Historial_Clientes (
    ID_Registro INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Fecha_Transaccion DATE NOT NULL, 
    Tipo_Transaccion VARCHAR(50) NOT NULL, -- Tipo de transacción realizada por el cliente
    Total_Gastado DECIMAL(10, 2), -- Total gastado por el cliente en la transacción
    Productos_Comprados TEXT, -- Detalle de los productos comprados en la transacción
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) -- Clave foránea a la tabla Clientes
);
