-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Users table
CREATE TABLE users (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "join_date" DATE NOT NULL
);

-- Artists table
CREATE TABLE artists (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "country" TEXT
);

-- Albums table
CREATE TABLE albums (
    "id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "artist_id" INTEGER NOT NULL,
    "release_year" INTEGER,
    FOREIGN KEY ("artist_id") REFERENCES "artists"("id")
        ON DELETE CASCADE
);

-- Songs table
CREATE TABLE songs (
    "id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "duration" INTEGER NOT NULL, -- duration in seconds
    "album_id" INTEGER NOT NULL,
    "genre" TEXT,
    "popularity" INTEGER CHECK ("popularity" BETWEEN 0 AND 100),
    FOREIGN KEY ("album_id") REFERENCES "albums"("id")
        ON DELETE CASCADE
);

-- Playlists table
CREATE TABLE playlists (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" DATE NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
        ON DELETE CASCADE
);

--Associative table playlist_songs (songs within playlists)
CREATE TABLE playlist_songs (
    "playlist_id" INTEGER NOT NULL,
    "song_id" INTEGER NOT NULL,
    "position" INTEGER,
    PRIMARY KEY ("playlist_id", "song_id"),
    FOREIGN KEY ("playlist_id") REFERENCES "playlists"("id")
        ON DELETE CASCADE,
    FOREIGN KEY ("song_id") REFERENCES "songs"("id")
        ON DELETE CASCADE
);

-- Indexes to optimize queries
CREATE INDEX "idx_users_email" ON "users"("email");
CREATE INDEX "idx_artists_name" ON "artists"("name");
CREATE INDEX "idx_albums_title" ON "albums"("title");
CREATE INDEX "idx_songs_title" ON "songs"("title");
CREATE INDEX "idx_playlists_name" ON "playlists"("name");

--

--View for complete song details, including album and artist
CREATE VIEW "song_details" AS
SELECT
  "songs"."id" AS "song_id",
  "songs"."title" AS "song_title",
  "albums"."title" AS "album_title",
  "artists"."name" AS "artist_name",
  "songs"."duration",
  "songs"."genre",
  "songs"."popularity"
FROM "songs"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
JOIN "artists" ON "albums"."artist_id" = "artists"."id";

--

--View with average song popularity and total tracks per artist
CREATE VIEW "artist_popularity" AS
SELECT
  "artists"."name" AS "artist_name",
  ROUND(AVG("songs"."popularity"), 2) AS "avg_popularity",
  COUNT("songs"."id") AS "num_songs"
FROM "artists"
JOIN "albums" ON "artists"."id" = "albums"."artist_id"
JOIN "songs" ON "albums"."id" = "songs"."album_id"
GROUP BY "artists"."name";

-- View with total song duration per album
CREATE VIEW "album_duration" AS
SELECT
  "albums"."title" AS "album_title",
  "artists"."name" AS "artist_name",
  SUM("songs"."duration") AS "total_duration_seconds"
FROM "albums"
JOIN "artists" ON "albums"."artist_id" = "artists"."id"
JOIN "songs" ON "albums"."id" = "songs"."album_id"
GROUP BY "albums"."id";
