-- write a SQL query to find the names of schools (public or charter!) in the Cambridge school district. Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”
SELECT s.name
FROM schools s
JOIN districts d ON s.district_id = d.id
WHERE d.name = 'Cambridge';
