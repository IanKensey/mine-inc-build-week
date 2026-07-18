# Mine Inc. Roadmap

**Status:** Active  
**Last updated:** 2026-07-18

## Build Week destination

The Build Week prototype must prove one complete progression loop:

**Observe → Select → Mine → Destroy → Collect → Manufacture → Attach**

Everything in the committed Build Week roadmap serves that loop.

## Stable foundation

### Milestone 0 — Repository and documentation baseline

**Status:** Complete

Delivered:

- Git repository and project structure;
- Build Week scope;
- concept overview;
- collaboration log;
- test checklist;
- Godot `.gitignore`;
- MIT licence;
- Codex operating instructions.

Purpose:

Create a traceable, runnable project foundation and distinguish the pre-existing concept from Build Week implementation.

### Milestone 1 — 3D foundation

**Version:** `0.1.0-buildweek`  
**Status:** Complete, manually verified, committed

Player outcome:

- view the escape pod in space;
- orbit and zoom;
- reset the camera;
- understand the prototype HUD.

Delivered:

- Godot project;
- built-in-geometry pod;
- lighting and depth markers;
- bounded camera;
- HUD and version display.

### Milestone 2 — Asteroid mining

**Version:** `0.2.0-buildweek`  
**Status:** Complete, manually verified, committed

Player outcome:

- see an asteroid approach on a visible trajectory;
- select it;
- fire discrete mining shots;
- destroy it on the fifth hit;
- reset and replay.

Delivered:

- authored fly-by;
- dotted path;
- selection and HP;
- mining beam;
- destruction effect;
- repeatable reset.

### Milestone 3 — Resource release and collection

**Version:** `0.3.0-buildweek`  
**Status:** Complete, manually verified, committed

Player outcome:

- see three Rock pickups released;
- collect them individually;
- build a Rock total;
- understand that uncollected Rock can be lost.

Delivered:

- three pickups;
- two Rock each;
- predictable drift;
- click collection;
- scene-local inventory;
- 14-second lifetime;
- final three-second fade;
- renderer-compatible per-instance material fading.

## Completed manufacturing milestone

### Milestone 4 — Manufacture one Storage Module

**Version:** `0.4.0-buildweek`  
**Status:** Complete, manually verified, committed

Player outcome:

- understand the Storage Module cost;
- collect enough Rock;
- start manufacturing;
- see short progress;
- receive one completed module pending placement.

Approved boundary:

- fixed cost: 4 Rock;
- duration: 3 seconds;
- one always-visible manufacturing panel;
- spend Rock at start;
- allow collection during manufacturing;
- one pending Storage Module;
- HUD-only pending state;
- reset clears production and pending state.

Explicitly not included:

- module geometry;
- placement preview;
- attachment;
- multiple recipes;
- crafting framework;
- storage-capacity rules.

Completion evidence:

- Codex completion report reviewed;
- full manual test sequence passed;
- no faults or debugger errors found;
- short video captured showing Rock collection and manufacturing;
- changes committed and pushed.

## Active required work

### Milestone 5 — Attach the Storage Module

**Target version:** `0.5.0-buildweek`  
**Status:** Active planning

Player outcome:

- take the pending Storage Module;
- place or attach it to a clear pod attachment area;
- receive unmistakable visual confirmation that the pod has expanded;
- complete the prototype loop.

Minimum intended scope:

- one module;
- one simple placement surface or small 3D grid;
- clear valid-position feedback;
- one confirmed attachment;
- pending state consumed exactly once;
- reset restores the clean prototype;
- no moving, rotating, deleting, capacity simulation, or multiple modules unless required for clarity.

Key design question:

Find the smallest interaction that genuinely demonstrates attachment without creating a general construction system.

Milestone 4 is now committed and reviewed. The next task is to define the smallest convincing attachment interaction before asking Codex for a planning proposal.

### Milestone 6 — Integration and submission closeout

**Target version:** `0.6.0-buildweek` or final Build Week tag  
**Status:** Planned

Purpose:

Make the completed loop reliable, understandable, testable, and ready for judging.

Work may include:

- full-loop regression;
- focused UI wording and layout polish;
- reset and replay hardening;
- Windows run instructions;
- repository cleanup;
- README collaboration narrative;
- final screenshots;
- final gameplay capture;
- public YouTube demo under three minutes;
- Devpost description;
- track selection;
- `/feedback` Codex Session ID;
- submission checklist;
- final tag.

Milestone 6 is not a feature-expansion milestone.

## Stop line

The required Build Week build ends when:

- the full loop works;
- the build matches the video;
- judges can run it;
- Codex/GPT-5.6 collaboration is clearly documented;
- the submission package is complete.

Do not add another gameplay system merely because time remains. Use remaining time for clarity, resilience, evidence, and submission quality.

## Stretch work

Only consider stretch work after Milestones 4–6 are complete and submission-ready.

Possible stretch:

- a minimal collector-drone demonstration.

Default decision:

Do not implement it.

It adds automation before the manual core loop has been judged and could weaken the submission by consuming polish and evidence time.

## Explicitly deferred beyond Build Week

The wider Mine Inc. concept may later include:

- multiple asteroid types;
- scanning and trajectory analysis;
- storage and logistics;
- manufacturing chains;
- automation;
- power generation and routing;
- research;
- repair;
- shields;
- pirates and defence;
- trading;
- crew;
- campaign progression;
- save/load;
- richer art, sound, and UI;
- Steam packaging;
- possible mobile adaptation.

These are product-roadmap ideas, not Build Week commitments.

## Sequencing rule

The roadmap is sequential:

1. close and commit the active milestone;
2. review the next player outcome;
3. ask Codex for a proposal;
4. approve the smallest vertical slice;
5. implement and manually verify;
6. update the controls.

Do not plan several implementation milestones in parallel. The only safe parallel work is governance, evidence preparation, and submission planning that does not alter active production files.
