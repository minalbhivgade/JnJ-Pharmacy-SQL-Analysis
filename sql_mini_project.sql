show tables;
use project;

select count(*) from dataset;
desc dataset;
-- 1. Retrieve all columns for all records in the dataset.
select * from
dataset;
-- 2. How many unique countries are represented in the dataset? 
select count(distinct Country) as distinct_counties
from dataset;
-- 3. Select the names of all the customers on the 'Retail' channel.
SELECT `Customer Name` as customers
FROM dataset
WHERE Channel = 'Retail';
-- 4. Find the total quantity sold for the 'Antibiotics' product class.
select * from dataset;
select SUM(Quantity) AS  total_quantity
from dataset
WHERE `Product Class` = 'Antibiotics';
-- 5. List all the distinct months present in the dataset. 
select * from dataset;

select distinct `Month` as distinct_months
from dataset;
-- 6. Calculate the total sales for each year.
select * from dataset;
select year,sum(sales) as total_salary
from dataset
group by Year;

-- 7. Find the customer with the highest sales value. 
SELECT `Customer Name` AS customers, MAX(Sales) AS max_sales
FROM dataset
GROUP BY `Customer Name`
ORDER BY max_sales DESC
LIMIT 1;
-- 8. Get the names of all employees who are Sales Reps and are  managed by 'James Goodwill
select * from dataset;
SELECT `Name of Sales Rep` AS SalesRep
FROM dataset
WHERE  `Sales Team` = 'Sales Rep'  AND `Manager` = 'James Goodwill' ;
-- 9. Retrieve the top 5 countries with the highest sales.
select * from dataset;
SELECT Country, SUM(Sales) AS TotalSales
FROM dataset
GROUP BY Country
ORDER BY TotalSales DESC
LIMIT 5;
-- 10. Calculate the average price of products in each sub-channel. 
select * from dataset;
select  `Sub-channel`  , avg(price)  as avg_price
from dataset
group by `sub-channel` ;
-- 11. Retrieve all sales made by employees from 'Germany' in the year  2018. 
select sales ,country,year
from dataset
where country = 'Germany' and year = 2018;
-- 12. Calculate the total sales for each product class, for each month, and order the results by  year, month and product class. 
select * from dataset;
select year, month,`Product Class`, sum(sales)  as sum_sales 
from dataset
GROUP BY Year, Month, `Product Class`
ORDER BY Year, Month, `Product Class`;
-- 13. Find the top 3 sales reps with the highest sales in 2019. 
select * from dataset;
select year, `Name of Sales Rep`,sum(sales) as total_sales
from dataset
where year = 2019
group by `Name of Sales Rep`
order by total_sales desc
limit 3;

-- 14. Calculate the monthly total sales for each sub-channel and  then calculate the average monthly sales for each sub-channel  over the years. 
select * from dataset;
select `sub-channel` as sub_channel, month,sum(sales) as totale_sales
from dataset
group by month,sub_channel;


select `sub-channel` , month,avg(totale_sales) as totale_sales
from (select `sub-channel` as sub_channel, month,sum(sales) as avg_month_sales
from dataset
group by month,sub_channel) as month_total_sales
GROUP BY `Sub-channel`;
