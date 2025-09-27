CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL UNIQUE,
    email VARCHAR(32) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    date_joined TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_verified TINYINT(1) NOT NULL DEFAULT 0,
    bio LONGTEXT,
    user_type enum('FREELANCER','RECRUITER') NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE freelancers (
     freelancer_id INT UNSIGNED,
     role VARCHAR(32) NOT NULL,
     availability_status TINYINT(1) NOT NULL DEFAULT 0,
     projects_counts INT NOT NULL DEFAULT 0 CHECK(projects_counts >= 0),
     PRIMARY KEY (freelancer_id),
     FOREIGN KEY (freelancer_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE recruiters (
    recruiter_id INT UNSIGNED,
    company_name VARCHAR(28) NOT NULL UNIQUE,
    industry ENUM('Technology','Design','Marketing','Finance','Education','Healthcare','Legal','Engineering','Media','Other') NOT NULL DEFAULT 'Other',
    PRIMARY KEY(recruiter_id),
    FOREIGN KEY(recruiter_id) REFERENCES users(id) ON DELETE CASCADE 
);

CREATE TABLE projects (
    id INT UNSIGNED AUTO_INCREMENT,
    recruiter_id INT UNSIGNED NOT NULL,
    title VARCHAR(20) NOT NULL,
    description LONGTEXT NOT NULL,
    budget DECIMAL(10,2) NOT NULL CHECK(budget != 0),
    deadline TIMESTAMP NOT NULL ,
    status ENUM('OPEN','IN_PROGRESS','UNDER_REVIEW','CANCELED','DELETED') NOT NULL DEFAULT 'OPEN',
    deleted TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY(id),
    FOREIGN KEY(recruiter_id) REFERENCES recruiters(recruiter_id)
);

CREATE TABLE saved_projects (
    freelancer_id INT UNSIGNED NOT NULL,
    project_id INT UNSIGNED NOT NULL,
    saved_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(freelancer_id , project_id),
    FOREIGN KEY(freelancer_id) REFERENCES freelancers(freelancer_id),
    FOREIGN KEY(project_id) REFERENCES projects(id)
); 



CREATE TABLE skill_categories (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE skills (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL UNIQUE,
    category_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (category_id) REFERENCES skill_categories (id)
);

CREATE TABLE freelancer_skills (
    skill_id INT UNSIGNED,
    freelancer_id INT UNSIGNED,
    PRIMARY KEY (skill_id , freelancer_id),
    FOREIGN KEY (skill_id) REFERENCES skills (id),
    FOREIGN KEY (freelancer_id) REFERENCES freelancers (freelancer_id)
);

CREATE TABLE certificate_providers (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE certificates (
    id INT UNSIGNED AUTO_INCREMENT,
    provider_id INT UNSIGNED NULL,
    name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (provider_id) REFERENCES certificate_providers (id)
);

CREATE TABLE certificate_details (
    freelancer_id INT UNSIGNED NOT NULL,
    certificate_id INT UNSIGNED NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (freelancer_id , certificate_id),
    FOREIGN KEY (freelancer_id) REFERENCES freelancers(freelancer_id),
    FOREIGN KEY (certificate_id) REFERENCES certificates (id)
);

CREATE TABLE applications (
    id INT UNSIGNED AUTO_INCREMENT,
    project_id INT UNSIGNED NOT NULL,
    freelancer_id INT UNSIGNED NOT NULL,
    cover_letter LONGTEXT NOT NULL,
    proposed_budget DECIMAL(10,2) NOT NULL CHECK (proposed_budget > 0),
    proposed_deadline TIMESTAMP NOT NULL,
    application_status enum('PENDING','ACCEPTED','REJECTED','WITHDRAWN') NOT NULL DEFAULT 'PENDING',
    submission_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(project_id) REFERENCES projects(id),
    FOREIGN KEY(freelancer_id) REFERENCES freelancers(freelancer_id)
);

CREATE INDEX usernames_index ON users (username);
CREATE INDEX emails_index ON users (email);
CREATE INDEX projects_status_index ON projects (status);
CREATE INDEX skills_name_index ON skills (name);
CREATE INDEX certificate_providers_index ON certificate_providers(name);

CREATE VIEW current_projects AS
SELECT * FROM projects WHERE deleted = 0;

-- Trigger to make sure application deadlines and budgets are correct
DELIMITER $$

CREATE TRIGGER application_constraints
BEFORE INSERT ON applications
FOR EACH ROW
BEGIN
    DECLARE project_deadline TIMESTAMP;
    DECLARE project_budget DECIMAL(10,2);

    SELECT deadline , budget 
    INTO project_deadline, project_budget
    FROM projects
    WHERE id = NEW.project_id;

    IF NEW.proposed_deadline > project_deadline  THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Proposed Deadline Can not be after the project asked deadline';
    END IF;
END$$

DELIMITER ;

-- Creating two procedure one to add freelancer , one to add recruiter
DELIMITER $$
CREATE PROCEDURE add_freelancer(
    IN p_username VARCHAR(32), 
    IN p_email VARCHAR(32), 
    IN p_password VARCHAR(128),
    IN p_bio LONGTEXT,
    IN p_role VARCHAR(32),

    -- Optional  
    IN p_date_joined TIMESTAMP,
    IN p_is_verified TINYINT(1)    
    )
BEGIN
    INSERT INTO users (username , email , password , date_joined , is_verified , bio , user_type)
    VALUES
    (p_username, 
     p_email, 
     p_password, 
     IFNULL(p_date_joined , CURRENT_TIMESTAMP),
     IFNULL(p_is_verified , 0), 
     p_bio,
     'FREELANCER');

     INSERT INTO freelancers(freelancer_id , role)
     VALUES
     (LAST_INSERT_ID() , p_role);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_recruiter(
    IN p_username VARCHAR(32),
    IN p_email VARCHAR(32),
    IN p_password VARCHAR(128),
    IN p_date_joined TIMESTAMP,
    IN p_is_verified TINYINT(1),
    IN p_bio LONGTEXT,
    IN p_company_name VARCHAR(28),
    IN p_industry VARCHAR(28)
)
BEGIN
    INSERT INTO users (username , email, password , date_joined, is_verified , bio , user_type)
    VALUES
    (p_username,
     p_email,
     p_password,
     IFNULL(p_date_joined , CURRENT_TIMESTAMP),
     IFNULL(p_is_verified , 0),
     p_bio,
     'RECRUITER');

     INSERT INTO recruiters (recruiter_id , company_name , industry)
     VALUES
     (LAST_INSERT_ID() , p_company_name , p_industry);
END$$

DELIMITER ;


