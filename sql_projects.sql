CREATE DATABASE sql_projects;

SHOW DATABASES;

USE sql_projects;

/*
sql_projects
│
├── Banking
├── Railway Reservation
├── Employee Management
├── Customer Orders
└── Student Management
*/


/*
==================================================
BANKING PROJECT
1. Customers Table
==================================================
*/

CREATE TABLE banking_customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

SHOW TABLES;

DESC banking_customers;

/*
==================================================
BANKING PROJECT
2. Insert Customers Data
==================================================
*/

INSERT INTO banking_customers (name, city)
VALUES
('Janani', 'Chennai'),
('Poovarasan', 'Coimbatore'),
('Sandhiya', 'Erode'),
('Preethi', 'Salem');

SELECT * FROM banking_customers;


/*
==================================================
BANKING PROJECT
3. Create Accounts Table
==================================================
*/

CREATE TABLE banking_accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES banking_customers(customer_id)
);

SHOW TABLES;


/*
==================================================
BANKING PROJECT
4. Insert Accounts Data
==================================================
*/

INSERT INTO banking_accounts
(customer_id, account_type, balance)
VALUES
(1, 'Savings', 50000),
(1, 'Current', 20000),
(2, 'Savings', 30000),
(3, 'Savings', 15000),
(4, 'Current', 40000);

SELECT * FROM banking_accounts;


/*
sql_projects
│
├── banking_customers
│      ├── customer_id
│      ├── name
│      └── city
│
└── banking_accounts
       ├── account_id
       ├── customer_id  → banking_customers
       ├── account_type
       └── balance
       
       */
       
/* Quest 1 :  Retrieve all accounts with balance greater than 20,000 */

SELECT * FROM banking_accounts WHERE balance > 20000;

/*
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
3          | 2           | Savings      | 30000
5          | 4           | Current      | 40000
/*


/*  Quest 2 :  Find customers who live in Chennai */

SELECT * FROM banking_customers WHERE city = 'Chennai';

/*  Quest 3 :  Display accounts with balance between 20,000 and 50,000 */

SELECT * FROM banking_accounts
WHERE balance BETWEEN 20000 AND 50000;

/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
2          | 1           | Current      | 20000
3          | 2           | Savings      | 30000
5          | 4           | Current      | 40000
*/

/*output
customer_id | name   | city
------------|--------|--------
1           | Janani | Chennai
*/

/*  Quest 4 :  Find customers whose names start with 'J' */

SELECT * FROM banking_customers
WHERE name LIKE 'J%';


/*output
customer_id | name   | city
------------|--------|--------
1           | Janani | Chennai
*/


/*  Quest 5 :  Retrieve accounts of type 'Savings' or 'Current' */

SELECT * FROM banking_accounts
WHERE account_type IN ('Savings', 'Current');


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
2          | 1           | Current      | 20000
3          | 2           | Savings      | 30000
4          | 3           | Savings      | 15000
5          | 4           | Current      | 40000
*/

/*  Quest 6 :  Display accounts that are not 'Savings' */

SELECT * FROM banking_accounts
WHERE account_type != 'Savings';


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
2          | 1           | Current      | 20000
5          | 4           | Current      | 40000
*/

/*  Quest 7 :  Find customers whose names contain the letter 'a' */

SELECT * FROM banking_customers
WHERE name LIKE '%a%';


/*output
customer_id | name    | city
------------|---------|--------
1           | Janani  		| Chennai
2           | Poovarasan    | Coimbatore
3           | Sandhiya   	| Madurai
*/

/*  Quest 8 :  Retrieve accounts with balance less than or equal to 30,000 */

SELECT * FROM banking_accounts
WHERE balance <= 30000;


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
2          | 1           | Current      | 20000
3          | 2           | Savings      | 30000
4          | 3           | Savings      | 15000
*/


/*  Quest 9 :  Find customers who are not from Madurai */

SELECT * FROM banking_customers
WHERE city != 'Madurai';


/*output
customer_id | name    | city
------------|---------|----------
1           | Janani  		| Chennai
2           | Poovarasan    | Coimbatore
3           | Sandhiya	    | Erode
4           | Preethi	    | Salem
*/

/*  Quest 10 :  Display accounts where balance is not between 10,000 and 40,000 */

SELECT * FROM banking_accounts
WHERE balance NOT BETWEEN 10000 AND 40000;


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
*/


/*  Quest 11 :  Retrieve customers whose names end with 'i' */

SELECT * FROM banking_customers
WHERE name LIKE '%i';


