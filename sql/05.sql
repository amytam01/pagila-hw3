/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM(
	SELECT *
	FROM(
		SELECT title, UNNEST(special_features) AS special_feature
		FROM film
	) AS special
	WHERE special_feature = 'Behind the Scenes') AS btsFeature
INNER JOIN(
	SELECT *
	FROM(
		SELECT title, UNNEST(special_features) AS special_feature
		FROM film
	) AS special
	WHERE special_feature = 'Trailers'
	) AS trailerFeature
	USING(title)
	ORDER BY title;


