USE dbms_placements;

-- SUBQUERIES PRACTICE QUESTIONS

/*
				
	Q1. Find out the Phone With Highest Price Without Using ORDER BY 
    Q2. Number of phones having above average rating
    Q3. Highest rated phone for the samsung brand
    Q4. Cheapest Phone of Each Brand
    Q5. Highest rated phone for the Each Brand
*/

SELECT * FROM smartphones WHERE price = (SELECT MAX(price) FROM smartphones);

SELECT * FROM smartphones WHERE rating > (SELECT AVG(rating) FROM smartphones);

SELECT * FROM smartphones WHERE rating = (SELECT MAX(rating) FROM smartphones) AND  brand_name LIKE 'samsung' ORDER BY price LIMIT 1 ;

SELECT brand_name,model,price FROM smartphones WHERE (brand_name,price) IN (SELECT  brand_name , MIN(price) FROM smartphones GROUP BY brand_name) ORDER BY brand_name;

SELECT brand_name,model,rating FROM smartphones WHERE (brand_name,rating) IN ( SELECT brand_name,MAX(rating) FROM smartphones 
GROUP BY brand_name) ORDER BY brand_name;


 
