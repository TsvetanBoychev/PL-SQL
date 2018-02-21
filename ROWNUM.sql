CREATE TABLE customers
( customer_id number(10) NOT NULL,
  last_name varchar2(50) NOT NULL,
  first_name varchar2(50) NOT NULL,
  favorite_website varchar2(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id))
  
  INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(4000,'Jackson','Joe','www.techonthenet.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(5000,'Smith','Jane','www.digminecraft.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(6000,'Ferguson','Samantha','www.bigactivities.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(7000,'Reynolds','Allen','www.checkyourmath.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(8000,'Anderson','Paige',NULL);

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(9000,'Johnson','Derek','www.techonthenet.com');

select * from CUSTOMERS;


SELECT ROWNUM, customers.*
FROM customers
WHERE customer_id > 4500;


SELECT ROWNUM, customers.*
FROM customers
WHERE customer_id > 4500
ORDER BY last_name;


SELECT ROWNUM, n.*
FROM (SELECT customers.*
      FROM customers
      WHERE customer_id > 4500
      ORDER BY last_name) n;

