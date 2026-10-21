# Filter: List high-priority unresolved complaints.
```
SELECT *
FROM complaint
WHERE priority = 'High'
  AND status <> 'CLOSED';
```

1. Queries complaint table using SELECT and FROM keywords
2. priority = 'High' selects complaints with exactly the High priority label.  
3. status <> 'CLOSED' selects complaints without the CLOSED status, so OPEN, IN_PROGRESS, or UNDER_REVIEW are chosen.  

# Date condition: Show complaints opened within a supplied date range.
```
SELECT *
FROM complaint
WHERE received_at BETWEEN '2025-01-03' AND '2025-01-10';
```

1. Queries complaint table using SELECT and FROM keywords
2. WHERE keyword chooses items whereby the received_at attribute has dates between 2025-01-03 and 2025-01-10

# Null-handling: List closed complaints where date_closed is missing (expected zero).
```
SELECT *
FROM complaint
INNER JOIN service_request
ON complaint.customer_id = service_request.customer_id
WHERE complaint.status = 'CLOSED' AND service_request.closed_at IS NULL;
```

1. Queries joined complaint and service_request tables using SELECT, FROM, and INNER JOIN keywords, combining items where complaint.customer_id = service_request.customer_id
2. WHERE keyword chooses items whereby the complaint's status attribute is CLOSED and the service_request's closed_at attribute is NULL.