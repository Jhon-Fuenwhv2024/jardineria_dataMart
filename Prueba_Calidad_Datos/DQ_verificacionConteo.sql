-- A. Verificación de Conteo de Registros (Integridad y Completitud)
-- Objetivo: Comparar el número total de registros cargados en la Tabla de Hechos
-- (DataMart.HechosVentas) con la tabla de origen en Staging (stg_detalle_pedido).
-- Ambos conteos deben coincidir si todas las líneas de detalle de pedido se cargaron correctamente.

SELECT
    '1. DataMart.HechosVentas (Conteo Final)' AS Tabla_Evaluada,
    COUNT(*) AS Total_Registros
FROM
    DataMart.HechosVentas

UNION ALL

SELECT
    '2. jardineria_staging.stg_detalle_pedido (Origen Staging)' AS Tabla_Evaluada,
    COUNT(*) AS Total_Registros
FROM
    jardineria_staging.stg_detalle_pedido;