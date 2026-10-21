-- ===
-- 1. Show each complaint with customer name.
-- ===

SELECT 
	complaint.complaint_id,
	complaint.complaint_text,
	customer.first_name,
	customer.last_name
FROM complaint
INNER JOIN customer
ON complaint.customer_id = customer.customer_id;

-- ===
-- 2. Add optional account type without dropping complaints that have no account.
-- ===

SELECT 
	complaint.complaint_id,
	complaint.complaint_text,
	customer.first_name,
	customer.last_name,
	account.account_type 
FROM complaint
INNER JOIN customer
	ON complaint.customer_id = customer.customer_id
LEFT JOIN account
	ON complaint.customer_id = account.customer_id;

-- ===
-- 3. Verify distinct complaint count before and after joins.
-- ===

-- Before Join
SELECT COUNT(DISTINCT complaint_id) AS complaint_count
FROM complaint;

-- After Join
SELECT COUNT(DISTINCT complaint_id) AS complaint_count
FROM complaint
INNER JOIN customer
	ON complaint.customer_id = customer.customer_id
LEFT JOIN account
	ON complaint.customer_id = account.customer_id;

-- ===
-- 4. Create complaint_analyst_view containing only justified fields.
-- ===

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



