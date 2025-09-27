USE freelancing_platform

-- Populate skill_categories
INSERT INTO skill_categories (name) VALUES
('Web Development'),
('Mobile Development'),
('Data Science'),
('Machine Learning'),
('Artificial Intelligence'),
('Cybersecurity'),
('Cloud Computing'),
('DevOps'),
('Blockchain'),
('Game Development'),
('Database Management'),
('UI/UX Design'),
('E-commerce'),
('Embedded Systems'),
('AR/VR Development'),
('Software Testing'),
('IT Support'),
('Networking'),
('Business Intelligence'),
('Automation'),
('IoT'),
('Digital Marketing'),
('SEO'),
('Content Writing'),
('Graphic Design'),
('Video Editing'),
('3D Modeling'),
('Animation'),
('Project Management'),
('Consulting');

-- Populate skills
INSERT INTO skills (name, category_id) VALUES
('HTML', 1),
('CSS', 1),
('JavaScript', 1),
('React', 1),
('Angular', 1),
('Swift', 2),
('Kotlin', 2),
('Flutter', 2),
('SQL', 11),
('MongoDB', 11),
('Python', 3),
('R', 3),
('TensorFlow', 4),
('PyTorch', 4),
('Scikit-learn', 3),
('Cybersecurity Basics', 6),
('Penetration Testing', 6),
('AWS', 7),
('Azure', 7),
('Docker', 8),
('Kubernetes', 8),
('Solidity', 9),
('Unity', 10),
('Unreal Engine', 10),
('Figma', 12),
('Adobe XD', 12),
('Photoshop', 25),
('Illustrator', 25),
('After Effects', 26),
('Blender', 27);

-- Populate certificate_providers
INSERT INTO certificate_providers (name) VALUES
('Coursera'),
('Udemy'),
('edX'),
('LinkedIn Learning'),
('Google'),
('Microsoft'),
('AWS'),
('IBM'),
('Cisco'),
('Oracle'),
('Harvard Online'),
('Stanford Online'),
('Khan Academy'),
('Pluralsight'),
('DataCamp');

-- Populate Certificates
INSERT INTO certificates (provider_id, name) VALUES
(1, 'Python for Everybody'),
(1, 'Machine Learning'),
(2, 'Web Development Bootcamp'),
(2, 'Java Programming Masterclass'),
(3, 'Data Science Essentials'),
(4, 'Project Management Foundations'),
(5, 'Google Analytics'),
(5, 'Google Cloud Fundamentals'),
(6, 'Microsoft Azure Fundamentals'),
(6, 'Microsoft Excel Expert'),
(7, 'AWS Solutions Architect'),
(7, 'AWS Developer Associate'),
(8, 'IBM Data Science Professional'),
(9, 'Cisco Networking Essentials'),
(10,'Oracle Database Administrator'),
(11,'Harvard CS50x'),
(11,'Harvard CS50sql'),
(11,'Harvard CS50p'),
(11,'Harvard CS50ai'),
(12,'Stanford AI Certificate'),
(13,'Khan Academy Programming Basics'),
(14,'Pluralsight JavaScript Fundamentals'),
(15,'DataCamp Pandas Foundations');

