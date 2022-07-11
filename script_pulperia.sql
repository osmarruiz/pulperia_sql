create database if not exists pulperia;
use pulperia;

create table vendedor(
    id_vendedor varchar(10),
    nombre varchar(15),
    apellido varchar(15),
    numero_tel int,
    sueldo int,
    constraint vendedorpk primary key(id_vendedor)

);
create table proveedor(
    id_proveedor varchar(10),
    nombre_proveedor varchar(30),
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
    id_proveedor varchar(10),
    nombreprod varchar(10),
    cant int,
    precio_de_compra int,
    precio_de_venta int,
    ganancia int,
    existencia int,
    tipo enum('comestibles','hogar','materia prima'),
    constraint productopk primary key(id_producto)
);
create table entrada(
    id_entrada varchar(5),
    id_proveedor varchar(10),
    id_producto varchar(10),
    fecha_entrega date,
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
    cantidad_vendida int,
    precio int,
    constraint detallepk primary key(num_detalle),
    constraint detallefk foreign key(id_venta) references venta(id_venta) on update cascade on delete cascade,
    constraint detallefk2 foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade
);

INSERT INTO cliente
values
('141', 'Enrique', 'Josepo'),
('312', 'Victoria', 'Perez'), 
('412', 'Pablo', 'Solorzano'), 
('532', 'Esmeralda', 'Montes'), 
('234', 'Maria', 'Castro'),
('123', 'Miguel', 'Arauz'),
('140', 'Mario', 'Flavio'),
('139', 'Marcos', 'Espinoza'),
('122', 'Vicente', 'Tellez'),
('111', 'Jose', 'Bolivar'),
('411', 'DiMaria', 'Hernandez'),
('400', 'Guillermo', 'Estrada'),
('389', 'Marcos', 'Acuña'),
('145', 'Jefrey', 'Baldizon'),
('465', 'Elena', 'Munguia');

INSERT INTO proveedor
values
('68239', 'Coca Cola', 'Jueves', 84729816),
('79342', 'Panaderia Tinoco', 'Martes', 81638193),
('92346', 'Pepsi', 'Martes', 81273623),
('24978', 'Bimbo', 'Martes' , 89561425),
('12463', 'Laboratorio Ramos', 'Lunes', 56829781),
('87392', 'TipTop', 'Martes', 82871236), 
('23462', 'Eskimo', 'Miercoles', 86271278),
('23235', 'Pollo Estrella', 'Miercoles', 89654212),
('19233', 'DeliQueso', 'Viernes', 89546212),
('23782', 'Nike', 'Viernes', 56387121),
('98763', 'Agencia rapigas', 'Jueves', 87124612),
('27842', 'SASA', 'Lunes', 83765423),
('67956', 'Shinola', 'Lunes', 89645372),
('23522', 'Kerns', 'Jueves', 87653415),
('89752', 'Cafe Presto', 'Lunes', 85472912);

INSERT INTO vendedor
values
('134', 'Mario', 'Martinez', 89763423,5000),
('323', 'Edipsia', 'Altamirano', 87641253,6000), 
('234', 'Edgard', 'Munguia', 89652714,3000), 
('563', 'Kevin', 'Gomez', 78364512,5000), 
('654', 'Mario', 'Rivas', 87120943,8000),
('168', 'Miguela', 'Membreño', 88662345,4500),
('986', 'Marcio', 'Balladares', 87124653,6777),
('690', 'Marcia', 'Osejo', 89832353,7500),
('658', 'Vicen', 'Obregon', 78934234,8000),
('631', 'Josias', 'Gutierrez', 76582910,5000),
('457', 'Marco', 'Lebron', 86735123,2600),
('770', 'Guillermina', 'Vallejos', 89673614,13000),
('247', 'Ariel', 'Bucardo', 34876123,5000),
('185', 'Jefferson', 'Reyez', 68924923,6000),
('448', 'Elisa', 'Gonzales', 56372910,3400);

insert into producto
values
('342947','68239','soda coca-2lt',20,25,36,11,20,'comestible'),
('342948','68239','soda fanta-2lt',20,25,36,11,20,'comestible'),
('342970','79342','marqueta',12,30,50,20,12,'comestible'),
('342972','79342','pan simple',12,10,15,5,12,'comestible'),
('343030','92346','7up-500ml',25,9,15,6,25,'comestible'),
('344032','87392','piernas',14,30,55,25,14,'comestible'),
('344036','87392','muslo',14,45,65,20,14,'comestible'),