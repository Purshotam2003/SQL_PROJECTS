select * from sql2
where transactions_id is null or 
sale_date is null or 
sale_time is null or customer_id is null or 
gender is null or 
age is null or 
category is null or quantiy is null or 	price_per_unit is null or cogs is null or 
total_sale is null;

select count(*),gender as total_sales from sql2 group by gender;
--unique customers??
select count(distinct customer_id) as total_cust from sql2;
select count(distinct category) as total_cat from sql2;
select * from sql2 where sale_date="05-11-2022";
SELECT * 
FROM sql2 
WHERE category = 'clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantiy > 2;
SELECT CATEGORY,count(*) NET_QUANT,SUM(TOTAL_SALE) AS TOTAL_SALE FROM SQL2 GROUP BY CATEGORY;

SELECT AVG(AGE) FROM SQL2 WHERE CATEGORY="BEAUTY";
SELECT TRANSACTIONS_ID FROM SQL2 WHERE TOTAL_SALE > 1000;