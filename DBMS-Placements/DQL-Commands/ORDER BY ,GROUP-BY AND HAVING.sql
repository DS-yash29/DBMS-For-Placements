-- GROUPINGS  & SORTING
USE dbms_placements;


/*
	Problems Based On Sorting
	1. Top 5 Samsung Phones With Biggest Screen Size
    2. Phones in the decreasing order of number of cameras
    3. Phones Sorted based on PPI
    4. Phone with the second largest battery
    5. Details of worst rated oneplus model
    6. SELECT ALL Phones Alphabetically and then on the basis of price in reverse order
    7. SELECT ALL Phones Alphabetically and then on the basis of rating
*/
SELECT model,price,screen_size FROM smartphones
WHERE brand_name = 'samsung'
ORDER BY screen_size DESC
LIMIT 5;

SELECT * FROM smartphones
ORDER BY (num_front_cameras + num_rear_cameras) DESC ;

SELECT model , (sqrt(pow(resolution_width,2) + pow(resolution_height,2)))/screen_size AS 'PPI' FROM smartphones
ORDER BY PPI DESC;

SELECT model,price FROM smartphones
ORDER BY price DESC
LIMIT 1,1;

SELECT * FROM smartphones
WHERE brand_name LIKE 'oneplus'
ORDER BY rating ASC LIMIT 1;

SELECT * FROM smartphones
ORDER BY model ASC, price DESC;

SELECT * FROM smartphones
ORDER BY model,rating ;

/*
	PROBLEMS BASED ON GROUPING
    1. For Every Brand -> Get the total no of models , averge price , max rating , avg screen size and battery capacity
    2. Group Based on NFC Availability -> Get Avg Price & Rating
	3. Group Based on Brand & processor -> get total models & avg price
    4. Find top 5 Most Costly Brand
    5. Average Price of Phones with more than 20 models
    6. Top 3 Brands With Highest Average RAM
    7. Brands with average rating > 70 and total_models>10 and are 5g enables
*/

SELECT COUNT(*) AS 'Total_models', ROUND(AVG(price),2) AS 'Average-Price' , MAX(rating) AS 'Max-Rating' , 
ROUND(AVG(screen_size),2) AS 'Average-Screen-Size' , ROUND(AVG(battery_capacity),2) AS 'Average-Battery' 
FROM smartphones
GROUP BY brand_name
HAVING Total_models>=10;

SELECT has_nfc,ROUND(AVG(price),2) AS 'Average Price' , ROUND(AVG(rating),2)
AS 'Average Rating' FROM smartphones
GROUP BY has_nfc;

 SELECT brand_name,processor_brand , COUNT(*) AS 'Total Models', AVG(rating) AS 'Average_Rating' FROM smartphones
 GROUP BY brand_name,processor_brand
 ORDER BY brand_name ASC ,processor_brand ASC,Average_Rating DESC;

SELECT brand_name , ROUND(AVG(price),2) AS 'Average_Price' FROM smartphones
GROUP BY brand_name
ORDER BY Average_Price DESC
LIMIT 5;

SELECT brand_name, ROUND(AVG(price),2) AS 'Average_Price' FROM smartphones
GROUP BY brand_name
HAVING COUNT(*)>=20
ORDER BY brand_name;

SELECT brand_name,ROUND(AVG(ram_capacity),2) AS 'Average_Ram'  FROM smartphones
WHERE refresh_rate > 90 AND fast_charging_available = 1 
GROUP BY brand_name
HAVING COUNT(*) >= 10
ORDER BY Average_Ram DESC
LIMIT 3;

SELECT brand_name,ROUND(AVG(price),2) AS 'Average_Price' FROM smartphones
WHERE has_5g = 'TRUE'
GROUP BY brand_name
HAVING COUNT(*) >= 10 AND AVG(rating) > 70 ;