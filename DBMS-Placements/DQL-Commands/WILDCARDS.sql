USE dbms_placements;

-- WILDCARDS

-- Fetch all the phones whose processor starts with S
SELECT model,price,processor_brand FROM smartphones
WHERE processor_brand LIKE "S%";

-- Fetchh all the phones whose brand name starts or ends with O
SELECT * FROM smartphones
WHERE brand_name LIKE "o%" OR brand_name LIKE "%o";

