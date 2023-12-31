USE Northwind;

#1.Extraed los pedidos con el máximo "order_date" para cada empleado.
#fecha de los pedidos más recientes que ha gestionado cada empleado
#--order_id, customer_id, employee_id, order_date, required_date

select * from employees;
select * from orders;

SELECT order_id, customer_id, employee_id, order_date
FROM orders o
WHERE order_date = (
    SELECT MAX(order_date)
    FROM orders
    WHERE employee_id = o.employee_id);


#2.Extraed el precio unitario máximo (unit_price) de cada producto vendido.
#informe de los productos vendidos y su precio unitario.

SELECT product_id, MAX(unit_price) AS precio_unitario_maximo
FROM products p
WHERE unit_price = (
    SELECT MAX(unit_price)
    FROM products f
    WHERE p.product_id = f.product_id
)
GROUP BY product_id;



#--3.Extraed información de los productos "Beverages"
#--ID del producto, el nombre del producto y su ID de categoría.
#--usar tabla categories extraer category name, productos

SELECT product_id, product_name, category_id
FROM products
WHERE category_id = (SELECT category_id 
FROM categories 
WHERE category_name = 'Beverages');


#--4.Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
#--paises donde buscar proveedores

select * from customers c;
select * from suppliers ;

SELECT DISTINCT c.country
FROM customers c
LEFT JOIN suppliers s ON c.country = s.country
WHERE s.country IS NULL;


5.Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"(es un producto)
Extraed el OrderId y el nombre del cliente
tabla productos, product_name, units_on_order, tabla cutmers

SELECT order_id, customer_id FROM orders 

SELECT order_ir, product_id FROM order_details 


6.Extraed los 10 productos más caros
saber cuáles son los 10 productos más caros.
SELECT * 
FROM (SELECT product_name AS 'Diez productos mas caros' , MAX(unit_price)
FROM products 
GROUP BY product_name 
ORDER BY MAX(unit_price) DESC)
AS a 
LIMIT 10 ;
