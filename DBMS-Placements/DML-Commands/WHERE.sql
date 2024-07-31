USE dbms_placements;

-- Conditional Queries

SELECT model,price FROM smartphones
WHERE brand_name = "Oneplus";

-- Different Operators in MySQL

-- 1. Inequality
SELECT model,price FROM smartphones
WHERE price>=50000;

SELECT * FROM smartphones
WHERE rating < 70;

-- 2. LIKE COMMAND
SELECT * FROM smartphones
WHERE brand_name LIKE "Oppo";

-- 3. BETWEEN COMMAND
SELECT DISTINCT brand_name FROM smartphones
WHERE battery_capacity BETWEEN 5800 AND 7000;

-- 4. IN COMMAND
SELECT * FROM smartphones
WHERE processor_brand IN ("snapdragon","bionic") AND brand_name IN ("Oneplus","Apple");


-- 5. AND/OR/NOT COMMAND
SELECT model,price FROM smartphones 
WHERE ram_capacity < 8 AND internal_memory >= 128;

SELECT * FROM smartphones
WHERE processor_brand = 'Dimensity' OR brand_name LIKE 'apple';

SELECT model,price FROM smartphones
WHERE NOT brand_name IN ("apple","Oneplus","oppo","realme");

-- ORDER BY -> Used In Ordering / Sorting the result
SELECT model,price,rating FROM smartphones
WHERE ram_capacity BETWEEN 4 AND 6
ORDER BY price DESC;

