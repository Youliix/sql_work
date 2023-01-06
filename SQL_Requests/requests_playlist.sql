BEGIN;

-- QUERY 1: Explore PlaylistTrack (line count : 8715)
SELECT * FROM playlist_track;

-- QUERY 2: How many track does each playlist have? Order from largest to smallest playlists. (line count : 14)
SELECT PlaylistId, COUNT(TrackId) AS NbTrack 
FROM playlist_track
GROUP BY PlaylistId
ORDER BY NbTrack DESC;

-- QUERY 3: Is there a difference between the unit price contained in invoice_items and tacks ?

-- QUERY 4: Identify the rows where either TrackId or PlaylistId is NULL (PlaylistTrack table).
SELECT *
FROM playlist_track
WHERE TrackId IS NULL OR PlaylistId IS NULL;

-- QUERY 5: Group the songs according to the different types of media (use a count) (line count : 5)

SELECT media_types.Name, COUNT(tracks.TrackId)
    FROM media_types
    INNER JOIN tracks
    ON media_types.MediaTypeId = tracks.MediaTypeId
    GROUP BY media_types.Name;

-- QUERY 6: Show the number of tracks for each playlist that have more than 100 tracks. (line count : ())

SELECT PlaylistId, COUNT(TrackId) AS NbTrack 
FROM playlist_track
GROUP BY PlaylistId
HAVING NbTrack >= 100
ORDER BY NbTrack DESC;

-- QUERY 7: Show the number of tracks for each playlist with an even PlaylistId that have more than 100 tracks. (line count : 2)

SELECT PlaylistId, COUNT(TrackId) AS NbTrack 
FROM playlist_track
WHERE PlaylistId % 2 = 0
GROUP BY PlaylistId
HAVING NbTrack >= 100
ORDER BY NbTrack DESC;

-- QUERY 8: Join table PlaylistTrack with Playlist (line count : 8715)

SELECT *
FROM playlist_track JOIN playlists
ON playlist_track.PlaylistId = playlists.PlaylistId;

-- QUERY 9: Join table PlaylistTrack with Playlist without any column duplicate (line count : 8715)

SELECT playlist_track.PlaylistId, TrackId, Name
FROM playlist_track INNER JOIN playlists 
ON playlist_track.PlaylistId = playlists.PlaylistId;

-- QUERY 10: Join table PlaylistTrack with Playlist without any column duplicate and using aliases in your code (AS) (line count : 8715)

SELECT PT.PlaylistId, TrackId, Name
FROM playlist_track AS PT INNER JOIN playlists AS P
ON PT.PlaylistId = P.PlaylistId;

-- QUERY 11: How many track does each playlist have? Show the name of the playlist in your result. (line count : 14)

SELECT PT.PlaylistId, COUNT(TrackId) AS NbTrack, Name
FROM playlist_track AS PT INNER JOIN playlists AS P
ON PT.PlaylistId = P.PlaylistId
GROUP BY PT.PlaylistId;

-- QUERY 12: Are they albums title whose names are similar to playlists name ?

SELECT count(*) FROM (SELECT DISTINCT name FROM playlists), 
                    (SELECT DISTINCT title FROM albums)
WHERE Title = name;

-- QUERY 13: Count the number of albums for each genre. Order the results by most to least popular genre. (line count : 25)

SELECT count(DISTINCT AlbumId) AS NbAlbums, genres.Name AS Genre
FROM tracks
INNER JOIN genres ON tracks.GenreId = genres.GenreId
GROUP BY tracks.GenreId
ORDER BY NbAlbums DESC;

-- QUERY 14: Show the same result and add the name of the genre. (line count : 25)

SELECT tracks.GenreId, genres.Name, COUNT(DISTINCT AlbumId) AS NbAlbum
FROM tracks INNER JOIN genres ON tracks.GenreId = genres.GenreId
GROUP BY tracks.GenreId
ORDER BY NbAlbum DESC;

-- QUERY 15: Count the number of playlists for each genre. Order the results by most to least popular genre. (line count : 25)

SELECT tracks.GenreId, genres.Name, COUNT(DISTINCT PlaylistId) AS NbPlaylist
FROM tracks 
INNER JOIN genres ON tracks.GenreId = genres.GenreId
INNER JOIN playlist_track ON playlist_track.TrackId = tracks.TrackId
GROUP BY tracks.GenreId
ORDER BY NbPlaylist DESC;

-- QUERY 16: How many different media, genre, tracks, albums and artists are there in this DB (1 request) ?

SELECT * FROM
(SELECT count(MediaTypeId) as 'nb_medias' FROM media_types),
(SELECT count(GenreId) as 'nb_genres' FROM genres),
(SELECT count(TrackId) as 'nb_tracks' FROM tracks),
(SELECT count(AlbumId) as 'nb_albums' FROM albums),
(SELECT count(ArtistId) as 'nb_artists' FROM artists)

-- QUERY 17: Which playlist or playlists have no tracks? (line count : 4)

SELECT playlists.Name, playlists.PlaylistId, playlist_track.TrackId
FROM playlists
LEFT JOIN playlist_track
ON playlists.PlaylistId = playlist_track.PlaylistId
WHERE playlist_track.TrackId IS NULL;

COMMIT;