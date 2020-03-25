-- For this project, I used the Sakila DB and wrote queries to get answers in the comments.

-- Instruct SQL to use Sakila database
USE sakila;

--  Querying for all First and Last Name of Actors
SELECT first_name, last_name
FROM actor ORDER BY 2, 1;

--  CONCAT the first and last name, and read in uppercase
SELECT UPPER(CONCAT(first_name,' ',last_name)) 
FROM actor;

--  Query all of the information of actor's name that start with Joe 
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE 'Joe%';

-- Query for all actors with 'GEN' in their last name
SELECT *
FROM actor
WHERE last_name LIKE '%GEN%';

--  Querying for actors whose last names contain the letters `LI`; ordered the rows by last name and first name, in that order:
SELECT *
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

--   Querying for the country_id for countries IN Afghanistan, Bangladesh, and China
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- Adding a column to the table actor
ALTER TABLE actor
ADD description BLOB;

-- # Deleting a column from the table actor using DROP
ALTER TABLE actor
DROP description;

-- Querying for all actors last name and provide a total count for each
SELECT last_name, COUNT(*) AS Ct
FROM actor
GROUP BY 1
ORDER BY 1;

-- Querying for all actors last name, and display last_name >= 2
SELECT last_name, COUNT(*) AS Ct
FROM actor
GROUP BY 1
HAVING Ct >= 2
ORDER BY 1;

-- Querying for actor HARPO WILLIAMS, and fix his name to GROUCHO WILLIAMS
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO'
AND last_name = 'WILLIAMS';

--  Querying for all staff's first and last names, and addresses
SELECT s.first_name, s.last_name, a.address
FROM staff s 
INNER JOIN address a
ON s.address_id = a.address_id;

-- Querying for the total payments accepted by each staff member
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total
FROM staff s
LEFT JOIN payment p
ON p.staff_id = s.staff_id
GROUP BY 1;

-- Querying for the top 3 films that have the most actors
SELECT f.film_id, f.title, f.release_year, COUNT(fa.film_id) AS num_of_actors
FROM film f
INNER JOIN film_actor fa
ON fa.film_id = f.film_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 3;

-- Querying for the number of copies of the film 'Hunchback Impossible' that exists in the inventory system
SELECT COUNT(*) AS num_of_film_copies
FROM film f 
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible';

-- Querying for the total paid by each customer, ordered by total amount paid descending, then alphabetically by last name
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY 1
ORDER BY 4 DESC, 1, 3;

--  Displayed the titles of movies starting with the letters `K` and `Q` whose language is English.
SELECT title AS film_title
FROM film
WHERE language_id = (SELECT l.language_id FROM language AS l WHERE name = 'English')
AND (title LIKE 'K%'
OR title LIKE 'Q%'); 

-- Querying for all actors who appeared in the filem 'Alone Trip'
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id IN 
	(SELECT actor_id
		FROM film_actor
        WHERE film_id = (SELECT film_id
							FROM film
                            WHERE title = 'Alone Trip'))
ORDER BY last_name;

-- Querying for the names and email address of all Canadian customers
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customer c
INNER JOIN address a 
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
WHERE country_id = (SELECT country_id
					FROM Country
					WHERE country = 'Canada');

-- Querying for all title of films that are in the family category
SELECT title
FROM film
WHERE film_id IN (SELECT film_id
					FROM film_category
                    WHERE category_id IN (SELECT category_id
											FROM category
                                            WHERE name LIKE '%family%'));

