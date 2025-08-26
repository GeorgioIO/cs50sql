-- in 5.sql, write a SQL query to find all teams that Satchel Paige played for.

-- Your query should return a table with a single column, one for the name of the teams.
SELECT DISTINCT(t.name)
FROM teams t
JOIN performances p ON t.id = p.team_id
JOIN players pl ON p.player_id = pl.id
WHERE pl.first_name = 'Satchel'
AND pl.last_name = 'Paige';

