/*
1. Filter results with WHERE
2.Sort results with ORDER BY
3.Transform results with String Function
4.Change result titles with Alias
5.Filter results based on DATE
6.Aggregate results with GROUP BY and NUMERIC FUNCTIONS
7.Find unique values with DISTINCT
8.Merge rows with GROUP BY and String Functions
9.RANK results with RANK and ROW NUMBER

*/
select * from payment;

USE sakila;



show tables;

/* 1.Filter results with WHERE  */

SELECT * from actor;
/*select first_name from actor;*/ 

/* Single Condition */
SELECT *
FROM actor
WHERE first_name = "PENELOPE";

Select * 
from actor
WHERE first_name<>'PENELOPE';

/*Multiple Condition*/

SELECT * 
FROM actor
WHERE first_name = 'PENELOPE' AND last_name = "MONROE";

select *
from actor
WHERE first_name='PENELOPE' OR last_name='MONROE';

SELECT *
FROM actor
WHERE first_name = 'PENELOPE' AND actor_id > 10;

Select * 
from actor
WHERE first_name='PENELOPE' OR 'JOHN'; /*(This is wrong)*/

Select * 
from actor
WHERE first_name='PENELOPE' OR first_name = 'JOHN';/*(This is correct we have to specify the column)*/

/* What do you think goes wrong in the below query */

Select *
from actor
WHERE first_name='PENELOPE' OR first_name='JOHN' AND actor_id>10;/*AND & OR operator cannot be used together cause AND operator takes predecession over OR operator*/


Select *
from actor
WHERE (first_name='PENELOPE' OR first_name='JOHN') AND actor_id>10;/*This is correct*/

SELECT *
FROM actor
WHERE first_name IN ('PENELOPE','JOHN') AND actor_id > 10;
/* WHERE first_name = "PENELOPE" OR first_name = "JOHN"
Select *
from actor
WHERE first_name NOT IN ('PENELOPE','JOHN') AND actor_id>10;

/*LIKE and wildcards*/
SELECT *
FROM actor
WHERE first_name LIKE 'JOHN%';

Select *
from actor
WHERE first_name like '%y';

Select *
from actor
WHERE first_name LIKE '%nn%';

Select *
from actor
WHERE first_name LIKE 'ag%';/*Nobody has ag in their first_name*/

/*....................2.Search results with ORDER BY.................*/
 Select * from actor
 ORDER BY first_name;

SELECT * 
FROM actor
WHERE first_name like '%NN%' OR first_name like '%NG%'
ORDER BY first_name DESC;

/* DESCENDING ORDER */
SELECT * 
FROM actor
WHERE first_name like '%NN%' OR first_name like '%NG%'
ORDER BY first_name DESC;

/* Write a query to show the top 20 first and last names from actor in descending order of first name */
SELECT first_name as 'FIRST NAME', last_name as 'LAST NAME'
FROM actor
ORDER BY first_name DESC
LIMIT 20;
/* .................. 3.Transform results with string Function ..........*/
/* LENGTH OF A STRING */
SELECT first_name,
CHAR_length(first_name) as LENGTH
FROM actor;

/* ADDITION OF STRINGS BY CONCATINATING */
SELECT first_name, last_name, CONCAT(first_name,' ', last_name) as FULLNAME
FROM actor;

/* Combining Functions together */

SELECT first_name, last_name, CONCAT(first_name,' ', last_name) AS FULLNAME,
LENGTH(CONCAT(first_name,' ',last_name)) AS LENGTH
from actor;

/* Find the longest name in the actor table */

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS FULLNAME,
LENGTH(CONCAT(first_name, ' ', last_name)) AS LENGTH_OF_FULLNAME
FROM actor
ORDER BY LENGTH_OF_FULLNAME DESC
LIMIT 2;


/* UPPER AND LOWER CASE */
SELECT first_name, last_name,
LOWER(first_name), UPPER(last_name)
from actor;

