INSERT INTO DataMart.DimTiempo (
    fecha,
    año,
    mes,
    dia,
    nombre_mes,
    trimestre,
    semestre
)
SELECT DISTINCT
    fecha_pedido AS fecha,
    YEAR(fecha_pedido) AS año,
    MONTH(fecha_pedido) AS mes,
    DAY(fecha_pedido) AS dia,
    (SELECT MONTHNAME(fecha_pedido)) AS nombre_mes,
    (SELECT QUARTER(fecha_pedido)) AS trimestre,
    (SELECT IF(MONTH(fecha_pedido) <= 6, 1, 2)) AS semestre
FROM
    jardineria_staging.stg_pedido;