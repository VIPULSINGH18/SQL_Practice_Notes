CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category TEXT,
  price NUMERIC(10,2),
  stock_quantity INT,
  is_available BOOLEAN,
  added_on DATE
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  product_id INT,
  quantity INT,
  order_date DATE,
  customer_name VARCHAR(50),
  payment_method VARCHAR(50),
  CONSTRAINT fk_product FOREIGN KEY (product_id) /*build the connection between both the table using primary and foreign key */
  REFERENCES products(product_id) ON DELETE CASCADE
);
SELECT * FROM products
SELECT * FROM orders



							/* TEST:3 */
/*Q1*/
/*showing every order along with proudct_name and price*/

SELECT o.order_id,o.customer_name,o.payment_method,p.product_name,p.price FROM products p
RIGHT JOIN orders o
ON p.product_id = o.product_id;


/*Q2*/
/*showing all product details whether it is ordered or not*/

SELECT * FROM products p
LEFT JOIN orders o
ON o.product_id = p.product_id;


/*q3*/
/*showing order for only 'Electronic' category*/

SELECT p.category,p.product_name,o.order_id,o.quantity,o.order_date,o.customer_name,o.payment_method FROM products p
JOIN orders o
ON o.product_id= p.product_id
WHERE category='Electronics'


/*q4*/
/*Showing all orders sorted by price from high to low*/

SELECT p.price,p.product_name,o.order_id,o.quantity,o.order_date,o.customer_name,o.payment_method FROM products p
JOIN orders o
ON o.product_id= p.product_id
ORDER BY price DESC;


/*Q5*/
/*showing number of orders placed for each product*/

SELECT p.product_name,count(o.order_id)AS order_freq FROM products p
LEFT JOIN orders o
ON o.product_id=p.product_id
GROUP BY p.product_name;



/*q6*/
/*Showing revenue of each product*/


SELECT p.product_name,SUM(o.quantity*p.price) AS total_revenue FROM products p
JOIN orders o
ON o.product_id= p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


/*q7*/
/*Showing products with revenue >2000*/

SELECT p.product_name,SUM(o.quantity*p.price) AS total_revenue FROM products p
JOIN orders o
ON o.product_id= p.product_id
GROUP BY p.product_name
HAVING SUM(o.quantity*p.price)>2000
ORDER BY total_revenue DESC;


/*q8*/
 
SELECT DISTINCT o.customer_name,p.category FROM orders o
JOIN products p
ON o.product_id=p.product_id
WHERE category='Fitness';


/*..............................*/

