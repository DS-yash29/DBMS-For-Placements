USE dbms_placement;


-- FETCH TOP 
SELECT brand_name,model,price FROM smartphones
LIMIT 5;

-- ORDER BY 
-- -> Below Query Fetches Top 10 Smartphones With Highest Price;
SELECT * FROM smartphones 
ORDER BY price DESC
LIMIT 10;


/*
Aggregate Functions
	1. Sum
    2. Min
    3. Max
    4. Avg
    5. Count
*/
-- Total Apple Models
SELECT COUNT(*) AS "Total Apple Phones" FROM smartphones
WHERE brand_name LIKE "apple";


-- Average , Maximum & Minimum Price of 5G Smartphones
SELECT avg(price) AS "Average Price",max(price) AS "Maximum Price" , min(price) AS "Minimum Price" FROM smartphones
WHERE has_5g = "TRUE";