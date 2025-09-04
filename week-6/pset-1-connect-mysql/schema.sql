CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    username VARCHAR(25) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE schools (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL UNIQUE,
    type ENUM('Primary','Secondary','Higher Education') NOT NULL,
    location VARCHAR(25) NOT NULL,
    founding_year YEAR NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE companies (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL UNIQUE,
    industry ENUM('Technology','Education','Business') NOT NULL,
    location VARCHAR(25) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE follows (
    user_follows_id INT UNSIGNED,
    user_followed_id INT UNSIGNED,
    FOREIGN KEY (user_follows_id) REFERENCES users (id),
    FOREIGN KEY (user_followed_id) REFERENCES users (id)
);

CREATE TABLE school_affiliation (
  id INT UNSIGNED AUTO_INCREMENT,
  user_id INT UNSIGNED,
  school_id INT UNSIGNED,
  start_date DATE NOT NULL,
  end_date DATE,
  degree_type VARCHAR(25) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (school_id) REFERENCES schools (id)
);

CREATE TABLE company_affiliation (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED,
    company_id INT UNSIGNED,
    start_date DATE NOT NULL,
    end_date DATE,
    title VARCHAR(25) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users (id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
)

-- sqlite3
-- CREATE TABLE users (
--     id INTEGER,
--     first_name TEXT NOT NULL,
--     last_name TEXT NOT NULL,
--     username TEXT NOT NULL UNIQUE,
--     password TEXT NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE schools (
--     id INTEGER,
--     name TEXT NOT NULL UNIQUE,
--     type TEXT NOT NULL CHECK(type IN ('Elementary School','Middle School','High School','Lower School','Upper School','College','University')),
--     location TEXT NOT NULL,
--     founding_year INTEGER NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE companies (
--     id INTEGER,
--     name TEXT NOT NULL UNIQUE,
--     industry TEXT NOT NULL,
--     location TEXT NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE follows (
--     user_follows_id INTEGER,
--     user_followed_id INTEGER,
--     FOREIGN KEY (user_follows_id) REFERENCES users (id),
--     FOREIGN KEY (user_followed_id) REFERENCES users (id)
-- );

-- CREATE TABLE school_affiliation (
--     id INTEGER,
--     user_id INTEGER,
--     school_id INTEGER,
--     start_date NUMERIC NOT NULL,
--     end_date NUMERIC NOT NULL,
--     degree_type TEXT NOT NULL,
--     PRIMARY KEY (id),
--     FOREIGN KEY (user_id) REFERENCES users (id),
--     FOREIGN KEY (school_id) REFERENCES schools (school_id)
-- );

-- CREATE TABLE company_affiliation (
--     id INTEGER,
--     user_id INTEGER,
--     company_id INTEGER,
--     start_date NUMERIC NOT NULL,
--     end_date NUMERIC NOT NULL,
--     title TEXT NOT NULL,
--     PRIMARY KEY(id),
--     FOREIGN KEY(user_id) REFERENCES users (id),
--     FOREIGN KEY(company_id) REFERENCES companies(id)
-- );

