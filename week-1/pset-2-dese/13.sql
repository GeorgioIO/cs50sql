-- Get all districts that their staff need improvement marked as 'needs_imporvement' > 50 and count of skills in that district
SELECT d.name , COUNT(s.id) AS schools_counts
FROM districts d
JOIN schools s ON d.id = s.district_id
JOIN staff_evaluations sf ON d.id = sf.district_id
WHERE needs_improvement > 20
GROUP BY d.name
HAVING schools_counts > 2;
