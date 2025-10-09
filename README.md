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

```sql
USE master;
CREATE DATABASE DataWarehouse;
USE DataWarehouse;
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;