-- Populate Freelancers
CALL add_freelancer('alice_dev','alice@example.com','pass123','Frontend developer with 3 years of experience.','Web Developer' , NULL , 1);
CALL add_freelancer('bob_data','bob@example.com','pass123','Data enthusiast specialized in analytics.','Data Analyst' , NULL , NULL);
CALL add_freelancer('carol_design','carol@example.com','pass123','Creative UX/UI designer.','UI/UX Designer' , NULL , 1);
CALL add_freelancer('dan_fullstack','dan@example.com','pass123','Fullstack developer with expertise in Python and JS.','Fullstack Developer' , NULL , 1);
CALL add_freelancer('eve_ai','eve@example.com','pass123','Machine learning specialist focusing on NLP.','AI Engineer' , NULL , 1);
CALL add_freelancer('frank_backend','frank@example.com','pass123','Backend developer with Java and SQL experience.','Backend Developer' , NULL , 1);
CALL add_freelancer('grace_mobile','grace@example.com','pass123','Mobile app developer for iOS and Android.','Mobile Developer' , NULL , NULL);
CALL add_freelancer('hank_cloud','hank@example.com','pass123','Cloud solutions architect with AWS expertise.','Cloud Engineer' , NULL , NULL);
CALL add_freelancer('irene_graphics','irene@example.com','pass123','Graphic designer with branding experience.','Graphic Designer' , NULL , 1);
CALL add_freelancer('jack_cyber','jack@example.com','pass123','Cybersecurity analyst focused on network security.','Cybersecurity Specialist' , NULL , NULL);
CALL add_freelancer('kate_frontend','kate@example.com','pass123','Frontend developer specializing in React.js.','Web Developer' , NULL , NULL);
CALL add_freelancer('leo_data','leo@example.com','pass123','Data scientist with experience in machine learning models.','Data Scientist' , NULL , NULL);
CALL add_freelancer('maya_design','maya@example.com','pass123','UI/UX designer passionate about clean interfaces.','UI/UX Designer' , NULL , 1);
CALL add_freelancer('nate_fullstack','nate@example.com','pass123','Fullstack engineer experienced in Node.js and Vue.','Fullstack Developer' , NULL , NULL);
CALL add_freelancer('olivia_ai','olivia@example.com','pass123','AI engineer working with TensorFlow and PyTorch.','AI Engineer' , NULL , 1);
CALL add_freelancer('paul_backend','paul@example.com','pass123','Backend developer skilled in PHP and MySQL.','Backend Developer' , NULL , 1);
CALL add_freelancer('quinn_mobile','quinn@example.com','pass123','Android and iOS app developer.','Mobile Developer' , NULL , 1);
CALL add_freelancer('rachel_cloud','rachel@example.com','pass123','Cloud infrastructure engineer with Azure skills.','Cloud Engineer' , NULL , NULL);
CALL add_freelancer('sam_graphics','sam@example.com','pass123','Branding and illustration graphic designer.','Graphic Designer' , NULL , 1);
CALL add_freelancer('tina_cyber','tina@example.com','pass123','Cybersecurity expert for web applications.','Cybersecurity Specialist' , NULL , 1);
CALL add_freelancer('uma_frontend','uma@example.com','pass123','Frontend developer with Angular expertise.','Web Developer' , NULL , NULL);
CALL add_freelancer('victor_data','victor@example.com','pass123','Data analyst proficient in SQL and Excel.','Data Analyst' , NULL , NULL);
CALL add_freelancer('wendy_design','wendy@example.com','pass123','Creative designer for mobile and web apps.','UI/UX Designer' , NULL , NULL);
CALL add_freelancer('xander_fullstack','xander@example.com','pass123','Fullstack developer experienced in MERN stack.','Fullstack Developer' , NULL , NULL);
CALL add_freelancer('yvonne_ai','yvonne@example.com','pass123','AI engineer focused on computer vision projects.','AI Engineer' , NULL , 1);
CALL add_freelancer('zack_backend','zack@example.com','pass123','Backend developer specializing in REST APIs.','Backend Developer' , NULL , NULL);


-- Populate Recruiters
CALL add_recruiter('techcorp','hr@techcorp.com','pass123', NULL , 1 , 'Leading technology company.','TechCorp','Technology'  );
CALL add_recruiter('market_inc','hr@marketinc.com','pass123', NULL , NULL ,'Marketing agency specialized in digital campaigns.','Market Inc','Marketing' );
CALL add_recruiter('edu_world','hr@eduworld.com','pass123', NULL , 1 ,'Education services company.','EduWorld','Education' );
CALL add_recruiter('finbank','hr@finbank.com','pass123', NULL , NULL ,'Banking and finance services.','FinBank','Finance' );
CALL add_recruiter('healthplus','hr@healthplus.com','pass123', NULL , 1 ,'Healthcare and medical services.','HealthPlus','Healthcare' );
CALL add_recruiter('lawgroup','hr@lawgroup.com','pass123', NULL , NULL ,'Legal consultancy and services.','LawGroup','Legal' );
CALL add_recruiter('engineerhub','hr@engineerhub.com','pass123', NULL , 1 ,'Engineering solutions provider.','EngineerHub','Engineering' );
CALL add_recruiter('mediaworld','hr@mediaworld.com','pass123', NULL , NULL ,'Media production and entertainment.','MediaWorld','Media' );
CALL add_recruiter('designstudio','hr@designstudio.com','pass123', NULL , 1 ,'Creative design agency.','DesignStudio','Design' );
CALL add_recruiter('techinnovate','hr@techinnovate.com','pass123', NULL , NULL ,'Innovative tech startup.','TechInnovate','Technology' );
CALL add_recruiter('eduplus','hr@eduplus.com','pass123', NULL , 1 ,'Educational platforms and services.','EduPlus','Education' );
CALL add_recruiter('finconsult','hr@finconsult.com','pass123', NULL , 1 ,'Financial consultancy and planning.','FinConsult','Finance' );
CALL add_recruiter('medicare','hr@medicare.com','pass123', NULL , NULL ,'Healthcare solutions and software.','MediCare','Healthcare' );
CALL add_recruiter('lawassist','hr@lawassist.com','pass123', NULL , 1 ,'Legal assistance and advisory services.','LawAssist','Legal' );
CALL add_recruiter('creativehub','hr@creativehub.com','pass123',NULL , 1 ,'Design and creative consultancy.','CreativeHub','Design' );

