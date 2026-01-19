-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Inserting users
INSERT INTO users (id, name, email, join_date) VALUES
(1, 'João Pedro', 'joao@example.com', '2024-01-15'),
(2, 'Maria Silva', 'maria@example.com', '2024-03-10');

-- Inserting artists
INSERT INTO artists (id, name, country) VALUES
(1, 'John Mayer', 'USA'),
(2, 'Red Hot Chili Peppers', 'USA'),
(3, 'The Beatles', 'UK'),
(4, 'Engenheiros do Hawaii', 'Brazil');

-- Inserting albums
INSERT INTO albums (id, title, artist_id, release_year) VALUES
(1, 'Continuum', 1, 2006),
(2, 'Californication', 2, 1999),
(3, 'Abbey Road', 3, 1969),
(4, 'O Papa é Pop', 4, 1990);

-- Inserting songs
INSERT INTO songs (id, title, duration, album_id, genre, popularity) VALUES
(1, 'Gravity', 240, 1, 'Blues Rock', 90),
(2, 'Scar Tissue', 230, 2, 'Funk Rock', 88),
(3, 'Come Together', 259, 3, 'Rock', 92),
(4, 'Infinita Highway', 330, 4, 'Rock Brasileiro', 85);

-- Inserting playlists
INSERT INTO playlists (id, name, user_id, created_at) VALUES
(1, 'Favoritas do João', 1, '2024-05-01'),
(2, 'Rock Internacional', 2, '2024-05-10'),
(3, 'Likes', 1, '2024-05-08');

-- Associating songs with playlists
INSERT INTO playlist_songs (playlist_id, song_id, position) VALUES
(1, 1, 1), -- João: "Gravity"
(1, 4, 2), -- João: "Infinita Highway"
(2, 2, 1), -- Maria: "Scar Tissue"
(2, 3, 2); -- Maria: "Come Together"

--

SELECT
    "playlist_songs"."position",
    "songs"."title",
    "albums"."title",
    "artists"."name"
FROM
    "playlist_songs"
JOIN "songs" ON "playlist_songs"."song_id" = "songs"."id"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
JOIN "artists" ON "albums"."artist_id" = "artists"."id"
WHERE
    "playlist_songs"."playlist_id" = 2
ORDER BY
    "playlist_songs"."position";

--

SELECT
    "playlists"."name",
    "playlists"."created_at",
    "users"."name"
FROM
    "playlists"
JOIN "users" ON "playlists"."user_id" = "users"."id"
WHERE
    "users"."name" = 'Maria Silva';

--

SELECT
    "songs"."title",
    "songs"."duration",
    "songs"."genre",
    "albums"."title",
    "albums"."release_year",
    "artists"."name"
FROM
    "songs"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
JOIN "artists" ON "albums"."artist_id" = "artists"."id"
WHERE
    "artists"."name" = 'Red Hot Chili Peppers';

--

SELECT DISTINCT
    "artists"."name"
FROM
    "playlist_songs"
JOIN "songs" ON "playlist_songs"."song_id" = "songs"."id"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
JOIN "artists" ON "albums"."artist_id" = "artists"."id"
JOIN "playlists" ON "playlist_songs"."playlist_id" = "playlists"."id"
WHERE
    "playlists"."name" = 'Rock Internacional'
ORDER BY
    "artists"."name";

--

SELECT DISTINCT
    "playlists"."name"
FROM
    "playlists"
JOIN "playlist_songs" ON "playlists"."id" = "playlist_songs"."playlist_id"
JOIN "songs" ON "playlist_songs"."song_id" = "songs"."id"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
JOIN "artists" ON "albums"."artist_id" = "artists"."id"
WHERE
    "artists"."name" = 'The Beatles'
ORDER BY
    "playlists"."name";

--

-- Insert a new song into the album with id = 1
INSERT INTO "songs" ("id", "title", "duration", "album_id", "genre", "popularity")
VALUES (5, 'New Light', 230, 1, 'Pop Rock', 87);

-- Update the popularity of the song with id = 2 to 95
UPDATE "songs"
SET "popularity" = 95
WHERE "id" = 2;

-- Remove the song with id = 4 from the playlist with id = 1
DELETE FROM "playlist_songs"
WHERE "playlist_id" = 1 AND "song_id" = 4;

--

-- Top 5 most popular songs by the artist 'Red Hot Chili Peppers'
SELECT
    "songs"."title",
    "songs"."popularity",
    "artists"."name"
FROM
    "songs"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
JOIN "artists" ON "albums"."artist_id" = "artists"."id"
WHERE
    "artists"."name" = 'Red Hot Chili Peppers'
ORDER BY
    "songs"."popularity" DESC
LIMIT 5;

--

--Total duration (in seconds) of the playlist 'Rock Internacional'
SELECT
    "playlists"."name",
    SUM("songs"."duration") AS "total_duration_seconds"
FROM
    "playlist_songs"
JOIN "songs" ON "playlist_songs"."song_id" = "songs"."id"
JOIN "playlists" ON "playlist_songs"."playlist_id" = "playlists"."id"
WHERE
    "playlists"."name" = 'Rock Internacional'
GROUP BY
    "playlists"."name";

--

-- Number of songs per artist
SELECT
    "artists"."name",
    COUNT("songs"."id") AS "total_songs"
FROM
    "artists"
JOIN "albums" ON "artists"."id" = "albums"."artist_id"
JOIN "songs" ON "albums"."id" = "songs"."album_id"
GROUP BY
    "artists"."name"
ORDER BY
    "total_songs" DESC;

--

-- Update the name of the playlist with id = 1 to 'Rock Clássico'
UPDATE "playlists"
SET "name" = 'Rock Clássico'
WHERE "id" = 1;

-- Delete a playlist by name using a subquery (more flexible)
DELETE FROM "playlists"
WHERE "id" = (
    SELECT "id" FROM "playlists" WHERE "name" = 'Likes'
);

--


-- CTE to calculate the average popularity of each artist
WITH "artist_avg_popularity" AS (
  SELECT
    "artists"."name" AS "artist_name",                   -- Artist's name
    ROUND(AVG("songs"."popularity"), 2) AS "avg_popularity"  -- Rounded average popularity
  FROM "artists"
  JOIN "albums" ON "artists"."id" = "albums"."artist_id" -- Link artists to their albums
  JOIN "songs" ON "albums"."id" = "songs"."album_id"     -- Link albums to their songs
  GROUP BY "artists"."name"                              -- Group by artist to calculate the average
)
--Select artists with average popularity greater than 85 and sort from highest to lowest
SELECT *
FROM "artist_avg_popularity"
WHERE "avg_popularity" > 85
ORDER BY "avg_popularity" DESC;
