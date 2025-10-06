-- ================================================================
-- SCRIPT PARA CREACIÓN DE BASE DE DATOS STAGING - JARDINERÍA
-- ================================================================
-- Autor: [Jhon Fuentes]
-- Descripción: Script para crear la base de datos Staging basada 
--              en el modelo relacional de la base de datos Jardinería
-- ================================================================

-- Eliminar base de datos si existe y crear nueva
DROP DATABASE IF EXISTS jardineria_staging;
CREATE DATABASE jardineria_staging;
USE jardineria_staging;

-- ================================================================
-- CREACIÓN DE TABLAS STAGING
-- ================================================================

-- Tabla de clientes
CREATE TABLE stg_cliente (
  ID_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(50),
  nombre_contacto VARCHAR(30),
  apellido_contacto VARCHAR(30),
  telefono VARCHAR(15),
  fax VARCHAR(15),
  linea_direccion1 VARCHAR(50),
  linea_direccion2 VARCHAR(50),
  ciudad VARCHAR(50),
  region VARCHAR(50),
  pais VARCHAR(50),
  codigo_postal VARCHAR(10),
  ID_empleado_rep_ventas INT,
  limite_credito NUMERIC(15,2)
);

-- Tabla de empleados
CREATE TABLE stg_empleado (
  ID_empleado INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido1 VARCHAR(50),
  apellido2 VARCHAR(50),
  extension VARCHAR(10),
  email VARCHAR(100),
  ID_oficina INT,
  ID_jefe INT,
  puesto VARCHAR(50)
);

-- Tabla de productos
CREATE TABLE stg_producto (
  ID_producto INT PRIMARY KEY,
  CodigoProducto VARCHAR(15),
  nombre VARCHAR(70),
  Categoria INT,
  dimensiones VARCHAR(25),
  proveedor VARCHAR(50),
  descripcion TEXT,
  cantidad_en_stock SMALLINT,
  precio_venta NUMERIC(15,2),
  precio_proveedor NUMERIC(15,2)
);

-- Tabla de categorías de productos
CREATE TABLE stg_categoria_producto (
  Id_Categoria INT PRIMARY KEY,
  Desc_Categoria VARCHAR(50),
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256)
);

-- Tabla de pedidos
CREATE TABLE stg_pedido (
  ID_pedido INT PRIMARY KEY,
  fecha_pedido DATE,
  fecha_esperada DATE,
  fecha_entrega DATE,
  estado VARCHAR(15),
  comentarios TEXT,
  ID_cliente INT
);

-- Tabla de detalles de pedidos
CREATE TABLE stg_detalle_pedido (
  ID_detalle_pedido INT PRIMARY KEY,
  ID_pedido INT,
  ID_producto INT,
  cantidad INT,
  precio_unidad NUMERIC(15,2),
  numero_linea SMALLINT
);

-- Tabla de pagos
CREATE TABLE stg_pago (
  ID_pago INT PRIMARY KEY,
  ID_cliente INT,
  forma_pago VARCHAR(40),
  id_transaccion VARCHAR(50),
  fecha_pago DATE,
  total NUMERIC(15,2)
);