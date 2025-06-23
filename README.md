# Hospital-Billing-Analysis-using-SQL

This project is a complete SQL-based analysis of hospital data, focusing on billing, patient demographics, ward usage, and diagnoses. It aims to extract actionable insights from healthcare records to improve billing efficiency, resource allocation, and diagnosis monitoring.

## Dataset Overview

The database contains the following relational tables:
| Table Name          | Description                                                      |
| ------------------- | ---------------------------------------------------------------- |
| `patients`          | Stores patient demographic information (age, gender)             |
| `billing`           | Contains billing details such as cost, duration, and insurance   |
| `patient_admission` | Tracks admission/discharge details, diagnosis, ward, and outcome |
| `diagnoses`         | Lists all possible diagnosis categories                          |
| `wards`             | Provides information about hospital ward capacities              |

## SQL Operations Performed

This project includes:

### Table Creation
Defined schemas for all five tables with appropriate data types and constraints (PK, FK).

### Data Insertion
Inserted sample data for all tables using realistic healthcare entries.

### Query Operations
Joins across tables to combine patient, billing, and diagnosis info.

Aggregate functions (e.g., SUM, AVG, COUNT) for financial and operational insights.

Filtering using WHERE, CASE, and IF to identify key trends.

Grouping and sorting (GROUP BY, ORDER BY) for meaningful summaries.

## Key Queries & Insights

Total Billing with Insurance Status

Show which patients had insurance and calculate cost implications.

Average Recovery Days by Ward

Evaluate ward performance based on patient recovery duration.

Most Common Diagnoses

Identify frequently occurring health issues.

Revenue Generated per Ward

Determine which hospital wards are financially contributing the most.

Gender-wise Patient Distribution

Understand gender demographics of admitted patients.

Top 3 Expensive Admissions

Analyze the most resource-intensive patient cases.

### Sample Query
SELECT 
    ward_type,
    AVG(recovery_days) AS average_recovery_days
FROM patient_admission
GROUP BY ward_type;

### Tools Used
MySQL Workbench – for writing and executing SQL queries

GitHub – for version control and public repository hosting

## How to Run

Clone the repository

Open MySQL Workbench

Create a database (e.g., hospitalsdb)

Run the hospital_billing.sql file

Execute queries and explore insights

### Future Enhancements

Add stored procedures and views

Visualize data in Power BI or Streamlit

Normalize schema for larger datasets

Connect to real-world hospital datasets

# About Me
# Sravani Reddy
# B.Tech CSIT Graduate | Aspiring Data Analyst | Passionate about solving real-world problems using data
