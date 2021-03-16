/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM(
SELECT actor_id FROM film_actor
WHERE film_id IN(
	SELECT film_id
	FROM film_actor --Movies with actors with Bacall #2
	WHERE actor_id IN(
		SELECT actor_id
		FROM film_actor --Movies with actors with Bacall #1
		WHERE film_id IN (
			SELECT film_id
			FROM film_actor
			WHERE actor_id = 112 --Movies with Bacall
		) AND actor_id != 112
	) -- Russel Bacall has a Bacall Number of 0
 	)
) AS BacallNum2

--Removing actors with Bacall Number <2
INNER JOIN actor USING(actor_id)
WHERE actor_id NOT IN(
	SELECT actor_id
	FROM film_actor --Movies with actors with Bacall #1
	WHERE film_id IN (
		SELECT film_id
		FROM film_actor
		WHERE actor_id = 112 --Movies with Bacall
	)
)
ORDER BY "Actor Name";
