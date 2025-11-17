CREATE TABLE Flipkart(
Product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100) UNIQUE NOT NULL,
sku_code CHAR(8) UNIQUE NOT NULL,
Price NUMERIC(10,2) CHECK(price>=0),
Stock_quantity INTEGER CHECK(stock_quantity>0),
is_available BOOLEAN DEFAULT TRUE,
Category VARCHAR(50) NOT NULL,
Added_on DATE DEFAULT current_date,
Lat_update TIMESTAMP DEFAULT now()
);

INSERT INTO FLIPKART(product_name,sku_code,price,Stock_quantity,is_available,Category)
VALUES('Wireless Mouse', 'WM123456', 699.99, 50, TRUE, 'Electronics'),
	  ('Bluetooth Speaker', 'BS234567', 1499.00, 30, TRUE, 'Electronics'),
	  ('Laptop Stand', 'LS345678', 799.50, 20, TRUE, 'Accessories'),
	  ('USB-C Hub', 'UC456789', 1299.99, 15, TRUE, 'Accessories'),
	  ('Notebook', 'NB567890', 99.99, 100, TRUE, 'Stationery'),
	  ('Pen Set', 'PS678901', 199.00, 200, TRUE, 'Stationery'),
	  ('Coffee Mug', 'CM789012', 299.00, 75, TRUE, 'Home & Kitchen'),
	  ('LED Desk Lamp', 'DL890123', 899.00, 40, TRUE, 'Home & Kitchen'),
	  ('Yoga Mat', 'YM901234', 499.00, 25, TRUE, 'Fitness'),
	  ('Water Bottle', 'WB012345', 349.00, 60, TRUE, 'Fitness');

SELECT * FROM FLIPKART;


/* using clauses*/            /*TEST:1...*/

/*Q1)*/
SELECT product_name ,price FROM FLIPKART;

/*Q2*/
SELECT product_name FROM FLIPKART
WHERE category='Electronics';

/*Q3*/
SELECT Category FROM FLIPKART
GROUP BY Category;

/*Q4*/
SELECT Category,count(*) FROM FLIPKART
GROUP BY Category
HAVING count(*)>1

/*q5*/
SELECT * FROM FLIPKART
ORDER BY price ASC;

/*Q6*/
SELECT * FROM FLIPKART
LIMIT 3

/*Q7*/
SELECT product_name AS item_name , PRICE AS item_price FROM FLIPKART

/*q8*/

SELECT DISTINCT Category FROM FLIPKART

/*....................................*/



/* using logical , relational, set , like operators*/

SELECT * FROM FLIPKART
WHERE category= 'Accessories' AND stock_quantity>15


/*it will print all the category except accessories*/
SELECT * FROM FLIPKART
WHERE category!='Accessories'

/*when we have to print multiple categories data*/
/*Using OR operator*/
SELECT * FROM FLIPKART
WHERE category='Electronics'OR category='Stationery'OR category='Fitness'

/*Using SET*/
SELECT * FROM FLIPKART
WHERE category IN ('Electronics','Stationery','Fitness')

/*Using LIKE operator*/

SELECT * FROM FLIPKART
WHERE sku_code LIKE 'Y%' /*word starting from Y*/

SELECT * FROM FLIPKART
WHERE sku_code LIKE '%90%'; /*code in which we have 90 as a number*/

SELECT * FROM FLIPKART
WHERE sku_code LIKE '_M%' /*code in which second letter is M*/

/*...........................*/


/*Aggregation Functions(sum,count,average,min,max) */ 

/* sum of stock quantity of all products name*/

SELECT SUM(stock_quantity) FROM FLIPKART

/*sum of prices of products of category electronics and fitness*/

SELECT SUM(price) FROM FLIPKART
WHERE category IN ('Electronics','Fitness')

/*finding the count products in our table*/
SELECT count(product_name) FROM FLIPKART

/*average*/
SELECT AVG(price) FROM FLIPKART

/*Minimum price*/
SELECT MIN(price) FROM FLIPKART

/*Maximum price*/
SELECT MAX(price) FROM FLIPKART


/*.................................*/

									/*TEST:2...*/
/*Q1*/
SELECT product_name,price FROM FLIPKART
WHERE price= (SELECT MIN(price) FROM FLIPKART);  /*using subquery concept*/

/*Q2*/
SELECT ROUND(AVG(price),2) FROM FLIPKART 
WHERE category IN ('Home & Kitchen','Fitness')

