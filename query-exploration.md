# Observations and unexpected data
- Employee is a single entity with a role attribute rather than separate entities for each role
- Complaints have no blank fields
- Complaints has 4 statuses: 5 OPEN, 2 IN_PROGRESS, 2 UNDER_REVIEW, 1 CLOSED.
- There are different priorities for each complaint
- Service requests can have NULL closed_at dates
- Complaints record is rather small
- Fees are separate from transactions
- Customers have a customer_response entity
- There's an audit log that appears to keep track of actions done by employees