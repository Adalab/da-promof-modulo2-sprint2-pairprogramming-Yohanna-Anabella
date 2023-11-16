USE Northwind;

#1--cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.--

SELECT customers.customer_id ,customers.company_name,COUNT(orders.order_id) AS pedidos_por_compania
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.customer_id, customers.company_name ;


#2--Productos pedidos por empresa en UK por año.
#--query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año
#--concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos

SELECT c.company_name AS nombre_empresa, 
       YEAR(o.order_date) AS año,
       SUM(d.quantity) AS cantidad_objetos_pedidos
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details d ON o.order_id = d.order_id
WHERE c.country = 'UK'
GROUP BY c.company_name, YEAR(o.order_date)
ORDER BY nombre_empresa, año;


#3.--cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos

SELECT c.company_name AS nombre_empresa,
       YEAR(o.order_date) AS año,
       SUM(d.quantity) AS cantidad_objetos_pedidos,
       SUM(d.unit_price * d.quantity * (1 - d.discount)) AS monto_total_con_descuento
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details d ON o.order_id = d.order_id
WHERE c.country = 'UK'
GROUP BY c.company_name, YEAR(o.order_date)
ORDER BY nombre_empresa, año;


#--6.Qué empresas tenemos en la BBDD Northwind:
#nombre de todas las empresas cliente, los ID de sus pedidos y las fechas.

SELECT customers.company_name, orders.order_id , orders.order_date 
FROM customers
INNER JOIN orders 

#--7.Pedidos por cliente de UK:
#--nos solicitan información acerca del número de pedidos que ha realizado cada cliente del propio Reino Unido
#--nombre de cada compañía cliente junto con el número de pedidos.

SELECT customers.company_name, SUM(order_details.quantity), customers.country 
FROM customers INNER JOIN order_details 
GROUP BY customers.company_name, order_details.quantity, customers.country 
HAVING customers.country = 'UK'

#--8.Empresas de UK y sus pedidos,obtengamos todos los nombres de las empresas,los ID de todos los pedidos que han realizado y la fecha del pedido.

SELECT customers.company_name, orders.order_id, orders.order_date 
FROM customers 
INNER JOIN orders;

#9.Empleadas que sean de la misma ciudad:,la ubicación, nombre, y apellido tanto de las empleadas como de las jefas





