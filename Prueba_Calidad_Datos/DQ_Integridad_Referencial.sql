Verificación de Integridad Referencial (Claves Foráneas)
-- Objetivo: Confirmar que no existen registros en la Tabla de Hechos (HechosVentas)
-- con claves foráneas nulas, lo cual indicaría una falla en el mapeo a las dimensiones.

SELECT COUNT(*) AS Registros_con_FKs_Nulas
FROM DataMart.HechosVentas
WHERE
    -- Se verifica si alguna de las claves subrogadas principales (FKs) es nula
    id_producto IS NULL OR
    id_categoria IS NULL OR
    id_tiempo IS NULL;

-- Si el resultado de Registros_con_FKs_Nulas es > 0, indica fallas en el mapeo
-- entre las claves originales de staging y las claves subrogadas de las dimensiones [1].