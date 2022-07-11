create database if not exists pulperia;
use pulperia;

create table vendedor(
    id_vendedor varchar(10),
    nombre varchar(15),
    apellido varchar(15),
    numero_tel int,
    constraint vendedorpk primary key(id_vendedor)

);
create table proveedor(
    id_proveedor varchar(10),
    nombre_proveedor varchar(15),
    dia_entre enum('lunes','martes','miercoles','jueves','viernes'),
    numero_tel int,
    constraint proveedorpk primary key(id_proveedor)
);
create table cliente(
    id_cliente varchar(10),
    nombre varchar(15),
    apellido varchar(15),
    constraint clientepk primary key(id_cliente)
);
create table producto(
    id_producto varchar(10),
    nombreprod varchar(10),
    cant int,
    precio_de_compra int,
    precio_de_venta int,
    margen int,
    tipo enum('comestibles','hogar','materia prima'),
    constraint productopk primary key(id_producto)
);
create table entrada(
    id_entrada varchar(5),
    id_proveedor varchar(10),
    id_producto varchar(10),
    fecha_entrega date,
    cant int,
    constraint proveepk primary key(id_entrada),
    constraint proveefk foreign key(id_proveedor) references proveedor(id_proveedor) on update cascade on delete cascade,
    constraint proveefk2 foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade
);
create table venta(
    id_venta varchar(5),
    id_cliente varchar(10),
    id_vendedor varchar(10),
    fecha date,
    constraint ventapk primary key(id_venta),
    constraint ventafk foreign key(id_cliente) references cliente(id_cliente) on update cascade on delete cascade,
    constraint ventafk2 foreign key(id_vendedor) references vendedor(id_vendedor) on update cascade on delete cascade
);
create table detalles_de_venta(
    num_detalle varchar(5),
    id_venta varchar(10),
    id_producto varchar(10),
    cantidad varchar(10),
    precio int,
    constraint detallepk primary key(num_detalle),
    constraint detallefk foreign key(id_venta) references venta(id_venta) on update cascade on delete cascade,
    constraint detallefk2 foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade
);

