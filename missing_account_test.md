# SQL commands I used:
```
INSERT INTO complaint (
    complaint_id,
    customer_id,
    account_id,
    channel,
    category,
    complaint_text,
    priority,
    status,
    received_at,
    assigned_analyst_id
)
VALUES (
    'CMP011',
    'CUS001',
    NULL,
    'Email',
    'Service Delay',
    'Test complaint with no linked account',
    'Low',
    'OPEN',
    '2026-10-21 09:00:00',
    'EMP001'
);


SELECT
    complaint_id,
    first_name,
    last_name,
    complaint_text,
    account_type
FROM complaint_analyst_view
WHERE complaint_id = 'CMP011';
```
# Result
| complaint_id | first_name | last_name | complaint_text | account_type |
|---|---|---|---|---|
| CMP011 | William | Johnson | Test complaint with no linked account | NULL |


After inserting a test complaint with a NULL account_id, I made sure the complaint remained visible using a query. This proves that complaints without an associated account remain visible.



