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
