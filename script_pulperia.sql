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
    tipo enum('comestibles','hogar','materia prima'),
    vencimiento date,
    constraint productopk primary key(id_producto)
);
create table provee(
    id_provee varchar(5),
    id_proveedor varchar(10),
    id_producto varchar(10),
    fecha_entrega date,
    constraint proveepk primary key(id_provee),
    constraint proveefk foreign key(id_proveedor) references proveedor(id_proveedor) on update cascade on delete cascade,
    constraint proveefk2 foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade,
);
create table orden(
    id_orden varchar(5),
    id_cliente varchar(10),
    id_vendedor varchar(10),
    id_producto varchar(10),
    fecha date,
    constraint ordenpk primary key(id_orden),
    constraint ordenfk foreign key(id_cliente) references cliente(id_cliente) on update cascade on delete cascade,
    constraint ordenfk2 foreign key(id_vendedor) references vendedor(id_vendedor) on update cascade on delete cascade,
    constraint proveefk3 foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade
);
