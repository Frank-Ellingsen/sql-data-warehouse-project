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


* USE CASE BIG PICTURE<br>
CREATE VIEW gold.big_numbers AS<br>
select 'Total Sales' AS measure_name, sum(sales) as measure_value from gold.fact_sales<br>
UNION ALL<br>
select 'Total Quantity' AS measure_name, sum(quantity) as measure_value from gold.fact_sales<br>
UNION ALL<br>
select 'Average Sales Price' AS measure_name, avg(price) as measure_value from gold.fact_sales<br>
UNION ALL<br>
select 'Total Orders' AS measure_name, count(distinct order_number) as measure_value from gold.fact_sales<br>
UNION ALL<br>
select 'Total Products' AS measure_name, count(distinct product_key) as measure_value from gold.dim_products<br>
UNION ALL<br>
select 'Total Buying Customers' AS measure_name, count(distinct customer_key) as measure_value from gold.fact_sales<br>
UNION ALL<br>
select 'Total Customers' AS measure_name, count(distinct customer_id) as measure_value from gold.dim_customers<br>
<br>
select * from gold.big_numbers<br>
<br>
measure_name	measure_value<br>
Total Sales	29356250<br>
Total Quantity	60423<br>
Average Sales Price	486<br>
Total Orders	27659<br>
Total Products	295<br>
Total Buying Customers	18484<br>
Total Customers	18484<br>

<br>
<br>


🧠 Author
Frank Ellingsen