-- Populate Projects
INSERT INTO projects (recruiter_id, title, description, budget, deadline) VALUES
(27, 'Website Redesign', 'Redesign company website with modern UI/UX.', 5000.00, '2025-11-30 23:59:59'),
(28, 'Social Media Ads', 'Create ad campaigns for social media platforms.', 3000.00, '2025-12-10 23:59:59'),
(29, 'E-Learning App', 'Develop an app for online education content.', 10000.00, '2025-12-20 23:59:59'),
(30, 'Investment Analysis', 'Analyze investment portfolios for clients.', 7500.00, '2025-11-25 23:59:59'),
(31, 'Health Tracking', 'Build a system for patient health tracking.', 8500.00, '2025-12-15 23:59:59'),
(32, 'Legal Database', 'Develop a database for legal case management.', 6000.00, '2025-12-05 23:59:59'),
(33, 'Bridge Design', 'Design structural blueprints for bridges.', 12000.00, '2025-12-30 23:59:59'),
(34, 'Video Production', 'Produce promotional videos for social media.', 4500.00, '2025-11-28 23:59:59'),
(35, 'Branding Package', 'Create brand identity and marketing materials.', 4000.00, '2025-12-12 23:59:59'),
(36, 'AI Chatbot', 'Develop an AI-powered customer support chatbot.', 9000.00, '2025-12-18 23:59:59'),
(37, 'Learning Platform', 'Build online platform for virtual courses.', 11000.00, '2025-12-22 23:59:59'),
(38, 'Financial Model', 'Create financial forecasting models.', 7000.00, '2025-12-08 23:59:59'),
(39, 'Telemedicine App', 'Develop mobile app for remote consultations.', 9500.00, '2025-12-19 23:59:59'),
(40, 'Legal Website', 'Design website for legal services firm.', 3500.00, '2025-11-29 23:59:59'),
(40, 'Logo & UI', 'Create logo and UI for new startup.', 2500.00, '2025-12-10 23:59:59'),
(27, 'Backend API', 'Develop backend API for e-commerce platform.', 8000.00, '2025-12-21 23:59:59');

-- Populate Saved Projects
INSERT INTO saved_projects (freelancer_id, project_id) VALUES
(1, 3),
(1, 7),
(1, 2),
(1, 5),
(2, 1),
(3, 6),
(4, 8),
(4, 12),
(5, 4),
(5, 10),
(6, 9),
(6, 15),
(7, 11),
(7, 14),
(8, 3),
(8, 7),
(9, 2),
(9, 5),
(10, 1),
(10, 6),
(11, 8),
(11, 12),
(12, 4),
(12, 10),
(13, 9),
(13, 15),
(14, 11),
(14, 14),
(15, 3),
(15, 7),
(16, 2),
(16, 5),
(17, 1),
(17, 6),
(18, 8),
(18, 12),
(19, 4),
(19, 10),
(20, 9),
(20, 15),
(21, 11),
(21, 14),
(22, 3),
(22, 7),
(23, 2),
(23, 5),
(24, 1),
(24, 6),
(25, 8),
(25, 12),
(25, 4),
(25, 10);


