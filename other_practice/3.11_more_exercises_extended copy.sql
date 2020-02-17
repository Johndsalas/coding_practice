-- Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.

select payment_id, amount, payment_date
from payment
where payment_date >= '2005-05-27';

-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.

select payment_id, amount, payment_date
from payment
where payment_date >= '2005-05-27';

-- Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.

select *
from customer
where last_name like "s%" and first_name like "%n";

-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".

select *
from customer
where last_name like "m%" and active = 0;

-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.

select *
from category
where (category_id > 4) and (name like 'c%' or name like 's%' or name like 't%');

-- Select all columns minus the password column from the staff table for rows that contain a password.

select staff_id, first_name, last_name, address_id, picture, email, active, username, last_update
from staff
where password is not null;

-- Select all columns minus the password column from the staff table for rows that do not contain a password.

select staff_id, first_name, last_name, address_id, picture, email, active, username, last_update
from staff
where password is null;

-- IN operator
-- Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.

select phone, district
from address
where district in('California', 'England', 'Taipei', 'West Java');


-- Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)

select payment_id, amount, payment_date
from payment
where date(payment_date) in('2005-05-25', '2005-05-27', '2005-05-29');

-- Select all columns from the film table for films rated G, PG-13 or NC-17.

select *
from film
where rating in('G','pg-13','nc-17');

-- BETWEEN operator
-- Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005. YYYY-MM-DD HH:MM:SS

select *
from payment
where payment_date between '2005-05-25 00:00:00' and '2005-05-25 23:59:59';


-- Select the following columns from the film table for films where the length of the description is between 100 and 120.
-- Hint: total_rental_cost = rental_duration * rental_rate

select *
from film
where len(description) between 100 and 200;

-- LIKE operator
-- Select the following columns from the film table for rows where the description begins with "A Thoughtful".

select *
from film
where description like "A Thoughtful%";

-- Select the following columns from the film table for rows where the description ends with the word "Boat".

select *
from film
where description like "%boat";


-- Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.

select *
from film
where description like "%database%";


-- LIMIT Operator

-- Select all columns from the payment table and only include the first 20 rows.

select *
from payment
limit 20;

-- Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.

select payment_date, amount
from payment
where amount > 5
limit 1000 offset 999; 


-- Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.

select *
from customer
limit 100 offset 100;

-- ORDER BY statement
-- Select all columns from the film table and order rows by the length field in ascending order.

select *
from film
order by length asc; 

-- Select all distinct ratings from the film table ordered by rating in descending order.

select distinct rating
from film
order by rating desc;

-- Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.

select payment_date, amount
from payment
order by amount desc
limit 20;

-- Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage, under 2 hours in length, and a     rental duration between 5 and 7 days, ordered by length in descending order.

USE sakila;

SELECT title, description, special_features, length, rental_duration

FROM film
	
WHERE length < 120
		AND rental_duration BETWEEN 5 AND 7
		AND special_features LIKE '%Behind the Scenes%' 
		
ORDER BY length DESC
LIMIT 10;

-- JOINs
-- Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. -- customer.last_name = actor.last_name)

USE sakila;
SELECT
		c.first_name cust_first_name,c.last_name cust_last_name,a.first_name actor_first_name,a.last_name actor_last_name
FROM
		customer c
LEFT JOIN
		actor a
		using(last_name);


-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 599
	
USE sakila;
	SELECT
		c.first_name cust_first_name
		,c.last_name cust_last_name
		,a.first_name actor_first_name
		,a.last_name actor_last_name
	FROM
		customer c
	LEFT JOIN
		actor a
		using(last_name);

-- Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. -- customer.last_name = actor.last_name)
-- returns correct number of records: 200

	USE sakila;
	SELECT
		c.first_name cust_first_name
		,c.last_name cust_last_name
		,a.first_name actor_first_name
		,a.last_name actor_last_name
	FROM
		customer c
	RIGHT JOIN
		actor a
		using(last_name);
		
-- Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. -- customer.last_name = actor.last_name)
-- returns correct number of records: 43
	
	USE sakila;
	SELECT
		c.first_name cust_first_name
		,c.last_name cust_last_name
		,a.first_name actor_first_name
		,a.last_name actor_last_name
	FROM
		customer c
	JOIN
		actor a
		using(last_name);

-- Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
-- Returns correct records: 600
	
	USE sakila;
	SELECT
		cty.city
		,ctry.country
		
	FROM
		city cty
	LEFT JOIN
		country ctry
		USING (country_id);
		
-- Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
	
	USE sakila;
	
	SELECT
		f.title
		,f.description
		,f.release_year
		,l.name language
	FROM
		film f
	JOIN
		language l
		USING(language_id);

-- Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2
	
	USE sakila;
	SELECT
		st.first_name
		,st.last_name
		,a.address
		,a.address2
		,cty.city
		,a.district
		,a.postal_code
	FROM
		staff st
	LEFT JOIN
		address a
		USING(address_id)
	LEFT JOIN
		city cty
		USING(city_id);

-- What is the average replacement cost of a film? 

USE sakila;
	SELECT
		AVG(replacement_cost)
	FROM
		film;

-- Does this change depending on the rating of the film?

USE sakila;
	SELECT
		rating
		,AVG(replacement_cost)
	FROM
		film
	GROUP BY
		rating;

-- How many different films of each genre are in the database?

USE sakila;
	SELECT
		cat.name genre
		,count(*) films
	FROM
		film_category fc
	JOIN
		category cat
		USING(category_id)
	GROUP BY cat.name

-- What are the 5 frequently rented films?

USE sakila;
	SELECT
		f.title
		,count(*) rentals
	FROM
		film f
	JOIN
		inventory i
		USING(film_id)
	JOIN
		rental r
		USING(inventory_id)
	GROUP BY
		f.title
	ORDER BY
		rentals DESC
	LIMIT 5;
	
-- What are the most most profitable films (in terms of gross revenue)?	
	
SELECT
		f.title
		,SUM(p.amount) revenues
	FROM
		film f
	JOIN
		inventory i
		USING(film_id)
	JOIN
		rental r
		USING(inventory_id)
	JOIN
		payment p
		USING(rental_id)
	GROUP BY
		f.title
	ORDER BY
		revenues DESC
	LIMIT 5;	
	
-- Who is the best customer?

SELECT
		CONCAT(cust.last_name,', ',cust.first_name) cust_name
		,SUM(p.amount) revenues
	FROM
		customer cust
	JOIN
		rental r
		USING(customer_id)
	JOIN
		payment p
		USING(rental_id)
	GROUP BY
		CONCAT(cust.last_name,', ',cust.first_name)
	ORDER BY
		revenues DESC
	LIMIT 1;

-- Who are the most popular actors (that have appeared in the most films)?

SELECT
		CONCAT(a.last_name,', ',a.first_name) actor_name
		,COUNT(*) movies
	FROM
		film_actor fa
	JOIN
		(SELECT DISTINCT 
			actor_id
			,first_name
			,last_name
		FROM
			actor
		) a
		USING(actor_id)
	GROUP BY
		CONCAT(a.last_name,', ',a.first_name) 
		,a.actor_id
	ORDER BY
		movies DESC
	LIMIT 5;

-- What are the sales for each store for each month in 2005?

USE sakila;
	SELECT 
		SUBSTR(p.payment_date,1,7) yrmo
		,s.store_id
		,SUM(p.amount) Sales
	FROM
		store s
	JOIN
		staff st
		USING(store_id)
	JOIN
		rental r
		USING(staff_id)
	JOIN
		payment p
		USING(rental_id)
	WHERE
		p.payment_date LIKE '2005%'
	GROUP BY 
		SUBSTR(p.payment_date,1,7)
		,s.store_id;
