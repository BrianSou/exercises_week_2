DROP VIEW IF EXISTS complaint_analyst_view;

CREATE VIEW complaint_analyst_view AS
SELECT 
	complaint.complaint_id,
	customer.first_name,
	customer.last_name,
	complaint.complaint_text,
	complaint.channel,
	complaint.category,
	complaint.status,
	complaint.priority,
	complaint.received_at,
	account.account_type,
	investigation.investigation_summary,
	recommendation.recommendation_text,
	recommendation.confidence_score
FROM complaint
INNER JOIN customer
	ON complaint.customer_id = customer.customer_id
LEFT JOIN account
	ON complaint.account_id = account.account_id
LEFT JOIN investigation
	ON complaint.complaint_id = investigation.complaint_id
LEFT JOIN recommendation
	ON recommendation.investigation_id = investigation.investigation_id;

SELECT *
FROM complaint_analyst_view;

/*
 * Justification for fields:
 * complaint_id = Uniquely identifies each complaint for tracking.
 * first_name = Identifies the customer associated with the complaint.
 * last_name = Helps distinguish customers with similar names.
 * complaint_text = Provides details of the customer's issue.
 * channel = Shows how the complaint was submitted.
 * category = Classifies complaints to identify common issues.
 * status = Tracks complaint resolution progress.
 * priority = Helps identify urgent complaints.
 * received_at = Tracks when complaints were received.
 * account_type = Provides account context without exposing sensitive details.
 * investigation_summary = Summarizes findings from the investigation.
 * recommendation_text = Provides suggested actions to resolve the complaint.
 * confidence_score = Indicates the confidence level of the recommendation.
 */




