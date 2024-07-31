-- JOINS 
USE dbms_placements;

/*
				JOINS Related Queries
    1. Fetch the Order Details of all the orders placed in Pune
    2. Find All the Profitable Orders
    3. Customer Who has placed maximum number of orders
    4. Find Most Profitable Category
    5. Find 5 Most Profitable State
*/

SELECT DISTINCT t1.user_id,t1.name,t2.order_id,t1.city,t3.amount,t3.profit,t3.quantity,t4.category FROM users t1 
JOIN orders t2 ON t2.user_id = t1.user_id
JOIN od t3 ON t3.order_id = t2.order_id
JOIN category t4 ON t4.category_id = t3.category_id
WHERE t1.city = 'Pune';

SELECT t1.order_id , SUM(t2.profit) AS 'Profit' FROM orders t1
JOIN od t2 on t2.order_id = t1.order_id
GROUP BY t2.order_id
HAVING Profit > 0  ;

SELECT t1.user_id,t1.name,COUNT(*) AS 'Total_Orders' FROM users t1
JOIN orders t2 ON t2.user_id = t1.user_id
GROUP BY t1.user_id,t1.name;

SELECT t2.vertical,SUM(t1.profit) 'Profit' FROM od t1
JOIN category t2 ON t1.category_id = t2.category_id
GROUP BY t2.vertical
ORDER BY Profit DESC
LIMIT 1;

SELECT t1.state , SUM(t3.profit) AS 'Profit' FROM users t1
JOIN orders t2 ON t2.user_id = t1.user_id
JOIN od t3 ON t3.order_id = t2.order_id
GROUP BY t1.state
ORDER BY Profit DESC LIMIT 5;


