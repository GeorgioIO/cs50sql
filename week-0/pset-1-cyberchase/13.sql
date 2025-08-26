-- write a SQL query to explore a question of your choice. This query should:
-- Involve at least one condition, using WHERE with AND or OR
-- write a query to get all the episodes that title have 'The' and topic is either Patterns or Point of view
SELECT title FROM episodes WHERE title LIKE '%The%' AND (topic = 'Patterns' OR topic = 'Point of View');
