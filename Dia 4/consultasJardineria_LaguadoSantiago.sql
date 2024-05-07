use jardineria;

create table gama_producto (
gama VARCHAR(50) primary key,
descripcion_texto TEXT null,
descripcion_html TEXT null,
imagen VARCHAR(256) null
);

create table producto (
codigo_producto VARCHAR(15) primary key,
nombre VARCHAR(70) not null,
gama VARCHAR(50),
dimensiones VARCHAR(25) null,
proveedor VARCHAR(50) null,
descripcion TEXT null,
cantidad_en_stock SMALLINT(6) not null,
precio_venta DECIMAL(15,2) not null,
precio_proveedor DECIMAL(12,2) null,
FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

create table oficina (
codigo_oficina VARCHAR(10) primary key,
ciudad VARCHAR(30) not null,
pais VARCHAR(50) not null,
region VARCHAR(50) null,
codigo_postal VARCHAR(10) not null,
telefono VARCHAR(20) not null,
linea_direccion1 VARCHAR(50) not null,
linea_direccion2 VARCHAR(50) null
);

create table empleado (
codigo_empleado INT(11) primary key,
nombre VARCHAR(50) not null,
apellido1 VARCHAR(50) not null,
apellido2 VARCHAR(50) null,
extension VARCHAR(10) not null,
email VARCHAR(10) not null,
codigo_oficina VARCHAR(10) not null,
codigo_jefe INT(11) null,
puesto VARCHAR(50) null,
FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado),
FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina)
);

create table cliente (
codigo_cliente INT(11) primary key,
nombre_cliente VARCHAR(50) not null,
nombre_contacto VARCHAR(30) null,
apellido_contacto VARCHAR(30) null,
telefono VARCHAR(15) not null,
fax VARCHAR(15) not null,
linea_direccion1 VARCHAR(50) not null,
linea_direccion2 VARCHAR(50) null,
ciudad VARCHAR(50) not null,
region VARCHAR(50) null,
pais VARCHAR(50) null,
codigo_postal VARCHAR(10) null,
codigo_empleado_rep_ventas INT(11) null,
limite_credito DECIMAL(15,2) null,
FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

create table pago (
codigo_cliente INT(11),
forma_pago VARCHAR(40) not null,
id_transaccion VARCHAR(50) primary key,
fecha_pago DATE not null,
total DECIMAL (15,2) not null,
FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

create table pedido (
codigo_pedido INT(11) primary key,
fecha_pedido DATE not null,
fecha_esperada DATE not null,
fecha_entrega DATE null,
estado VARCHAR(15) not null,
comentarios TEXT null,
codigo_cliente INT(11),
FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

create table detalle_pedido (
codigo_pedido INT(11),
codigo_producto VARCHAR(15),
cantidad INT(11) not null,
precio_unidad DECIMAL(15,2) not null,
numero_linea SMALLINT(6) not null,
FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);