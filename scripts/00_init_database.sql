/*
=============================================================
Create Database and Tables - MySQL Version
=============================================================
*/
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
-- Drop database if it exists
DROP DATABASE IF EXISTS DataWarehouseAnalytics;

-- Create database
CREATE DATABASE DataWarehouseAnalytics;

-- Use database
USE DataWarehouseAnalytics;

-- =========================================================
-- Create dim_customers table
-- =========================================================

CREATE TABLE dim_customers (
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

-- =========================================================
-- Create dim_products table
-- =========================================================

CREATE TABLE dim_products (
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

-- =========================================================
-- Create fact_sales table
-- =========================================================

CREATE TABLE fact_sales (
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price INT
);

-- =========================================================
-- Load CSV Data into dim_customers
-- =========================================================

LOAD DATA LOCAL INFILE '/Users/pallavijadhav/Desktop/Codebasics Course/Projects/SQL Project/sql-data-analytics-project/datasets/flat-files/dim_customers.csv'
INTO TABLE dim_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =========================================================
-- Load CSV Data into dim_products
-- =========================================================

LOAD DATA LOCAL INFILE '/Users/pallavijadhav/Desktop/Codebasics Course/Projects/SQL Project/sql-data-analytics-project/datasets/flat-files/dim_products.csv'
INTO TABLE dim_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =========================================================
-- Load CSV Data into fact_sales
-- =========================================================

LOAD DATA LOCAL INFILE '/Users/pallavijadhav/Desktop/Codebasics Course/Projects/SQL Project/sql-data-analytics-project/datasets/flat-files/fact_sales.csv'
INTO TABLE fact_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;