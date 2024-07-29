# Problema a Resolver: Optimización y Gestión Integral de Operaciones en una Ferretería
________________________________________
## Introducción
Una ferretería enfrenta múltiples desafíos operativos y estratégicos que requieren una gestión eficiente de datos para mejorar la rentabilidad, satisfacción del cliente y eficiencia operativa. La implementación de una base de datos bien estructurada juega un papel crucial en abordar estas problemáticas, proporcionando una plataforma centralizada para la gestión y análisis de datos críticos.
________________________________________
## Desafíos Actuales
1.	Gestión de Inventarios: La falta de un sistema centralizado dificulta el seguimiento preciso del inventario de productos. Esto conlleva a problemas como excesos o faltantes de stock, afectando la capacidad de respuesta ante la demanda y generando costos innecesarios por almacenamiento excesivo o pérdida de ventas por falta de productos.
2.	Gestión de Clientes y CRM: La gestión manual de la información de clientes limita la capacidad de la ferretería para ofrecer servicios personalizados, gestionar eficientemente las relaciones con los clientes y aprovechar oportunidades de venta cruzada o upselling.
3.	Optimización de Ventas y Rentabilidad: La falta de datos estructurados sobre las ventas, incluyendo análisis de productos más vendidos, rentabilidad por producto y tendencias de ventas, impide la toma de decisiones estratégicas fundamentadas para maximizar los ingresos y optimizar los márgenes de beneficio.
4.	Gestión de Proveedores y Cadena de Suministro: La falta de visibilidad sobre la relación con los proveedores y los costos de adquisición de productos afecta la capacidad de la ferretería para negociar mejores términos, gestionar la calidad del suministro y optimizar los tiempos de entrega.
5.	Análisis de Opiniones y Feedback de Clientes: La retroalimentación de los clientes no se gestiona de manera estructurada, lo que dificulta la identificación de áreas de mejora en el servicio al cliente y la reputación de la marca.
________________________________________
## Solución Propuesta: Implementación de una Base de Datos Relacional
Para abordar estos desafíos de manera efectiva, se propone la implementación de una base de datos relacional que incluya las siguientes entidades principales y relaciones:

1.	Entidades:
* Departamentos: Almacena información sobre los departamentos de la empresa.
* Metodo_Pago: Contiene los métodos de pago disponibles para los clientes.
* Categoria_Producto: Lista las categorías bajo las cuales se clasifican los productos que la empresa ofrece.
* Clientes: Registra los datos de los clientes que compran en la empresa, incluyendo información de contacto única como teléfono y correo electrónico.
* Proveedores: Almacena los datos de los proveedores de los productos que la empresa vende.
* Empleados: Registra información detallada de los empleados de la empresa, incluyendo el departamento al que pertenecen.
* Productos: Contiene detalles de los productos que la empresa vende, incluyendo su precio y la categoría a la que pertenecen.
* Direcciones_Clientes y Direcciones_Proveedores: Almacenan las direcciones asociadas a clientes y proveedores respectivamente.
* Pedidos: Registra los pedidos realizados por los clientes, incluyendo la fecha del pedido y el método de pago utilizado.
* Detalle_Pedidos: Detalla los productos específicos incluidos en cada pedido, junto con la cantidad y precio unitario.
* Facturas: Almacena información sobre las facturas generadas a partir de los pedidos.
* Comentario_Cliente y Devolucion_Cliente: Registra comentarios de los clientes y las devoluciones realizadas por ellos.
* Inventario: Mantiene un registro de las existencias de productos disponibles en la empresa.
* Compras_Proveedores y Detalles_Compras_Proveedores: Registra las compras realizadas a los proveedores, incluyendo detalles como la fecha de compra, el total y los productos comprados.

2.	Relaciones Clave:
* Clientes <-> Pedidos: Un cliente puede realizar varios pedidos.
* Pedidos <-> Detalle_Pedidos: Un pedido puede incluir múltiples productos (detalles).
* Pedidos <-> Facturas: Un pedido puede tener asociada una factura.
* Clientes <-> Comentario_Cliente: Un cliente puede realizar varios comentarios.
* Clientes <-> Devolucion_Cliente: Un cliente puede realizar varias devoluciones.
* Productos <-> Detalle_Pedidos y Detalles_Compras_Proveedores: Productos son incluidos en detalles de pedidos y compras.
* Proveedores <-> Compras_Proveedores: Los proveedores realizan ventas a la empresa en forma de compras.

3.	Funcionalidades Clave:
* Análisis de Inventarios: Seguimiento en tiempo real del stock de productos y análisis de rotación de inventarios.
* Análisis de Ventas: Identificación de productos más vendidos, análisis de rentabilidad por producto y predicción de demanda.
* Gestión de Clientes: Seguimiento de preferencias de compra, gestión de lealtad y segmentación de clientes.
* Optimización de Proveedores: Evaluación de rendimiento de proveedores, análisis de costos y gestión de calidad.
* Análisis de Feedback de Clientes: Identificación de áreas de mejora en servicio al cliente y ajuste de estrategias de marketing.
________________________________________
## Explicación de las tablas:
1. Departamentos (Departments):
* Almacena información de los departamentos.
Columnas: id_departamento, nombre_departamento.

