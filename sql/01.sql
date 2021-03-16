/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

SELECT title FROM (
	SELECT title,
	UNNEST(special_features) AS special
	FROM film
	WHERE rating = 'G'
	)
	AS G_trailers
	WHERE special = 'Trailers'
	ORDER BY title DESC;
