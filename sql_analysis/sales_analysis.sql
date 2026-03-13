-- =====================================================
-- Retail Sales Analysis
-- Dataset: Superstore Sales Dataset from Kaggle
-- =====================================================

-- 1 Total Sales
SELECT
SUM(Sales) AS total_sales
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`;


-- 2 Total Profit
SELECT
SUM(Profit) AS total_profit
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`;


-- 3 Monthly Sales Trend
SELECT
EXTRACT(YEAR FROM `Order Date`) AS year,
EXTRACT(MONTH FROM `Order Date`) AS month,
SUM(Sales) AS monthly_sales
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY year, month
ORDER BY year, month;


-- 4 Month-over-Month Sales Growth
SELECT
month,
monthly_sales,
monthly_sales - LAG(monthly_sales) OVER (ORDER BY month) AS mom_growth
FROM (
  SELECT
  DATE_TRUNC(`Order Date`, MONTH) AS month,
  SUM(Sales) AS monthly_sales
  FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
  GROUP BY month
)
ORDER BY month;


-- 5 Sales by Category
SELECT
Category,
SUM(Sales) AS total_sales
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY Category
ORDER BY total_sales DESC;


-- 6 Sales by Sub-Category
SELECT
`Sub-Category`,
SUM(Sales) AS total_sales
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;


-- 7 Top 10 Products by Sales
SELECT
`Product Name`,
SUM(Sales) AS total_sales
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- 8 Profit by Region
SELECT
Region,
SUM(Profit) AS total_profit
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY Region
ORDER BY total_profit DESC;


-- 9 Sales by Customer Segment
SELECT
Segment,
SUM(Sales) AS total_sales
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY Segment
ORDER BY total_sales DESC;


-- 10 Discount Impact on Profit
SELECT
Discount,
AVG(Profit) AS avg_profit
FROM `ascendant-altar-489312-r5.sales_dataset.sales_dataset`
GROUP BY Discount
ORDER BY Discount;