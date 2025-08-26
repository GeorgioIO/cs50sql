
-- *** The Lost Letter ***
-- Get Anneke address id
SELECT id FROM addresses WHERE address = '900 Somerville Avenue';

-- Get Varsha address id
SELECT id FROM addresses WHERE address LIKE '% Finn%';

-- Get the id of the package that match both addresses
SELECT p.id
FROM packages p
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE a1.address = '900 Somerville Avenue'
  AND a2.address LIKE '%Finn%';

-- Get address_id where letter end up ordering by timestamp to get the latest limiting by 1 to get the first
-- SELECT address_id
-- FROM scans
-- WHERE package_id = (SELECT id
-- FROM packages
-- WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
-- AND to_address_id = (SELECT id FROM addresses WHERE address LIKE '% Finn%'))
-- AND action = 'Drop'
-- ORDER BY timestamp DESC
-- LIMIT 1;

SELECT address_id
FROM scans s
JOIN packages p ON s.package_id = p.id
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE s.action = 'Drop'
AND a1.address = '900 Somerville Avenue'
AND a2.address LIKE '% Finn%'
ORDER BY s.timestamp DESC
LIMIT 1;

-- Get type of the address where the letter end up
-- SELECT type FROM addresses WHERE id = (SELECT address_id
-- FROM scans
-- WHERE package_id = (SELECT id
-- FROM packages
-- WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
-- AND to_address_id = (SELECT id FROM addresses WHERE address LIKE '% Finn%'))
-- AND action = 'Drop'
-- ORDER BY timestamp DESC
-- LIMIT 1);
SELECT a.type
FROM addresses a
JOIN scans s ON a.id = s.address_id
JOIN packages p ON s.package_id = p.id
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE s.action = 'Drop'
AND a1.address = '900 Somerville Avenue'
AND a2.address LIKE '% Finn%'
ORDER BY s.timestamp DESC
LIMIT 1;

-- Get address of where the letter end up
-- SELECT address FROM addresses WHERE id = (SELECT type FROM addresses WHERE id = (SELECT address_id
-- FROM scans
-- WHERE package_id = (SELECT id
-- FROM packages
-- WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
-- AND to_address_id = (SELECT id FROM addresses WHERE address LIKE '% Finn%'))
-- AND action = 'Drop'
-- ORDER BY timestamp DESC
-- LIMIT 1));
SELECT a.address
FROM addresses a
JOIN scans s ON a.id = s.address_id
JOIN packages p ON s.package_id = p.id
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE s.action = 'Drop'
AND a1.address = '900 Somerville Avenue'
AND a2.address LIKE '% Finn%'
ORDER BY s.timestamp DESC
LIMIT 1;



-- *** The Devious Delivery ***
-- Get information on a package that has no from_address_id
SELECT *  FROM packages WHERE from_address_id IS NULL;
-- Get the id
SELECT id , contents FROM packages WHERE from_address_id IS NULL;

-- Get information from scans for that package id
SELECT *
FROM scans s
JOIN packages p ON s.package_id = p.id
WHERE p.from_address_id IS NULL;

-- Get the id of last row based on timestamp and where action = 'Drop' to see where it end up
SELECT s.address_id
FROM scans s
JOIN packages p ON s.package_id = p.id
WHERE p.from_address_id IS NULL
AND s.action = 'Drop'
ORDER BY s.timestamp DESC
LIMIT 1;

SELECT a.type
FROM addresses a
JOIN scans s ON a.id = s.address_id
JOIN packages p ON s.package_id = p.id
WHERE p.from_address_id IS NULL
AND s.action = 'Drop'
ORDER BY s.timestamp DESC
LIMIT 1;

-- *** The Forgotten Gift ***
-- Get package information (content) where to_address_id = '728 Maple Place' and from = '109 Tileston Sreet'
SELECT *
FROM packages p
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE a1.address = '109 Tileston Street'
AND a2.address = '728 Maple Place';

-- Get the latest driver name of the package
SELECT d.name
FROM drivers d
JOIN scans s ON d.id = s.driver_id
JOIN packages p ON s.package_id = p.id
JOIN addresses a1 ON p.from_address_id = a1.id
JOIN addresses a2 ON p.to_address_id = a2.id
WHERE a1.address = '109 Tileston Street'
AND a2.address = '728 Maple Place'
ORDER BY s.timestamp DESC
LIMIT 1;
