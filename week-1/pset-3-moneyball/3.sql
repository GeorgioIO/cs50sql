-- In 3.sql, write a SQL query to find Ken Griffey Jr.’s home run history.

-- Sort by year in descending order.
-- Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
-- Your query should return a table with two columns, one for year and one for home runs.
SELECT pr.year , pr.HR
FROM performances pr
JOIN players p ON pr.player_id = p.id
WHERE p.first_name = 'Ken'
AND p.last_name = 'Griffey'
AND p.birth_year = 1969
ORDER BY pr.year DESC;
