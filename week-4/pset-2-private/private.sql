-- Reset with every .read
DROP TABLE IF EXISTS paper;
DROP VIEW IF EXISTS message;
DROP TABLE IF EXISTS ciphered_texts;

-- Creating a paper table where i will store the code
CREATE TABLE paper (
    id INTEGER,
    starting_letter INTEGER NOT NULL CHECK ( starting_letter >= 0),
    len INTEGER NOT NULL CHECK ( len > 0),
    PRIMARY KEY (id)
);

-- Creating table ciphered_texts that the view will watch
CREATE TABLE ciphered_texts (
    id INTEGER,
    phrase TEXT NOT NULL,
    PRIMARY KEY (id)
);

-- Creating a trigger called decode whenever we INSERT on paper it will parse the given text
CREATE TRIGGER decode
AFTER INSERT ON paper
FOR EACH ROW
BEGIN
    -- Here we insert in ciphered_texts , the result of substr(sentence , starting_letter , len) ONLY WHERE we find that sentence id equals to our paper id
    INSERT INTO ciphered_texts (phrase)
    VALUES
    ((SELECT substr(sentence , NEW.starting_letter , NEW.len)
    FROM sentences
    WHERE id = NEW.id));
END;

-- Inserting into papers (where everythings happens)
INSERT INTO paper (id , starting_letter , len)
VALUES
(14 , 98 , 4),
(114 , 3 , 5),
(618 , 72 , 9),
(630 , 7 , 3),
(932 , 12 , 5),
(2230 , 50 , 7),
(2346 , 44 , 10),
(3041 , 14 , 5);

-- The exercise view
CREATE VIEW message AS
SELECT id , phrase FROM ciphered_texts;