/*output
customer_id | name   | city
------------|--------|----------
1           | Janani | Chennai
4           | Preethi | Chennai
*/


/*  Quest 12 :  Find accounts with balance equal to 50,000 */

SELECT * FROM banking_accounts
WHERE balance = 50000;


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
*/

/*  Quest 13 :  Display customers whose city is either Chennai or Salem */

SELECT * FROM banking_customers
WHERE city IN ('Chennai', 'Salem');


/*output
customer_id | name    | city
------------|---------|----------
1           | Janani  | Chennai
4           | Preethi | Salem
*/


/*  Quest 14 :  Find accounts with balance greater than 10,000 and less than 40,000 */

SELECT * FROM banking_accounts
WHERE balance > 10000 AND balance < 40000;


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
2          | 1           | Current      | 20000
3          | 2           | Savings      | 30000
4          | 3           | Savings      | 15000
*/


/*  Quest 15 :  Retrieve accounts where account type is not in ('Current') */

SELECT * FROM banking_accounts
WHERE account_type NOT IN ('Current');


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
3          | 2           | Savings      | 30000
4          | 3           | Savings      | 15000
*/

/*  Quest 16 :  Display all accounts sorted by balance in descending order */

SELECT * FROM banking_accounts
ORDER BY balance DESC;


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
5          | 4           | Current      | 40000
3          | 2           | Savings      | 30000
2          | 1           | Current      | 20000
4          | 3           | Savings      | 15000
*/


/*  Quest 17 :  List customers sorted alphabetically by name */

SELECT * FROM banking_customers
ORDER BY name ASC;


/*output
customer_id | name       | city
------------|------------|----------
1           | Janani	 | Chennai
2           | Poovarasan | Coimbatore
4           | Preethi    | Salem
3           | Sandhiya   | Erode
*/

/*  Quest 18 :  Display accounts sorted by account type and then by balance (descending) */

SELECT * FROM banking_accounts
ORDER BY account_type ASC, balance DESC;


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
5          | 4           | Current      | 40000
2          | 1           | Current      | 20000
1          | 1           | Savings      | 50000
3          | 2           | Savings      | 30000
4          | 3           | Savings      | 15000
*/


/*  Quest 19 :  Find the total balance of all accounts */

SELECT SUM(balance) AS total_balance
FROM banking_accounts;

/*output
total_balance
-------------
155000
*/

/*  Quest 20 :  Calculate the average balance of accounts */

SELECT AVG(balance) AS average_balance
FROM banking_accounts;


/*output
average_balance
---------------
31000
*/


/*  Quest 21 :  Find the maximum account balance */

SELECT MAX(balance) AS maximum_balance
FROM banking_accounts;


/*output
maximum_balance
---------------
50000
*/


/*  Quest 22 :  Find the minimum account balance */

SELECT MIN(balance) AS minimum_balance
FROM banking_accounts;


/*output
minimum_balance
---------------
15000
*/


/*  Quest 23 :  Count the total number of customers */

SELECT COUNT(*) AS total_customers
FROM banking_customers;


/*output
total_customers
---------------
4
*/


/*  Quest 24 :  Find total balance grouped by account type */

SELECT account_type, SUM(balance) AS total_balance
FROM banking_accounts
GROUP BY account_type;


/*output
account_type | total_balance
-------------|--------------
Current      | 60000
Savings      | 95000
*/

/*  Quest 25 :  Find average balance for each account type */

SELECT account_type, AVG(balance) AS average_balance
FROM banking_accounts
GROUP BY account_type;


/*output
account_type | average_balance
-------------|----------------
Current      | 30000
Savings      | 31666.67
*/

/*  Quest 26 :  Display account types having average balance greater than 20,000 */

SELECT account_type, AVG(balance) AS average_balance
FROM banking_accounts
GROUP BY account_type
HAVING AVG(balance) > 20000;


/*output
account_type | average_balance
-------------|----------------
Current      | 30000
Savings      | 31666.67
*/

/*  Quest 27 :  Count number of accounts for each customer */

SELECT customer_id, COUNT(*) AS total_accounts
FROM banking_accounts
GROUP BY customer_id;


/*output
customer_id | total_accounts
------------|---------------
1           | 2
2           | 1
3           | 1
4           | 1
*/

/*  Quest 28 :  Display customers having more than one account */

SELECT customer_id, COUNT(*) AS total_accounts
FROM banking_accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;


/*output
customer_id | total_accounts
------------|---------------
1           | 2
*/

/*  Quest 29 :  Retrieve customer names along with their account balances */

