/* SELECT column FROM table; */
SELECT * FROM film;
SELECT * FROM actor;
SELECT first_name FROM actor;

/* Check: Find customer emails */
SELECT first_name, last_name, email FROM customer;

/* SELECT DISTINCT column FROM * (duplicate values) */
SELECT * FROM actor ORDER BY first_name;
SELECT DISTINCT first_name FROM actor ORDER BY first_name;

/* Parenthesis are optional */
SELECT DISTINCT(release_year) FROM film;
SELECT DISTINCT(rental_rate) FROM film;

/* Test: SELECT DISTINCT */
SELECT DISTINCT rating FROM film;

/* COUNT (the number of rows in a table,
paranthesis are required) */
SELECT COUNT(*) FROM payment;
SELECT COUNT(DISTINCT(amount)) FROM payment;

/* WHERE column .. condition.. */
SELECT COUNT(amount) FROM payment WHERE amount=6.99;
SELECT * FROM customer WHERE first_name='Jerry';
SELECT * FROM film WHERE replacement_cost > 29 AND rental_rate >= 4;
SELECT email FROM customer WHERE first_name='Nancy' AND last_name='Thomas'; 
SELECT description FROM film WHERE title='Outlaw Hanky';
SELECT phone FROM address WHERE address = '259 Ipoh Drive';

/* ORDER BY (column1, column2)*/
SELECT * FROM customer ORDER BY first_name DESC;
SELECT * FROM customer ORDER BY store_id, first_name;

/* LIMIT */
SELECT * FROM payment 
WHERE amount != 0.00
ORDER BY payment_date DESC 
LIMIT 5;

/* Test: (lenght is also a SQL keywords) */
SELECT customer_ID FROM payment
WHERE amount > 0
ORDER BY payment_date ASC
LIMIT 10; 

SELECT title, length FROM film 
ORDER BY length ASC
LIMIT 5; 

SELECT COUNT(*) FROM film
WHERE length <= 50;

/* BETWEEN AND (dates ISO 8601) */
SELECT * FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-16';  

/* IN (rather than OR operator) */
SELECT * FROM payment
WHERE amount NOT IN (.99,1.98,1.99)
ORDER BY amount;

/* LIKE case sensitive, ILIKE case insensitive */
SELECT * FROM customer
WHERE first_name LIKE 'A%';

SELECT * FROM customer
WHERE first_name LIKE 'A__';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'A__';

SELECT * FROM customer
WHERE first_name NOT ILIKE '_a%';

SELECT COUNT(*) FROM payment
WHERE amount >= 5;

/* 
-------------------------
End of section challenge 
-------------------------
*/
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT(district)) FROM address;

SELECT DISTINCT(district) FROM address;

SELECT COUNT(*) FROM film 
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 and 15;

SELECT COUNT(*) FROM film 
WHERE title LIKE '%Truman';