# Alignment Notes

Purpose: confirm that the assisted journey does not invent behavior that is not in the spec.

Date: 2026-10-15
Files checked: assisted_journey.md and current_state_journey.md, against specs.md


## Result

- Every capability in the assisted journey traces to a section of specs.md.
- No capability goes against the Out of Scope or Non-Goals sections.


## Capability trace

Intake
- Read the complaint record, narrative and identifiers: Core Flows step 1, F1
- Treat the narrative as information only: Error Conditions
- Phone complaints arrive as text: F13
- Analyst opens the complaint: Interface Expectations

Investigation
- Suggest a claim team label: Core Flows step 2, F4
- List the evidence needed: Core Flows step 3
- Uncertain classification is treated as sensitive: Business Rules 
- Analyst accepts or changes the label: Interface Expectations

Evidence search
- Retrieve account details, history, complaint history and service requests: Core Flows step 4, F2, F16
- Only use the complaint's own customer, looked up by ID: NFR security, Edge Scenarios
- Stop and ask the analyst when the customer is not certain: Edge Scenarios
- Retrieve, attach and highlight the policy that applies: Core Flows step 5, F14, F15, F17
- Check for missing or contradictory evidence: Core Flows step 6, F6
- Stop and flag when evidence, policy or a service is missing: NFR reliability
- Draft a request for missing information: F10
- Analyst sends the request, never the assistant: Non-Goals

Recommendation
- Case summary in four separate sections: Core Flows step 7, F5, F11, F16, F17, F18, F19
- Advisory recommendation and next action: Core Flows step 8, F3, F20, Interface Expectations
- Confidence paragraph: F21, Interface Expectations
- Mask personal data: NFR privacy
- Analyst challenges any item: Interface Expectations 

Approval
- Analyst decides non-sensitive cases: Positive Scenarios, Non-Goals (does not replace analysts)
- Pause and send sensitive cases to the supervisor: Core Flows step 9, F8, Business Rules
- What counts as sensitive: Business 
- Supervisor approves, rejects or requests changes: Core Flows step 10, Interface Expectations
- Supervisor must not be the case's preparer: Business Rules
- Assistant cannot approve: Error Conditions, Out of Scope

Response
- Draft a customer response: F9
- Analyst edits and sends it: Non-Goals
- Sensitive outcome only after approval: Business Rules

Closure
- Record decisions, status and audit history with who and when: Core Flows step 11, F7, NFR audit
- Audit records cannot be edited or deleted: NFR audit
- Analyst updates the status and closes the case: Scope (status updates)
- Status and history visible on the case: Interface Expectations

Timing
- Agent's part takes under 2 minutes: NFR


## Spec features checked against the journey

- F1 to F11: all used in the assisted journey
- F12: not used. It is out of current scope because it would contact the customer.
- F13: not used. It is deferred, and phone complaints arrive as text (C2).
- F14 to F21: all used in the assisted journey


## Out of Scope and Non-Goals check

- Final legal, regulatory, fraud, credit or compensation decisions without a human: not in the journey. These outcomes always go to a supervisor.
- Generated text used as policy evidence: not in the journey. Policy evidence only comes from the retrieval tool, with a source.
- Unrestricted database access: not in the journey. Only approved SQL tools are used, for the complaint's own customer.
- Replacing analysts or supervisors: not in the journey. Every decision is HUMAN.
- Replacing the existing banking system: not in the journey. Intake and sending stay in the bank's current channels.
- Contacting the customer directly: not in the journey. The assistant only writes drafts.


## Current state journey check

- The current state journey describes today's process and adds no new system behavior.
- Its problems (slow, inconsistent, hard to audit) come from the Overview in specs.md and the business background.
- The specific delays and rework (missing identifiers, misrouting, outdated policy, wrong customer with the same family name) are reasonable assumptions that match the Edge Scenarios and Overview. They should be confirmed with real analysts.


## Follow-ups

- The product owner answers Q1 (claim team labels), Q2 (Delivery Reviewer role) and Q3 (how success criteria are measured).
