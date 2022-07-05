create database if not exists pulperia;
use pulperia;

create table vendedor(
    id_vendedor varchar(10),
    nombre varchar(15),
    apellido varchar(15),
    numero_tel int,

);
create table proveedor(
    id_proveedor varchar(10),
    nombre_proveedor varchar(15),
    dia_entre enum('lunes','martes','miercoles','jueves','viernes'),
    numero_tel int,
    
);
create table cliente(
    id_cliente varchar(10),
    nombre varchar(15),
    apellido varchar(15),
);
create table producto(
    id_producto varchar(10),
    nombreprod varchar(10),
    cant int,
    tipo enum('comestibles','hogar','materia prima'),
    vencimiento date,
);
create table provee(
    id_proveedor varchar(10),
    id_producto varchar(10),
    fecha_entrega date,
);
create table orden(
    id_cliente varchar(10),
    id_vendedor varchar(10),
    id_producto varchar(10),
    fecha date,

);
