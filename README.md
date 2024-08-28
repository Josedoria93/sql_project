# Problema a Resolver: Optimización y Gestión Integral de Operaciones en una Ferretería
### Alumno: Jose Luis Doria Petro
### Curso: SQL
### Comisión: 57190
### Profesor: Anderson Michel Torres
### Tutor: Ariel Annone

[![Ferreteria.png](https://i.postimg.cc/59nz7XZR/Ferreteria.png)](https://postimg.cc/QVKVVdNQ)
________________________________________
## Introducción
Una ferretería enfrenta múltiples desafíos operativos y estratégicos que requieren una gestión eficiente de datos para mejorar la rentabilidad, satisfacción del cliente y eficiencia operativa. La implementación de una base de datos bien estructurada juega un papel crucial en abordar estas problemáticas, proporcionando una plataforma centralizada para la gestión y análisis de datos críticos.
________________________________________
## Desafíos Actuales
1.	**Gestión de Inventarios**: La falta de un sistema centralizado dificulta el seguimiento preciso del inventario de productos. Esto conlleva a problemas como excesos o faltantes de stock, afectando la capacidad de respuesta ante la demanda y generando costos innecesarios por almacenamiento excesivo o pérdida de ventas por falta de productos.

2.	**Gestión de Clientes y CRM**: La gestión manual de la información de clientes limita la capacidad de la ferretería para ofrecer servicios personalizados, gestionar eficientemente las relaciones con los clientes y aprovechar oportunidades de venta cruzada o upselling.

3.	**Optimización de Ventas y Rentabilidad**: La falta de datos estructurados sobre las ventas, incluyendo análisis de productos más vendidos, rentabilidad por producto y tendencias de ventas, impide la toma de decisiones estratégicas fundamentadas para maximizar los ingresos y optimizar los márgenes de beneficio.

4.	**Gestión de Proveedores y Cadena de Suministro**: La falta de visibilidad sobre la relación con los proveedores y los costos de adquisición de productos afecta la capacidad de la ferretería para negociar mejores términos, gestionar la calidad del suministro y optimizar los tiempos de entrega.

5.	**Análisis de Opiniones y Feedback de Clientes**: La retroalimentación de los clientes no se gestiona de manera estructurada, lo que dificulta la identificación de áreas de mejora en el servicio al cliente y la reputación de la marca.
________________________________________
## Solución Propuesta: Implementación de una Base de Datos Relacional
Para abordar estos desafíos de manera efectiva, se propone la implementación de una base de datos relacional que incluya las siguientes entidades principales y relaciones:

1.	**Entidades**:
* Departamentos
* Metodo_Pago
* Categoria_Producto
* Clientes
* Proveedores
* Empleados
* Productos
* Direcciones_Clientes y Direcciones_Proveedores
* Pedidos
* Detalle_Pedidos
* Facturas
* Comentario_Cliente y Devolucion_Cliente
* Inventario
* Compras_Proveedores y Detalles_Compras_Proveedores

2.	**Relaciones Clave**:
* Clientes <-> Pedidos: Un cliente puede realizar varios pedidos.
* Pedidos <-> Detalle_Pedidos: Un pedido puede incluir múltiples productos (detalles).
* Pedidos <-> Facturas: Un pedido puede tener asociada una factura.
* Clientes <-> Comentario_Cliente: Un cliente puede realizar varios comentarios.
* Clientes <-> Devolucion_Cliente: Un cliente puede realizar varias devoluciones.
* Productos <-> Detalle_Pedidos y Detalles_Compras_Proveedores: Productos son incluidos en detalles de pedidos y compras.
* Proveedores <-> Compras_Proveedores: Los proveedores realizan ventas a la empresa en forma de compras.

3.	**Funcionalidades Clave**:
* Análisis de Inventarios: Seguimiento en tiempo real del stock de productos y análisis de rotación de inventarios.
* Análisis de Ventas: Identificación de productos más vendidos, análisis de rentabilidad por producto y predicción de demanda.
* Gestión de Clientes: Seguimiento de preferencias de compra, gestión de lealtad y segmentación de clientes.
* Optimización de Proveedores: Evaluación de rendimiento de proveedores, análisis de costos y gestión de calidad.
* Análisis de Feedback de Clientes: Identificación de áreas de mejora en servicio al cliente y ajuste de estrategias de marketing.
________________________________________
## Explicación de las tablas:
1. **Departamentos (Departments)**:
* Almacena información de los departamentos.
* Columnas: id_departamento, nombre_departamento.

2. **Metodo_Pago (Payment Methods)**:
* Almacena información de los métodos de pago.
* Columnas: id_metodo_pago, nombre_metodo_pago.

3. **Categoria_Producto (Product Categories)**:
* Almacena información de las categorías de productos.
* Columnas: id_categoria, nombre_categoria.

4. **Clientes (Customers)**:
* Almacena información de los clientes.
* Columnas: id_cliente, nombre, telefono, email.

5. **Proveedores (Suppliers)**:
* Almacena información de los proveedores.
* Columnas: id_proveedor, nombre, telefono, email.

6. **Empleados (Employees)**:
* Almacena información de los empleados con referencia a la tabla Departamentos.
* Columnas: id_empleado, nombre, telefono, email, id_departamento, puesto.

7. **Productos (Products)**:
* Almacena información de los productos con referencia a Categoria_Producto para categorización.
* Columnas: id_producto, nombre, precio_unitario, id_categoria.

8. **Direcciones_Clientes (Customer Addresses)**:
* Almacena direcciones de clientes con referencia a Clientes.
* Columnas: id_direccion_cliente, id_cliente, direccion.

9. **Direcciones_Proveedores (Supplier Addresses)**:
* Almacena direcciones de proveedores con referencia a Proveedores.
* Columnas: id_direccion_proveedor, id_proveedor, direccion.

10. **Pedidos (Orders**):
* Almacena información de pedidos con referencias a Clientes y Metodo_Pago.
* Columnas: id_pedido, fecha_pedido, id_cliente, id_metodo_pago.

11. **Detalle_Pedidos (Order Details)**:
* Almacena detalles de pedidos con referencias a Pedidos y Productos.
* Columnas: id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario.

12. **Facturas (Invoices)**:
* Almacena información de facturas con referencia a Pedidos.
* Columnas: id_factura, fecha_factura, id_pedido, total_factura.

13. **Comentario_Cliente (Customer Comments)**:
* Almacena comentarios de clientes con referencia a Clientes.
* Columnas: id_comentario, id_cliente, comentario, fecha_comentario.

14. **Devolucion_Cliente (Customer Returns)**:
* Almacena información de devoluciones de clientes con referencias a Pedidos y Productos.
* Columnas: id_devolucion, id_pedido, id_producto, motivo, fecha_devolucion, cantidad_devolucion.

15. **Inventario (Inventory)**:
* Almacena información de inventario con referencia a Productos.
* Columnas: id_inventario, id_producto, cantidad_stock.

16. **Compras_Proveedores (Supplier Purchases)**:
* Almacena información de compras a proveedores con referencia a Proveedores.
* Columnas: id_compra_proveedor, fecha_compra, id_proveedor, total_compra, estado_pago.

17. **Detalles_Compras_Proveedores (Supplier Purchase Details)**:
* Almacena detalles de compras a proveedores con referencias a Compras_Proveedores y Productos.
* Columnas: id_detalle_compra, id_compra_proveedor, id_producto, cantidad, precio_unitario.

## Clasificación de las tablas en *tablas de hechos* y *tablas transaccionales*:

### *Tablas de Hechos* 
*Suelen contener datos que son utilizados para el análisis y reporting*:

* *facturas*: Registra el monto total de las facturas emitidas, lo cual es un dato clave para el análisis financiero y de ventas.
* *detalle_pedidos*: Almacena los detalles de los productos en cada pedido, incluyendo cantidad y precio, lo que es crucial para el análisis de ventas y gestión de inventario.
* *devolucion_cliente*: Contiene datos sobre las devoluciones de productos, como cantidad y motivo, que son importantes para el análisis de devoluciones y satisfacción del cliente.
* *compras_proveedores*: Registra información sobre las compras a proveedores, incluyendo el monto total de la compra, útil para el análisis de costos y gastos.
* *detalles_compras_proveedores*: Almacena detalles sobre los productos comprados, como cantidad y precio, que son importantes para el análisis de costos de compras y gestión de inventario.

### *Tablas Transaccionales* 
*Almacenan datos relacionados con transacciones o eventos específicos*:

* *pedidos*: Registra cada pedido realizado por los clientes, incluyendo el cliente, el método de pago y el empleado, lo cual representa una transacción comercial específica.
* *comentario_cliente*: Contiene los comentarios realizados por los clientes, reflejando interacciones y feedback en una transacción específica.
* *devolucion_cliente*: Aunque también puede ser considerada una tabla de hechos debido a su contenido, registra transacciones de devoluciones, que es un tipo de transacción específica.

### *Tablas de Soporte o Referencia* 
*Estas tablas proporcionan datos de referencia que son utilizados por las tablas de hechos y transaccionales*:

* *clientes*: Contiene información sobre los clientes, usada en las transacciones y análisis.
* *proveedores*: Almacena información sobre los proveedores, utilizada en las transacciones de compras.
* *empleados*: Registra datos sobre los empleados, utilizados en pedidos y facturación.
* *departamentos*: Contiene información sobre los departamentos, usada para organizar empleados.
* *metodo_pago*: Almacena los métodos de pago disponibles, utilizados en pedidos.
* *categoria_producto*: Contiene las categorías de productos, usadas en la tabla de productos.
* *productos*: Aunque principalmente es una tabla de referencia, se relaciona con las transacciones de ventas y compras.

### Bosquejo simplificado del modelo entidad-relación (E-R).
```
  +-------------------+        +---------------------+       +-----------------+
  |     Clientes      |        |     Empleados        |       |   Proveedores   |
  +-------------------+        +---------------------+       +-----------------+
  | id_cliente (PK)   |        | id_empleado (PK)     |       | id_proveedor (PK)|
  | nombre            |        | nombre               |       | nombre          |
  | telefono          |        | telefono             |       | telefono        |
  | email             |        | email                |       | email           |
  |                   |        | id_departamento (FK) |       |                 |
  |                   |        +---------------------+       |                 |
  +-------------------+                     |               +-----------------+
           |                               |
           |                               |
           +----------------+--------------+
                            |
                            |
                            |
                            |
  +-------------------+     |     +---------------------+
  | Direcciones_Clientes |     |     |   Direcciones_Proveedores |
  +-------------------+     |     +---------------------+
  | id_direccion_cliente (PK)|     | id_direccion_proveedor (PK) |
  | id_cliente (FK)     |-----+     | id_proveedor (FK) |
  | direccion          |           | direccion       |
  +-------------------+           +-----------------+

  +-------------------+              +---------------------+
  |     Departamentos |              |     Metodo_Pago      |
  +-------------------+              +---------------------+
  | id_departamento (PK)             | id_metodo_pago (PK)  |
  | nombre_departamento              | nombre_metodo_pago   |
  +----------------------------------+---------------------+

  +-------------------+              +---------------------+
  | Categoria_Producto|              |     Productos        |
  +-------------------+              +---------------------+
  | id_categoria (PK) |              | id_producto (PK)     |
  | nombre_categoria  |              | nombre              |
  +-------------------+              | precio_unitario     |
                                     | id_categoria (FK)   |
                                     +---------------------+

  +-------------------+              +---------------------+
  |     Pedidos       |              |    Detalle_Pedidos   |
  +-------------------+              +---------------------+
  | id_pedido (PK)    |              | id_detalle_pedido (PK)|
  | fecha_pedido      |              | id_pedido (FK)      |
  | id_cliente (FK)   |--------------| id_producto (FK)    |
  | id_metodo_pago (FK)|             | cantidad            |
  +-------------------+              | precio_unitario     |
                                     +---------------------+

  +-------------------+              +---------------------+
  |     Facturas      |              |    Comentarios_Cliente|
  +-------------------+              +---------------------+
  | id_factura (PK)   |              | id_comentario (PK)   |
  | fecha_factura     |              | id_cliente (FK)      |
  | id_pedido (FK)    |--------------| comentario           |
  | total_factura     |              | fecha_comentario     |
  +-------------------+              +---------------------+

  +-------------------+              +---------------------+
  | Devolucion_Cliente|              |    Inventario        |
  +-------------------+              +---------------------+
  | id_devolucion (PK)|              | id_inventario (PK)   |
  | id_pedido (FK)    |--------------| id_producto (FK)     |
  | id_producto (FK)  |              | cantidad_stock       |
  | motivo            |              +---------------------+
  | fecha_devolucion  |
  | cantidad_devolucion|
  +-------------------+

  +-------------------+              +---------------------+
  | Compras_Proveedores|             | Detalles_Compras_Proveedores|
  +-------------------+              +---------------------+
  | id_compra_proveedor (PK)|        | id_detalle_compra (PK)|
  | fecha_compra       |             | id_compra_proveedor (FK)|
  | id_proveedor (FK)  |-------------| id_producto (FK)     |
  | total_compra       |             | cantidad             |
  | estado_pago        |             | precio_unitario      |
  +-------------------+              +---------------------+
```
[![Modelo.png](https://i.postimg.cc/CxYVRKKw/Modelo.png)](https://postimg.cc/F7P6qNc6)

## Método de Importación de Datos en la Base de Datos *empresa_ferretera*

* Para integrar la información en la base de datos empresa_ferretera, se ha empleado un método sistemático y eficiente de importación de datos utilizando comandos SQL. Este proceso asegura que los datos sean cargados correctamente en las tablas correspondientes, facilitando así la gestión y consulta de la información dentro del sistema. A continuación se detalla el método utilizado:
  
**Preparación de Datos**:

* *Recopilación*: Los datos fueron recopilados y organizados en un formato que facilita su importación. Estos datos incluyen información sobre departamentos, categorías de productos, métodos de pago, clientes, proveedores y empleados.
  
* *Formato*: Los datos fueron estructurados en comandos SQL INSERT INTO, que son estándar para la inserción de registros en tablas de bases de datos relacionales. Cada comando especifica la tabla en la que se deben insertar los datos y los valores a ser insertados en las columnas correspondientes.

**Estructura de Comandos SQL**:

* *Comandos INSERT INTO*: Cada tabla en la base de datos tiene un conjunto de comandos SQL INSERT INTO. Estos comandos permiten agregar múltiples registros a la vez. El formato general es:
```
INSERT INTO nombre_tabla (columna1, columna2, ...) VALUES (valor1, valor2, ...), (valor1, valor2, ...), ...;
```
[![INSERT-INTO.png](https://i.postimg.cc/KcC5r9CY/INSERT-INTO.png)](https://postimg.cc/6TLRBhWs)

**Proceso de Importación**:

* *Ejecución de Comandos*: Los comandos SQL se ejecutan a través de una herramienta de administración de bases de datos (MySQL Workbench). Estos comandos son procesados por el sistema de gestión de bases de datos (SGBD), el cual inserta los registros en las tablas correspondientes.

* *Verificación*: Después de ejecutar los comandos, se realiza una verificación para asegurar que los datos se hayan importado correctamente. Esto puede implicar consultas SQL de prueba para comprobar que los datos están presentes y correctos en las tablas.

[![Captura-de-pantalla-2024-08-24-192821.png](https://i.postimg.cc/V6VKW4nB/Captura-de-pantalla-2024-08-24-192821.png)](https://postimg.cc/dkGRq2WL)
  
**Beneficios del Método**:

* *Eficiencia*: La importación de datos mediante comandos SQL INSERT INTO permite agregar múltiples registros en una sola operación, lo que es más eficiente que insertar los datos uno por uno.

* *Consistencia*: Al utilizar un formato estandarizado, se minimiza el riesgo de errores durante la importación. Esto garantiza que los datos se inserten de manera coherente y precisa.

* *Facilidad de Actualización*: En el futuro, si es necesario actualizar o añadir más datos, se puede utilizar un enfoque similar para mantener la integridad y la estructura de la base de datos.
_______________________________________
# OBJETOS DE LA BASE DE DATOS:
* Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
* Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
* Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa.
* Listado de Triggers.

## Documentacion de Vistas

1. **Vista de Pedidos de un Cliente Específico**
* Descripción: Muestra todos los pedidos realizados por un cliente específico.
* Objetivo: Proporcionar un resumen de los pedidos de un cliente para la gestión y seguimiento.
* Tablas Compuestas: pedidos
  
```
SELECT id_pedido,fecha_pedido,id_empleado FROM empresa_ferretera.pedidos_cliente_especifico;
```
[![vista-pedidos-cliente-especifico.png](https://i.postimg.cc/jjj96DBT/vista-pedidos-cliente-especifico.png)](https://postimg.cc/HrfBdkpv)

2. **Vista de Productos en Stock Bajo**
* Descripción: La vista proporciona una lista de productos cuyo stock en inventario es inferior a un umbral predefinido.
* Objetivo: Facilitar la identificación de productos con bajo stock para que los encargados de inventario puedan tomar medidas y realizar * pedidos de reposición a tiempo.
* Tablas Compuestas: Productos, inventario.
```  
SELECT * FROM empresa_ferretera.productos_stock_bajo;
```
[![Vista-de-Productos-en-Stock-Bajo.png](https://i.postimg.cc/pdXN0Ghg/Vista-de-Productos-en-Stock-Bajo.png)](https://postimg.cc/TKSH1cc9)

3. **vista_pedidos_empleado_estado_pago**
* Descripción: La vista muestra el número total de pedidos gestionados por cada empleado, el total de ventas generadas y el método de pago utilizado. 
* Objetivo: Proporcionar un resumen de las ventas realizadas por cada empleado, agrupado por el método de pago utilizado en los pedidos.
* Tablas Compuestas: empleados, pedidos, facturas y metodo_pago.
```
SELECT * FROM vista_pedidos_empleado_estado_pago;
```
## Documentacion de Procedimientos Almacenados

1. **Nombre del Procedimiento Almacenado: sp_ventas_producto**
* Descripción: Simplifica la recuperación de datos relacionados con un producto específico en la tabla detalle_pedidos.
* Objetivo: Recuperar todos los detalles de los pedidos relacionados con un producto específico, identificado por su producto_id, desde la tabla detalle_pedidos.
* Tablas Compuestas:La Tabla Principal es detalle_pedidos y el campo clave de la Tabla detalle_pedidos es id_producto.
  
```  
CALL sp_ventas_producto(5);
```
[![Procedimiento-Almacenado.png](https://i.postimg.cc/cHCY7ZXz/Procedimiento-Almacenado.png)](https://postimg.cc/9R3rC33P)

2. **Nombre del Procedimiento Almacenado: sp_agregar_cliente**
* Descripción: Se utiliza para insertar nuevos registros en las tablas clientes y direcciones_cliente.
* Objetivo: Simplificar y centralizar el proceso de inserción de nuevos clientes en la base de datos, garantizando que los datos se inserten correctamente en la tabla clientes y direcciones_cliente.
* Tablas Compuestas: El procedimiento afecta a las tablas clientes y direcciones_cliente.

```
CALL sp_agregar_cliente('Aristoteles Perez', '575-1234', 'aris.perez@example.com', '123 Calle Principal, Springfield');
```
[![Stored-Procedure.png](https://i.postimg.cc/nhwQHNHY/Stored-Procedure.png)](https://postimg.cc/PCYqy3vP)

3. **Nombre del Procedimiento Almacenado: sp_puesto**
* Descripción: Permite a los responsables de recursos humanos, finanzas o administración obtener información rápida y relevante sobre la compensación de los empleados en función de su puesto.
* Objetivo: Calcular y proporcionar estadísticas salariales (promedio, máximo y mínimo) de un puesto específico dentro de una empresa.
* Tablas Compuestas: El procedimiento interactúa con la tabla empleados.

```
CALL sp_puesto('Sales Manager', @promedio, @mayor, @menor);
SELECT @promedio AS Promedio, @mayor AS Mayor, @menor AS Menor;
```
[![Stored-Procedure.png](https://i.postimg.cc/kMcPZbFK/Stored-Procedure.png)](https://postimg.cc/pypS5ySL)

4. **Nombre del Procedimiento Almacenado: sp_listar_productos_categoria**
* Descripción: Permite a los usuarios o aplicaciones filtrar productos por categoría de manera eficiente.
* Objetivo: Recuperar y mostrar información sobre productos que pertenecen a una categoría específica.
* Tablas Compuestas: categoria_producto y productos.

```
CALL sp_listar_productos_categoria('Herramientas');
```
[![Stored-Procedure.png](https://i.postimg.cc/KjVNVf9m/Stored-Procedure.png)](https://postimg.cc/8fRMfRQY)

## Documentacion de Función

1. **Nombre de la Función: total_ventas_cliente**
* Descripción: Esta función es útil para la generación de informes financieros y análisis de clientes que requieran seguimiento del rendimiento de ventas por cliente.
* Objetivo: Calcular el total de ventas acumuladas para un cliente específico dentro de una base de datos.
* Tablas Compuestas: facturas y pedidos, parámetro de Entrada (cliente_id INT).
```
  SELECT total_ventas_cliente(1) AS total_ventas;
```
[![Funci-n.png](https://i.postimg.cc/ZqZ1VYBV/Funci-n.png)](https://postimg.cc/3kSSwTZv)

2. **Nombre de la Función: total_compras_proveedor**
* Descripción: Esencial para gestionar la contabilidad de proveedores y para análisis de gastos relacionados con proveedores en sistemas de gestión de compras y finanzas.
* Objetivo: Calcular el total de compras realizadas a un proveedor específico. 
* Tablas Compuestas: compras_proveedores y parámetro de Entrada (proveedor_id INT).
```
SELECT total_compras_proveedor(5) AS total_compras;
```
[![FX.png](https://i.postimg.cc/j2KcrCTF/FX.png)](https://postimg.cc/k61KQJBQ)

## Documentacion de los Trigger

1. **Nombre del Trigger: after_insert_detalle_pedido**
* Descripción: Se encarga de ajustar la cantidad de stock disponible para un producto en el inventario, descontando la cantidad del producto que se ha vendido.
* Objetivo: Mantener actualizado el inventario en la base de datos de manera automática cuando se agrega un nuevo detalle de pedido (venta).  
* Tablas Compuestas: detalle_pedidos y inventario.

2. **Nombre del Trigger: after_insert_detalles_compras_proveedores** 
* Descripción: Se encarga de ajustar la cantidad de stock disponible para un producto en el inventario, aumentando la cantidad del producto que se ha comprado.
* Objetivo: Mantener actualizado el inventario en la base de datos de manera automática cuando se registra una nueva compra de productos a proveedores. 
* Tablas Compuestas: detalles_compras_proveedores y inventario.
_______________________________________
## BACKUP | DUMP:
* Realizar copias de seguridad (backups) en MySQL es esencial para proteger la integridad de los datos y garantizar la continuidad del negocio.
* El proyecto se ejecuto con MySQL Workbench, EXPORT TO DUMP PROJECT FOLDER que permite exportar una base de datos a un archivo autocontenido en formato SQL.

[![Backup.png](https://i.postimg.cc/0NxShm9g/Backup.png)](https://postimg.cc/k21Db2Vw)

[![Export-Completed.png](https://i.postimg.cc/GtBTvxxD/Export-Completed.png)](https://postimg.cc/q6T7TnYB)
_______________________________________

## CORRER EL CÓDIGO EN EL CONTENEDOR (CODESPACE):

[![Primer-paso.png](https://i.postimg.cc/wvcV2myB/Primer-paso.png)](https://postimg.cc/phrzXyBN)


[![Segundo-Paso.png](https://i.postimg.cc/Y2RRmQBn/Segundo-Paso.png)](https://postimg.cc/QVB129t1)


[![Tercer-Paso.png](https://i.postimg.cc/3xtWXJxH/Tercer-Paso.png)](https://postimg.cc/VJbY1wt7)


[![Cuarto-Paso.png](https://i.postimg.cc/dVkjXXkp/Cuarto-Paso.png)](https://postimg.cc/NKtX2dxk)


[![Quinto-Paso.png](https://i.postimg.cc/VkxWcRX6/Quinto-Paso.png)](https://postimg.cc/DScXr1jk)

### Descripción de cada comando:

* make test-db: Este comando se utiliza para ver los datos de cada tabla en la base de datos. Es útil para verificar que los datos se están almacenando correctamente.
```
make test-db
```
* make access-db: Con este comando, puedes acceder a la base de datos. Te permite interactuar directamente con la base de datos para realizar consultas o modificaciones.
```
make access-db
```
* make backup-db: Este comando realiza un respaldo de la base de datos. Es esencial para asegurar que no se pierdan datos importantes en caso de algún fallo.
```
make backup-db
```
* make clean-db: Utilizar este comando para limpiar la base de datos. Esto puede incluir eliminar datos temporales o innecesarios para mantener la base de datos ordenada y eficiente.
```
make clean-db
```
_______________________________________
## ROLES Y USUARIOS
* Base de Datos Seleccionada: empresa_ferretera para las operaciones.
* Rol DBA: Se crea un rol DBA con todos los permisos sobre empresa_ferretera.
* Usuario josedp: Se crea un nuevo usuario josedp con una política de seguridad configurada.

  [![Alter-User.png](https://i.postimg.cc/nhqC7qwj/Alter-User.png)](https://postimg.cc/K1vGh3bx)

* Asignación de Rol: Asigna el rol DBA al usuario josedp y establece este rol como el predeterminado.
* Actualización de Privilegios: Asegura que todos los cambios de permisos sean aplicados.

### Consultar la Tabla de Usuarios
* Una vez que estés en MySQL, puedes usar la siguiente consulta para ver todos los usuarios:
```
SELECT User, Host FROM mysql.user;
```

## Para ver la instrucción SQL que se usó para crear el usuario 'josedp'@'%', ejecuta el siguiente comando en MySQL:
```
SHOW CREATE USER 'josedp'@'%';
```

* La salida del comando podría verse algo así:

```
CREATE USER 'josedp'@'%' 
IDENTIFIED WITH 'caching_sha2_password' 
AS '$A$005$\\nmz{Da[2(QoSM1Y7nvRr8AHWsguKpRe193HTYlIQDDh1k/maq16HUq61oWC' 
DEFAULT ROLE `DBA`@`%` 
REQUIRE NONE 
PASSWORD EXPIRE INTERVAL 30 DAY 
ACCOUNT UNLOCK 
PASSWORD HISTORY DEFAULT 
PASSWORD REUSE INTERVAL DEFAULT 
PASSWORD REQUIRE CURRENT DEFAULT 
FAILED_LOGIN_ATTEMPTS 4 
PASSWORD_LOCK_TIME 3;
```

_______________________________________
## Beneficios Esperados
* Mejora en la precisión y eficiencia en la gestión de inventarios.
* Mejora en la satisfacción y retención de clientes a través de un mejor servicio y personalización.
* Optimización de procesos internos y reducción de costos operativos.
* Mejora en la rentabilidad a través de decisiones estratégicas basadas en datos.
* Mejora en la reputación de la marca y fidelización de clientes a través de un mejor servicio y productos adaptados a sus necesidades.
________________________________________
## Conclusión
La implementación de una base de datos relacional adaptada a las necesidades específicas de una ferretería no solo resolverá los desafíos actuales, sino que también proporcionará una plataforma robusta para la toma de decisiones informadas y la optimización continua de procesos. Esto posicionará a la ferretería para competir eficazmente en un mercado dinámico y responder proactivamente a las demandas cambiantes de los clientes y condiciones del mercado.
