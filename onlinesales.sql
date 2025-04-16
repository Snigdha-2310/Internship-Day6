-- sales_trend_analysis.sql

-- 🧹 Drop table if it exists
DROP TABLE IF EXISTS online_sales;

-- 📦 Create the online_sales table
CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount NUMERIC(10, 2),
    product_id INT
);

-- 📥 Insert new sample records
INSERT INTO online_sales (order_date, amount, product_id) VALUES
('2023-01-10', 180.00, 201),
('2023-01-25', 220.00, 202),
('2023-02-08', 340.00, 203),
('2023-02-20', 400.00, 204),
('2023-03-03', 130.00, 205),
('2023-03-17', 270.00, 206),
('2023-04-05', 310.00, 207),
('2023-04-22', 420.00, 208),
('2023-05-09', 520.00, 209),
('2023-05-30', 690.00, 210),
('2023-06-11', 240.00, 211),
('2023-06-25', 360.00, 212),
('2023-07-14', 780.00, 213),
('2023-07-29', 850.00, 214),
('2023-08-03', 190.00, 215),
('2023-08-18', 260.00, 216),
('2023-09-12', 460.00, 217),
('2023-09-28', 530.00, 218),
('2023-10-06', 610.00, 219),
('2023-10-21', 720.00, 220);

-- 🔎 A. Extract Month and Year
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM 
    online_sales;

-- 📅 B. Group By Year and Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- 💰 C. Total Revenue Per Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- 📦 D. Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- 📆 E. Sorted Monthly Report
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year, order_month;

-- 🏆 F. Top 3 Revenue Months
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    total_revenue DESC
LIMIT 3;
