/*Which titles from season 5 have the topic 'Science' or aired after January 1, 2010?*/
SELECT "title", "air_date", "season"
FROM "episodes"
WHERE "season" = 5
AND ("topic" LIKE '%Science%' OR "air_date" > '2010-01-01');

