-- write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.
SELECT s.name 
FROM schools s
JOIN graduation_rates g ON s.id = g.school_id
WHERE (s.type  = 'Public School' OR s.type = 'Charter School')
AND g.graduated = 100.0;
