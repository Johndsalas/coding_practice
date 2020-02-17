-- Employees Database

use employees;

-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

SELECT dept_name as dertment_name, concat(first_name, ' ', last_name) as full_name, salary as manager_salary, a.avg_salary as a_sal

FROM departments as d

JOIN dept_manager as dm
ON d.dept_no = dm.dept_no

JOIN titles as t
ON dm.emp_no = t.emp_no

JOIN employees as e
ON e.emp_no = t.emp_no

JOIN salaries as s
ON s.emp_no = t.emp_no

join(select avg(salary) as avg_salary from salaries) as a 

WHERE t.title = 'Manager' and dm.to_date > now() and s.to_date > now()

ORDER BY d.dept_name asc;

-- World Database

use world;
describe countrylanguage;
-- Use the world database for the questions below.
-- What languages are spoken in Santa Monica?

select cl.language, cl.percentage
 
from countrylanguage as cl

join city as c
on c.countrycode = cl.countrycode

where c.name = 'santa monica'

order by cl.percentage;

-- How many different countries are in each region?

select region, count(*) as num_countries

from country

group by region

order by count(*);

-- What is the population for each region?

select distinct region, sum(population) as population

from country

group by region

order by sum(population) desc;

-- What is the population for each continent?

select continent, sum(Population) as population

from country

group by continent

order by sum(population) desc;

-- What is the average life expectancy globally?

select avg(lifeExpectancy) from country;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

select continent, avg(LifeExpectancy)

from country

group by continent

order by avg(LifeExpectancy);

select region, avg(LifeExpectancy)

from country

group by region

order by avg(LifeExpectancy);

-- Display the first and last names in all lowercase of all the actors.

use sakila;

select lower(concat(first_name,' ',last_name)) as names

from actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query you could use to obtain this information?

select actor_id, first_name, last_name
from actor
where first_name = "Joe";

-- Find all actors whose last name contain the letters "gen":

select concat(first_name,' ',last_name) as names

from actor

where last_name like "%gen%";

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.

select first_name, last_name

from actor

where last_name like "%li%"

order by last_name, first_name;

-- Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:

select country_id, country
from country
where country in('Afghanistan', 'Bangladesh','China');

-- List the last names of all the actors, as well as how many actors have that last name.

select last_name, count(*)
from actor
group by last_name;


-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

select last_name, count(*)
from actor
group by last_name
having count(*) > 1;

-- You cannot locate the schema of the address table. Which query would you use to re-create it?

