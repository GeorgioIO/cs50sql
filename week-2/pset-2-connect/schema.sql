CREATE TABLE users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE schools (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    type TEXT NOT NULL CHECK(type IN ('Elementary School','Middle School','High School','Lower School','Upper School','College','University')),
    location TEXT NOT NULL,
    founding_year INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE companies (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    industry TEXT NOT NULL,
    location TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE follows (
    user_follows_id INTEGER,
    user_followed_id INTEGER,
    FOREIGN KEY (user_follows_id) REFERENCES users (id),
    FOREIGN KEY (user_followed_id) REFERENCES users (id)
);

CREATE TABLE school_affiliation (
    id INTEGER,
    user_id INTEGER,
    school_id INTEGER,
    start_date NUMERIC NOT NULL,
    end_date NUMERIC NOT NULL,
    degree_type TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (school_id) REFERENCES school (school_id)
);

CREATE TABLE company_affiliation (
    id INTEGER,
    user_id INTEGER,
    company_id INTEGER,
    start_date NUMERIC NOT NULL,
    end_date NUMERIC NOT NULL,
    title TEXT NOT NULL
);

