-- 1. Tabla CATEGORIA
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NULL,
    estado VARCHAR(20) NOT NULL
);
-- 2. Tabla UNIDAD_MEDIDA
CREATE TABLE unidad_medida (
    id_unidad SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    abreviatura VARCHAR(10) NOT NULL
);
-- 3. Tabla PRODUCTO
CREATE TABLE producto (
    id_producto SERIAL PRIMARY KEY,
    codigo_barras VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(255) NULL,
    precio_referencia NUMERIC(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_categoria INTEGER NOT NULL,
    id_unidad INTEGER NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_unidad) REFERENCES unidad_medida(id_unidad)
);
-- 4. Tabla REGLA_REPOSICION
CREATE TABLE regla_reposicion (
    id_regla SERIAL PRIMARY KEY,
    stock_minimo INTEGER NOT NULL,
    stock_maximo INTEGER NOT NULL,
    punto_reposicion INTEGER NOT NULL,
    id_producto INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
-- 5. Tabla PROVEEDOR
CREATE TABLE proveedor (
    id_proveedor SERIAL PRIMARY KEY,
    ruc VARCHAR(11) UNIQUE NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NULL,
    correo VARCHAR(100) NULL,
    estado VARCHAR(20) NOT NULL
);
