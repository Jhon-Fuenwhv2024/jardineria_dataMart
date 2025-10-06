# 🌱 Repositorio DataMart Jardinería

## 📋 Descripción del Proyecto

Este proyecto consiste en el desarrollo completo de un DataMart para la gestión y análisis de datos relacionados con una empresa de jardinería. El objetivo es facilitar la toma de decisiones empresariales mediante la organización eficiente de la información transaccional y la generación de reportes analíticos para el negocio.

El proyecto implementa un modelo de DataMart dimensional basado en esquema estrella, que permite el análisis multidimensional de las ventas de productos de jardinería.

## 🎯 Objetivos

- Crear un DataMart dimensional para análisis de ventas
- Implementar procesos ETL (Extract, Transform, Load) eficientes
- Establecer controles de calidad de datos
- Facilitar el análisis de tendencias de ventas por producto, categoría y tiempo
- Proporcionar métricas clave del negocio

## 🏗️ Arquitectura del Proyecto

### Modelo Dimensional
- **Esquema Estrella** con tabla de hechos central `HechosVentas`
- **Dimensiones**: Producto, Categoría, Tiempo
- **Métricas**: Cantidad vendida, precio unitario, total de ventas

### Flujo de Datos
1. **Base Transaccional** → Sistema OLTP de origen
2. **Staging Area** → Área temporal para extracción y limpieza
3. **Transformación ETL** → Procesos de transformación de datos
4. **DataMart** → Sistema OLAP dimensional final

## 📁 Estructura del Repositorio

```
repositorio_jardineria_dataMart/
├── 📂 Documentacion/
│   ├── 📂 Informes/
│   │   ├── 📄 EA1_ModeloEstrella_Jardineria.pdf
│   │   ├── 📄 EA2_Staging _Jardineria.pdf
│   │   └── 📄 EA3_ProcesoETL.pdf
│   └── 📂 Diagramas/
│       └── 🖼️ MODELO ESTRELLA.png
├── 📂 SQL_Scripts/
│   ├── 📂 Base_transacional/
│   │   └── 📄 CreacionJardineria.sql
│   ├── 📂 Stangin_extraccion/
│   │   ├── 📄 CreacionStaging.sql
│   │   └── 📄 carga_datos_extraccion.sql
│   ├── 📂 ETL_Transformacion/
│   │   └── 📄 etl_logica_tranformacion.sql
│   └── 📂 DataMart_Carga/
│       └── 📄 data_Mart_cargaFinal.sql
├── 📂 Prueba_Calidad_Datos/
│   ├── 📄 DQ_verificacionConteo.sql
│   ├── 📄 DQ_Integridad_Referencial.sql
│   └── 📄 DQ_Validacion_Metricas.sql
└── 📄 README.MD
```

## 🔧 Descripción de Componentes

### 📚 Documentación
- **Informes**: Documentación técnica de cada fase del proyecto
- **Diagramas**: Modelo conceptual y lógico del esquema estrella

### 💾 Scripts SQL

#### Base Transaccional
- `CreacionJardineria.sql`: Creación de la base de datos OLTP de origen

#### Staging/Extracción
- `CreacionStaging.sql`: Creación del área de staging
- `carga_datos_extraccion.sql`: Scripts de extracción de datos desde el sistema fuente

#### ETL/Transformación
- `etl_logica_tranformacion.sql`: Lógica de transformación y limpieza de datos

#### DataMart/Carga
- `data_Mart_cargaFinal.sql`: Carga final de dimensiones y tabla de hechos

### 🔍 Pruebas de Calidad de Datos
- `DQ_verificacionConteo.sql`: Verificación de integridad y completitud
- `DQ_Integridad_Referencial.sql`: Validación de claves foráneas
- `DQ_Validacion_Metricas.sql`: Verificación de precisión de cálculos

## 🚀 Instrucciones de Implementación

### Prerrequisitos
- SQL Server o MySQL
- Acceso a la base de datos transaccional de origen
- Permisos para crear bases de datos y esquemas

### Orden de Ejecución

1. **Crear Base Transaccional**
   ```sql
   -- Ejecutar: SQL_Scripts/Base_transacional/CreacionJardineria.sql
   ```

2. **Crear Área de Staging**
   ```sql
   -- Ejecutar: SQL_Scripts/Stangin_extraccion/CreacionStaging.sql
   ```

3. **Extraer Datos**
   ```sql
   -- Ejecutar: SQL_Scripts/Stangin_extraccion/carga_datos_extraccion.sql
   ```

4. **Transformar Datos**
   ```sql
   -- Ejecutar: SQL_Scripts/ETL_Transformacion/etl_logica_tranformacion.sql
   ```

5. **Cargar DataMart**
   ```sql
   -- Ejecutar: SQL_Scripts/DataMart_Carga/data_Mart_cargaFinal.sql
   ```

6. **Ejecutar Pruebas de Calidad**
   ```sql
   -- Ejecutar todos los scripts en: Prueba_Calidad_Datos/
   ```

## 📊 Métricas y KPIs

### Métricas Principales
- **Cantidad Vendida**: Unidades de productos vendidos
- **Precio Unitario**: Precio por unidad de producto
- **Total de Ventas**: Cantidad × Precio Unitario

### Dimensiones de Análisis
- **Temporal**: Análisis por fecha, mes, trimestre, año
- **Producto**: Análisis por producto individual
- **Categoría**: Análisis por categoría de productos

## 🔐 Control de Calidad

El proyecto incluye un conjunto completo de pruebas de calidad de datos:

- ✅ **Verificación de Conteo**: Validación de integridad de registros
- ✅ **Integridad Referencial**: Verificación de consistencia de claves
- ✅ **Validación de Métricas**: Precisión de cálculos financieros

## 🤝 Contribuciones

Este proyecto forma parte de las actividades académicas del curso de Base de Datos II. Las contribuciones deben seguir las mejores prácticas de:

- Documentación clara y detallada
- Código SQL comentado y estructurado
- Pruebas de calidad exhaustivas
- Versionado de cambios

## 📝 Notas Técnicas

- **Motor de BD**: Compatible con SQL Server/MySQL
- **Modelo**: Esquema Estrella (Star Schema)
- **Metodología**: Kimball Dimensional Modeling
- **ETL**: Procesos batch programados

## 📞 Contacto

Para consultas sobre este proyecto, contactar al equipo de desarrollo del DataMart Jardinería.

---
*Proyecto desarrollado como parte del curso de Base de Datos II - Universidad*
