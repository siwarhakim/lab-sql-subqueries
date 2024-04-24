USE sakila;
SELECT * 
FROM sakila.inventory I
JOIN sakila.film f
USING(film_id);

-- 1
SELECT COUNT(I.inventory_id) AS number_of_copies , f.title AS Title
FROM sakila.inventory I
JOIN sakila.film f
USING(film_id)
WHERE f.title="Hunchback Impossible";

-- 2
SELECT *
FROM sakila.film 
WHERE length > (SELECT AVG(length) FROM sakila.film);

-- 3
SELECT a.first_name , a.last_name, a.actor_id
FROM sakila.film_actor fa
JOIN sakila.film f USING(film_id)
JOIN sakila.actor a USING (actor_id)
WHERE f.title="Alone trip";

SELECT actor.*
FROM sakila.actor
WHERE actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM sakila.film
    JOIN sakila.film_actor ON film.film_id = film_actor.film_id
    WHERE film.title = 'Alone Trip'
);