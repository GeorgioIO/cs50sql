-- ! 1. List all freelancers with their username and their role.
SELECT u.username , f.role
FROM users u
JOIN freelancers f ON u.id = f.freelancer_id;

-- ! 2. Get all projects that are currently open.
SELECT title , description
FROM projects 
WHERE status = 'OPEN';

-- ! 3. Count how many users are verified.
SELECT COUNT(id) AS `Verified User Counts` 
FROM users
WHERE is_verified = 1;

-- ! 4. Show all skills and their category name.
SELECT s.name AS skill_name , sc.name AS category_name
FROM skills s
JOIN skill_categories sc ON s.category_id = sc.id;

-- ! 5. List all saved projects for a given freelancer (carol_design) , the query should display project title , project budget , and who own it.
SELECT p.title , p.budget , u.username
FROM projects p
JOIN users u ON p.recruiter_id = u.id
JOIN saved_projects sp ON p.id = sp.project_id
WHERE sp.freelancer_id = (SELECT id FROM users WHERE username = 'carol_design');  

-- ! 6. Find freelancers who have more than 3 skills. order result by count from most to least , then alphabetically
SELECT u.username , COUNT(fs.freelancer_id) AS skills_count
FROM users u 
JOIN freelancers f ON u.id = f.freelancer_id
JOIN freelancer_skills fs ON f.freelancer_id = fs.freelancer_id
GROUP BY fs.freelancer_id
HAVING COUNT(fs.freelancer_id) > 3
ORDER BY skills_count DESC , u.username;

-- ! 7. Get projects and the number of applications each has. order by the application count
SELECT p.title , COUNT(a.id) AS application_count
FROM projects p 
JOIN applications a ON p.id = a.project_id
GROUP BY p.title
ORDER BY application_count;

-- ! 8. List freelancers who have certificates and the number of certificates they have.
SELECT u.username , COUNT(cd.certificate_id) AS certificate_count
FROM users u
JOIN freelancers f ON u.id = f.freelancer_id
JOIN certificate_details cd ON f.freelancer_id = cd.freelancer_id
GROUP BY u.username;

-- ! 9. Show projects with application exceeding the project budget. your query should show title , budget , proposed budget , and the difference
SELECT u.username , p.title , p.budget , ap.proposed_budget , ap.proposed_budget - p.budget AS difference
FROM users u
JOIN projects p ON u.id = p.recruiter_id
JOIN applications ap ON p.id = ap.project_id
WHERE ap.proposed_budget > p.budget;

-- ! 10. List freelancers and their average proposed budgets in applications . Order by the average
SELECT u.username , AVG(ap.proposed_budget) AS average_proposed_budget
FROM users u
JOIN freelancers f ON u.id = f.freelancer_id
JOIN applications ap ON f.freelancer_id = ap.freelancer_id
GROUP BY u.username
ORDER BY average_proposed_budget DESC;

-- ! 11. Find all recruiters who posted projects but have no verified account
SELECT u.username
FROM users u 
JOIN recruiters r ON u.id = r.recruiter_id
WHERE u.is_verified = 0
AND u.id IN (SELECT recruiter_id FROM projects);

-- ! 12. Top 3 recruiters with most projects posted.
SELECT u.username 
FROM users u
JOIN recruiters r ON u.id = r.recruiter_id
JOIN projects p ON r.recruiter_id = p.recruiter_id
GROUP BY u.username
ORDER BY COUNT(p.id) DESC
LIMIT 3;

-- ! 13. List freelancers who have certificates from a specific provider (Harvard Online) and applied to projects over 5000 budget
SELECT u.username
FROM users u
JOIN freelancers f ON u.id = f.freelancer_id
JOIN applications ap ON f.freelancer_id = ap.freelancer_id
JOIN certificate_details cd ON f.freelancer_id = cd.freelancer_id
JOIN certificates c ON cd.certificate_id = c.id
JOIN certificate_providers cp ON c.provider_id = cp.id
WHERE cp.name = 'Harvard Online'
AND ap.proposed_budget > 5000;
-- WHERE cd.certificate_id IN (SELECT id FROM certificates WHERE provider_id = (SELECT id FROM certificate_providers WHERE name = 'Harvard Online'))
-- AND f.freelancer_id IN (SELECT freelancer_id FROM applications WHERE proposed_budget > 5000);


-- ! 14. Find projects where no freelancer applied
SELECT id , title FROM projects WHERE id NOT IN (SELECT project_id FROM applications);

-- ! 15. List freelancerss with their top 3 highest proposed budgets in applications.
SELECT u.username , ap.proposed_budget
FROM users u
JOIN freelancers f ON u.id = f.freelancer_id
JOIN applications ap ON f.freelancer_id = ap.freelancer_id
GROUP BY u.username;