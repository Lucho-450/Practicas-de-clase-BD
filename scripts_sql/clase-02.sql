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

-- 4. Tabla REGLA_REPOSICION
CREATE TABLE regla_reposicion (
    id_regla SERIAL PRIMARY KEY,
    stock_minimo INTEGER NOT NULL,
    stock_maximo INTEGER NOT NULL,
    punto_reposicion INTEGER NOT NULL,
    id_producto INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

insert into regla_reposicion (stock_minimo, stock_maximo, punto_reposicion, id_producto)
values (20, 100, 40, 1),
       (10, 50, 20, 2),
       (15, 60, 25, 3),
       (8, 40, 15, 4),
       (30, 150, 60, 5);

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

insert into proveedor (ruc, razon_social, direccion, telefono, correo, estado)
values ('20100094212','Laive S.A.','Av. Nicolás Arriola 740, La Victoria','014175000','ventas@laive.com.pe','Activo'),
       ('20100035121','Otto Kunz S.A.C.','Av. Los Frutales 450, Ate','013495600','pedidos@ottokunz.com.pe','Activo'),
       ('20512345678','Panificadora Del Sur S.A.C.','Jr. Huancavelica 320, Cercado de Lima','014281234','contacto@panificadorasur.pe','Inactivo'),
       ('20567891234','Pesquera Mar Azul S.A.','Av. Néstor Gambetta 1250, Callao','015772200','ventas@maraazul.com.pe','Activo'),
       ('20601234567','Agrícola Frutas del Valle E.I.R.L.','Mercado Mayorista de Frutas, La Victoria','998112233','frutasdelvalle@gmail.com','Activo');

-- 6. Tabla PRODUCTO_PROVEEDOR
CREATE TABLE producto_proveedor (
    id_producto_proveedor SERIAL PRIMARY KEY,
    codigo_proveedor VARCHAR(50) NOT NULL,
    costo_referencia NUMERIC(10,2) NOT NULL,
    plazo_entrega INTEGER NOT NULL,
    id_proveedor INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    UNIQUE (id_proveedor, id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

insert into producto_proveedor (codigo_proveedor, costo_referencia, plazo_entrega, id_proveedor, id_producto)
values ('LAI-001', 9.50, 2, 1, 1),
       ('OTK-014', 12.80, 3, 2, 2),
       ('PDS-007', 2.80, 1, 3, 3),
       ('PMA-032', 14.00, 2, 4, 4),
       ('AFV-101', 5.20, 1, 5, 5);
