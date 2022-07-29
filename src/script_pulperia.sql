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
    visita enum('lunes','martes','miercoles','jueves','viernes'),
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
    nombreprod varchar(50),
    tamano varchar(10),
    cant int,
    precio_de_compra int,
    precio_de_venta int,
    ganancia int,
    existencia int,
    tipo enum('comestible','hogar','materia prima'),
    constraint productopk primary key(id_producto)
);
create table entrada(
    id_entrada varchar(5),
    id_proveedor varchar(10),
    id_producto varchar(10),
    fecha_entrega date,
    constraint entradapk primary key(id_entrada),
    constraint entradafk foreign key(id_proveedor) references proveedor(id_proveedor) on update cascade on delete cascade,
    constraint entradafk2 foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade
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
    id_detalle varchar(10),
    num_detalle int,
    id_venta varchar(10),
    id_producto varchar(10),
    cantidad_vendida int,
    precio_u int,
    precio int,
    existencia int,
    constraint detallepk primary key(id_detalle),
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
('12463', 'Lala', 'Lunes', 56829781),
('87392', 'TipTop', 'Martes', 82871236), 
('23462', 'Eskimo', 'Miercoles', 86271278),
('23235', 'Pollo Estrella', 'Miercoles', 89654212),
('19233', 'DeliQueso', 'Viernes', 89546212),
('23782', 'Xedex', 'Viernes', 56387121),
('98763', 'Baygon', 'Jueves', 87124612),
('27842', 'Caballito', 'Lunes', 83765423),
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
('342947','soda coca','2LT',20,25,36,11,20,'comestible'),
('342948','soda fanta-2lt','2LT',20,25,36,11,20,'comestible'),
('342970','marqueta','700GR',12,30,50,20,12,'comestible'),
('342972','pan simple','30GR',12,10,15,5,12,'comestible'),
('343030','7up','500ML',25,9,15,6,25,'comestible'),
('344032','piernas','1LB',14,30,55,25,14,'comestible'),
('344036','muslo','1LB',14,45,65,20,14,'comestible'),
('345012','napolitano','5OOML',10,90,135,45,10,'comestible'),
('345013','ron con pasas','500ML',10,90,135,45,10,'comestible'),
('345014','vainilla','1LB',10,90,135,45,10,'comestible'),
('346011','queso ahumado','1LB',16,40,60,20,16,'comestible'),
('347011','detergente','500GR',12,9,15,6,12,'hogar'),
('348011','insecticida','500ML',10,50,77,27,10,'hogar'),
('349913','colorante azul','20GR',16,20,34,14,16,'hogar'),
('349914','colorante negro','20GR',16,20,34,14,16,'hogar');

insert into entrada
values
('00001','68239','342947','2022-01-12'),
('00002','68239','342948','2022-01-12'),
('00003','79342','342970','2022-01-14'),
('00004','79342','342972','2022-01-14'),
('00005','92346','343030','2022-01-16'),
('00006','87392','344032','2022-01-16'),
('00007','87392','344036','2022-01-16'),
('00008','23462','345012','2022-01-22'),
('00009','23462','345013','2022-01-22'),
('00010','23462','345014','2022-01-22'),
('00011','19233','346011','2022-01-23'),
('00012','23782','347011','2022-01-23'),
('00013','98763','348011','2022-01-24'),
('00014','27842','349913','2022-01-25'),
('00015','27842','349914','2022-01-25');

insert into venta
values
('00001','312','986','2022-02-01'),
('00002','312','986','2022-02-01'),
('00003','532','986','2022-02-01'),
('00004','123','134','2022-02-01'),
('00005','139','654','2022-02-02'),
('00006','145','654','2022-02-02'),
('00007','400','168','2022-02-02'),
('00008','111','457','2022-02-03'),
('00009','141','770','2022-02-03'),
('00010','532','185','2022-02-03'),
('00011','111','185','2022-02-03'),
('00012','139','168','2022-02-04'),
('00013','234','168','2022-02-04'),
('00014','465','563','2022-02-04'),
('00015','312','185','2022-02-04'),
('00016','123','185','2022-02-04');

insert into detalles_de_venta
values
('10234312',1,'00001','342972',2,15,30,10),
('10434672',2,'00001','345012',1,135,135,9),
('12354256',3,'00001','345013',1,135,135,9),
('73099338',1,'00002','343030',1,15,15,24),
('54380508',2,'00002','349913',2,34,68,14),
('19639559',1,'00003','347011',2,15,30,10),
('44986564',1,'00004','348011',1,77,77,9),
('68134448',2,'00004','346011',2,65,130,14),
('21789064',3,'00004','345014',3,135,405,7),
('18529719',4,'00004','342972',2,15,30,8),
('34340444',1,'00005','342972',1,15,15,7),
('84890681',1,'00006','345013',2,135,270,7),
('11843212',1,'00007','343030',3,15,45,21),
('11422794',2,'00007','346011',1,60,60,13),
('67902835',1,'00008','342947',2,36,72,18),
('99801804',2,'00008','342948',2,36,72,18),
('16252841',1,'00009','342972',3,15,45,4),
('74404050',1,'00010','344032',4,55,220,10),
('43822977',1,'00011','342972',1,15,15,3),
('63988326',1,'00012','345012',1,135,135,8),
('40258510',1,'00013','343030',2,15,30,19),
('38166298',1,'00014','342972',3,15,45,0),
('53290433',1,'00015','342947',2,36,72,16),
('61173069',2,'00015','347011',3,15,45,7),
('61174069',3,'00015','349914',2,34,68,14),
('62173069',4,'00015','343030',1,15,15,18);