/*Q3*/
SELECT product_name,stock_quantity FROM FLIPKART
WHERE stock_quantity>50 AND price!=299.00;

/*Q4*/
SELECT product_name,price AS max_price FROM FLIPKART
WHERE price IN(1499.00,1299.99,199.00,899.00,499.00);

SELECT product_name,price AS max_price,category FROM FLIPKART
WHERE price IN(1499.00,1299.99,199.00,899.00,499.00);

SELECT MAX(price) AS max_price,category FROM FLIPKART
GROUP BY category;

/*Q5*/
SELECT DISTINCT UPPER (category) AS upper_catg  FROM FLIPKART
ORDER BY upper_catg DESC;


/*..................................*/


/* string functions(upper,lower,substr,length,left,right,concat,replace,trim*/

SELECT length(sku_code) FROM FLIPKART

SELECT SUBSTR(product_name,1,5) FROM FLIPKART  /* first parameter tells from where word has to begin and second parameter tells how many words we have to extract...*/

SELECT LEFT(sku_code,5) FROM FLIPKART /*extract words from the left side upto 5 characters*/
SELECT RIGHT(sku_code,3) FROM FLIPKART /* extract words from the right side upto 3 characters*/

SELECT concat(product_name,' ',category) AS product_with_category FROM FLIPKART /* concat function is used when we have to combine the data of two or more than two columns*/

SELECT TRIM('   hello23  '); /*trim command is used to remove the extra spaces from our data*/

SELECT REPLACE(sku_code,LEFT(sku_code,2),'GG') FROM FLIPKART /*It replaces the specific part of our data with provided data*/ 



/*.....................................*/


/*Alter command is used to modify our table by adding and removing column,renaming the table name, change the constraint, change the data type of our table*/




/*.....................................*/



/* Cases in SQL*/

SELECT product_name,price,
CASE WHEN (price>1000) THEN 'Expensive'
	 WHEN  price BETWEEN 500 AND 1000 THEN 'Moderate'
	 ELSE 'Cheap' 
END AS price_tag FROM FLIPKART;



/* now if we have to add new column price tag in our table then we will use alter command and cases together....*/

ALTER TABLE FLIPKART
ADD COLUMN price_tag TEXT;  /*new column added with null values... now we have to update this using cases*/
UPDATE FLIPKART
SET price_tag=
CASE WHEN (price>1000) THEN 'Expensive'
	 WHEN  price BETWEEN 500 AND 1000 THEN 'Moderate'
	 ELSE 'Cheap' 
END ;

SELECT * FROM FLIPKART

/*.....................................*/


											/*Task 1*/
/*only using cases*/ 											
SELECT product_name,stock_quantity,
CASE WHEN stock_quantity>100 THEN 'High Stock'
	 WHEN stock_quantity BETWEEN 30 AND 100 THEN 'Medium Stock'
	 ELSE 'Low Stock'
END AS label FROM FLIPKART


/* using alter command and cases both*/
ALTER TABLE FLIPKART
ADD COLUMN label VARCHAR(50)

UPDATE FLIPKART
SET label=
CASE WHEN stock_quantity>100 THEN 'High Stock'
	 WHEN stock_quantity BETWEEN 30 AND 100 THEN 'Medium Stock'
	 ELSE 'Low Stock'
END ;

SELECT * FROM FLIPKART

/*.....................................*/



									/*VIEWS*/
/*FITNESS_PRODUCTS*/
CREATE VIEW available_fitness_products AS
SELECT product_id, product_name, price, stock_quantity
FROM FLIPKART
WHERE category = 'Fitness' AND is_available = TRUE;


/*low_stock_products*/
CREATE VIEW low_stock_products AS
SELECT product_name, category, stock_quantity
FROM FLIPKART
WHERE stock_quantity < 30;

/****************************************/


									/*Procedures*/
/*syntax for proceedures*/

CREATE PROCEDURE procedure_name(param1,param2,param3) /*function initialised*/ 
LANGUAGE plpgsql
AS
$$
BEGIN
		/*function definition*/
END;
$$;

/****************************************/


/*adding product inside the table procesure*/

CREATE PROCEDURE add_product(
    p_name VARCHAR,
    p_sku CHAR(8),
    p_price NUMERIC,
    p_qty INT,
    p_category TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products(name, sku_code, price, stock_quantity, category)
    VALUES (p_name, p_sku, p_price, p_qty, p_category);

    RAISE NOTICE 'Product added successfully!';
END;
$$;


/****************************************/



