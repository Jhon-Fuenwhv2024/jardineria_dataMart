Validación de Métricas (Precisión)
-- Objetivo: Verificar que la métrica calculada total_venta es correcta,
-- comparando la suma total en la tabla de hechos con la suma
-- recalculada directamente desde la tabla de staging.

-- 4. Validar agregación total de ventas (ejemplo: suma total)

-- 1. Suma de ventas en DataMart:
SELECT
    '1. DataMart.HechosVentas (SUM(total_venta))' AS Metrica_Evaluada,
    SUM(total_venta) AS Suma_Total_Ventas
FROM
    DataMart.HechosVentas

UNION ALL

-- 2. Recálculo de la suma de ventas desde Staging:
SELECT
    '2. Staging (SUM(cantidad * precio_unidad))' AS Metrica_Evaluada,
    SUM(cantidad * precio_unidad) AS Suma_Total_Ventas
FROM
    jardineria_staging.stg_detalle_pedido;

-- Nota: Si los resultados de ambas consultas son idénticos, se confirma la precisión de la transformación de la métrica.