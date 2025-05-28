create database COMPANY;
use COMPANY;
select * from sales;

-- Q1: Find all orders ship via 'Economy' mode with total amount greater than 25000.
select * from sales 
where Ship_Mode='Economy'
 and Total_Amount>25000;
 
-- Q2:retrive all sales data for technology category in ireland made after 2020-01-01. 
 select * from sales
 where Category='Technology'
 and Country ='Ireland'
 and Order_Date >'2020-01-01';
 
 -- Q3: List the top 10 most profitable sales transactions in decending order.
 
 select * from sales 
 order by Unit_Profit Desc Limit 10;
 
select * from sales 
 order by Unit_Profit Desc Limit 10, 20; 
 
 -- Q4: Find all customers whose name starts with 'J' and ends with 'n'
 
 select Order_Id, Customer_Name from sales where Customer_Name like 'J%N';
 
 -- Q5; Retrieve all products names that contain 'Acco' anywhere in the name.
 
 select Order_Id ,Product_Name from sales where Product_Name like '%Acco%';
 
 -- Q6: Get top 5 cities with highest total sales amount.
 
SELECT City, SUM(Total_Amount) AS Total_Sales
FROM sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q7: Display the second set of 10 records for customer_Name and Total_Amount in descending order

select Customer_Name , Total_Amount 
from sales order by Total_Amount desc limit 10,10;

-- Q8: Find total revenue,average unit cost and total numbers by order

SELECT 
  SUM(Total_Amount) AS `Total_Revenue`,
  AVG(Unit_Cost) AS `Average_Unit_Cost`,
  Count(Order_Id) AS `Total_Units`
FROM sales;

-- Q9: count uniqe number of regions
select Count(distinct Region) as uniq from sales;

-- Q10: Find the number of orderss palced by each customer 

select Customer_Name, COUNT(Order_ID) AS Order_Placed
from sales
group bY Customer_Name
order by Order_Placed desc;

-- Q11: Rank 5 products based on total sales using RANK().(Types of ranking functions: RANK(),DENSE_RANK(), ROW_NUMBER(), ROW_NUMBER())

select Product_Name, sum(Total_Amount) As Total_Sales,
rank() over (order by sum(Total_Amount) desc) As Sales_Rank from sales
group by Product_Name
limit 5;

 







 
 
