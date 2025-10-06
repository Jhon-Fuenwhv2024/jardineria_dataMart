/*
Métricas a calcular/incluir: cantidad_vendida, precio_unidad, y el cálculo del 
total_venta (cantidad * precio_unidad).
Carga HechosVentas (Tabla de Hechos Central)
Resuelve las claves subrogadas (SK) utilizando las claves originales (PK) de staging.
*/

INSERT INTO DataMart.HechosVentas ( 
    id_producto, 
    id_categoria, 
    id_tiempo, 
    cantidad_vendida, 
    precio_unidad, 
    total_venta, 
    numero_pedido, 
    numero_linea 
) 
SELECT 
    DP.id_producto,         -- Clave Subrogada de Producto 
    DC.id_categoria,        -- Clave Subrogada de Categoría 
    DT.id_tiempo,           -- Clave Subrogada de Tiempo (fecha_pedido) 
    SDP.cantidad AS cantidad_vendida, 
    SDP.precio_unidad, 
    (SDP.cantidad * SDP.precio_unidad) AS total_venta,  -- Métrica calculada 
    SDP.ID_pedido AS numero_pedido,  -- Referencia operacional 
    SDP.numero_linea 
FROM 
    jardineria_staging.stg_detalle_pedido SDP 
JOIN 
    jardineria_staging.stg_pedido SP 
    ON SDP.ID_pedido = SP.ID_pedido 
JOIN 
    jardineria_staging.stg_producto SPR     -- Necesario para obtener la Categoria (clave original)
    ON SDP.ID_producto = SPR.ID_producto 
-- Uniones de Lookup para obtener Claves Subrogadas:
JOIN 
    DataMart.DimProducto DP 
    ON SDP.ID_producto = DP.id_producto_original    -- Asumiendo mapeo 1:1 de ID_producto original a SK
JOIN 
    DataMart.DimTiempo DT 
    ON SP.fecha_pedido = DT.fecha 
JOIN 
    DataMart.DimCategoria DC 
    ON SPR.Categoria = DC.id_categoria_original;