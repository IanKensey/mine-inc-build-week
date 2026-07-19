# Mine Inc. OpenAI Build Week Control

**Status:** Active  
**Rules checked:** 2026-07-18  
**Submission deadline:** 2026-07-21 at 5:00 PM Pacific Time  
**Authoritative source:** Official Devpost rules and submission form

This document is an operational summary, not a substitute for the official rules. Recheck the official Devpost rules immediately before submission.


## Current delivery snapshot

Stable committed prototype:

`0.5.0-buildweek`

The complete Build Week gameplay loop now covers:

- 3D pod observation and camera control;
- authored asteroid trajectory;
- selection and five-shot mining;
- destruction and Rock release;
- manual Rock collection;
- 4-Rock Storage Module manufacturing;
- three-second visible progress;
- fixed six-slot Cargo presentation;
- Storage Module selection;
- six authored attachment sockets;
- successful module attachment to any pod face;
- reset and full-loop replay.

Gameplay feature development is frozen.

Remaining work:

1. Milestone 6 read-only audit.
2. Essential fixes only.
3. Full regression and repository closeout.
4. Final narrated YouTube demo.
5. Devpost text, track, repository link, and `/feedback` Session ID.
6. Final submission and confirmation evidence.

Milestone videos and screenshots have been captured through M5.

## Competition objective

Submit a working project built with Codex and GPT-5.6 that clearly demonstrates:

- a coherent idea;
- functioning technical implementation;
- readable design and user experience;
- thoughtful human–AI collaboration;
- a convincing, concise demonstration.

Mine Inc. is a game and is permitted as a project type, but it must be entered into the closest available track.

## Provisional track

**Provisional choice:** Apps for Your Life

Rationale:

Mine Inc. is a consumer entertainment experience, making this the closest of the four available tracks.

This remains an explicit pre-submission decision. Confirm the track against the final submission form and any official clarification.

## Existing-project compliance

The wider Mine Inc. concept predates the submission period.

The playable Godot prototype is the Build Week work.

The submission must clearly distinguish:

### Before Build Week

- high-level game concept;
- intended long-term systems;
- concept documents and planning.

### During Build Week

- repository baseline;
- Godot implementation;
- pod and camera;
- asteroid path and trajectory;
- selection and mining;
- destruction;
- Rock release, collection, fade, and expiration;
- Storage Module manufacturing;
- module attachment;
- testing, fixes, evidence, and submission packaging.

Evidence includes:

- dated Git commits;
- `VERSION`;
- `codex-collaboration-log.md`;
- Codex proposal and completion reports;
- manual test records;
- screenshots and gameplay clips;
- primary Codex session and `/feedback` ID.

## Required use of Codex and GPT-5.6

The project must meaningfully use both Codex and GPT-5.6.

Mine Inc. demonstrates this through:

- the primary Codex build thread;
- Codex repository inspection;
- Codex implementation proposals;
- human approval prompts;
- Codex production coding;
- Codex automated validation;
- Codex completion reports;
- human manual testing and defect reports;
- Codex diagnosis and focused corrections;
- repository documentation explaining the collaboration;
- narrated demo coverage.

Governance documents guide this work but do not replace Codex implementation.

## Submission package

### Working project

The project must:

- install and run consistently on its stated platform;
- function as shown in the video and description;
- be tested with the documented Godot version;
- have a clean, understandable launch path.

Mine Inc. target:

- Windows 11;
- Godot Engine v4.6.2.stable.official;
- Compatibility renderer.

### Category

Choose one track.

Current provisional track:

- Apps for Your Life.

### Text description

The description should explain:

- the stranded escape-pod premise;
- the core loop;
- what is implemented;
- why the prototype is intentionally focused;
- what Codex and GPT-5.6 contributed;
- key human product and QA decisions;
- significant technical lessons;
- target platform and run method.

### Demo video

Requirements:

- less than three minutes;
- publicly visible on YouTube;
- clear demonstration;
- audio narration;
- explains what was built;
- explains how Codex was used;
- explains how GPT-5.6 was used;
- contains no unlicensed copyrighted music or material.

Recommended target:

**2 minutes 20 seconds to 2 minutes 45 seconds.**

Suggested structure:

1. **0:00–0:15 — Hook**
   - stranded pod;
   - asteroid approaching;
   - one-sentence premise.

2. **0:15–1:35 — Complete gameplay loop**
   - camera;
   - trajectory;
   - selection;
   - five-shot destruction;
   - Rock release and collection;
   - manufacture;
   - attach Storage Module;
   - final expanded pod view.

