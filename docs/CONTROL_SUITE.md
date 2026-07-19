# Mine Inc. Build Week Control Suite

**Status:** Active  
**Last updated:** 2026-07-18  
**Stable committed prototype:** `0.5.0-buildweek`  
**Active milestone:** Milestone 6 — integration and submission closeout

This suite is the durable project memory for Mine Inc. during OpenAI Build Week. It preserves the project’s direction, working method, decisions, risks, milestone state, and submission obligations when a conversation or Codex session changes.

It is deliberately small. Each document has one responsibility.

## Required reading order

A new Technical Lead conversation should read these files in order:

1. `TECHNICAL_LEAD.md` — how to lead and review the project.
2. `MILESTONE_STATUS.md` — what is complete and what is active now.
3. `ROADMAP.md` — the approved sequence to the Build Week end goal.
4. `WORKFLOW.md` — roles, approvals, testing, Git, and evidence.
5. `BUILD_WEEK.md` — competition requirements and submission readiness.
6. `DECISIONS.md` — decisions already made and their reasons.
7. `RISK_REGISTER.md` — current risks and mitigations.

Supporting operational records:

- `codex-collaboration-log.md`
- `test-checklist.md`
- `hackathon-scope.md`
- `concept-overview.md`
- root `AGENTS.md`
- root `README.md`
- root `VERSION`

## Source-of-truth order

When documents appear to conflict, use this order:

1. Official OpenAI Build Week rules and submission requirements.
2. The Product Owner’s latest explicit decision.
3. `MILESTONE_STATUS.md` for current execution state.
4. `DECISIONS.md` for accepted design and engineering decisions.
5. `ROADMAP.md` for sequencing and scope.
6. `TECHNICAL_LEAD.md` and `WORKFLOW.md` for process.
7. Older logs, reports, screenshots, and conversations for history.

Do not silently resolve a genuine contradiction. Surface it to the Product Owner.

## Anti-drift rule

This is a continuation of an active project, not a fresh concept exercise.

A new conversation must not:

- restart discovery;
- redesign completed milestones;
- reopen accepted decisions without new evidence;
- propose the wider game instead of the active Build Week milestone;
- replace Codex as the implementation engineer;
- jump ahead of the current milestone;
- confuse post-hackathon ideas with Build Week commitments.

The first task is always to identify:

- the stable committed version;
- the active milestone;
- the next approval or test gate;
- the nearest submission risk.

## Canonical restart instruction

Use this in a new Technical Lead conversation:

> Continue the Mine Inc. Build Week project as Technical Lead, Systems Architect, Scope Controller, Design Reviewer, QA Reviewer, and Engineering Mentor. Do not restart the project or act as the implementation engineer. Read `docs/CONTROL_SUITE.md` and the required control documents in the stated order, then report the stable version, active milestone, next gate, and most urgent Build Week risk. Codex remains the implementation engineer and must perform the core coding work through proposal, approval, implementation, and completion report. Treat completed milestones and accepted decisions as closed unless new evidence reveals a defect or contradiction.

## Ownership

The Product Owner and Technical Lead own the governance documents.

Codex may:

- read them;
- identify inconsistencies;
- propose factual status updates;
- update operational records when explicitly approved.

Codex must not redefine the project’s governance, roles, milestone sequence, or Build Week strategy.

## Update cadence

Update:

- `MILESTONE_STATUS.md` after every milestone gate;
- `DECISIONS.md` when an important decision is accepted;
- `RISK_REGISTER.md` when a risk changes materially;
- `ROADMAP.md` only when the approved sequence changes;
- `BUILD_WEEK.md` when official requirements or submission readiness changes;
- `TECHNICAL_LEAD.md` and `WORKFLOW.md` only when the operating model changes.

The control suite should remain concise. History belongs in `codex-collaboration-log.md`, Git, screenshots, and completion reports.
