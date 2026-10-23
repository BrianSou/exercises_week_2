# Feature Specification
1. Get user's complaint record
2. Gather relevant user's information from database
3. Preparing an analyst recommendation for a complaint
4. Categorize claims by defined claim team label
5. Create a complaint file that contains relevant information
6. Identify missing information from claim interaction
7. Record actions and who performed them for each event
8. Send proposed actions and recommendations to a supervisor
9. Draft a reponse for the customer to their case
10. Request missing information to the customer
11. Summarize customer's complaint
12. Before submitting the complaint, propose the customer to 
    fill some required information to process claim faster
13. Transcribe phone call complaint
14. Attach relevant policy to complaint document
15. Highlight policy section relevant to the document
16. Separate verified facts 
17. Separate retrieved policy evidence
18. Separate system-generated analysis
19. Separate human decisions
20. Propose a next action relevant to the claim
21. Write a confidence paragraph describing what it generated

## Overview
Banks receive customer complaints through multiple channels that Complaint Analysts and Supervisors need to investigate and address. Complaint handling currently required repeated mannual checks across structured operational data and unstructured policy documents, making the processs slow, inconsistent, and difficult to audit. The proposed solution will combine deterministic services for exact customer and complaint facts with retrieval-augmented generation for approved policy content. A controlled investigation workflow will then organize these inputs, show where each piece of evidence came from and help draft a recommendation.

## Scope
### In Scope
- Retrieve approved evidence to prepare a case summary that separated verified facts, retreived policy evidence, and generated analysis.
- Prepare analyst recommendations of proposed actions for complaints.
- Create supervisor review requests.
- Record decisions, status updates, and audit history

### Out of Scope
- Make final legal, regulatory, fraud, credit, or compensation decisions without human approval.
- Treat generated recommendations as policy evidence without a valid source citation.
- Give model unrestricted database or system access.

## Non-Goals
- Replace human complaint analysts and supervisors
- Replace the existing banking system
- Building every possible banking complaint process or product integration.
- The assistant will not contact customer directly

## Actors
  - Complaint analyst
  - Supervisor
  - Delivery Reviewer

## Preconditions
- Approved access to customer complaint records
- Approved access to customer account history and details
- Approved acccess to policy and procedure documents
- Approved access to database system services

## Core Flows

Agent workflow : 

- Read the complaint narrative and identifiers. 
- Classify the issue complaint
- Identify required evidence: 
- Call approved SQL tools to retrieve exact operational facts. 
- Call the RAG tool to retrieve relevant policy passages. 
- Check whether required evidence is missing or contradictory. 
- Prepare a case summary that separates verified facts, retrieved policy evidence and generated analysis. 
- Propose a next action. 
- Pause and create a supervisor-review request if necessary
- Continue only after the supervisor approves, rejects or requests changes. 
- Record the decision, status update and audit history.

## Business Rules

- Requires human approval for sensitive outcomes

## Error Conditions

- Agent accesses unauthorized data
- Agent ties claim with unrelevant data
- Agent ties claim with a different client information
- Agent bypasses its no-decision safeguard and self approve a decision

## Non-Functional Requirements

- Agent must go through its workflow in under 2 minutes

Security, privacy, audit and reliability constraints:

- Agent only accesses data and tools approved for the current complaint and the user's role
- Agent only uses information belonging to the customer tied to the complaint
- Customer personal data is masked in summaries and drafts unless required for the case
- Every data access, recommendation version, approval and status change is recorded with who performed it and when
- Audit records cannot be edited or deleted
- If required evidence, policy or a service is unavailable, agent stops and flags the case for analyst review instead of producing a recommendation

## High-Level Interface Expectations

- Analyst can open a complaint and view a case summary that separates verified facts, retrieved policy evidence, system-generated analysis and human decisions, with the source shown for each fact and policy passage
- Recommendations and proposed next actions are labeled as advisory, show missing or contradictory information, and include the agent's confidence statement
- Supervisor can review the case summary, evidence and proposed action, then approve, reject or request changes before any sensitive outcome is finalized
- Each case displays its status and a full audit history of actions, decisions and who performed them

## Success Criteria

- Agent classifies 95 out of 100 claims correctly
- Agent goes out of its scope of work on 2 out of 100 claims 
- Agent summarizes claim report with a score of 80% accuracy
- Agent retrieves user's relevant information accurately with an 80% accuracy

## Positive Scenarios

- Claim do not need to be escalated
- Claim fits 80% of a claim policy

## Negative Scenarios

- Claim requires supervisor approval
- Claim requires additional information from multiple complaint analysts

## Edge Scenarios

- Two persons sharing the same Familly name have separate claims and agent gets confused
- Two clients file claim about one another
- Several clients file claim about exact identical issue

## References
- Project brief
- Scenarios