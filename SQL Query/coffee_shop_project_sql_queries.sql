use coffee_shop_sales;
SELECT `coffee_shop_sales_2024.xlsx`.`ï»¿transaction_id`,
    `coffee_shop_sales_2024.xlsx`.`date`,
    `coffee_shop_sales_2024.xlsx`.`time`,
    `coffee_shop_sales_2024.xlsx`.`store_location`,
    `coffee_shop_sales_2024.xlsx`.`product_id`,
    `coffee_shop_sales_2024.xlsx`.`product_name`,
    `coffee_shop_sales_2024.xlsx`.`category`,
    `coffee_shop_sales_2024.xlsx`.`unit_price`,
    `coffee_shop_sales_2024.xlsx`.`quantity`,
    `coffee_shop_sales_2024.xlsx`.`total_price`,
    `coffee_shop_sales_2024.xlsx`.`customer_id`,
    `coffee_shop_sales_2024.xlsx`.`payment_method`
FROM `coffee_shop_sales`.`coffee_shop_sales_2024.xlsx`;

select count(*) 
from `coffee_shop_sales_2024.xlsx`;


-- What is the total sales amount for each month in 2024?

select extract(month from str_to_date(date,'%Y-%m-%D')) month,round(sum(total_price),2)  total_sales
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1;


-- What is the month-on-month percentage change in total sales for 2024?
with cte as 
(
select extract(month from str_to_date(date,'%Y-%m-%D')) month,round(sum(total_price),2)  total_sales
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1)

select month,abs(round(((lead(total_sales,1,total_sales) over () - total_sales ) / total_sales )* 100,2)) m_o_m
from cte;



-- For a selected month (e.g., June 2024), what is the difference in total sales compared to the previous month (May 2024)?

with cte as 
(
select extract(month from str_to_date(date,'%Y-%m-%D')) month,round(sum(total_price),2)  total_sales
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1)
,cte2 as(
select month,abs(round(((lead(total_sales,1,total_sales) over () - total_sales ) ),2)) m_o_m
from cte)

select month,m_o_m prev_mon_diff
from cte2
where month = 5;

-- What is the total number of orders (unique transaction_id) for each month in 2024?

select extract(month from str_to_date(date,'%Y-%m-%D')) month,count(distinct transaction_id)  total_orders
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1;

-- What is the month-on-month percentage change in the number of orders for 2024?

with cte as(
select extract(month from str_to_date(date,'%Y-%m-%D')) month,count(distinct transaction_id)  total_orders
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1)

select month,abs(round((lead(total_orders,1,total_orders)over() - total_orders) / total_orders * 100,2)) m_o_m_orders
from cte; 


-- For a selected month (e.g., June 2024), what is the difference in the number of orders compared to the previous month (May 2024)?
with cte as(
select extract(month from str_to_date(date,'%Y-%m-%D')) month,count(distinct transaction_id)  total_orders
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1)
,
cte2 as(
select month,abs(round(((lead(total_orders,1,total_orders) over () - total_orders ) ),2)) m_o_m_order_diff
from cte)

select month,m_o_m_order_diff
from cte2
where month = 5;



-- What is the total quantity sold for each month in 2024?

select extract(month from str_to_date(date,'%Y-%m-%D')) month,sum(quantity) total_quantity_sold
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1;


-- What is the month-on-month percentage change in total quantity sold for 2024?

WITH cte AS 
(
    SELECT 
        EXTRACT(MONTH FROM STR_TO_DATE(date, '%Y-%m-%d')) AS month,
        SUM(quantity) AS total_quantity_sold
    FROM `coffee_shop_sales_2024.xlsx`
    GROUP BY 1
    ORDER BY 1
),
cte2 AS 
(
    SELECT 
        month,
        ABS(ROUND(
            (LEAD(total_quantity_sold, 1, total_quantity_sold) OVER (ORDER BY month) - total_quantity_sold) / 
            total_quantity_sold * 100, 
            2
        )) AS m_o_m_per_quantity
    FROM cte
)

SELECT 
    month,
    m_o_m_per_quantity
FROM cte2;




-- For a selected month (e.g., June 2024), what is the difference in total quantity sold compared to the previous month (May 2024)?

with cte as(
select extract(month from str_to_date(date,'%Y-%m-%D')) month,sum(quantity) total_quantity_sold
from `coffee_shop_sales_2024.xlsx`
group by 1
order by 1)
,
cte2 as(
select month,abs(round(((lead(total_quantity_sold,1,total_quantity_sold) over () - total_quantity_sold) ),2)) m_o_m_quant_diff
from cte)

select month,m_o_m_quant_diff
from cte2
where month = 5;





-- What are the top 10 products by total sales amount in 2024?

with cte as
(
select extract(month from str_to_date(date,'%Y-%m-%D')) month,product_name,round(sum(total_price),2)  total_sales
from `coffee_shop_sales_2024.xlsx`
group by 1,2
order by 3 desc
),
cte2 as (
select *,row_number() over() rnk
from cte)

select *
from cte2
where rnk <=10;
