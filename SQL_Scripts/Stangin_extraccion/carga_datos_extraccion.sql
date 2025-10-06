================================================================
-- CONSULTAS PARA TRASLADAR DATOS DESDE JARDINERÍA A STAGING
-- ================================================================

-- Copiar datos de clientes
INSERT INTO jardineria_staging.stg_cliente
SELECT 
    ID_cliente,
    nombre_cliente,
    nombre_contacto,
    apellido_contacto,
    telefono,
    fax,
    linea_direccion1,
    linea_direccion2,
    ciudad,
    region,
    pais,
    codigo_postal,
    ID_empleado_rep_ventas,
    limite_credito
FROM jardineria.cliente;

-- Copiar datos de empleados
INSERT INTO jardineria_staging.stg_empleado
SELECT 
    ID_empleado,
    nombre,
    apellido1,
    apellido2,
    extension,
    email,
    ID_oficina,
    ID_jefe,
    puesto
FROM jardineria.empleado;

-- Copiar datos de productos
INSERT INTO jardineria_staging.stg_producto
SELECT 
    ID_producto,
    CodigoProducto,
    nombre,
    Categoria,
    dimensiones,
    proveedor,
    descripcion,
    cantidad_en_stock,
    precio_venta,
    precio_proveedor
FROM jardineria.producto;

-- Copiar datos de categorías de productos
INSERT INTO jardineria_staging.stg_categoria_producto
SELECT 
    Id_Categoria,
    Desc_Categoria,
    descripcion_texto,
    descripcion_html,
    imagen
FROM jardineria.Categoria_producto;

-- Copiar datos de pedidos
INSERT INTO jardineria_staging.stg_pedido
SELECT 
    ID_pedido,
    fecha_pedido,
    fecha_esperada,
    fecha_entrega,
    estado,
    comentarios,
    ID_cliente
FROM jardineria.pedido;

-- Copiar datos de detalles de pedidos
INSERT INTO jardineria_staging.stg_detalle_pedido
SELECT 
    ID_detalle_pedido,
    ID_pedido,
    ID_producto,
    cantidad,
    precio_unidad,
    numero_linea
FROM jardineria.detalle_pedido;

-- Copiar datos de pagos
INSERT INTO jardineria_staging.stg_pago
SELECT 
    ID_pago,
    ID_cliente,
    forma_pago,
    id_transaccion,
    fecha_pago,
    total
FROM jardineria.pago;

-- ================================================================
-- CONSULTAS DE VERIFICACIÓN
-- ================================================================

-- Verificar que los datos se copiaron correctamente
SELECT 'Clientes' as Tabla, COUNT(*) as Total_Registros FROM stg_cliente
UNION ALL
SELECT 'Empleados' as Tabla, COUNT(*) as Total_Registros FROM stg_empleado
UNION ALL
SELECT 'Productos' as Tabla, COUNT(*) as Total_Registros FROM stg_producto
UNION ALL
SELECT 'Categorías' as Tabla, COUNT(*) as Total_Registros FROM stg_categoria_producto
UNION ALL
SELECT 'Pedidos' as Tabla, COUNT(*) as Total_Registros FROM stg_pedido
UNION ALL
SELECT 'Detalles Pedido' as Tabla, COUNT(*) as Total_Registros FROM stg_detalle_pedido
UNION ALL
SELECT 'Pagos' as Tabla, COUNT(*) as Total_Registros FROM stg_pago;

-- ================================================================
-- FIN DEL SCRIPT
-- ================================================================