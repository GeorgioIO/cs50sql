-- In available.sql, write a SQL statement to create a view named available. This view should contain all dates that are available at all listings. Ensure the view contains the following columns:

-- id, which is the id of the listing from the listings table.
-- property_type, from the listings table.
-- host_name, from the listings table.
-- date, from the availabilities table, which is the date of the availability.

CREATE VIEW available AS
SELECT l.id , l.property_type , l.host_name , av.date
FROM listings l
JOIN availabilities av ON l.id = av.listing_id
WHERE available = 'TRUE';
