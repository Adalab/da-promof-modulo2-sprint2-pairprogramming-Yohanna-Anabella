USE Northwind;

SELECT  'Hola!'  AS tipo_nombre
FROM customers; #--columna temporal

#1.compañias que están afincadas en ciudades que empiezan por "A" o "B",evolvamos la ciudad, el nombre de la compañia y el nombre de 
#contacto.

SELECT c.company_name, c.contact_name, c.city
FROM customers AS c
WHERE city LIKE 'A%' OR city LIKE 'B%';

#2.Número de pedidos que han hecho en las ciudades que empiezan con L.
SELECT c.company_name, c.contact_name, c.city, COUNT(o.order_id) AS cantidad_pedidos
FROM customers c
INNER JOIN orders o USING (customer_id)
WHERE c.city LIKE 'L%'
GROUP BY c.company_name, c.contact_name, c.city;



#3.Todos los clientes cuyo "contact_title" no incluya "Sales",Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.

SELECT c.contact_name, c.contact_title, c.company_name
FROM customers c 
WHERE contact_title NOT LIKE 'Sales%'


#4.Todos los clientes que no tengan una "A" en segunda posición en su nombre.
#Devolved unicamente el nombre de contacto.

SELECT c.contact_name 
FROM customers c 
WHERE contact_name NOT LIKE '_a';


#5. Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT company_name AS nombre_empresa, city AS ciudad, contact_name AS nombre_contacto, 'Cliente' AS Relationship
FROM customers
GROUP BY company_name, city, contact_name

UNION

SELECT company_name, city, contact_name, 'Proveedor'
FROM suppliers
GROUP BY company_name, city, contact_name;

#6 
SELECT *
FROM categories
WHERE description LIKE '%sweet%' OR description LIKE '%Sweet%';

#7
-- Para clientes??


-- Para empleados
SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo
FROM employees;












