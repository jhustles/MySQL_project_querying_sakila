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

# Querying for actors whose last names contain the letters `LI`; ordered the rows by last name and first name, in that order:
SELECT *
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;