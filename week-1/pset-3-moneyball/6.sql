-- In 6.sql, write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.

-- Call the column representing total hits by players in 2001 “total hits”.
-- Sort by total hits, highest to lowest.
-- Your query should return two columns, one for the teams’ names and one for their total hits in 2001.
SELECT t.name , SUM(pr.H) AS sum_hits
FROM teams t
JOIN performances pr ON t.id = pr.team_id
WHERE pr.year = 2001
GROUP BY t.name
ORDER BY sum_hits DESC
LIMIT 5;