/* LEFT,RIGHT & SUBSTRING */
SELECT first_name, last_name, LEFT(first_name,3), RIGHT(first_name,3), substring(first_name, 2)
from actor;

/* Write a query to capitalize only first letter of the first name */
SELECT first_name, last_name, UPPER(LEFT(first_name,1)), LOWER(SUBSTRING(first_name,2)),
CONCAT(UPPER(LEFT(first_name,1)), LOWER(SUBSTRING(first_name,2)))
FROM actor;

/* TRIM */
SELECT first_name, CONCAT(CONCAT(first_name,'                   '),last_name),
CONCAT(TRIM(CONCAT(first_name,'                   ')),last_name)
from actor;

Select * from film_text;


SELECT description, TRIM(leading "A" from description)
from film_text;

Select description, TRIM(TRAILING 'a' from description)
from film_text;


/* LOCATE */
SELECT first_name, LOCATE('nn', first_name)
FROM actor;


/*.................. 4. Change result title with Alias ..............*/
Select first_name, last_name,
concat(first_name,' ',last_name) AS full_name,
length(concat(first_name,' ',last_name)) As length_of_name
from actor
ORDER BY length_of_name  DESC;

/* ................. 5. FILTER RESULTS BASED ON DATE ............*/ 


select * from actor;
Select *,
year(last_update),
month(last_update),
monthname(last_update),
day(last_update),
time(last_update),
date(last_update)
from actor;

SELECT * from actor
WHERE year(last_update)=2006;


/* .................. 6.Aggregate results with GROUP BY and NUMERIC function ..............*/
Select * from address limit 10 OFFSET 2;

SELECT count(*), count(address), count(address2)
FROM address;

SELECT district FROM address
GROUP BY district;

SELECT district, count(*) as count
FROM address
GROUP BY district
ORDER BY COUNT desc;

SELECT district, count(*) as COUNT
from address
WHERE district='WEST BENGALI'
ORDER BY count desc;


Select * from film;

Select rating from film
Group by rating
ORDER BY rating;

Select distinct rating /* It is slower in bigger data set */
from film;

Select release_year,
min(rental_duration),
max(rental_duration),
sum(rental_duration),
avg(rental_duration)
from film
group by release_year;

/*................... 7.Find unique values with distinct .........................*/
Select distinct rating
from film;

Select count( concat(first_name,' ',last_name))
from actor;

SELECT count(distinct CONCAT(first_name,' ', last_name))
FROM actor;

/* ORDER OF EXECUTION 
1. FROM INCLUDING JOINS
2.WHERE
3.GROUP BY
4.HAVING
5.SELECT
6.DISTINCT
7.UNION
8.ORDER BY
9.LIMIT AND OFFSET
*/

/*............ 8.Merge ROWS WITH GROUP BY AND STRING FUNCTION ...........*/
USE sakila;

select * from address
ORDER BY district;

SELECT district, GROUP_CONCAT(phone)
FROM address
GROUP BY district
ORDER BY district;



SELECT district, GROUP_CONCAT(phone
ORDER BY phone ASC SEPARATOR ';')
FROM address
GROUP BY district;

/*................... 9. RANK RESULTS WITH RANK AND ROW NUMBER .......................*/
Select * from film;

Select title,
rental_duration,
rental_rate,
(rental_duration * rental_rate) as rental_amount
from film;

SELECT title,
rental_duration,
RANK() OVER(ORDER BY rental_duration DESC) as rnk_
FROM film;

Select title,
rental_duration,
DENSE_RANK() OVER(ORDER BY rental_duration DESC) as rnk
from film;

Select title,
rental_duration,
ROW_NUMBER() OVER(ORDER BY rental_duration DESC) as rnk
from film;

Select * from film;

Select title,rating,rental_duration,
(rental_duration*rental_rate) As rental_amount,
ROW_NUMBER() OVER(PARTITION BY rating   ORDER BY (rental_duration*rental_rate) DESC) As rnk
from film;


