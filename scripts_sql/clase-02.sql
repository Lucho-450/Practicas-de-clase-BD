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
       ('miligramos', 'mg'),
       ('unidad', 'uni');

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

-- 7. Tabla ORDEN_COMPRA
INSERT INTO orden_compra (fecha_emision, fecha_entrega_prevista, estado, id_proveedor)
VALUES 
('2026-11-01', '2026-11-05', 'Aprobada', 1),
('2026-11-02', '2026-11-06', 'Pendiente', 2),
('2026-11-02', '2026-11-04', 'Pendiente', 3),
('2026-11-03', '2026-11-07', 'Recibida', 4),
('2026-11-03', '2026-11-05', 'Cancelada', 5);

-- 8. Tabla DETALLE_ORDEN_COMPRA
INSERT INTO detalle_orden_compra (cantidad_solicitada, costo_unitario, id_orden, id_producto)
VALUES 
(100, 9.50, 1, 1),
(50, 12.80, 2, 2),
(50, 2.80,  3, 3),
(50, 14.00, 4, 4),
(50, 5.20,  5, 5);

-- 9. Tabla UBICACION_ALMACEN
INSERT INTO ubicacion_almacen (codigo, tipo_ubicacion, descripcion, estado) VALUES
('A-01-01', 'Estante',      'Estante A, nivel 1, posición 1', 'ACTIVO'),
('B-02-01', 'Estante',      'Estante B, nivel 2, posición 1', 'ACTIVO'),
('REF-01',  'Refrigerado',  'Cámara de refrigeración 1',      'ACTIVO'),
('PISO-01', 'Piso',         'Zona de piso principal',         'ACTIVO'),
('CUAR-01', 'Cuarentena',   'Zona de cuarentena',             'ACTIVO');

-- 10. Tabla LOTE
INSERT INTO lote (numero_lote, fecha_fabricacion, fecha_vencimiento) VALUES
('LOT-2024-001', '2024-01-10', '2025-01-10'),
('LOT-2024-002', '2024-02-15', '2025-02-15'),
('LOT-2024-003', '2024-03-20', '2025-03-20'),
('LOT-2024-007', '2024-07-01', '2025-07-01'),
('LOT-2024-008', '2024-08-18', '2026-08-18');

-- 11.  Tabla EXISTENCIA
INSERT INTO existencia (id_lote, id_ubicacion, cantidad_disponible, cantidad_reservada) VALUES
(1, 1, 150, 20),
(1, 2, 100,  0),
(2, 1, 200, 50),
(2, 3,  75, 10),
(5, 4, 250,  0);


-- UPDATE: Cambiar el precio de producto
UPDATE producto SET precio_referencia = 15.00 WHERE id_unidad = 1;

-- UPDATE: Cambiar el estado de una orden de compra
UPDATE orden_compra SET estado = 'Recibida' WHERE id_orden = 2;

-- UPDATE: ampliar el stock máximo y el punto de reposición del producto 5
update regla_reposicion
set stock_maximo = 200,
    punto_reposicion = 80
where id_producto = 5;

-- UPDATE: cambiar el tipo de ubicacion
UPDATE ubicacion_almacen
SET tipo_ubicacion = 'Cuarentena'
WHERE codigo = 'DEV-01';