CREATE TABLE `address` (
  `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  SPATIAL KEY `idx_location` (`location`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;


-- Use JOIN to display the first and last names, as well as the address, of each staff member.

select staff.first_name, staff.last_name, a.address

from staff

join store
on staff.store_id=store.store_id

join address as a
on a.address_id=store.address_id;

-- Use JOIN to display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name, sum(p.amount)

from staff as s

join payment as p
on s.staff_id=p.staff_id

where p.payment_date like '2005-08-%'

group by s.first_name, s.last_name;

-- List each film and the number of actors who are listed for that film.

select title, count(actor_id)

from film as f

join film_actor as fa
on f.film_id=fa.film_id

group by title;

-- How many copies of the film Hunchback Impossible exist in the inventory system?

select count(i.film_id)

from film as f

join inventory as i
on f.film_id=i.film_id

where f.title = "Hunchback Impossible";
 

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

select title 

from film
where (title like 'k%' or title like 'q%') and language_id in(
																select language_id
																from language
																where name = "english");
-- Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name

from actor

where actor_id in(
					select actor_id
					from film
					where title = 'Alone Trip');

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.

select email

from customer

where last_update in (
						select last_update 
						from country
						where country = "canada");
									
								

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
select title
from film
where film_id in( 
					select film_id
					from film_category
					where category_id in(
											select category_id 
											from category
											where name = 'family'
					
										)

				);

-- Write a query to display how much business, in dollars, each store brought in.

select s.store_id, sum(amount)

from store as s

join staff as st
on s.store_id=st.store_id

join payment as p
on st.staff_id=p.staff_id

group by s.store_id;

-- Write a query to display for each store its store ID, city, and country.

select st.store_id, ci.city, co.country

from city as ci

join country as co
on ci.country_id=co.country_id

join address as a
on ci.city_id=a.city_id

join store as st
on st.address_id = a.address_id

group by st.store_id;

-- List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

select c.name, sum(p.amount)

from category as c

join film_category as fc
on fc.category_id=c.category_id

join inventory as i
on i.film_id=fc.film_id

join rental as r
on i.inventory_id=r.inventory_id

join payment as p
on p.rental_id=r.rental_id

group by c.name

order by sum(p.amount) desc

limit 5;

-- SELECT statements
-- Select all columns from the actor table.

select * from actor;

-- Select only the last_name column from the actor table.

select last_name from actor;

-- Select only the following columns from the film table.

select title, description from film;

-- DISTINCT operator
-- Select all distinct (different) last names from the actor table.

select distinct last_name from actor;
	
-- Select all distinct (different) postal codes from the address table.

select distinct postal_code from address;

-- Select all distinct (different) ratings from the film table.

select distinct rating from film;

-- WHERE clause
-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.

select title, description, rating, length
from film
where length/60 > 3;

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


SELECT title, description, special_features, length, rental_duration

FROM film
	
WHERE length < 120
		AND rental_duration BETWEEN 5 AND 7
		AND special_features LIKE '%Behind the Scenes%' 
		
ORDER BY length DESC
LIMIT 10;

-- JOINs
-- Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. -- customer.last_name = actor.last_name)


SELECTc.first_name cust_first_name,c.last_name cust_last_name,a.first_name actor_first_name,a.last_name actor_last_name
FROM customer c
LEFT JOIN actor a
using(last_name);


-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 599
	

SELECT
	c.first_name cust_first_name
	,c.last_name cust_last_name
	,a.first_name actor_first_name
	,a.last_name actor_last_name

FROM customer c
LEFT JOIN actor a
using(last_name);

-- Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. -- customer.last_name = actor.last_name)
-- returns correct number of records: 200

SELECT
		c.first_name cust_first_name
		,c.last_name cust_last_name
		,a.first_name actor_first_name
		,a.last_name actor_last_name

FROM customer c

RIGHT JOIN actor a
using(last_name);
		
-- Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. -- customer.last_name = actor.last_name)
-- returns correct number of records: 43
	
	
SELECT
		c.first_name cust_first_name
		,c.last_name cust_last_name
		,a.first_name actor_first_name
		,a.last_name actor_last_name

FROM customer c

JOIN actor a
using(last_name);

-- Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
-- Returns correct records: 600
	

SELECT cty.city, ctry.country
		
FROM city cty
lEFT JOIN country ctry
USING (country_id);
		
-- Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
	
SELECT
		f.title
		,f.description
		,f.release_year
		,l.name language

FROM film f
JOIN language l
USING(language_id);

-- Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2
	
	
SELECT
		st.first_name
		,st.last_name
		,a.address
		,a.address2
		,cty.city
		,a.district
		,a.postal_code

FROM staff st
LEFT JOIN
address a
USING(address_id)
	
LEFT JOIN
city cty
USING(city_id);

-- What is the average replacement cost of a film? 


SELECT AVG(replacement_cost)

FROM film;

-- Does this change depending on the rating of the film?


SELECT rating,AVG(replacement_cost)
	
FROM film
GROUP BY rating;

-- How many different films of each genre are in the database?

SELECT cat.name genre,count(*) films
	
FROM film_category fc

JOIN category cat
USING(category_id)

GROUP BY cat.name;

-- What are the 5 frequently rented films?


SELECT f.title,count(*) rentals
	
FROM film f

JOIN inventory i
USING(film_id)
	
JOIN rental r
USING(inventory_id)
	
GROUP BY f.title
ORDER BY rentals DESC
LIMIT 5;
	
-- What are the most most profitable films (in terms of gross revenue)?	
	
SELECT f.title,SUM(p.amount) revenues
	
FROM film f
JOIN inventory i
USING(film_id)

JOIN rental r
USING(inventory_id)

JOIN payment p
USING(rental_id)
	
GROUP BY f.title
ORDER BY revenues DESC
LIMIT 5;	
	
-- Who is the best customer?

SELECT
		CONCAT(cust.last_name,', ',cust.first_name) cust_name
		,SUM(p.amount) revenues
	
FROM customer cust
	
JOIN rental r
USING(customer_id)

JOIN payment p
USING(rental_id)
	
GROUP BY CONCAT(cust.last_name,', ',cust.first_name)
ORDER BY revenues DESC
LIMIT 1;

-- Who are the most popular actors (that have appeared in the most films)?

SELECT CONCAT(a.last_name,', ',a.first_name) actor_name,COUNT(*) movies
	
FROM film_actor fa
	
JOIN
		(SELECT DISTINCT 
			actor_id
			,first_name
			,last_name
		FROM
			actor
		) as a
		USING(actor_id)

GROUP BY CONCAT(a.last_name,', ',a.first_name),a.actor_id

ORDER BY movies DESC
LIMIT 5;

-- What are the sales for each store for each month in 2005?

SELECT 
		SUBSTR(p.payment_date,1,7) yrmo
		,s.store_id
		,SUM(p.amount) Sales
	
FROM store s
	
JOIN staff st
USING(store_id)
	
JOIN rental r
USING(staff_id)
	
JOIN payment p
USING(rental_id)
	
WHERE p.payment_date LIKE '2005%'

GROUP BY SUBSTR(p.payment_date,1,7),s.store_id;


































