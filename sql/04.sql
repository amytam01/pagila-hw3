/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM (
	SELECT first_name, last_name, UNNEST(special_features) AS special
	FROM actor
	INNER JOIN film_actor USING(actor_id)
	INNER JOIN film USING(film_id)
) AS behindSpecial
WHERE special = 'Behind the Scenes';
