-- write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each.
SELECT d.name , SUM(e.per_pupil_expenditure) AS sum_pup
FROM districts d
JOIN expenditures e ON d.id = e.district_id
WHERE d.type = 'Public School District'
GROUP BY d.name
ORDER BY sum_pup DESC
LIMIT 10;
