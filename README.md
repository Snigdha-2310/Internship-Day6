# Internship-Day6
# Internship-Day6

🔍 **Overview**  
This project explores how to perform **monthly sales trend analysis using SQL queries in PostgreSQL**. The analysis includes revenue aggregation, order volume computation, and top month filtering using `EXTRACT`, `GROUP BY`, and `ORDER BY`.

📊 **Dataset Structure**

| Column      | Data Type      | Description                 |
|-------------|----------------|-----------------------------|
| order_id    | SERIAL         | Unique Order ID             |
| order_date  | DATE           | Date of the order           |
| amount      | NUMERIC(10,2)  | Revenue from the order      |
| product_id  | INT            | ID of the product sold      |

---

🔧 **SQL Commands & Results**

### ✅ A. Creating the Table
```sql
DROP TABLE IF EXISTS online_sales;

CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount NUMERIC(10, 2),
    product_id INT
);
```


![Create](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/create.png)

✅ B. Inserting Values
```sql
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
```
![Insert](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/insert.png)

✅ C. Extract Month and Year
```sql
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM online_sales;
```
![a](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/a.png)
✅ D. Group By Year and Month\
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM online_sales
GROUP BY order_year, order_month;
```
![b](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/b.png)
✅ E. Total Revenue (SUM)
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY order_year, order_month;

```
![c](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/c.png)
✅ F. Revenue + Order Volume
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month;

```
![d](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/d.png)
✅ G. Sort By Month
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

```
![e](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/e.png)
✅ H. Top 3 Revenue Months
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY total_revenue DESC
LIMIT 3;
```
![f](https://github.com/Snigdha-2310/Internship-Day6/blob/main/Images/f.png)
🏁 Conclusion

In this SQL-based project, we successfully:

Analyzed monthly sales trends

Computed total revenue and order volume

Filtered and sorted data for business insights

Such SQL aggregations form the foundation of data analysis, reporting, and business intelligence.