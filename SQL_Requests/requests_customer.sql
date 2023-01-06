BEGIN;

-- Exploration of the Customer table in the Chinook database
-- QUERY 1
SELECT * FROM Customer;

-- QUERY 2
-- Extract CustomerId, Company and City data from the customer table in the Chinook database
SELECT CustomerId, Company, City From customers;

-- QUERY 3
-- Extract the Lastname, Firstname, email and city from the same table
SELECT LastName, FirstName, Email, City FROM customers;

-- QUERY 4
-- Extract the Lastname, Firstname, email, city and country from the same table
-- and select only the country starting with "AUSTR"
-- What do you observe? 
SELECT LastName, FirstName, Email, City, Country FROM customers
WHERE Country LIKE "AUSTR%";

-- QUERY 5
-- Extract the Lastname, Firstname, email, city and country from the same table
-- only from USA and Canada
SELECT LastName, FirstName, Email, City, Country FROM customers
WHERE Country like "USA" or Country like "Canada";

-- QUERY 6
-- Use the previous query and order the extracted data by lastname ascending
SELECT LastName, FirstName, Email, City, Country FROM customers
WHERE Country in ("USA","Canada")
ORDER BY LastName ASC;

-- QUERY 7
-- Show the top 5 data in alphabetical order
SELECT LastName, FirstName, Email, City, Country FROM customers
WHERE Country in ("USA","Canada")
ORDER BY LastName ASC
LIMIT 5
;

-- QUERY 8
-- Extract the Top 5 data starting at row 5
SELECT LastName, FirstName, Email, City, Country FROM customers
WHERE Country in ("USA","Canada")
ORDER BY LastName ASC
LIMIT 5
OFFSET 4;


-- QUERY 9
-- Count the number of clients you have in USA 
-- Count the number of clients you have in Canada
SELECT COUNT(Country) FROM customers
WHERE Country LIKE "USA";
SELECT COUNT(Country) FROM customers
WHERE Country LIKE "Canada";

-- QUERY 10
-- Count the number of clients you have in Berlin and in Paris (1 request and 1 line per cities)
SELECT City, COUNT(City) FROM customers
WHERE City LIKE "Berlin"
UNION
SELECT City, COUNT(City) FROM customers
WHERE City LIKE "Paris";

-- QUERY 11
-- How many states are there ?
-- And how many cities per state ?

query11
SELECT State, count(city) as 'nb city per state' FROM customers
WHERE state not null
group by state
UNION
SELECT 'nb state :', count(distinct state) from customers
where state not NULL;


-- QUERY 12
-- Count the number of clients per country and order them from the largest to the smallest.
SELECT Country, COUNT(Country) FROM customers
GROUP BY Country
ORDER BY COUNT(Country) DESC;

-------------------------------- 
-- Let's change table ! 
-- Explore the Track table
Use Track; 
SELECT * FROM Track; 

-- QUERY 13
-- Extract the data about songs with name starting by let'
-- Extract the data about songs with name containing good in it
-- Extract the data about songs with name ending by you
SELECT * FROM Track
WHERE Name LIKE "Let%'";

SELECT * FROM Track
WHERE Name LIKE "%good%";

SELECT * FROM Track
WHERE Name LIKE "%you";

-- QUERY 14
-- Extract the data about songs which length is from 230 et 240 seconds and order them from the longest to the shortest
SELECT * FROM Chinook.Track
Where Milliseconds BETWEEN 230000 and 240000
Order by Milliseconds desc;

-- QUERY 15
-- Extract data from the top 10 long songs which cost 0.99 
SELECT * FROM Chinook.Track
WHERE UnitPrice = 0.99
ORDER BY Milliseconds desc
LIMIT 10;

-- QUERY 16
-- Extract the different prices apply to the songs
-- Extract the number of different composer from the table
-- Extract songs where the price is bigger than the average price
SELECT DISTINCT(UnitPrice) FROM Track;
SELECT COUNT(DISTINCT Composer) FROM Track;
SELECT TrackId FROM tracks
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM tracks);

-- QUERY 17
-- Extract data of songs which genreid is 20 and album id is 253.
-- Order them by the id of each track
SELECT * FROM Chinook.Track
WHERE GenreId = 20
and AlbumId = 253
Order by TrackId asc;

-- QUERY 18 *1.0 -->permet de convertir en float
-- Calculate the length of songs in seconds
-- Count the number of songs whose songs are longer than the average length of song (eventually use a CASE)
SELECT Name, Milliseconds*1.0/1000 AS Length FROM Track;
SELECT name,  Milliseconds AS length
FROM tracks
WHERE Milliseconds > (SELECT avg(Milliseconds) FROM tracks)


-- QUERY 19
-- Calculate the average length of songs by album and count the number of songs by album
-- order by the number of songs descending
SELECT AlbumId, avg(Milliseconds) as 'avg time', count(TrackId) as 'nb tracks'  FROM Tracks
GROUP by AlbumId
ORDER by count(TrackId) desc;

-- QUERY 20 / Review
-- Extract the top 10 composers order from the longest average length of 
-- tracks and count the number of album the composer appear in 
SELECT Composer, AVG(Milliseconds)/1000 AS AvgLength, COUNT(AlbumId) AS NBAlbum
FROM Track
GROUP BY Composer
ORDER BY AvgLength DESC
LIMIT 10;

-- Bonus:
-- QUERY 21 (line count : 57)
-- Name the composers whose total of length songs are longer than the total of the length songs of queen
SELECT Composer, sum(Milliseconds)
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer
HAVING sum(Milliseconds) > (SELECT sum(Milliseconds) 
						FROM tracks 
						WHERE Composer
						LIKE '%Queen%')
ORDER BY sum(trackId)

-- QUERY 22
-- How many composers did not compose any songs ? (Only refer to track table)
-- How many of songs are not refered to a composer ?

-- Réponse à la 1ère question : aucun (réfléchir au sens logique dans la table tracks !)
SELECT count(TrackId) FROM tracks
WHERE Composer is null;

-- QUERY 23 (line count : 10)
-- Select the top 10 of composers by their number of tracks
-- You will see that the first one on the top is no-one
-- How is that possible? Comment here in 1 sentence
SELECT Composer, sum(trackId) FROM tracks
GROUP BY Composer
ORDER BY sum(trackId) DESC
LIMIT 10;

COMMIT;