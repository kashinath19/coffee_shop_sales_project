#coffee_shop_sales_project

**##Overview**

This project focuses on analyzing sales data for a fictional coffee shop chain to derive actionable insights into sales performance, order trends, and product popularity. Using a synthetic dataset of coffee shop sales for 2024, the project employs SQL for data querying and Power BI to create an interactive dashboard, providing a comprehensive view of business performance.

**##Dataset**
The dataset, coffee_shop_sales_2024.csv, contains 1,261 rows and 12 columns, including:

transaction_id, date, time, store_location, product_id, product_name, category, unit_price, quantity, total_price, customer_id, payment_method.
Features intentional data quality issues: ~7% null values, format errors (e.g., mixed date formats, invalid prices like $10 or -5), and ~5% duplicates, simulating real-world data challenges.

**##Objectives**
The goal is to build a Power BI dashboard that provides insights into:

Total Sales Analysis: Monthly sales, month-on-month (MoM) changes, and differences from the previous month.
Order Analysis: Total orders per month, MoM order changes, and differences.
Quantity Sold Analysis: Total quantities sold, MoM changes, and differences.
Sales Trends: Analysis by weekdays/weekends, store locations, product categories, and top-performing products.
Temporal Patterns: Daily and hourly sales patterns using heat maps and line charts.


**##Tools Used**
Excel : Used excel to handle the data cleaning process such as duplicates,null values,data format errors.
SQL: Queried the dataset to compute metrics like monthly sales, order counts, and top products.
Power BI: Designed an interactive dashboard with visuals like calendar heat maps, line charts, and sales breakdowns.

**##Key Features**
Data Cleaning: Handled null values, format errors, and duplicates to prepare the dataset for analysis.

SQL Queries: Extracted insights such as monthly sales, MoM changes, and top 10 products by sales.

Power BI Dashboard:
Calendar heat map showing daily sales with dynamic month filtering.

Sales comparison between weekdays and weekends.
Sales by store location with MoM difference metrics.
Daily sales line chart with an average line to highlight exceptional days.
Sales breakdown by product category and top 10 products.


**##Project Structure**
coffee_shop_sales_2024.csv: Synthetic dataset used for analysis.
generate_dataset.py: Python script to create the dataset with intentional errors.
sql_queries.sql: SQL queries for sales, order, and quantity analysis.
coffee_shop_sales_dashboard.pbix: Power BI file containing the interactive dashboard.

**##How to Use**
Data Collection: Collect the dataset i.e.coffee_shop_sales_2024.csv from kaggle or anyother data source.
SQL Analysis: Import the CSV into a database (e.g., MySQL) and run queries from sql_queries.sql.
Power BI Dashboard: Open coffee_shop_sales_dashboard.pbix in Power BI, connect to the dataset, and explore the visualizations.

**##Challenges Overcome**
Addressed data quality issues (nulls, format errors, duplicates) using Python and Power BI’s Power Query.
Resolved a Power BI import issue (0 records imported) by ensuring proper CSV formatting and data cleaning.
Designed dynamic visuals in Power BI with slicers and tooltips for an interactive user experience.

**##Future Improvements**
Add predictive analytics to forecast future sales trends.
Incorporate customer demographics for deeper segmentation.
Enhance the dashboard with real-time data integration.

**##Acknowledgments**
This project was inspired by real-world data analysis challenges and aims to showcase skills in data cleaning, SQL querying, and Power BI visualization for business intelligence.
