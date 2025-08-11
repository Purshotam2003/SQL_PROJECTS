# SQL Sales Data Analysis Queries

## Overview
This repository contains an SQL script designed for **data analysis on a `sql2` sales table**.  
The queries focus on:
- Data validation (finding missing values)
- Aggregations and summaries
- Filtering by conditions
- Category-based sales insights
- Customer and product diversity checks

## Table Used
The queries operate on a table named `sql2`, which is assumed to have the following columns:
- `transactions_id`
- `sale_date`
- `sale_time`
- `customer_id`
- `gender`
- `age`
- `category`
- `quantiy` *(Note: Possible typo — should be `quantity`)*
- `price_per_unit`
- `cogs` (Cost of Goods Sold)
- `total_sale`

## Queries Included

1. **Identify Missing Values**
```sql
SELECT * 
FROM sql2
WHERE transactions_id IS NULL 
   OR sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL 
   OR gender IS NULL 
   OR age IS NULL 
   OR category IS NULL 
   OR quantiy IS NULL 
   OR price_per_unit IS NULL 
   OR cogs IS NULL 
   OR total_sale IS NULL;
```

2. **Sales Count by Gender**
```sql
SELECT COUNT(*) AS total_sales, gender 
FROM sql2 
GROUP BY gender;
```

3. **Unique Customer Count**
```sql
SELECT COUNT(DISTINCT customer_id) AS total_cust 
FROM sql2;
```

4. **Unique Category Count**
```sql
SELECT COUNT(DISTINCT category) AS total_cat 
FROM sql2;
```

5. **Sales on a Specific Date**
```sql
SELECT * 
FROM sql2 
WHERE sale_date = '05-11-2022';
```

6. **Clothing Sales in November 2022 with Quantity > 2**
```sql
SELECT * 
FROM sql2 
WHERE category = 'clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantiy > 2;
```

7. **Category-wise Sales Summary**
```sql
SELECT category, COUNT(*) AS net_quant, SUM(total_sale) AS total_sale
FROM sql2
GROUP BY category;
```

8. **Average Age for Beauty Category Customers**
```sql
SELECT AVG(age) 
FROM sql2 
WHERE category = 'BEAUTY';
```

9. **Transactions with High Total Sales**
```sql
SELECT transactions_id 
FROM sql2 
WHERE total_sale > 1000;
```

## Usage
Run the `.sql` file in your preferred SQL environment (e.g., MySQL Workbench, phpMyAdmin, or command-line MySQL) after ensuring:
- The `sql2` table exists.
- Column names match those used in the queries.
- Data is loaded into the table.

## Notes
- The column name `quantiy` may be a typo — replace with `quantity` if applicable.
- Date formats in `sale_date` should match the SQL queries for proper filtering.
- These queries are written for **MySQL**; some syntax may differ for other databases.