SELECT c.name, a.balance
FROM banking_customers c
JOIN banking_accounts a
ON c.customer_id = a.customer_id;


/*output
name       | balance
-----------|--------
Janani     | 50000
Janani     | 20000
Poovarasan | 30000
Sandhiya   | 15000
Preethi    | 40000
*/

/*  Quest 30 :  Display all customers and their accounts (including customers without accounts) */

SELECT c.name, a.account_id, a.account_type, a.balance
FROM banking_customers c
LEFT JOIN banking_accounts a
ON c.customer_id = a.customer_id;


/*output
name       | account_id | account_type | balance
-----------|------------|--------------|--------
Janani     | 1          | Savings      | 50000
Janani     | 2          | Current      | 20000
Poovarasan | 3          | Savings      | 30000
Sandhiya   | 4          | Savings      | 15000
Preethi    | 5          | Current      | 40000
*/

/*  Quest 31 :  Display all accounts and corresponding customer details */

SELECT a.account_id, a.account_type, a.balance,
       c.customer_id, c.name, c.city
FROM banking_accounts a
JOIN banking_customers c
ON a.customer_id = c.customer_id;


/*output
account_id | account_type | balance | customer_id | name       | city
-----------|--------------|---------|-------------|------------|----------
1          | Savings      | 50000   | 1           | Janani     | Chennai
2          | Current      | 20000   | 1           | Janani     | Chennai
3          | Savings      | 30000   | 2           | Poovarasan | Coimbatore
4          | Savings      | 15000   | 3           | Sandhiya   | Erode
5          | Current      | 40000   | 4           | Preethi    | Salem
*/

/*  Quest 32 :  Retrieve customer names and account types where balance is greater than 20,000 */

SELECT c.name, a.account_type
FROM banking_customers c
JOIN banking_accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > 20000;


/*output
name       | account_type
-----------|-------------
Janani     | Savings
Poovarasan | Savings
Preethi    | Current
*/

/*  Quest 33 :  List customers with their total balance using JOIN */

SELECT c.name, SUM(a.balance) AS total_balance
FROM banking_customers c
JOIN banking_accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name;


/*output
name       | total_balance
-----------|--------------
Janani     | 70000
Poovarasan | 30000
Sandhiya   | 15000
Preethi    | 40000
*/

/*  Quest 34 :  Display customer names and balances sorted by balance */

SELECT c.name, a.balance
FROM banking_customers c
JOIN banking_accounts a
ON c.customer_id = a.customer_id
ORDER BY a.balance ASC;


/*output
name       | balance
-----------|--------
Sandhiya   | 15000
Janani     | 20000
Poovarasan | 30000
Preethi    | 40000
Janani     | 50000
*/

/*  Quest 35 :  Count number of accounts for each city using JOIN */

SELECT c.city, COUNT(a.account_id) AS total_accounts
FROM banking_customers c
JOIN banking_accounts a
ON c.customer_id = a.customer_id
GROUP BY c.city;


/*output
city       | total_accounts
-----------|---------------
Chennai    | 2
Coimbatore | 1
Erode      | 1
Salem      | 1
*/

/*  Quest 36 :  Find accounts with balance greater than average balance */

SELECT *
FROM banking_accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM banking_accounts
);


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
5          | 4           | Current      | 40000
*/

/*  Quest 37 :  Retrieve customers who have accounts */

SELECT *
FROM banking_customers
WHERE customer_id IN (
    SELECT customer_id
    FROM banking_accounts
);


/*output
customer_id | name       | city
------------|------------|----------
1           | Janani     | Chennai
2           | Poovarasan | Coimbatore
3           | Sandhiya   | Erode
4           | Preethi    | Salem
*/

/*  Quest 38 :  Find customers who do not have any accounts */

SELECT *
FROM banking_customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM banking_accounts
);


/*output
No records
*/

/*  Quest 39 :  Display account(s) with the maximum balance */

SELECT *
FROM banking_accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM banking_accounts
);


/*output
account_id | customer_id | account_type | balance
-----------|-------------|--------------|--------
1          | 1           | Savings      | 50000
*/

/*  Quest 40 :  Find customers whose total balance is greater than 40,000 */

SELECT c.name, SUM(a.balance) AS total_balance
FROM banking_customers c
JOIN banking_accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(a.balance) > 40000;


/*output
name   | total_balance
-------|--------------
Janani | 70000
*/

/* 🎉 Banking Project — Questions 1–40 complete! */


