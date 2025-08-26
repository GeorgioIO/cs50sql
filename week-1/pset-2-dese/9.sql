-- write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).
SELECT d.name
FROM districts d
JOIN expenditures e ON d.id = e.district_id
ORDER BY pupils
LIMIT 1;
