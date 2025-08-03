# JIFUNZ-Data-Analysis-Project
# Jifunz Database Analysis Project

This repository contains SQL scripts and an analytical report exploring the `jifunz` sample database. The project aims to demonstrate database setup, querying skills, and the ability to extract meaningful business insights from relational data.

Project Overview

The primary goals of this project were to:
1.  Set up a sample database in SQL Server.
2.  Understand the database schema and relationships (ERD).
3.  Answer a set of 20 business questions using SQL queries.
4.  Optimize queries for performance (where applicable).
5.  Generate actionable business insights from the data.
6.  Produce a structured report summarizing the findings.

Database Schema (ERD)

The `jifunz` database consists of the following tables: `Customer`, `Supplier`, `Product`, `"Order"`, and `OrderItem`.

The relationships are as follows:
* `Order.CustomerId` references `Customer.Id`
* `OrderItem.OrderId` references `Order.Id`
* `OrderItem.ProductId` references `Product.Id`
* `Product.SupplierId` references `Supplier.Id`

A visual representation of the ERD is available here: [erd_diagram.jpg](erd_diagram.jpg)
*(Note: Replace `erd_diagram.jpg` with a working image if you re-upload it to your repo. If not, describe the schema clearly.)*

Setup and How to Run

To set up the `jifunz` database and run the queries, follow these steps:

1.  **Prerequisites:**
    * SQL Server (or SQL Server Express/Developer Edition) installed.
    * SQL Server Management Studio (SSMS) or Azure Data Studio.

2.  **Database Creation:**
    * Open SSMS and connect to your SQL Server instance.
    * Create a new empty database named `jifunz` (or any name you prefer).
    * Open the `sql_scripts/01_schema_creation.sql` file in SSMS.
    * Ensure your `jifunz` database is selected in the dropdown menu.
    * Execute the script to create the tables and define relationships.

3.  **Data Population:**
    * Open the `sql_scripts/02_data_population.sql` file in SSMS.
    * Ensure your `jifunz` database is selected.
    * Execute the script to populate the tables with sample data.

4.  **Running Business Queries:**
    * Open the `sql_scripts/03_business_queries.sql` file in SSMS.
    * Ensure your `jifunz` database is selected.
    * You can execute the entire script or run individual queries to see the results.

Business Questions & Key Insights

This project addressed 20 specific business questions, which are fully detailed in the `sql_scripts/03_business_queries.sql` file.

Key insights derived from the analysis include:

* **Customer Geography**: Identification of top customer countries, allowing for focused marketing efforts.
* **Customer Spending**: Insights into total and average spending per customer, helping to identify high-value clients and target specific customer segments.
* **Supplier Network**: Understanding of supplier distribution by country and identifying key suppliers based on the number of products they offer.
* **Product Management**: Overview of product availability (active vs. discontinued) and categorization by packaging or naming patterns.
* **Sales Performance**: Snapshot of sales volume and total revenue for specific periods, useful for performance tracking and trend analysis.

For a detailed breakdown of all insights and the full analysis, please refer to the [analysis_report.pdf](reports/analysis_report.pdf) in the `reports` directory.

Files in this Repository

* `README.md`: This file.
* `sql_scripts/`:
    * `01_schema_creation.sql`: SQL script to create the database tables and constraints.
    * `02_data_population.sql`: SQL script to populate the tables with sample data.
    * `03_business_queries.sql`: SQL script containing all 20 business questions and their solutions.
* `reports/`:
    * `analysis_report.pdf`: The comprehensive analysis report summarizing findings and insights.
* `erd_diagram.jpg`: (Optional) The Entity-Relationship Diagram of the database.

---
