/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1;
 * That is, list all actors that have appeared in a film with 'RUSSEL BACALL'.
 * Do not list 'RUSSEL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN(
	SELECT film_id
	FROM film_actor
	WHERE actor_id = 112
) AS Bacall USING(film_id)
WHERE actor_id != 112 -- Russel Bacall has a Bacall Number of 0
ORDER BY "Actor Name";
