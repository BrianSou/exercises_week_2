# Assisted Journey

How a complaint is handled with the proposed assistant, and where humans stay responsible.

Every step is labelled with one of four types:

- SQL FACT: exact data from the bank's systems, retrieved by approved SQL tools
- DOCUMENT: policy passages found by the retrieval (RAG) tool, with their source
- GENERATED: assistance written by the system. It is advisory only and is never a decision.
- HUMAN: a decision made by an analyst or supervisor

Spec references point to specs.md. "Core Flows step N" refers to the Nth bullet of the agent workflow:

1. Read the complaint narrative and identifiers
2. Classify the issue
3. Identify required evidence
4. Call approved SQL tools
5. Call the RAG tool
6. Check whether evidence is missing or contradictory
7. Prepare the case summary
8. Propose a next action
9. Pause and create a supervisor-review request
10. Continue only after the supervisor decides
11. Record the decision, status update and audit history


## 1. Intake

- Unchanged: the customer still complains through phone, branch, web or email, and the complaint is logged in the existing complaint system (Non-Goals: does not replace the existing banking system).
- Phone complaints arrive as text. The assistant does not transcribe calls yet (F13 deferred, C2).
- SQL FACT: the assistant reads the complaint record, narrative and identifiers (Core Flows step 1, F1).
- The narrative is treated as information only. Instructions written inside it are ignored (Error Conditions, C7).
- HUMAN: the analyst opens the complaint (Interface Expectations).

Change from today: nothing changes for the customer. The analyst starts with the complaint record already loaded.


## 2. Investigation

- GENERATED: the assistant suggests a claim team label (Core Flows step 2, F4).
- GENERATED: the assistant lists the evidence this type of complaint needs (Core Flows step 3).
- If the assistant cannot classify with confidence, the case is treated as sensitive and the analyst decides (Business Rules, C3).
- HUMAN: the analyst accepts or changes the label (Interface Expectations, C6).

Change from today: classification is suggested consistently, but the analyst still decides.


## 3. Evidence search

- SQL FACT: the assistant retrieves account details, account history, complaint history and service requests (Core Flows step 4, F2, F16).
- It only uses data for the customer tied to this complaint, looked up by customer ID (NFR security, C5).
- If the customer is not certain, for example two customers share a family name, the assistant stops. HUMAN: the analyst confirms the customer (Edge Scenarios, C5).
- DOCUMENT: the assistant retrieves the policy passages that apply, attaches them to the case and highlights the relevant section (Core Flows step 5, F14, F15, F17).
- GENERATED: the assistant checks whether evidence is missing or contradictory (Core Flows step 6, F6).
- If evidence, policy or a service is missing, the assistant stops and flags the case. It does not make a recommendation (NFR reliability).
- GENERATED: the assistant drafts a request for the missing information (F10, C1).
- HUMAN: the analyst decides whether to send the request, and sends it through the bank's channels. The assistant never contacts the customer (Non-Goals).

Change from today: one search instead of many systems, every fact and passage shows its source, and the wrong customer's data cannot be pulled in.


## 4. Recommendation

- GENERATED: the assistant prepares a case summary in four separate sections: verified facts, policy evidence, system analysis and human decisions (Core Flows step 7, F5, F11, F16–F19).
- GENERATED: the assistant writes a recommendation and a proposed next action, labelled as advisory (Core Flows step 8, F3, F20, Interface Expectations).
- GENERATED: the assistant writes a confidence paragraph that names any missing or contradictory information (F21, Interface Expectations).
- Customer personal data is masked in the summary (NFR privacy).
- HUMAN: the analyst reviews the summary and can challenge any item. Each challenge is recorded (Interface Expectations, C6).

Change from today: facts, policy and opinion are no longer mixed together, and every statement points to its source.


## 5. Approval

If the outcome is not sensitive:
- HUMAN: the analyst decides the outcome. No supervisor review is needed (Positive Scenarios).

If the outcome is sensitive (legal, regulatory, fraud, credit, compensation, or an uncertain classification):
- GENERATED: the assistant pauses the case and creates a supervisor review request with the summary, evidence and proposed action (Core Flows step 9, F8, Business Rules, C3).
- HUMAN: the supervisor approves, rejects or requests changes (Core Flows step 10, Interface Expectations).
- The supervisor must be a different person from the analyst who prepared the case (Business Rules, C4).
- The assistant cannot approve anything or continue on its own (Error Conditions, Out of Scope).
- If the supervisor requests changes, the case goes back to the analyst.

Change from today: the supervisor receives the evidence with sources already attached, so they do not have to search again.


## 6. Response

- GENERATED: the assistant drafts a response to the customer, with personal data masked (F9, NFR privacy).
- HUMAN: the analyst edits the draft and sends it through the bank's channels (Non-Goals: the assistant does not contact the customer).
- A sensitive outcome can only appear in the response after the supervisor has approved it (Business Rules).

Change from today: the analyst starts from a draft instead of a blank page.


## 7. Closure

- The system records the decision, status change and full audit history, including who performed each action and when (Core Flows step 11, F7, NFR audit).
- Audit records cannot be edited or deleted (NFR audit).
- HUMAN: the analyst closes the case.
- Anyone reviewing the case can see its status and full history in one place (Interface Expectations).

Change from today: the audit trail is complete and lives in one place.


## Where the assistant helps

- Loads the complaint and the customer's data in one place
- Suggests a classification
- Finds and cites the applicable policy
- Spots missing or contradictory information
- Writes the summary, recommendation, confidence paragraph and drafts
- Records everything automatically
- The agent's part takes under 2 minutes (NFR)


## Where humans stay responsible

- Confirming the customer when identity is uncertain
- Accepting or changing the classification
- Challenging anything in the summary
- Deciding the outcome of non-sensitive cases
- Approving, rejecting or requesting changes for sensitive cases (supervisor)
- Sending anything to the customer
- Closing the case
