USE Northwind;

#"Ejercicio 1"
SELECT MIN(unit_price) AS lowestPrice,MAX(unit_price) AS highestPrice
FROM products;

#"Ejercicio 2"
SELECT COUNT(quantity_per_unit) AS cantidad, AVG(unit_price)
 FROM products;  
 
#"Ejercicio 3"
SELECT MAX(freight) AS Maxima, MIN(freight) AS Minimo
  FROM orders
  WHERE ship_country = "UK";

 #--" Ejercicio 4"--
SELECT AVG(unit_price) AS precio_medio
FROM products;

SELECT product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;


 #--"Ejercicio 5"--??
SELECT unit_price, product_name,
CASE
  	WHEN unit_price > 28.86 THEN 'precio_alto'
  	WHEN unit_price < 28.86 THEN 'precio_bajo'
  	END AS valor_productos 
FROM products;  
#--"Falta ordenar"--

#"Ejercicio 5"
SELECT discontinued, 
  CASE 
  	WHEN discontinued = 1 THEN 'discontinuado'
  END AS producto_disc
  FROM products;  

#"Ejercicio 6"
 SELECT product_id, product_name,
   CASE
   	WHEN discontinued = 0 THEN 'No discontinuado'
   END AS ProductosNoDiscontinuados
   
   FROM products
   LIMIT 10;  


#"Ejercicio 7"
SELECT employee_id, COUNT(order_id), MAX(freight)
  FROM orders
  GROUP BY employee_id;

#"Ejercicio 8"
SELECT employee_id, COUNT(order_id), MAX(freight)
FROM orders
 WHERE shipped_date <> 0000-00-00
 GROUP BY employee_id;
 
#Ejercicio 9

SELECT 
    DAY(order_date) AS dia,
    MONTH(order_date) AS mes,
    YEAR(order_date) AS ano,
    COUNT(*) AS cantidad_pedidos
FROM orders
GROUP BY dia, mes, ano
ORDER BY ano, mes, dia;


#Ejercicio 10
SELECT 
    MONTH(order_date) AS mes,
    YEAR(order_date) AS ano,
    COUNT(*) AS cantidad_pedidos
FROM orders
GROUP BY mes, ano
ORDER BY ano, mes;


#Ejercicio 11
SELECT
    city,
    COUNT(*) AS cantidad_empleados
FROM employees
GROUP BY city
HAVING COUNT(*) >= 4;


#Ejercicio12
SELECT
    *,
    CASE
        WHEN total_amount > 2000 THEN 'Alto'
        ELSE 'Bajo'
    END AS categoria_monto
FROM orders;


 


 


   

