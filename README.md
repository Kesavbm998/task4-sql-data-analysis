# Task 4 – SQL for Data Analysis (SQLite Compatible)

## Objective
Write SQL queries to analyze and manipulate structured data using the `sample_dataset.sql` file.

## Tools Used
- DB Browser for SQLite
- Dataset: `sample_dataset.sql`

## Queries Implemented
1. **WHERE vs HAVING**  
   Demonstrated the difference between filtering rows before aggregation (`WHERE`) and after aggregation (`HAVING`).

2. **Joins**  
   - INNER JOIN between `customers` and `orders`.  
   - LEFT JOIN to include all customers, even those without orders.  
   - RIGHT JOIN simulated in SQLite by swapping tables in a LEFT JOIN.

3. **Average Revenue Per User (ARPU)**  
   Calculated ARPU using a subquery and the `AVG()` function.

4. **Subqueries**  
   Found customers who spent more than the average order value using nested queries.

5. **Optimization with Indexes**  
   Created new indexes to speed up query performance:  
   - `idx_order_date` → Speeds up queries filtering/sorting by `order_date`.  
   - `idx_customer_date` → Composite index for filtering by both `customer_id` and `order_date`.  
   Used `PRAGMA index_list()` to list existing indexes.

6. **Views**  
   Created a `customer_spending` view to quickly see total spending per customer.

7. **NULL Handling**  
   Used `COALESCE()` to replace NULL values in `city` with `'Unknown'`.

## Deliverables
- `task4_queries_sqlite.sql` – All queries compatible with SQLite.
- `sample_dataset.sql` – SQL script to create and populate the tables.
- `screenshots/` – Output screenshots for each query.

## How to Run
1. Open DB Browser for SQLite.
2. Create a new database and import `sample_dataset.sql` (File → Import → Database from SQL file).
3. Open the Execute SQL tab.
4. Run the queries from `task4_queries_sqlite.sql` one by one.
5. Saved query outputs as screenshots in the `screenshots` folder.

---
**Author:** Kesav B M