3. **1:35–2:25 — Codex and GPT-5.6 collaboration**
   - proposal/approval/implementation rhythm;
   - human testing;
   - Reset-button focus diagnosis;
   - Compatibility-renderer fade correction;
   - repository/Git evidence.

4. **2:25–2:45 — Close**
   - what the prototype proves;
   - restrained future vision;
   - project title.

Do not film the final demo until the feature set is frozen.

### Repository

Provide a repository URL.

The repository must be:

- public with relevant licensing; or
- private and shared with the required judging addresses.

Repository readiness:

- [ ] licence present;
- [ ] exact setup instructions;
- [ ] exact Godot version;
- [ ] target platform;
- [ ] controls;
- [ ] implemented feature list;
- [ ] explicit deferred list;
- [ ] pre-existing concept/build-week provenance;
- [ ] Codex/GPT-5.6 collaboration narrative;
- [ ] where Codex accelerated work;
- [ ] key human product, engineering, and design decisions;
- [ ] clean default branch;
- [ ] final version/tag;
- [ ] no temporary or generated cache;
- [ ] video and description match build.

### Codex Session ID

Provide the `/feedback` Session ID from the primary thread where most core functionality was built.

Actions:

- [ ] continue using the primary Codex thread;
- [ ] obtain `/feedback` ID before deadline;
- [ ] store it safely;
- [ ] place it in the submission form;
- [ ] do not rely on chat history as the only copy.

## Judging readiness

The official OpenAI page describes judging around:

- technical implementation;
- design and user experience;
- potential impact;
- quality of the idea;
- thoughtful use of Codex and GPT-5.6;
- clear communication of problem, solution, and approach.

Mine Inc. should optimise for:

### Technical implementation

- complete loop;
- reliable reset;
- focused typed Godot architecture;
- clear state transitions;
- renderer-aware solutions;
- reproducible launch.

### Design and UX

- readable camera and trajectory;
- obvious selection and HP;
- satisfying destruction;
- collectible visibility;
- clear manufacturing feedback;
- intuitive attachment;
- compact HUD;
- replay without confusion.

### Quality of idea

- strong transformation fantasy;
- clear escalation from survival pod to mining fortress;
- prototype proves the first meaningful step;
- scope discipline shows intentional design.

### Codex collaboration

- clear role separation;
- visible proposal/approval cycle;
- Codex implemented the code;
- human product decisions and QA materially shaped the result;
- defects were diagnosed using evidence, not hand-waved.

## Minimum acceptable submission

The submission is viable when:

- M1–M5 work as one loop;
- reset supports another complete run;
- no serious debugger errors;
- repository instructions are accurate;
- Codex collaboration is documented;
- video is compliant and public;
- `/feedback` ID captured;
- Devpost fields complete;
- final submission made before deadline.

## Stretch threshold

No stretch feature may start until:

- required loop complete;
- full regression passes;
- repository ready;
- video script drafted;
- sufficient time remains for capture, upload, form entry, and contingency.

Default: no stretch implementation.

## Final submission checklist

### Build

- [ ] Full loop works from clean launch.
- [ ] M1–M5 regression passes.
- [ ] Reset works before, during, and after each process.
- [ ] Version displayed correctly.
- [ ] Final build matches documentation.
- [ ] Clean exit and relaunch.
- [ ] No unexpected debugger errors.

### Evidence

- [ ] Milestone screenshots.
- [ ] Full-loop gameplay clip.
- [ ] Codex proposal/report evidence.
- [ ] Human QA evidence.
- [ ] Git history evidence.
- [ ] Final repository screenshot.
- [ ] Primary Codex `/feedback` ID.

### Video

- [ ] Under three minutes.
- [ ] Public YouTube.
- [ ] Audio narration.
- [ ] Shows working project.
- [ ] Explains Codex use.
- [ ] Explains GPT-5.6 use.
- [ ] No unlicensed music or imagery.
- [ ] Link tested while signed out.

### Devpost

- [ ] Correct track.
- [ ] Title and elevator pitch.
- [ ] Project description.
- [ ] Feature explanation.
- [ ] Codex/GPT-5.6 collaboration.
- [ ] Repository URL.
- [ ] Video URL.
- [ ] `/feedback` Session ID.
- [ ] Platform and run instructions.
- [ ] All required declarations.
- [ ] Submit before deadline.
- [ ] Save confirmation evidence.

## Official references

- OpenAI Build Week: https://openai.com/build-week/
- Devpost overview: https://openai.devpost.com/
- Official rules: https://openai.devpost.com/rules
- FAQs: https://openai.devpost.com/details/faqs
- Resources: https://openai.devpost.com/resources
