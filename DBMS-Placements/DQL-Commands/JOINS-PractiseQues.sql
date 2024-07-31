USE dbms_placements;

-- JOINS Practise Questions
/*
	Q1. Find top-5 most sold products
    Q2. Find sales man who sold most no of products
    Q3. Top 5 Sales man who has generated most revenue
    Q4. Sales man name who has most no of unique customer.
    Q5. List all customers who have made more than 10 purchases
    Q6. List all pairs of customers who have made purchases with the same salesperson.
*/

SELECT t2.Name , SUM(t1.Quantity) AS 'Total_Sold'  FROM Products t2 
JOIN sales t1 ON t2.ProductID = t1.ProductID GROUP BY t2.Name 
ORDER BY Total_Sold DESC LIMIT 5;

SELECT t1.SalesPersonID , SUM(t1.Quantity) AS 'Quantity_Sold' FROM sales t1 
GROUP BY t1.SalesPersonID 
ORDER BY Quantity_Sold DESC LIMIT 1;


SELECT CONCAT(t3.FirstName," ",LastName) AS 'Emp-Name' ,ROUND(SUM(t2.price*t1.Quantity)) AS 'Revenue' FROM sales t1 
JOIN employees t3 ON t3.EmployeeID = t1.SalesPersonID 
JOIN products t2 ON t1.ProductID = t2.ProductID 
GROUP BY t3.FirstName,t3.LastName 
ORDER BY Revenue DESC;

WITH CTE AS 
(
SELECT SalesPersonID,COUNT(DISTINCT CustomerID) AS 'UC' FROM sales 
GROUP BY SalesPersonID 
ORDER BY UC DESC LIMIT 5
)
SELECT CONCAT(t2.FirstName," ",t2.LastName) 'SalesPerson' , t1.* FROM CTE t1
JOIN employees t2 ON t2.EmployeeID = t1.SalesPersonID
ORDER BY t1.UC DESC;


WITH CTE2 AS( 
SELECT CustomerID,COUNT(*) AS 'Total_Purchase'  FROM sales
GROUP BY CustomerID
HAVING Total_Purchase > 10
)
SELECT t1.CustomerID,CONCAT(t2.FirstName," ",t2.LastName)AS 'Name' ,t1.Total_Purchase  FROM CTE2 t1
JOIN customers t2 ON t2.CustomerID = t1.CustomerID
ORDER BY Total_Purchase DESC;

SELECT SalesPersonID,CustomerID,COUNT(*) AS 'Transactions' FROM sales
GROUP BY SalesPersonID,CustomerID
HAVING Transactions = 1;