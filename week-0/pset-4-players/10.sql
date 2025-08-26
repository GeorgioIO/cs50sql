-- write SQL query to answer a question of your choice. This query should:
-- Make use of AS to rename a column
-- Involve at least condition, using WHERE
-- Sort by at least one column using ORDER BY
SELECT birth_country , COUNT(*) AS players_count
FROM players
WHERE bats = 'R'
GROUP BY birth_country
ORDER BY players_count DESC;
