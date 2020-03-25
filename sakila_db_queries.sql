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