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

## Completed attachment milestone

### Milestone 5 — Attach the Storage Module

**Version:** `0.5.0-buildweek`  
**Status:** Complete, manually verified, committed

Player outcome:

- see Rock and the manufactured Storage Module in a fixed Cargo panel;
- select the Storage Module;
- enter attachment mode;
- choose one of six authored sockets;
- attach the module visibly to the pod;
- complete the full Build Week gameplay loop.

Completion evidence:

- all six socket positions manually tested across repeated runs;
- complete collect → manufacture → select → attach flow passed;
- video and screenshots captured;
- changes committed and pushed;
- no generic inventory or construction framework added.

## Active required work

### Milestone 6 — Integration and submission closeout

**Target version:** `0.6.0-buildweek` or final Build Week tag  
**Status:** Active

Purpose:

Freeze the feature set and make the completed loop reliable, understandable, easy to run, well evidenced, and ready for judging.

Approved work categories:

- read-only integration audit;
- full-loop regression;
- essential defect fixes only;
- narrowly justified UI wording or readability correction;
- reset and replay hardening;
- repository and documentation cross-check;
- exact Windows/Godot run instructions;
- README collaboration and provenance narrative;
- clean-clone or clean-import test where practical;
- final screenshots and full-loop capture;
- public YouTube demo under three minutes with audio;
- Devpost text and track decision;
- `/feedback` Codex Session ID;
- final version/tag and submission checklist.

Not approved:

- new gameplay systems;
- collector drone;
- storage-capacity effects;
- sound or music production;
- animation systems;
- extra module types;
- extra asteroid types;
- refactoring for elegance;
- generalisation of inventory, crafting, or construction;
- any feature not required for reliability or judge comprehension.

Milestone 6 should be executed as gated closeout work, not as one large speculative implementation task.

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
