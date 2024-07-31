USE dbms_placements;


# Constraints in DBMS
/*
	1. Primary Key
    2. Foriegn Key
    3. UNIQUE
    4. NOT NULL
    5. AUTO INCREAMENT
    6. DEFAULT
    7. CHECK

*/
CREATE TABLE students(
	Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Roll_No INT  ,
    Age INT CHECK (Age>=4)  ,
    Passed INT DEFAULT 1,
    Address VARCHAR(255) UNIQUE
);