--1. mostrar los detalles de venta
select
    *
from
    detalles_de_venta
;
--2. mostrar los nombres de los vendedores y cuantas veces vendieron
select
    e.nombre,v.id_vendedor,count(*) as total
from
    venta v
inner join vendedor e using (id_vendedor)
group by id_vendedor;
--3. mostrar el vendedor que vendio mas
select
    e.nombre,v.id_vendedor,count(*) as total
from
    venta v
inner join vendedor e using (id_vendedor)
group by id_vendedor
having total=(select max(total) from (select
    e.nombre,v.id_vendedor,count(*) as total
from
    venta v
inner join vendedor e using (id_vendedor)
group by id_vendedor)as con);

--4. cuanto gasto el cliente 312 en el mes de febrero
select
    v.id_cliente, sum(d.precio) as gasto_mensual
from
    venta v
inner join 
    detalles_de_venta d using(id_venta)
where
    id_cliente=312;
--5. promedio de cantidad de productos
select
    round(avg(existencia)) as promedio_productos
from
    producto
;
--6. seleccionar el producto o productos con menor cantidad de productos
select
    *
from 
    producto
group by id_producto
having existencia=(select min(existencia)from producto)
order by nombreprod
;
--7. proveedores que no trajeron productos
select
    p.nombre_proveedor
from
    proveedor p
where id_proveedor not in(select id_proveedor from entrada);
--8.proveedores que trajeron productos
select
    p.nombre_proveedor
from
    proveedor p
where id_proveedor in(select id_proveedor from entrada);
--9. mostrar el vendedor con mayor sueldo
select
    *
from 
    vendedor
where
    sueldo=(select max(sueldo)from vendedor);
--10. mostrar el vendedor con menor sueldo
select
    *
from 
    vendedor
where
    sueldo=(select min(sueldo)from vendedor);
--11. mostrar los productos agotados
select
    p.nombreprod,d.existencia
from detalles_de_venta d
inner join producto p using(id_producto)
where
d.existencia=0;
--12. el producto mas vendido
select
    p.nombreprod,count(d.existencia) as total
from detalles_de_venta d
inner join producto p using(id_producto)
group by id_producto
having total=(select max(total) from(select
    p.nombreprod,count(d.existencia) as total
from detalles_de_venta d
inner join producto p using(id_producto)
group by id_producto)as con);
--13. entradas del dia 2022-01-22
select
    *
from
    entrada
where
    fecha_entrega='2022-01-22';
--14. provedores que visitan el dia lunes
select
    *
from
    proveedor
where
    visita='lunes';
--15.nombre del proveedor con el numero 81273623
select
    nombre_proveedor
from
    proveedor
where
    numero_tel=81273623;
--16. provedores que visitan el dia miercoles
select
    *
from
    proveedor
where
    visita='miercoles';
--17. sueldo del vendedor Mario Martinez
select 
    nombre,sueldo
 from
    vendedor
where 
    nombre='Mario' && apellido='Martinez';
--18. seleccionar el producto mas caro precio_de_compra
select 
    *
from 
    producto
where
precio_de_compra=(select max(precio_de_compra)from producto);
--19. seleccionar el producto o los productos con mayor ganancia
select
    *
from
    producto
where
ganancia=(select max(ganancia)from producto);
--20. ventas realizadas el 2022-02-01
select
    * 
from  
    venta
where
    fecha='2022-02-01';
--21.cliente con mas compras
select
    c.nombre,count(v.id_cliente) as total
from
    venta v
inner join cliente c using(id_cliente)
group by id_cliente
having total=(select max(total)from(select
    c.nombre,count(v.id_cliente) as total
from
    venta v
inner join cliente c using(id_cliente)
group by id_cliente)as con);

--22. total recaudado vendido
select
    sum(precio) as total
from
    detalles_de_venta;
--23. cantidad de productos vendidos
select
    sum(cantidad_vendida) as total
from
    detalles_de_venta;
--24. cliente o clientes con apellido castro
select
    *
from
    cliente
where
    apellido='castro';
--25. id de elena munguia
select
    id_cliente
from
    cliente
where
    nombre='Elena' && apellido='Munguia';
--26. numero telefonico de deliqueso
select
    nombre_proveedor,numero_tel
from 
    proveedor;
--27. entrada del 2022-01-25
select
    * 
from  
    entrada
where
    fecha_entrega='2022-01-25';
--28. seleccionar los productos comestibles
select
    *
from    
    producto
where
    tipo=comestible;
--29. trabajadores con un sueldo mayor a 4000
select
    *
from    
    vendedor
where
    sueldo>4000;
--30. sueldo de Marcio Balladares
select
    sueldo,nombre,apellido
from
    vendedor
where nombre='Marcio'&&apellido='Balladares';