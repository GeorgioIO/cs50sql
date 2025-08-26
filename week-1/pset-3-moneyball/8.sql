--  In 8.sql, write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.

-- Your query should return a table with one column, the salary of the player.
SELECT salary
FROM salaries s
JOIN players p ON s.player_id = p.id
JOIN performances pr ON p.id = pr.player_id
WHERE pr.HR = (SELECT MAX(HR) FROM performances WHERE year = 2001)
AND s.year = 2001;
