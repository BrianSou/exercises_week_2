# Query I used: 
```
SELECT
    'Before Joins' AS time,
    COUNT(*) AS total_complaints,
    COUNT(DISTINCT complaint_id) AS unique_complaints
FROM complaint

UNION ALL

SELECT
    'After Joins',
    COUNT(*),
    COUNT(DISTINCT complaint_id)
FROM complaint_analyst_view;
```
| time | total_complaints | unique_complaints |
|---|---|---|
| Before Joins | 10 | 10 |
| After Joins | 10 | 10 |
# One-to-many duplication explanation
One-to-many duplication in SQL refers to the duplication of a record from one table to another table when a one-to-many relationship is established between those two tables due to multiple related records. For example, there might be a customer table that provides a list of unique customers joined with an orders table that records multiple orders from any single customer. When joined together, the customer's name may be recorded multiple times for each of their orders in the order table. For the above query, this may increase total_complaints after JOIN while the number of unique complaints remain unchanged.