-- 1. Tabla CATEGORIA
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NULL,
    estado VARCHAR(20) NOT NULL
);

insert into categoria (nombre, descripcion, estado)
values ('Lacteos','derivados de la leche','Activo'),
       ('Charcutería','embutidos','Inactivo'),
       ('Panadería','postres y pan','Inactivo'),
       ('Pescadería','mariscos y pescado','Activo'),
       ('Frutería','frutas','Activo');

-- 2. Tabla UNIDAD_MEDIDA
CREATE TABLE unidad_medida (
    id_unidad SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    abreviatura VARCHAR(10) NOT NULL
);

insert into unidad_medida (nombre, abreviatura)
values ('Litros','lt'),
       ('gramos','gr'),
       ('gramos','gr'),
       ('kilogramos','kg'),
       ('kilogramos','kg');

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

insert into producto (codigo_barras, nombre, descripcion, precio_referencia)
values ('7751271010016','Leche laive','leche con lactosa','12.00'),
       ('7750243000123','Chorizo Otto kunz','chorizo precocido','16.00'),
       ('0012345678905','Ciabatta','Pan','4.00'),
       ('5901234123457','Bonito','pescado','18.00'),
       ('4006381333931','Naranja de jugo','Fruta','7.00');
