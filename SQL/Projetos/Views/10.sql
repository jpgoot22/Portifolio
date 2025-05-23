-- This is the "Feeling more comfortable? n° 1
SELECT first_name, last_name
FROM players
WHERE height> (
    SELECT AVG(height)
    FROM players
)
ORDER BY height  DESC, first_name ASC , last_name ASC;
