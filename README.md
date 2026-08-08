# 🗄️ Adventure Works SQL Analysis

## 📌 Project Overview

This project focuses on analyzing the Adventure Works sales dataset using **MySQL**. The project demonstrates SQL skills including data integration, joins, views, date transformation, data analysis, and business-oriented queries.

The analysis combines Internet Sales data with relevant customer and product information to generate meaningful insights for sales and business performance analysis.

---

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- Adventure Works Dataset

---

## 🔧 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- Aggregate Functions
- UNION ALL
- INNER JOIN
- LEFT JOIN
- CONCAT
- CASE Statements
- Subqueries
- Views
- Date Functions
- Data Transformation

---

## 📊 Project Workflow

### 1. Database Creation

Created and selected the Adventure Works database for analysis.

### 2. Sales Data Integration

Combined the `FactInternetSales` and `Fact_Internet_Sales_New` tables using `UNION ALL` to create a unified sales view.

### 3. Product Analysis

Joined sales data with `dimproduct` to retrieve product names and product-related information.

### 4. Customer Analysis

Joined sales data with `dimcustomer` to generate customer full names and analyze customer-level sales information.

### 5. Date Transformation

Converted `OrderDateKey` into a proper date and extracted:

- Order Date
- Year
- Month
- Month Number
- Other date-related attributes

### 6. Business Analysis

Created SQL queries and views to analyze sales performance across products, customers, categories, and time.

---

## 📁 Repository Structure

```text
AdventureWorks-SQL-Analysis/
│
├── README.md
├── SQL_Query_Analysis-AdventureWorks
```

---

## 💡 Key SQL Skills Demonstrated

- Data Integration
- Relational Data Modeling
- SQL Joins
- Data Transformation
- View Creation
- Date Analysis
- Sales Analysis
- Customer Analysis
- Product Analysis
- Business Reporting

---

## 🎯 Business Questions

The project addresses business questions such as:

- What are the overall sales trends?
- Which products generate the highest sales?
- Which customers contribute the most revenue?
- How does sales performance change over time?
- How can sales data be combined with customer and product information?
- How can SQL views simplify recurring analysis?

---

## 🚀 How to Run the Project

1. Install MySQL and MySQL Workbench.
2. Load the Adventure Works database.
3. Open `AdventureWorks_SQL_Analysis.sql`.
4. Select the `adventure_works` database.
5. Execute the SQL statements in sequence.
6. Review the created views and analysis queries.

---

## 📚 Learning Outcomes

Through this project, I developed practical experience in:

- Writing SQL queries for business analysis.
- Combining multiple tables using joins.
- Creating reusable SQL views.
- Transforming date fields.
- Integrating multiple sales tables.
- Extracting actionable insights from relational data.

---

## 👨‍💻 Author

**Shravan Kumar K**

📧 shravanrao08@gmail.com

💼 LinkedIn: https://www.linkedin.com/in/shravan-kumar-k-471627230

💻 GitHub: https://github.com/Shravan-KumarK
