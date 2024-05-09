use jardineria;

--Devuelve un listado con el codigo de oficina y la ciudad donde hay oficinas.


SELECT * FROM oficina;
SELECT codigo_oficina as codigo, ciudad
FROM oficina;

--Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

SELECT ciudad, telefono, pais  FROM oficina WHERE  pais = 'España';


--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

SELECT * FROM empleado;
SELECT nombre, apellido1, apellido2, email, codigo_jefe  FROM empleado WHERE codigo_jefe = 7;

--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT puesto, nombre, apellido1, apellido2, email FROM empleado WHERE puesto = 'Director General' 


--Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

SELECT nombre, apellido1, apellido2, puesto FROM empleado WHERE puesto != 'Representante Ventas'


--Devuelve un listado con el nombre de los todos los clientes españoles.

SELECT * FROM cliente;	
SELECT nombre_cliente FROM cliente WHERE pais = 'Spain'


--Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT * FROM pedido;

SELECT estado from pedido;

Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
















--Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
--Utilizando la función DATEDIFF de MySQL.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido
WHERE DATEDIFF(fecha_entrega, fecha_esperada) >=2; 




--Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT * from gama_producto ;
-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente. ###  ###
SELECT DISTINCT  g.gama from cliente as c join pedido as p ON c.id_codigo_cliente
= p.id_codigo_cliente JOIN detalle_pedido as dp
on p.id_codigo_pedido = dp.id_codigo_pedido JOIN producto as p2
on p2.id_codigo_producto = dp.id_codigo_producto JOIN gama_producto as gp on gp.gama = p2.id_gama