2. Metodo_Pago (Payment Methods):
* Almacena información de los métodos de pago.
Columnas: id_metodo_pago, nombre_metodo_pago.

3. Categoria_Producto (Product Categories):
* Almacena información de las categorías de productos.
Columnas: id_categoria, nombre_categoria.

4. Clientes (Customers):
* Almacena información de los clientes.
Columnas: id_cliente, nombre, telefono, email.

5. Proveedores (Suppliers):
* Almacena información de los proveedores.
Columnas: id_proveedor, nombre, telefono, email.

6. Empleados (Employees):
* Almacena información de los empleados con referencia a la tabla Departamentos.
Columnas: id_empleado, nombre, telefono, email, id_departamento, puesto.

7. Productos (Products):
* Almacena información de los productos con referencia a Categoria_Producto para categorización.
Columnas: id_producto, nombre, precio_unitario, id_categoria.

8. Direcciones_Clientes (Customer Addresses):
* Almacena direcciones de clientes con referencia a Clientes.
Columnas: id_direccion_cliente, id_cliente, direccion.

9. Direcciones_Proveedores (Supplier Addresses):
* Almacena direcciones de proveedores con referencia a Proveedores.
Columnas: id_direccion_proveedor, id_proveedor, direccion.

10. Pedidos (Orders):
* Almacena información de pedidos con referencias a Clientes y Metodo_Pago.
Columnas: id_pedido, fecha_pedido, id_cliente, id_metodo_pago.

11. Detalle_Pedidos (Order Details):
* Almacena detalles de pedidos con referencias a Pedidos y Productos.
Columnas: id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unitario.

12. Facturas (Invoices):
* Almacena información de facturas con referencia a Pedidos.
Columnas: id_factura, fecha_factura, id_pedido, total_factura.

13. Comentario_Cliente (Customer Comments):
* Almacena comentarios de clientes con referencia a Clientes.
Columnas: id_comentario, id_cliente, comentario, fecha_comentario.

14. Devolucion_Cliente (Customer Returns):
* Almacena información de devoluciones de clientes con referencias a Pedidos y Productos.
Columnas: id_devolucion, id_pedido, id_producto, motivo, fecha_devolucion, cantidad_devolucion.

15. Inventario (Inventory):
* Almacena información de inventario con referencia a Productos.
Columnas: id_inventario, id_producto, cantidad_stock.

16. Compras_Proveedores (Supplier Purchases):
* Almacena información de compras a proveedores con referencia a Proveedores.
Columnas: id_compra_proveedor, fecha_compra, id_proveedor, total_compra, estado_pago.

17. Detalles_Compras_Proveedores (Supplier Purchase Details):
* Almacena detalles de compras a proveedores con referencias a Compras_Proveedores y Productos.
Columnas: id_detalle_compra, id_compra_proveedor, id_producto, cantidad, precio_unitario.

* Estas tablas están diseñadas para capturar de manera estructurada todos los aspectos operativos y transaccionales de una ferretería, facilitando así el análisis y la gestión de datos relevantes para la toma de decisiones empresariales.

* Bosquejo simplificado del modelo entidad-relación (E-R). Este bosquejo representa las entidades principales y sus relaciones clave de manera visual:
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
_______________________________________
# SEGUNDA PARTE DE LA ENTREGA
* Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
* Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
* Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa
* Listado de Triggers

## Documentacion de Vistas

1. Vista de Pedidos de un Cliente Específico
* Descripción: Muestra todos los pedidos realizados por un cliente específico.
* Objetivo: Proporcionar un resumen de los pedidos de un cliente para la gestión y seguimiento.
* Tablas Compuestas: pedidos
``` 
CREATE VIEW pedidos_cliente_especifico AS
SELECT
       id_pedido,
       fecha_pedido,
       id_empleado
FROM pedidos
WHERE id_cliente = 1; -- ID del cliente específico, ajustable
```
2. Vista de Productos en Stock Bajo
* Descripción: La vista proporciona una lista de productos cuyo stock en inventario es inferior a un umbral predefinido.
* Objetivo: Facilitar la identificación de productos con bajo stock para que los encargados de inventario puedan tomar medidas y realizar * pedidos de reposición a tiempo.
* Tablas Compuestas: Productos, inventario.
```  
CREATE VIEW productos_stock_bajo AS
SELECT
      p.id_producto,
      p.nombre,
      i.cantidad_stock
FROM productos p
JOIN inventario i
     ON p.id_producto = i.id_producto
WHERE i.cantidad_stock < 10; -- la cantidad de Stock es ajustable
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