/*
==================================================
RAILWAY RESERVATION PROJECT
1. Create Trains Table
==================================================
*/

CREATE TABLE railway_trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

DESC railway_trains;

/*
==================================================
RAILWAY RESERVATION PROJECT
2. Insert Trains Data
==================================================
*/

INSERT INTO railway_trains
(train_name, source, destination)
VALUES
('Express1', 'Chennai', 'Madurai'),
('Express2', 'Coimbatore', 'Salem'),
('Express3', 'Madurai', 'Chennai');


SELECT * FROM railway_trains;

/*
==================================================
RAILWAY RESERVATION PROJECT
3. Create Bookings Table
==================================================
*/

CREATE TABLE railway_bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES railway_trains(train_id)
);

DESC railway_bookings;

/*
==================================================
RAILWAY RESERVATION PROJECT
4. Insert Bookings Data
==================================================
*/

INSERT INTO railway_bookings
(train_id, passenger_name, fare, status)
VALUES
(1, 'Janani', 500, 'Confirmed'),
(1, 'Poovarasan', 500, 'Waiting'),
(2, 'Sandhiya', 300, 'Confirmed'),
(3, 'Ishu', 450, 'Cancelled'),
(2, 'Meera', 300, 'Confirmed');

SELECT * FROM railway_bookings;

/*  Quest 41 :  Retrieve all bookings with fare greater than 400 */

SELECT * FROM railway_bookings
WHERE fare > 400;


/*output
booking_id | train_id | passenger_name | fare | status
-----------|----------|----------------|------|----------
1          | 1        | Janani         | 500  | Confirmed
2          | 1        | Poovarasan     | 500  | Waiting
4          | 3        | Ishu           | 450  | Cancelled
*/

/*  Quest 42 :  Find bookings where status is not 'Confirmed' */

SELECT * FROM railway_bookings
WHERE status != 'Confirmed';


/*output
booking_id | train_id | passenger_name | fare | status
-----------|----------|----------------|------|----------
2          | 1        | Poovarasan     | 500  | Waiting
4          | 3        | Ishu           | 450  | Cancelled
*/

/*  Quest 43 :  Display trains starting from Chennai */

SELECT * FROM railway_trains
WHERE source = 'Chennai';


/*output
train_id | train_name | source  | destination
---------|------------|---------|------------
1        | Express1   | Chennai | Madurai
*/

/*  Quest 44 :  Retrieve bookings with fare between 300 and 500 */

SELECT * FROM railway_bookings
WHERE fare BETWEEN 300 AND 500;


/*output
booking_id | train_id | passenger_name | fare | status
-----------|----------|----------------|------|----------
1          | 1        | Janani         | 500  | Confirmed
2          | 1        | Poovarasan     | 500  | Waiting
3          | 2        | Sandhiya       | 300  | Confirmed
4          | 3        | Ishu           | 450  | Cancelled
5          | 2        | Meera          | 300  | Confirmed
*/

/*  Quest 45 :  Find passengers whose names start with 'A' */

SELECT * FROM railway_bookings
WHERE passenger_name LIKE 'A%';


/*output
booking_id | train_id | passenger_name | fare | status
-----------|----------|----------------|------|----------
*/

/*  Quest 46 :  Retrieve train names along with passenger names */

SELECT t.train_name, b.passenger_name
FROM railway_trains t
JOIN railway_bookings b
ON t.train_id = b.train_id;


/*output
train_name | passenger_name
-----------|----------------
Express1   | Janani
Express1   | Poovarasan
Express2   | Sandhiya
Express3   | Ishu
Express2   | Meera
*/

/*  Quest 47 :  Count number of bookings for each train */

SELECT train_id, COUNT(*) AS total_bookings
FROM railway_bookings
GROUP BY train_id;


/*output
train_id | total_bookings
----------|---------------
1         | 2
2         | 2
3         | 1
*/

/*  Quest 48 :  Display train names and total fare collected for each train */

SELECT t.train_name, SUM(b.fare) AS total_fare
FROM railway_trains t
JOIN railway_bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;


/*output
train_name | total_fare
-----------|-----------
Express1   | 1000
Express2   | 600
Express3   | 450
*/

/*  Quest 49 :  Find bookings with fare equal to the highest fare */

SELECT *
FROM railway_bookings
WHERE fare = (
    SELECT MAX(fare)
    FROM railway_bookings
);


/*output
booking_id | train_id | passenger_name | fare | status
-----------|----------|----------------|------|----------
1          | 1        | Janani         | 500  | Confirmed
2          | 1        | Poovarasan     | 500  | Waiting
*/