Select title,rating,rental_duration,
(rental_duration*rental_rate) As rental_amount,
NTILE(5) OVER(PARTITION BY rating ORDER BY (rental_duration*rental_rate) DESC) As rnk /* This is not a ranking */
from film;

/* How to count number of tables in a database */
SELECT * FROM INFORMATION_SCHEMA.tables
WHERE table_schema='sakila';

SELECT count(*) As totalnumberoftables/*Third This will be executed */
From INFORMATION_SCHEMA.tables /* First This will be executed */
WHERE table_schema = 'sakila';/* Second This will be executed */



/*..............  1. MERGE DATA WITH JOIN - INNER,LEFT,RIGHT,CROSS .........................*/
SELECT * FROM customer;

SELECT * FROM address;
/* 
A LEFT JOIN B = A LEFT OUTER JOIN B
A RIGHT JOIN B = A RIGHT OUTER JOIN B
A FULL JOIN B = A FULL OUTER JOIN B
A INNER JOIN B = A JOIN 
*/
select * from actor;


/*INNER JOIN */
SELECT customer.first_name,customer.last_name,address.address,address.address_id,customer.address_id,address.district
FROM
     address 
     INNER JOIN
     customer 
     ON address.address_id = customer.address_id;
     
/* LEFT JOIN */
SELECT c.first_name,c.last_name,a.address,a.address_id,c.address_id,a.district
FROM
     address as a
     LEFT JOIN
     customer as c
     ON a.address_id = c.address_id;     
     
/* RIGHT JOIN */
SELECT c.first_name,c.last_name,a.address,a.address_id,c.address_id,a.district
FROM
     address as a
     RIGHT JOIN
     customer as c
     ON a.address_id = c.address_id;     
     
/*ONLY A(A + A intersect B - A intersect B)*/
SELECT c.first_name,c.last_name,a.address,a.address_id,c.address_id,a.district
FROM
     address as a
     LEFT JOIN
     customer as c
     ON a.address_id = c.address_id
     WHERE c.address_id is NULL;
          
/* CROSS JOIN */
SELECT * FROM address CROSS JOIN customer;          
     
SELECT count(*) from customer;
SELECT count(*) from address;

/* Combine rows with UNION */

SELECT * FROM actor LIMIT 50;
SELECT * FROM address LIMIT 50;

SELECT 'actor' AS tbl, DATE(last_update) FROM actor
UNION
SELECT 'address' AS tbl, DATE(last_update) FROM address;


/* UNION ALL */

SELECT 'actor' AS tbl, DATE(last_update) FROM actor
UNION ALL
SELECT 'address' AS tbl, DATE(last_update) FROM address;

SELECT * from customer;
SELECT * from rental;

SELECT a.first_name,a.last_name,b.*
FROM 
customer AS a
INNER JOIN
rental AS b
ON a.customer_id = b.customer_id
WHERE 
a.customer_id = 6;

select * from rental
ORDER BY customer_id;
SELECT * FROM customer
WHERE first_name LIKE "JEN%";


SELECT *
FROM rental
WHERE customer_id IN(SELECT customer_id
        FROM customer
        WHERE first_name = 'jennifer');
        
/* 4. SELECTING DATA USING SUB QUERIES */
SELECT title, 
	   rating, 
       (rental_duration * rental_rate) as rental_amount,     
       ROW_NUMBER() OVER(PARTITION BY rating ORDER BY(rental_duration * rental_rate) DESC) AS rnk
FROM film;     

SELECT a.title, a.rating, a.rental_amount,a.rnk
FROM (SELECT title, 
	   rating, 
       (rental_duration * rental_rate) as rental_amount,     
       ROW_NUMBER() OVER(PARTITION BY rating ORDER BY(rental_duration * rental_rate) DESC) AS rnk
FROM film)  AS a
WHERE a.rnk = 1;     

/* Create SQL table to store DATA */

  