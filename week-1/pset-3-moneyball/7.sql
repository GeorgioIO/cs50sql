-- 7.sql, write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.

-- Your query should return a table with two columns, one for the player’s first name and one for their last name.
SELECT p.first_name , p.last_name
FROM players p
JOIN salaries s ON p.id = s.player_id
WHERE salary = (SELECT MAX(salary) FROM salaries);
