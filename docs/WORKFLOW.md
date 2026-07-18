# Mine Inc. Development Workflow

**Status:** Active  
**Last updated:** 2026-07-18

## Purpose

Define how the Product Owner, Technical Lead, and Codex collaborate so that:

- Codex performs the core implementation work;
- scope remains controlled;
- human decisions remain explicit;
- every milestone is manually verified;
- Git history and evidence support the Build Week submission;
- a new conversation can continue without restarting.

## Responsibility model

| Activity | Product Owner | Technical Lead | Codex |
|---|---|---|---|
| Product vision | Owns | Advises and challenges | Does not redefine |
| Milestone goal | Approves | Shapes and scopes | Reviews feasibility |
| Architecture | Final approval | Reviews and recommends | Proposes implementation |
| Production coding | Does not lead | Does not take over | Owns |
| Manual visual/interaction QA | Owns | Designs tests and analyses results | Supports diagnosis |
| Automated validation | Reviews | Reviews adequacy | Performs |
| Scope control | Final decision | Owns day-to-day control | Must comply |
| Commit and push | Owns | Advises | Never performs |
| Evidence capture | Owns | Plans | Identifies useful evidence |
| Submission strategy | Owns | Owns readiness guidance | Provides implementation facts |

## Standard milestone cycle

### 1. Define the player outcome

The Product Owner and Technical Lead agree:

- what the player should be able to do;
- what the player should see;
- what is explicitly excluded;
- how success will be tested.

The outcome must be small enough to finish and demonstrate.

### 2. Request a Codex proposal

Codex receives a planning-only prompt that asks it to:

- inspect the current repository;
- identify exact files;
- explain scene and script changes;
- define state and signals;
- identify risks;
- propose acceptance criteria;
- propose manual tests;
- ask for unresolved product decisions;
- make no changes;
- wait for approval.

### 3. Review the proposal

The Technical Lead reviews for:

- unnecessary infrastructure;
- milestone leakage;
- duplicated state;
- reset and race conditions;
- input focus;
- renderer constraints;
- hidden dependencies;
- regression coverage;
- player clarity.

The Product Owner makes final design decisions.

### 4. Approve a bounded implementation

The approval prompt states:

- approved behaviour;
- approved tuning;
- exact constraints;
- allowed files;
- forbidden systems;
- required completion report;
- no commit or push.

If the proposal needs revision, Codex revises it before coding.

### 5. Codex implements

Codex performs the production work in the primary build session.

It must remain within the approved milestone.

Codex should update operational documentation when approved:

- `README.md`;
- `docs/codex-collaboration-log.md`;
- `docs/test-checklist.md`;
- `VERSION`.

Codex must not alter governance documents unless specifically authorised.

### 6. Codex completion report

The report must include:

- every file created, modified, or deleted;
- final scene structure;
- script responsibilities;
- state transitions;
- safeguards;
- tuning values;
- validation performed;
- known limitations;
- exact manual test steps;
- confirmation of excluded work;
- confirmation that it did not commit or push.

### 7. Human manual QA

The Product Owner tests in the target environment.

Testing should cover:

- the new happy path;
- unavailable and invalid actions;
- repeated input;
- reset at critical moments;
- late timer/signal behaviour;
- interaction during transitions;
- full-loop replay;
- regression of earlier milestones;
- launch, exit, and relaunch;
- debugger errors;
- visible quality at normal camera distance.

The Product Owner reports observations, not guessed causes.

### 8. Defect loop

For each failure:

1. document the exact observation;
2. give Codex a read-only diagnostic request;
3. require a root-cause report and smallest proposed fix;
4. review and approve;
5. let Codex implement;
6. retest the failed path;
7. run focused regressions.

Do not bundle unrelated polish into a defect fix.

### 9. Evidence capture

Capture evidence after the build passes, not before.

Useful evidence includes:

- gameplay screenshots;
- short gameplay clips;
- Codex proposal and completion report;
- manual test confirmation;
- Git history;
- repository documentation;
- visible version number;
- important defect diagnosis and correction.

Evidence should show both the project and the human–Codex workflow.

### 10. Git gate

Before committing:

```powershell
git status
git diff --stat
git diff --check
```

Review:

- intended files only;
- no `.godot/` cache;
- no temporary files;
- legitimate `.gd.uid` source metadata handled consistently;
- media files deliberately included or excluded;
- documentation matches the tested build.

The Product Owner then stages, commits, pushes, and confirms a clean status.

Codex never commits or pushes.

### 11. Close the milestone

After commit and push:

- update `MILESTONE_STATUS.md`;
- add accepted decisions to `DECISIONS.md`;
- update risks if necessary;
- identify the next milestone gate;
- capture any remaining evidence;
- do not reopen the closed milestone unless a regression appears.

## Prompt discipline

### Planning prompt must say

- inspect first;
- propose only;
- do not modify files;
- do not commit or push;
- wait for approval;
- list exact files and risks;
- do not implement future milestones.

### Approval prompt must say

- approved behaviour and tuning;
- explicit exclusions;
- allowed file changes;
- reset and guard requirements;
- regression requirements;
- required completion report;
- do not commit or push.

### Diagnostic prompt must say

- report observed behaviour exactly;
- inspect the actual implementation;
- identify confirmed root cause;
- propose the smallest correction;
- do not change files yet;
- wait for approval.

## Git and versioning rules

- Every milestone must leave the default branch runnable.
- Use one purposeful commit after manual verification.
- Use a separate commit for clearly independent evidence or governance work when useful.
- The root `VERSION` is the canonical build version.
- HUD version text must match the intended milestone version.
- Do not mix failed experiments into the final commit.
- Do not rewrite history during Build Week unless necessary and understood.

## Documentation roles

Governance documents:

- owned by Product Owner and Technical Lead;
- define direction and process;
- changed deliberately.

Operational documents:

- maintained alongside implementation;
- record what Codex did and what the human verified.

The collaboration log should distinguish:

- Codex contributions;
- human decisions;
- automated verification;
- manual verification;
- defects and root causes.

## Build Week integrity

This workflow must strengthen, not obscure, Codex’s contribution.

Therefore:

- core functionality is built in Codex;
- the primary Codex session is preserved;
- proposals, approvals, reports, commits, and screenshots show the timeline;
- the README explains where Codex accelerated work and where the human made decisions;
- pre-existing concept work is distinguished from Build Week implementation;
- the final video explains both Codex and GPT-5.6 use;
- governance documents are described as human/Technical Lead controls, not as substitute implementation.

## Conversation restart procedure

A new Technical Lead conversation must:

1. read `docs/CONTROL_SUITE.md`;
2. follow its required reading order;
3. identify the current milestone from `MILESTONE_STATUS.md`;
4. preserve Codex as implementation engineer;
5. continue at the next gate;
6. avoid retelling or redesigning completed work.

A new Codex session should be avoided during the core build unless the primary session becomes unusable, because the submission requires the session ID from the thread where most core functionality was built.
