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
-- 7. Tabla ORDEN_COMPRA
CREATE TABLE orden_compra (
    id_orden SERIAL PRIMARY KEY,
    fecha_emision DATE NOT NULL,
    fecha_entrega_prevista DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_proveedor INTEGER NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);
-- 8. Tabla DETALLE_ORDEN_COMPRA
CREATE TABLE detalle_orden_compra (
    id_detalle_orden SERIAL PRIMARY KEY,
    cantidad_solicitada INTEGER NOT NULL,
    costo_unitario NUMERIC(10,2) NOT NULL,
    id_orden INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES orden_compra(id_orden),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
-- 9. Tabla UBICACION_ALMACEN
CREATE TABLE ubicacion_almacen (
    id_ubicacion SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    tipo_ubicacion VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NULL,
    estado VARCHAR(20) NOT NULL
);

--10. Tabla TIPO_MOVIMIENTO
CREATE TABLE tipo_movimiento (
    id_tipo_movimiento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    naturaleza VARCHAR(20) NOT NULL
);

--11. Tabla MOVIMIENTO_INVENTARIO
CREATE TABLE movimiento_inventario (
    id_movimiento SERIAL PRIMARY KEY,
    id_tipo_movimiento INT NOT NULL REFERENCES tipo_movimiento(id_tipo_movimiento),
    id_producto INT NOT NULL,
    id_lote INT,
    id_ubicacion INT,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cantidad NUMERIC(14,4) NOT NULL,
    referencia_operacion VARCHAR(100),
    observaciones TEXT
);

--12. Tabla CONTEO_INVENTARIO
CREATE TABLE conteo_inventario (
    id_conteo SERIAL PRIMARY KEY,
    fecha_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_fin TIMESTAMP,
    estado VARCHAR(20) NOT NULL,
    observaciones TEXT
);

--13. Tabla DETALLE_CONSUMO
CREATE TABLE detalle_conteo (
    id_detalle_conteo SERIAL PRIMARY KEY,
    id_conteo INT NOT NULL REFERENCES conteo_inventario(id_conteo),
    id_producto INT NOT NULL,
    id_lote INT,
    id_ubicacion INT,
    cantidad_sistema NUMERIC(14,4) NOT NULL DEFAULT 0,
    cantidad_contada NUMERIC(14,4) NOT NULL DEFAULT 0
);

--14. Tabla AJUSTE_INVENTARIO
CREATE TABLE ajuste_inventario (
    id_ajuste SERIAL PRIMARY KEY,
    id_detalle_conteo INT NOT NULL REFERENCES detalle_conteo(id_detalle_conteo),
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cantidad_ajustada NUMERIC(14,4) NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    estado VARCHAR(20) NOT NULL
);
