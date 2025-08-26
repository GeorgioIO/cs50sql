-- In 12.sql, write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.

-- Your query should return a table with two columns, one for the players’ first names and one of their last names.
-- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
-- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
-- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
-- Keep in mind the lessons you’ve learned in 10.sql and 11.sql!
SELECT first_name , last_name FROM players WHERE id IN (SELECT id FROM (SELECT p.id
FROM players p
JOIN performances pr ON p.id = pr.player_id
JOIN salaries s ON pr.player_id = s.player_id AND pr.year = s.year
WHERE pr.year = 2001
AND pr.H > 0
ORDER BY s.salary / pr.H  , first_name , last_name
LIMIT 10)
INTERSECT
SELECT id FROM (SELECT p.id
FROM players p
JOIN performances pr ON p.id = pr.player_id
JOIN salaries s ON pr.player_id = s.player_id AND pr.year = s.year
WHERE pr.year = 2001
and pr.RBI > 0
ORDER BY s.salary / pr.RBI , p.id
LIMIT 10));
