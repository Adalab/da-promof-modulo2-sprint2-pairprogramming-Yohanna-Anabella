USE Northwind;

SELECT  'Hola!'  AS tipo_nombre
FROM customers; --columna temporal

1.compañias que están afincadas en ciudades que empiezan por "A" o "B",evolvamos la ciudad, el nombre de la compañia y el nombre de 
contacto.

SELECT c.company_name, c.contact_name, c.city
FROM customers AS c
WHERE city LIKE 'A%' OR city LIKE 'B%';

2.Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT c.company_name, c.contact_name, c.city, SUM(o.order_id)  --ME FALTA SUMAR CANTIDAD DE PEDIDOS
FROM customers c INNER JOIN orders o
GROUP BY c.company_name, c.contact_name, c.city,o.order_id
HAVING city LIKE 'L%';

3.Todos los clientes cuyo "contact_title" no incluya "Sales",Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.

SELECT c.contact_name, c.contact_title, c.company_name
FROM customers c 
WHERE contact_title NOT LIKE 'Sales%'


4.Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.

SELECT c.contact_name 
FROM customers c 
WHERE contact_name NOT LIKE '_a';