/*  Quest 50 :  Retrieve trains that have more than one booking */

SELECT t.train_id, t.train_name, COUNT(b.booking_id) AS total_bookings
FROM railway_trains t
JOIN railway_bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
HAVING COUNT(b.booking_id) > 1;


/*output
train_id | train_name | total_bookings
---------|------------|---------------
1        | Express1   | 2
2        | Express2   | 2
*/

/* 🎉 Railway Reservation Project — Questions 41–50 complete! /*


/*
==================================================
EMPLOYEE MANAGEMENT PROJECT
1. Create Employee Table
==================================================
*/

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

DESC employees;

/*
==================================================
EMPLOYEE MANAGEMENT PROJECT
2. Insert Employee Data
==================================================
*/

INSERT INTO employees
(emp_id, emp_name, department, salary, city, joining_date)
VALUES
(101, 'John', 'IT', 60000, 'Chennai', '2022-01-15'),
(102, 'David', 'HR', 45000, 'Bangalore', '2021-03-10'),
(103, 'Smith', 'IT', 70000, 'Chennai', '2020-07-12'),
(104, 'Mary', 'Finance', 55000, 'Mumbai', '2023-01-20'),
(105, 'James', 'HR', 48000, 'Delhi', '2022-05-05'),
(106, 'Linda', 'Finance', 65000, 'Mumbai', '2021-08-18');

SELECT * FROM employees;

/*  Quest 1 :  Find the total number of employees in each department */

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;


/*output
department | total_employees
-----------|----------------
Finance    | 2
HR         | 2
IT         | 2
*/

/*  Quest 2 :  Find the average salary of employees in each department */

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;


/*output
department | average_salary
-----------|---------------
Finance    | 60000
HR         | 46500
IT         | 65000
*/

/*  Quest 3 :  Display departments having more than one employee */

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;


/*output
department | total_employees
-----------|----------------
Finance    | 2
HR         | 2
IT         | 2
*/

/*  Quest 4 :  Find the highest salary in each department */

SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;


/*output
department | highest_salary
-----------|---------------
Finance    | 65000
HR         | 48000
IT         | 70000
*/


/*  Quest 5 :  Find the lowest salary in each department */

SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;


/*output
department | lowest_salary
-----------|--------------
Finance    | 55000
HR         | 45000
IT         | 60000
*/

/*  Quest 6 :  Find departments whose average salary is greater than 50,000 */

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;


/*output
department | average_salary
-----------|---------------
Finance    | 60000
IT         | 65000
*/

/*  Quest 7 :  Calculate the total salary expenditure for each department */

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;


/*output
department | total_salary
-----------|-------------
Finance    | 120000
HR         | 93000
IT         | 130000
*/

/*  Quest 8 :  Display all employees sorted by salary in descending order */

SELECT * FROM employees
ORDER BY salary DESC;


/*output
emp_id | emp_name | department | salary | city     | joining_date
-------|----------|------------|--------|----------|------------
103    | Smith    | IT         | 70000  | Chennai  | 2020-07-12
106    | Linda    | Finance    | 65000  | Mumbai   | 2021-08-18
101    | John     | IT         | 60000  | Chennai  | 2022-01-15
104    | Mary     | Finance    | 55000  | Mumbai   | 2023-01-20
105    | James    | HR         | 48000  | Delhi    | 2022-05-05
102    | David    | HR         | 45000  | Bangalore| 2021-03-10
*/

/*  Quest 9 :  Display employees sorted first by department and then by salary in descending order */

SELECT * FROM employees
ORDER BY department ASC, salary DESC;


/*output
emp_id | emp_name | department | salary | city      | joining_date
-------|----------|------------|--------|-----------|------------
104    | Mary     | Finance    | 55000  | Mumbai    | 2023-01-20
106    | Linda    | Finance    | 65000  | Mumbai    | 2021-08-18
102    | David    | HR         | 45000  | Bangalore | 2021-03-10
105    | James    | HR         | 48000  | Delhi     | 2022-05-05
101    | John     | IT         | 60000  | Chennai   | 2022-01-15
103    | Smith    | IT         | 70000  | Chennai   | 2020-07-12
*/

/*  Quest 10 :  Find cities that have more than one employee */

SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city
HAVING COUNT(*) > 1;


/*output
city    | total_employees
--------|----------------
Chennai | 2
Mumbai  | 2
*/

/*  Quest 11 :  Find the total salary paid in each city */

SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city;


