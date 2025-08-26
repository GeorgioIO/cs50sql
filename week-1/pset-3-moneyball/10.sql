-- In 10.sql, write a query to return just such a table.

-- Your query should return a table with five columns, per the above.
-- Order the results, first and foremost, by player’s IDs (least to greatest).
-- Order rows about the same player by year, in descending order.
-- Consider a corner case: suppose a player has multiple salaries or performances for a given year. Order them first by number of home runs, in descending order, followed by salary, in descending order.
-- Be careful to ensure that, for a single row, the salary’s year and the performance’s year match.
SELECT p.first_name , p.last_name , s.salary , pr.HR , s.year
FROM players p
JOIN performances pr ON p.id = pr.player_id
JOIN salaries s ON pr.player_id = s.player_id AND pr.year = s.year
ORDER BY p.id , s.year DESC , pr.HR DESC , s.salary DESC;
