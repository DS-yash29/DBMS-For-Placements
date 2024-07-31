USE dbms_placements;

-- SELECT ALL 
SELECT * FROM smartphones;

-- SELECT Specific Columns
SELECT brand_name FROM smartphones;

-- SELECT DISTINCT
SELECT DISTINCT brand_name FROM smartphones; 

-- ALIAS 
SELECT model AS 'Phone ka Naam' FROM smartphones;

-- CONSTANTS
SELECT brand_name,"Badhiya Hai",7 FROM smartphones;

-- CUSTOMIZED EXPRESSIONS
SELECT model,(num_rear_cameras + num_front_cameras) AS 'Total Camera' FROM smartphones;