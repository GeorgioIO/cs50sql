CREATE TABLE meteo_temp (
    name TEXT,
    id INTEGER,
    nametype TEXT,
    class TEXT,
    mass NUMERIC,
    discovery TEXT,
    year INTEGER,
    lat NUMERIC,
    long NUMERIC
);

.import --csv meteorites.csv --skip 1 meteo_temp

UPDATE meteo_temp
SET mass = NULLIF(mass, ''),
    year = NULLIF(year, ''),
    lat  = NULLIF(lat, ''),
    long = NULLIF(long, '');

UPDATE meteo_temp SET mass = ROUND(mass,2) , lat = ROUND(lat,2) , long = ROUND(long,2);

DELETE FROM meteo_temp WHERE nametype = 'Relict';

CREATE TABLE meteorites (
    id INTEGER,
    name TEXT,
    class TEXT,
    mass NUMERIC,
    discovery TEXT,
    year INTEGER,
    lat NUMERIC,
    long NUMERIC,
    PRIMARY KEY (id)
);

INSERT INTO meteorites (id , name, class , mass , discovery , year , lat , long)
SELECT  id , name, class , mass , discovery , year , lat , long FROM meteo_temp ORDER BY year , name ;

