-- 1. Tabla CATEGORIA
insert into categoria (nombre, descripcion, estado)
values ('Lacteos','derivados de la leche','Activo'),
       ('Charcutería','embutidos','Inactivo'),
       ('Panadería','postres y pan','Inactivo'),
       ('Pescadería','mariscos y pescado','Activo'),
       ('Frutería','frutas','Activo');

-- 2. Tabla UNIDAD_MEDIDA
insert into unidad_medida (nombre, abreviatura)
values ('Litros','lt'),
       ('gramos','gr'),
       ('kilogramos','kg'),
       ('Miligramos', 'mg'),
       ('Unidad', 'uni');

-- 3. Tabla PRODUCTO

insert into producto (codigo_barras, nombre, descripcion, precio_referencia,estado, id_categoria, id_unidad)
values ('7751271010016','Leche laive','leche con lactosa',12.00,'Activo',1,1),
       ('7750243000123','Chorizo Otto kunz','chorizo precocido',16.00,'Inactivo',2,2),
       ('0012345678905','Ciabatta','Pan',4.00,'Inactivo',3,3),
       ('5901234123457','Bonito','pescado',18.00,'Activo',4,4),
       ('4006381333931','Naranja de jugo','Fruta',7.00,'Activo',5,5);

-- 4. Tabla REGLA_REPOSICION

insert into regla_reposicion (stock_minimo, stock_maximo, punto_reposicion, id_producto)
values (20, 100, 40, 1),
       (10, 50, 20, 2),
       (15, 60, 25, 3),
       (8, 40, 15, 4),
       (30, 150, 60, 5);

-- 5. Tabla PROVEEDOR

insert into proveedor (ruc, razon_social, direccion, telefono, correo, estado)
values ('20100094212','Laive S.A.','Av. Nicolás Arriola 740, La Victoria','014175000','ventas@laive.com.pe','Activo'),
       ('20100035121','Otto Kunz S.A.C.','Av. Los Frutales 450, Ate','013495600','pedidos@ottokunz.com.pe','Activo'),
       ('20512345678','Panificadora Del Sur S.A.C.','Jr. Huancavelica 320, Cercado de Lima','014281234','contacto@panificadorasur.pe','Inactivo'),
       ('20567891234','Pesquera Mar Azul S.A.','Av. Néstor Gambetta 1250, Callao','015772200','ventas@maraazul.com.pe','Activo'),
       ('20601234567','Agrícola Frutas del Valle E.I.R.L.','Mercado Mayorista de Frutas, La Victoria','998112233','frutasdelvalle@gmail.com','Activo');

-- 6. Tabla PRODUCTO_PROVEEDOR

insert into producto_proveedor (codigo_proveedor, costo_referencia, plazo_entrega, id_proveedor, id_producto)
values ('LAI-001', 9.50, 2, 1, 1),
       ('OTK-014', 12.80, 3, 2, 2),
       ('PDS-007', 2.80, 1, 3, 3),
       ('PMA-032', 14.00, 2, 4, 4),
       ('AFV-101', 5.20, 1, 5, 5);
