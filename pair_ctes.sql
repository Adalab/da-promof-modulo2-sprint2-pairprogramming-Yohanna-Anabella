USE Northwind;

--1.Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
--el id del cliente y el nombre de la compañia de la tabla Customers.

WITH tabla_clientes AS (
SELECT customer_id, company_name
FROM customers)

SELECT c.customer_id, c.company_name  FROM  customers AS c;

--2.Selecciona solo los de que vengan de "Germany".

WITH tabla_clientes_paises AS (
SELECT customer_id, company_name, country
FROM customers 
WHERE country = 'Germany')

SELECT customer_id, company_name, country FROM tabla_clientes_paises;

--3.Extraed el id de las facturas y su fecha de cada cliente.
--En este caso queremos extraer todas las facturas que se han emitido a un cliente, 
--su fecha la compañia a la que pertenece.

WITH facturas_clientes AS (
SELECT customer_id , company_name, order_id, order_date 
FROM orders
INNER JOIN customers 
USING (customer_id)
ORDER BY customer_id)

SELECT customer_id , company_name, order_id, order_date FROM facturas_clientes; 

--4.Contad el número de facturas por cliente

WITH facturas_por_clientes AS(

SELECT customer_id , company_name, COUNT(order_id) 
FROM orders
INNER JOIN customers 
USING (customer_id)
GROUP BY customer_id 
ORDER BY customer_id)

SELECT customer_id , company_name, order_id FROM facturas_por_clientes;


--5.Cuál la cantidad media pedida de todos los productos ProductID.
--Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.

WITH promedio_por_productos AS (

SELECT product_id, SUM(quantity) AS suma_productos, product_name
FROM order_details 
INNER JOIN products 
USING (product_id)
GROUP BY product_id)


SELECT product_name, AVG(suma_productos) FROM promedio_por_productos; 
















