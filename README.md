# SQL Cheat Sheet

## Table of Contents
- [What is SQL?](#what-is-sql)
- [Basic SQL Syntax](#basic-sql-syntax)
- [SQL Data Types](#sql-data-types)
- [SQL Operators](#sql-operators)
- [SQL Functions](#sql-functions)
- [SQL Clauses](#sql-clauses)
- [SQL Joins](#sql-joins)
- [SQL Views](#sql-views)
- [SQL Indexes](#sql-indexes)
- [SQL Constraints](#sql-constraints)
- [SQL Transactions](#sql-transactions)
- [SQL Performance Tuning Tips](#sql-performance-tuning-tips)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Conclusion](#conclusion)

---

## What is SQL?
SQL stands for Structured Query Language. It is used to manage and manipulate structured data stored in a relational database management system (RDBMS). SQL is case-insensitive, but SQL keywords are usually capitalized, such as `SELECT`, `FROM`, and `WHERE`.

## Basic SQL Syntax
Here are some common SQL commands and their syntax:

| Command       | Syntax                                                                                   | Description                                                            |
|---------------|------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| **ALTER TABLE**| `ALTER TABLE table_name ADD column_name datatype;`                                       | Add columns to a table in a database                                   |
| **AS**         | `SELECT column_name AS 'Alias' FROM table_name;`                                         | Rename a column or table using an alias                                |
| **CASE**       | `SELECT column_name, CASE WHEN condition THEN 'Result_1' ELSE 'Result_2' END FROM table_name;` | Create conditional outputs inside a `SELECT` statement                 |
| **CREATE TABLE**| `CREATE TABLE table_name (column_1 datatype, column_2 datatype);`                       | Create a new table with specified columns and datatypes                |
| **DELETE**     | `DELETE FROM table_name WHERE some_column = some_value;`                                 | Remove rows from a table                                               |
| **INSERT**     | `INSERT INTO table_name (column_1, column_2) VALUES (value_1, 'value_2');`                | Add new rows to a table with specified values                          |
| **SELECT**     | `SELECT column_name FROM table_name;`                                                    | Fetch data from a database                                             |
| **UPDATE**     | `UPDATE table_name SET column_name = value WHERE condition;`                             | Modify existing rows in a table                                        |

## SQL Data Types
SQL has different data types depending on the implementation (e.g., MySQL, PostgreSQL). Below is a quick summary of common data types:

### MySQL Data Types
- **String**: `CHAR(size)`, `VARCHAR(size)`, `TEXT(size)`
- **Numeric**: `INT(size)`, `FLOAT(size, d)`, `DECIMAL(size, d)`
- **Date/Time**: `DATE`, `DATETIME`, `TIMESTAMP`

### PostgreSQL Data Types
- **String**: `VARCHAR(size)`, `TEXT`
- **Numeric**: `INTEGER`, `SERIAL`, `NUMERIC`
- **Date/Time**: `TIMESTAMP`, `DATE`, `TIME`

## SQL Operators
Operators are used to specify conditions in SQL statements.

| Operator       | Syntax                                                                                       | Description                                     |
|----------------|----------------------------------------------------------------------------------------------|-------------------------------------------------|
| **AND**        | `SELECT column_name FROM table_name WHERE column_1 = value_1 AND column_2 = value_2;`         | Combine two conditions                           |
| **OR**         | `SELECT column_name FROM table_name WHERE column_1 = value_1 OR column_2 = value_2;`          | At least one of the conditions is true           |
| **BETWEEN**    | `SELECT column_name FROM table_name WHERE column_name BETWEEN value_1 AND value_2;`           | Value falls between a specified range            |
| **LIKE**       | `SELECT column_name FROM table_name WHERE column_name LIKE pattern;`                          | Match a specific pattern                         |
| **IN**         | `SELECT column_name FROM table_name WHERE column_name IN (value_1, value_2);`                 | Match any value in a list                        |

## SQL Functions
SQL functions are built-in commands for performing operations on data.

| Function       | Syntax                                                              | Description                                     |
|----------------|---------------------------------------------------------------------|-------------------------------------------------|
| **AVG()**      | `SELECT AVG(column_name) FROM table_name;`                           | Return the average value                         |
| **COUNT()**    | `SELECT COUNT(column_name) FROM table_name;`                         | Count the number of rows                         |
| **MAX()**      | `SELECT MAX(column_name) FROM table_name;`                           | Return the highest value                         |
| **MIN()**      | `SELECT MIN(column_name) FROM table_name;`                           | Return the lowest value                          |
| **SUM()**      | `SELECT SUM(column_name) FROM table_name;`                           | Return the sum of values                         |

## SQL Clauses
Clauses define the structure of SQL queries:

| Clause         | Syntax                                                              | Description                                     |
|----------------|---------------------------------------------------------------------|-------------------------------------------------|
| **WHERE**      | `SELECT column_name FROM table_name WHERE condition;`                | Filter records based on condition                |
| **ORDER BY**   | `SELECT column_name FROM table_name ORDER BY column_name ASC | DESC;`  | Sort the result set                              |
| **GROUP BY**   | `SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;` | Group rows with the same values                  |
| **LIMIT**      | `SELECT column_name FROM table_name LIMIT number;`                   | Limit the number of rows returned                |

## SQL Joins
Joins are used to combine rows from two or more tables based on a related column.

| Join Type      | Syntax                                                              | Description                                     |
|----------------|---------------------------------------------------------------------|-------------------------------------------------|
| **INNER JOIN** | `SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id;`   | Match rows in both tables                        |
| **LEFT JOIN**  | `SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.id;`    | All rows from left table, matched rows from right|
| **RIGHT JOIN** | `SELECT * FROM table1 RIGHT JOIN table2 ON table1.id = table2.id;`   | All rows from right table, matched rows from left|
| **FULL JOIN**  | `SELECT * FROM table1 FULL JOIN table2 ON table1.id = table2.id;`    | All rows where there is a match in either table  |

## SQL Views
Views are virtual tables created using SQL queries.

| Command          | Syntax                                                               | Description                                     |
|------------------|----------------------------------------------------------------------|-------------------------------------------------|
| **CREATE VIEW**  | `CREATE VIEW view_name AS SELECT column1, column2 FROM table_name;`   | Create a view from a query                       |
| **DROP VIEW**    | `DROP VIEW view_name;`                                               | Delete a view                                    |

## SQL Indexes
Indexes help speed up data retrieval. 

| Command            | Syntax                                                      | Description                                     |
|--------------------|-------------------------------------------------------------|-------------------------------------------------|
| **CREATE INDEX**   | `CREATE INDEX index_name ON table_name(column_name);`        | Create an index                                  |
| **DROP INDEX**     | `DROP INDEX index_name ON table_name;`                       | Delete an index                                  |

## SQL Constraints
Constraints are rules applied to columns in a table.

- **NOT NULL**: Ensures a column cannot have a NULL value.
- **UNIQUE**: Ensures unique values in a column.
- **PRIMARY KEY**: A combination of NOT NULL and UNIQUE.
- **FOREIGN KEY**: Ensures referential integrity.
- **CHECK**: Ensures values meet a specific condition.
- **DEFAULT**: Provides a default value.

## SQL Transactions
SQL transactions are used to execute multiple commands as a single unit of work.

| Command          | Syntax                                                           | Description                                     |
|------------------|------------------------------------------------------------------|-------------------------------------------------|
| **COMMIT**       | `COMMIT;`                                                        | Save changes                                     |
| **ROLLBACK**     | `ROLLBACK;`                                                      | Undo changes                                     |
| **SAVEPOINT**    | `SAVEPOINT savepoint_name;`                                      | Define a point for partial rollback              |

## SQL Performance Tuning Tips
- **Use indexes** for faster queries.
- **Avoid SELECT *;** specify columns instead.
- **Use `EXPLAIN`** to analyze query plans.
- **Minimize use of subqueries** and `DISTINCT`.
- **Prefer `JOIN` clauses** over filtering in `WHERE`.

## Frequently Asked Questions
- **Can I hack with SQL?**  
  Yes, through SQL injection, a common hacking technique.
  
- **Is SQL the same as MySQL or PostgreSQL?**  
  No, SQL is a language, while MySQL and PostgreSQL are implementations.

## Conclusion
This cheat sheet provides a quick reference for common SQL commands and techniques. Bookmark this page or download a PDF version to keep it handy for your SQL queries.
