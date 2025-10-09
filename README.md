# 🏗️ SQL Data Warehouse Project – CRM & ERP Integration via Medallion Architecture

## 📘 Overview

This project demonstrates a full-stack SQL-based data warehouse pipeline that ingests raw CSV files from CRM and ERP systems, transforms them through a medallion architecture (Bronze → Silver → Gold), and exposes clean, queryable views for analytics and reporting.

Built for municipal and enterprise contexts, the solution emphasizes modularity, traceability, and performance—ideal for strategic controllers, BI architects, and data engineers.

---

## 🧱 Architecture

The pipeline follows the **Medallion Strategy**:

| Layer   | Purpose                                  | Format         |
|---------|------------------------------------------|----------------|
| Bronze  | Raw ingestion from CRM/ERP CSV files     | Staged tables  |
| Silver  | Cleaned, conformed, and enriched data    | SQL procedures |
| Gold    | Business-ready dimensional models & facts| SQL views      |

Schemas are created as part of the initialization:


📂 Source Systems
CRM: Customer info, product catalog, sales details

ERP: Customer demographics, location data, product categories

CSV files are staged in the datasets/ folder and loaded via SQL scripts and stored procedures.

Gold Layer
Final views are created for:

gold.dim_customers

gold.dim_products

gold.fact_sales

These views support BI dashboards and KPI tracking

📌 Tools & Tech
SQL Server

QuickDBD (ERD modeling)

GitHub for version control

Notion for documentation template


USE CASE BIG PICTURE;
CREATE VIEW gold.big_numbers AS
select 'Total Sales' AS measure_name, sum(sales) as measure_value from gold.fact_sales
UNION ALL
select 'Total Quantity' AS measure_name, sum(quantity) as measure_value from gold.fact_sales
UNION ALL
select 'Average Sales Price' AS measure_name, avg(price) as measure_value from gold.fact_sales
UNION ALL
select 'Total Orders' AS measure_name, count(distinct order_number) as measure_value from gold.fact_sales
UNION ALL
select 'Total Products' AS measure_name, count(distinct product_key) as measure_value from gold.dim_products
UNION ALL
select 'Total Buying Customers' AS measure_name, count(distinct customer_key) as measure_value from gold.fact_sales
UNION ALL
select 'Total Customers' AS measure_name, count(distinct customer_id) as measure_value from gold.dim_customers

select * from gold.big_numbers

measure_name	measure_value
Total Sales	29356250
Total Quantity	60423
Average Sales Price	486
Total Orders	27659
Total Products	295
Total Buying Customers	18484
Total Customers	18484




🧠 Author
Frank Ellingsen
