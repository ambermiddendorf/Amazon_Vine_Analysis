SELECT * 
INTO total_votes_20
	FROM vine_table
	WHERE total_votes>=20;
	

SELECT *
INTO helpful_votes_50
	FROM total_votes_20
	WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT)>=.5;
	
SELECT * FROM helpful_votes_50
ORDER BY CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT);


SELECT * 
INTO paid_reviews
	FROM helpful_votes_50
	WHERE vine = 'Y';
	
SELECT * 
INTO unpaid_reviews
	FROM helpful_votes_50
	WHERE vine = 'N';

SELECT * FROM paid_reviews;

SELECT 
	COUNT(review_id) AS NumOfReviews,
	COUNT(review_id) filter (where star_rating = 5) as NumOf5Stars,
	CAST(COUNT(review_id) filter (where star_rating = 5) AS FLOAT)/CAST(COUNT(review_id) AS FLOAT) as Perc5Stars
INTO paid_reviews_summary
FROM paid_reviews;

SELECT 
	COUNT(review_id) AS NumOfReviews,
	COUNT(review_id) filter (where star_rating = 5) as NumOf5Stars,
	CAST(COUNT(review_id) filter (where star_rating = 5) AS FLOAT)/CAST(COUNT(review_id) AS FLOAT) as Perc5Stars
INTO unpaid_reviews_summary
FROM unpaid_reviews;

SELECT 'Paid' AS Type,
	COUNT(review_id) AS NumOfReviews,
	COUNT(review_id) filter (where star_rating = 5) as NumOf5Stars,
	CAST(COUNT(review_id) filter (where star_rating = 5) AS FLOAT)/CAST(COUNT(review_id) AS FLOAT) as Perc5Stars
INTO summary
FROM paid_reviews;

INSERT INTO summary (type, numofreviews, numof5stars, perc5stars)
	SELECT 'Unpaid', numofreviews, numof5stars, perc5stars
	FROM unpaid_reviews_summary;
	
	
SELECT * FROM summary;