USE Northwind;

--"Ejercicio 1"
SELECT MIN(unit_price) AS lowestPrice,MAX(unit_price) AS highestPrice
FROM products;

--"Ejercicio 2"--
SELECT COUNT(quantity_per_unit) AS cantidad, AVG(unit_price)
 FROM products;  
 
--"Ejercicio 3"--
SELECT MAX(freight) AS Maxima, MIN(freight) AS Minimo
  FROM orders
  WHERE ship_country = "UK";

 --" Ejercicio 4"--
SELECT AVG(unit_price) AS precio_medio
  FROM products; 

 --"Ejercicio 5"--
SELECT unit_price, product_name,
CASE
  	WHEN unit_price > 28.86 THEN 'precio_alto'
  	WHEN unit_price < 28.86 THEN 'precio_bajo'
  	END AS valor_productos 
FROM products;  
--"Falta ordenar"--

--"Ejercicio 6"--
SELECT discontinued, 
  CASE 
  	WHEN discontinued = 1 THEN 'discontinuado'
  END AS producto_disc
  FROM products;  

--"Ejercicio 7"--
 SELECT product_id, product_name,
   CASE
   	WHEN discontinued = 0 THEN 'No discontinuado'
   END AS ProductosNoDiscontinuados
   
   FROM products
   LIMIT 10;  


--"Ejercicio 8"--
SELECT employee_id, COUNT(order_id), MAX(freight)
  FROM orders
  GROUP BY employee_id;

--"Ejercicio 9"--
SELECT employee_id, COUNT(order_id), MAX(freight)
FROM orders
 WHERE shipped_date <> 0000-00-00
 GROUP BY employee_id;


SELECT 

 


 


   

