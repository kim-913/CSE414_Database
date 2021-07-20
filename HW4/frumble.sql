-- 1. 
-- Create a table in the database and load the data from the provided file into that table; 
-- use SQLite or any other relational DBMS of your choosing.
-- Turn in your create-table statement. The data import statements are optional.

-- Create a table corresponding to the text and import the txt file to the table
CREATE TABLE frumble
(
    name VARCHAR(10),
    discount VARCHAR(3),
    month VARCHAR(3),
    price INT
);

-- 2. 
-- Find all non-trivial functional dependencies in the database. This is a reverse engineering task, 
-- so expect to proceed in a trial and error fashion. Search first for the simple dependencies, 
-- say name → discount then try the more complex ones, like name, discount → month, as needed. 
-- To check each functional dependency you have to write a SQL query.
-- Your challenge is to write this SQL query for every candidate functional dependency that you check, 
-- such that:
/* 
a. the query's answer is always short (say: no more than ten lines - remember that 0 results can 
be instructive as well)
*/

--.mode csv
--.import /Users/ziruoke/Desktop/CSE414/HW4/mrFrumbleData.csv

-- I only chose to analyze 3 trivial relationship, I ignore name -> month and 
-- 1. name -> discount
-- However, the functional dependency doesn't exist.
SELECT Max(count)
From(
     SELECT Count(DISTINCT F.discount) as count
    FROM frumble as F
    GROUP BY F.name
   );

-- 2. name -> price 
-- functional dependency exists
SELECT COUNT
FROM(
     SELECT COUNT(DISTINCT F.price) as count
    FROM frumble as F
    GROUP BY F.name
   )
ORDER BY COUNT DESC
LIMIT 10;

-- 3. month -> discount
-- functional dependency exists
SELECT COUNT
FROM
(
     SELECT COUNT(DISTINCT F.discount) as count
FROM frumble as F
GROUP BY F.month
   )
ORDER BY count DESC
LIMIT 10;
-- I found 2 FDs in total listed above on 2. and 3.

-- 3.Decompose the table into Boyce-Codd Normal Form (BCNF), and create SQL tables for the decomposed 
-- schema. Create keys and foreign keys where appropriate. For this question turn in the SQL 
-- commands for creating the tables.
/*
If we name name: N, discount: D, month: M, price: P
in R(N, D, M, P), N -> P, M -> D
From N -> P, we get:
R1(N, P), R2(N, D, M)
Here, R1 is BCNF, we can decompose R2 according to M -> D
Thus, R2 can be represented as:
R3(M, D), R4(M, N)
Thus, final BCNF:
R1(N, P), R3(M, D), R4(M, N) representing:
R1(name, price), R3(month, discount), R4(month, name)
*/

CREATE TABLE R1
(
    price INT,
    name VARCHAR
(10) PRIMARY KEY
);

CREATE TABLE R3
(
    discount VARCHAR(10),
    month VARCHAR(3) PRIMARY KEY
);

CREATE TABLE R4
(
    name VARCHAR(10) REFERENCES R1(name),
    month VARCHAR(3) REFERENCES R3(month),
    PRIMARY KEY(name, month)
);

-- 4.
INSERT INTO R1
SELECT DISTINCT name, price
FROM frumble;

INSERT INTO R3
SELECT DISTINCT discount, month
FROM Frumble;

INSERT INTO R4
SELECT DISTINCT month, name
FROM Frumble;

-- 36 for R1
SELECT COUNT(*)
FROM R1;

-- 426 for R3
SELECT COUNT(*)
FROM R3;

-- 12 for R4
SELECT COUNT(*)
FROM R4;