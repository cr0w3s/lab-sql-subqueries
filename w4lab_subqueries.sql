-- initialize db
USE sakila;

-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist 
-- in the inventory system.
-- we need to figure out which film ID Hunchback has
-- film names live in the title column in the film tbl; com col = film_id
-- we need to count the instances of inventory_id that equal that film_id

SELECT COUNT(i.inventory_id) AS 'num of copies' FROM sakila.inventory as i
JOIN sakila.film as f
ON i.film_id = f.film_id
WHERE title  = 'HUNCHBACK IMPOSSIBLE';


-- 2. List all films whose length is longer than the average length of all 
-- the films in the Sakila database.
SELECT title from sakila.film
WHERE length > (SELECT ROUND(AVG(length)) from sakila.film);


-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
-- film title lives in film tbl
-- actor name lives in actor tbl
-- film_actor tbl has actor_id & film_id to link the two other tbls
-- SELECT a.first_name, a.last_name FROM sakila.actor AS a
-- JOIN sakila.film_actor AS fa
-- ON a.actor_id = fa.actor_id
-- JOIN sakila.film AS f
-- ON f.film_id = fa.film_id
-- WHERE f.title = 'ALONE TRIP';

SELECT CONCAT(a.first_name,' ',a.last_name) AS 'actor list'
FROM sakila.actor AS a
WHERE actor_id IN (
	SELECT actor_id
    FROM sakila.film_actor AS fa
	JOIN sakila.film AS f
		ON f.film_id = fa.film_id
	WHERE title = 'ALONE TRIP'
);