-- Populate Applications
INSERT INTO applications (project_id, freelancer_id, cover_letter, proposed_budget, proposed_deadline, application_status)
VALUES
(1, 12, 'Experienced in responsive design and UI optimization.', 4700.00, '2025-11-29 23:59:59', 'PENDING'),
(2, 8, 'Creative graphic designer with a focus on branding.', 1900.00, '2025-10-14 23:59:59', 'PENDING'),
(3, 13, 'EdTech developer experienced with scalable platforms.', 9800.00, '2025-12-19 23:59:59', 'PENDING'),
(3, 3, 'Skilled in educational tools and performance tuning.', 9500.00, '2025-12-18 23:59:59', 'PENDING'),
(4, 6, 'Translator fluent in English and French, timely delivery.', 2800.00, '2025-09-24 23:59:59', 'PENDING'),
(5, 15, 'Digital marketer with SEO/SEM expertise.', 8400.00, '2025-12-14 23:59:59', 'PENDING'),
(6, 2, 'Mobile app developer skilled in Flutter.', 6900.00, '2025-11-19 23:59:59', 'PENDING'),
(7, 19, 'Copywriter with expertise in marketing campaigns.', 2400.00, '2025-09-29 23:59:59', 'PENDING'),
(8, 22, 'Data analyst experienced with visualization tools.', 5900.00, '2025-9-29 23:59:59', 'PENDING'),
(9, 5, 'Blockchain developer with hands-on Solidity expertise.', 11900.00, '2025-11-30 23:59:59', 'PENDING'),
(10, 18, 'Photographer with proven e-commerce product experience.', 4400.00, '2025-12-08 23:59:59', 'PENDING'),
(11, 7, 'Video editor skilled with Adobe Premiere & After Effects.', 5300.00, '2025-12-21 23:59:59', 'PENDING'),
(12, 9, 'Content writer specialized in blogs and SEO articles.', 2900.00, '2025-11-09 23:59:59', 'PENDING'),
(13, 20, 'Cybersecurity expert skilled in penetration testing.', 9400.00, '2025-12-04 23:59:59', 'PENDING');


INSERT INTO freelancer_skills (freelancer_id, skill_id) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(3, 8),
(3, 10),
(4, 6),
(5, 7),
(5, 8),
(6, 2),
(7, 9),
(8, 3),
(8, 10),
(9, 4),
(10, 1),
(11, 5),
(12, 6),
(13, 7),
(14, 8),
(15, 2),
(16, 3),
(17, 4),
(18, 5),
(19, 6),
(20, 7),
(21, 8),
(22, 9),
(23, 10),
(24, 1),
(25, 2),
(26, 3);


INSERT INTO certificate_details (freelancer_id, certificate_id, date) VALUES
(1, 1, '2025-01-15 10:00:00'),
(1, 5, '2025-02-20 11:30:00'),
(2, 2, '2025-03-10 09:45:00'),
(2, 6, '2025-04-12 14:20:00'),
(3, 3, '2025-01-25 12:15:00'),
(3, 7, '2025-02-28 15:40:00'),
(4, 4, '2025-05-05 08:00:00'),
(5, 8, '2025-03-18 16:30:00'),
(5, 9, '2025-04-22 13:00:00'),
(6, 10, '2025-06-12 10:50:00'),
(7, 11, '2025-07-01 11:10:00'),
(8, 12, '2025-08-20 09:30:00'),
(9, 13, '2025-02-14 14:25:00'),
(10, 14, '2025-01-08 10:05:00'),
(11, 15, '2025-03-30 12:40:00'),
(12, 16, '2025-05-15 16:55:00'),
(13, 17, '2025-06-25 08:15:00'),
(14, 18, '2025-07-12 09:45:00'),
(15, 19, '2025-08-05 14:35:00'),
(16, 20, '2025-09-01 13:20:00'),
(17, 21, '2025-02-18 10:10:00'),
(18, 22, '2025-04-08 15:50:00'),
(19, 23, '2025-06-20 11:00:00'),
(20, 1, '2025-07-25 12:25:00'),
(21, 2, '2025-08-15 09:55:00'),
(22, 3, '2025-09-05 14:15:00'),
(23, 4, '2025-01-22 10:40:00'),
(24, 5, '2025-03-12 13:35:00'),
(25, 6, '2025-04-28 15:10:00'),
(26, 7, '2025-06-03 11:50:00');
