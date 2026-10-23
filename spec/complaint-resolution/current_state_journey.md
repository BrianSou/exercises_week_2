# Current State Journey

How a complaint is handled today, without the assistant.

This is based on the Overview in specs.md and the business background. Handling today is slow, inconsistent and difficult to audit because analysts check structured data and policy documents by hand. System names are kept generic because the spec does not name real systems.

People involved:
- Customer
- Front-line staff (call centre, branch, web and email teams)
- Complaint analyst
- Supervisor


## 1. Intake

What happens:
- The customer complains by phone, at a branch, through the website or by email.
- Front-line staff log the complaint in the complaint system.
- For phone calls, staff type up notes of the call by hand.

Systems: phone, branch, web form, email inbox, complaint system

Handoffs: customer to front-line staff, then front-line staff to the analyst queue

Delays:
- The complaint waits in the queue before an analyst picks it up.
- Typing up phone notes takes time.

Rework:
- Identifiers such as the account number are often missing, so the analyst has to look them up or ask again.
- Notes from different channels vary in quality and detail.


## 2. Investigation

What happens:
- The analyst reads the complaint and decides what type of complaint it is.
- The analyst decides which claim team should handle it.
- The analyst works out which information needs checking.

Systems: complaint system

Handoffs: the case is sent to another claim team if the first one is wrong

Delays:
- The analyst has to understand the complaint from scratch.
- A wrongly routed case waits in another team's queue.

Rework:
- Different analysts label similar complaints differently.
- A misrouted case has to be reassigned and started again.


## 3. Evidence search

What happens:
- The analyst opens each system separately: account details, transaction history, complaint history and service requests.
- The analyst searches the policy and procedure documents by hand to find the rule that applies.
- The analyst copies what they find into notes or emails.

Systems: core banking or account system, complaint history, service request system, policy document library, personal notes

Handoffs:
- The analyst asks other analysts or teams for information they cannot access.
- The analyst contacts the customer when information is missing.

Delays:
- Switching between systems.
- Waiting for other teams.
- Waiting for the customer to reply.

Rework:
- Missing or contradictory information means going back to the customer and repeating the search.
- With customers who share a family name, the analyst can pick up the wrong customer's records.
- The analyst may use an outdated version of a policy.
- When several analysts are involved, they repeat each other's checks.


## 4. Recommendation

What happens:
- The analyst writes a recommendation in free text.
- Facts, policy quotes and the analyst's own opinion are mixed together.
- Sources are often not recorded.

Systems: word processor or email, complaint system

Handoffs: none yet

Delays: writing from scratch for every case

Rework:
- Recommendations are inconsistent between analysts.
- Without sources, the recommendation is hard to check later.


## 5. Approval

What happens:
- For sensitive outcomes, the analyst sends the case to a supervisor, usually by email.
- The supervisor re-checks the evidence because sources are not clear.
- The supervisor approves, rejects or sends the case back.

Systems: email, complaint system

Handoffs: analyst to supervisor, and back again if changes are needed

Delays:
- Waiting in the supervisor's queue.
- The supervisor repeats the search to verify the evidence.

Rework: cases sent back for more evidence go through steps 3 and 4 again


## 6. Response

What happens:
- The analyst writes a response to the customer from scratch.
- The analyst checks by hand that the response does not expose personal data it shouldn't.
- The analyst sends the response through the bank's channels.

Systems: email, letter templates, complaint system

Handoffs: analyst to customer

Delays: writing each response from scratch

Rework: wording is inconsistent, and responses sometimes need correcting


## 7. Closure

What happens:
- The analyst updates the case status and closes it.
- The record of what happened is spread across emails, notes and several systems.

Systems: complaint system, email, notes

Handoffs: none

Delays: none at this step, but audits later are slow

Rework: rebuilding who decided what, and when, is difficult during an audit


## Main problems

- Slow: many separate systems, manual searches and waiting on other people.
- Inconsistent: each analyst classifies, searches and writes differently.
- Hard to audit: sources and decisions are not recorded in one place.
- Error-prone: the wrong customer's data can be picked up, and outdated policy can be used.