/*output
city      | total_salary
----------|-------------
Bangalore | 45000
Chennai   | 130000
Delhi     | 48000
Mumbai    | 120000
*/

/*  Quest 12 :  Display departments ordered by total salary expenditure from highest to lowest */

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;


/*output
department | total_salary
-----------|-------------
IT         | 130000
Finance    | 120000
HR         | 93000
*/

/*  Quest 13 :  Find the number of employees in each department whose salary is greater than 50,000 */

SELECT department, COUNT(*) AS total_employees
FROM employees
WHERE salary > 50000
GROUP BY department;


/*output
department | total_employees
-----------|----------------
Finance    | 2
IT         | 2
*/

/*  Quest 14 :  Find the difference between the highest and lowest salary in each department */

SELECT department,
       MAX(salary) - MIN(salary) AS salary_difference
FROM employees
GROUP BY department;


/*output
department | salary_difference
-----------|------------------
Finance    | 10000
HR         | 3000
IT         | 10000
*/

/*  Quest 15 :  Display the top 3 highest-paid employees */

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;


/*output
emp_id | emp_name | department | salary | city    | joining_date
-------|----------|------------|--------|---------|------------
103    | Smith    | IT         | 70000  | Chennai | 2020-07-12
106    | Linda    | Finance    | 65000  | Mumbai  | 2021-08-18
101    | John     | IT         | 60000  | Chennai | 2022-01-15
*/

/* 🎉 Employee Management Project  — Questions 1–15 complete! /*


/*
==================================================
CUSTOMER ORDERS PROJECT
1. Create Customers Table
==================================================
*/

CREATE TABLE order_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);


/*
==================================================
CUSTOMER ORDERS PROJECT
2. Create Orders Table
==================================================
*/

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES order_customers(customer_id)
);

DESC order_customers;

DESC orders;

/*
==================================================
CUSTOMER ORDERS PROJECT
3. Insert Customers Data
==================================================
*/

INSERT INTO order_customers
(customer_id, customer_name, city)
VALUES
(1, 'Janani', 'Chennai'),
(2, 'Poovarasan', 'Coimbatore'),
(3, 'Surya', 'Madurai'),
(4, 'Preethi', 'Salem'),
(5, 'Sandhiya', 'Erode');

SELECT * FROM order_customers;

/*
==================================================
CUSTOMER ORDERS PROJECT
4. Insert Orders Data
==================================================
*/

INSERT INTO orders
(order_id, customer_id, amount, order_date)
VALUES
(101, 1, 2500, '2026-01-10'),
(102, 1, 3500, '2026-01-15'),
(103, 2, 5000, '2026-02-05'),
(104, 2, 2500, '2026-02-10'),
(105, 2, 3000, '2026-02-15'),
(106, 3, 4500, '2026-03-01'),
(107, 4, 6000, '2026-03-05'),
(108, 4, 3500, '2026-03-10'),
(109, 5, 2000, '2026-03-15'),
(110, 5, 4000, '2026-03-20');

SELECT * FROM orders;

/*  Quest 16 :  Find the total order amount for each customer */

SELECT customer_id, SUM(amount) AS total_order_amount
FROM orders
GROUP BY customer_id;


/*output
customer_id | total_order_amount
------------|-------------------
1           | 6000
2           | 10500
3           | 4500
4           | 9500
5           | 6000
*/

/*  Quest 17 :  Find customers who have placed more than 3 orders */

SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3;


/*output
No records
*/

/*  Quest 18 :  Find the average order amount for each customer */

SELECT customer_id, AVG(amount) AS average_order_amount
FROM orders
GROUP BY customer_id;


/*output
customer_id | average_order_amount
------------|---------------------
1           | 3000
2           | 3500
3           | 4500
4           | 4750
5           | 3000
*/

/*  Quest 19 :  Find the highest order amount placed by each customer */

SELECT customer_id, MAX(amount) AS highest_order_amount
FROM orders
GROUP BY customer_id;


/*output
customer_id | highest_order_amount
------------|---------------------
1           | 3500
2           | 5000
3           | 4500
4           | 6000
5           | 4000
*/


/*  Quest 20 :  Display customers sorted by their total purchase amount */

SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM orders
GROUP BY customer_id
ORDER BY total_purchase_amount DESC;


/*output
customer_id | total_purchase_amount
------------|----------------------
2           | 10500
4           | 9500
1           | 6000
5           | 6000
3           | 4500
*/

/*  Quest 21 :  Find customers whose total purchase amount exceeds 10,000 */

SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 10000;


/*output
customer_id | total_purchase_amount
------------|----------------------
2           | 10500
*/

/*  Quest 22 :  Display customer names along with the total number of orders placed */

SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM order_customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


/*output
customer_name | total_orders
--------------|-------------
Janani        | 2
Poovarasan    | 3
Surya         | 1
Preethi       | 2
Sandhiya      | 2
*/

/*  Quest 23 :  Find the customer who spent the highest amount */

SELECT c.customer_name, SUM(o.amount) AS total_purchase_amount
FROM order_customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase_amount DESC
LIMIT 1;


/*output
customer_name | total_purchase_amount
--------------|----------------------
Poovarasan    | 10500
*/

/*  Quest 24 :  Find the customer who placed the maximum number of orders */

SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM order_customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC
LIMIT 1;


/*output
customer_name | total_orders
--------------|-------------
Poovarasan    | 3
*/

/*  Quest 25 :  Find customers whose average order amount is greater than 2,000 */

SELECT customer_id, AVG(amount) AS average_order_amount
FROM orders
GROUP BY customer_id
HAVING AVG(amount) > 2000;


/*output
customer_id | average_order_amount
------------|---------------------
1           | 3000
2           | 3500
3           | 4500
4           | 4750
5           | 3000
*/

/*  Quest 26 :  Display the top 5 customers based on total purchase amount */

SELECT c.customer_name, SUM(o.amount) AS total_purchase_amount
FROM order_customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase_amount DESC
LIMIT 5;


/*output
customer_name | total_purchase_amount
--------------|----------------------
Poovarasan    | 10500
Preethi       | 9500
Janani        | 6000
Sandhiya      | 6000
Surya         | 4500
*/

/*  Quest 27 :  Find the minimum order amount for each customer */

SELECT customer_id, MIN(amount) AS minimum_order_amount
FROM orders
GROUP BY customer_id;


/*output
customer_id | minimum_order_amount
------------|---------------------
1           | 2500
2           | 2500
3           | 4500
4           | 3500
5           | 2000
*/


/*  Quest 28 :  Find customers who have placed orders worth more than 5,000 in total */

SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 5000;


/*output
customer_id | total_purchase_amount
------------|----------------------
1           | 6000
2           | 10500
4           | 9500
5           | 6000
*/

/*  Quest 29 :  Display customer-wise total orders and total purchase amount */

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase_amount
FROM order_customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


/*output
customer_name | total_orders | total_purchase_amount
--------------|--------------|----------------------
Janani        | 2            | 6000
Poovarasan    | 3            | 10500
Surya         | 1            | 4500
Preethi       | 2            | 9500
Sandhiya      | 2            | 6000
*/


/*  Quest 30 :  Find customers who placed more than 2 orders and spent more than 8,000 */

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase_amount
FROM order_customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2
   AND SUM(o.amount) > 8000;


/*output
customer_name | total_orders | total_purchase_amount
--------------|--------------|----------------------
Poovarasan    | 3            | 10500
*/

/* 🎉 Customer Orders Project — Questions 16–30 complete! */


/*
==================================================
STUDENT MANAGEMENT PROJECT
1. Create Students Table
==================================================
*/

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

DESC students;

/*
==================================================
STUDENT MANAGEMENT PROJECT
2. Insert Student Data
==================================================
*/

INSERT INTO students
(student_id, student_name, department, marks)
VALUES
(1, 'Janani', 'IT', 85),
(2, 'Poovarasan', 'CSE', 92),
(3, 'Surya', 'ECE', 78),
(4, 'Preethi', 'IT', 95),
(5, 'Sandhiya', 'CSE', 88),
(6, 'Ishu', 'ECE', 72),
(7, 'Arun', 'IT', 65),
(8, 'Meera', 'CSE', 76),
(9, 'Karthik', 'ECE', 91),
(10, 'Priya', 'IT', 82);

SELECT * FROM students;

/*  Quest 31 :  Find the average marks scored by students in each department */

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department;


/*output
department | average_marks
-----------|--------------
CSE        | 85.33
ECE        | 80.33
IT         | 81.75
*/

/*  Quest 32 :  Find departments whose average marks are above 75 */

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 75;


/*output
department | average_marks
-----------|--------------
CSE        | 85.33
ECE        | 80.33
IT         | 81.75
*/

/*  Quest 33 :  Find the highest mark scored in each department */

SELECT department, MAX(marks) AS highest_marks
FROM students
GROUP BY department;


/*output
department | highest_marks
-----------|--------------
CSE        | 92
ECE        | 91
IT         | 95
*/


/*  Quest 34 :  Find the total number of students in each department */

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;


/*output
department | total_students
-----------|---------------
CSE        | 3
ECE        | 3
IT         | 4
*/


/*  Quest 35 :  Find departments having more than 5 students */

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department
HAVING COUNT(*) > 5;


/*output
No records
*/

/*  Quest 36 :  Display departments sorted by average marks in descending order */

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
ORDER BY average_marks DESC;


/*output
department | average_marks
-----------|--------------
CSE        | 85.33
IT         | 81.75
ECE        | 80.33
*/

/*  Quest 37 :  Find the top 3 departments based on average marks */

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;


/*output
department | average_marks
-----------|--------------
CSE        | 85.33
IT         | 81.75
ECE        | 80.33
*/

/*  Quest 38 :  Find departments whose average marks are between 70 and 90 */

SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;


/*output
department | average_marks
-----------|---------------
CSE        | 85.33
ECE        | 80.33
IT         | 81.75
*/

/*  Quest 39 :  Find the total marks scored by students in each department */

SELECT department, SUM(marks) AS total_marks
FROM students
GROUP BY department;


/*output
department | total_marks
-----------|------------
CSE        | 256
ECE        | 241
IT         | 327
*/

/*  Quest 40 :  Display departments sorted by the total number of students */

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department
ORDER BY total_students DESC;


/*output
department | total_students
------------|---------------
IT         | 4
CSE        | 3
ECE        | 3
*/

/*  Quest 41 :  Find the lowest mark scored in each department */

SELECT department, MIN(marks) AS lowest_marks
FROM students
GROUP BY department;


/*output
department | lowest_marks
-----------|--------------
CSE        | 76
ECE        | 72
IT         | 65
*/


/*  Quest 42 :  Find departments where the highest mark is greater than 90 */

SELECT department, MAX(marks) AS highest_marks
FROM students
GROUP BY department
HAVING MAX(marks) > 90;


/*output
department | highest_marks
-----------|--------------
CSE        | 92
ECE        | 91
IT         | 95
*/

/*  Quest 43 :  Find the number of students scoring above 80 in each department */

SELECT department, COUNT(*) AS total_students
FROM students
WHERE marks > 80
GROUP BY department;


/*output
department | total_students
------------|---------------
CSE        | 2
ECE        | 1
IT         | 3
*/

/*  Quest 44 :  Find departments where more than 3 students scored above 75 */

SELECT department, COUNT(*) AS total_students
FROM students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;


/*output
No records
*/

/*  Quest 45 :  Display departments ordered by highest mark in descending order */

SELECT department, MAX(marks) AS highest_marks
FROM students
GROUP BY department
ORDER BY highest_marks DESC;


/*output
department | highest_marks
-----------|--------------
IT         | 95
CSE        | 92
ECE        | 91
*/


/* 🎉 Student Management Project — Questions 31–45 complete!  */

/*

Overall SQL Projects — Completed ✅

Banking → Q1–40 ✅
Railway Reservation → Q41–50 ✅
Employee Management → Q1–15 ✅
Customer Orders → Q16–30 ✅
Student Management → Q31–45 ✅

*/


/*
sql_projects
│
├── BANKING PROJECT
│   │
│   ├── banking_customers
│   │      ├── customer_id
│   │      ├── name
│   │      └── city
│   │
│   └── banking_accounts
│          ├── account_id
│          ├── customer_id → banking_customers
│          ├── account_type
│          └── balance
│
├── RAILWAY RESERVATION PROJECT
│   │
│   ├── railway_trains
│   │      ├── train_id
│   │      ├── train_name
│   │      ├── source
│   │      └── destination
│   │
│   └── railway_bookings
│          ├── booking_id
│          ├── train_id → railway_trains
│          ├── passenger_name
│          ├── fare
│          └── status
│
├── EMPLOYEE MANAGEMENT PROJECT
│   │
│   └── employees
│          ├── emp_id
│          ├── emp_name
│          ├── department
│          ├── salary
│          ├── city
│          └── joining_date
│
├── CUSTOMER ORDERS PROJECT
│   │
│   ├── order_customers
│   │      ├── customer_id
│   │      ├── customer_name
│   │      └── city
│   │
│   └── orders
│          ├── order_id
│          ├── customer_id → order_customers
│          ├── amount
│          └── order_date
│
└── STUDENT MANAGEMENT PROJECT
    │
    └── students
           ├── student_id
           ├── student_name
           ├── department
           └── marks
*/
