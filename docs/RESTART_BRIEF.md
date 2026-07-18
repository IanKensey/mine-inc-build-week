# Mine Inc. Restart Brief

**Stable version:** `0.4.0-buildweek`  
**Active milestone:** Milestone 5 — attach the pending Storage Module  
**Next gate:** agree the player-facing attachment interaction, then request a planning-only Codex proposal

This is a continuation of an active OpenAI Build Week project. Do not restart discovery or redesign completed milestones.

## Working roles

- Product Owner: vision, final decisions, manual QA, commits, pushes.
- Technical Lead: scope, architecture review, proposal review, QA design, hackathon readiness.
- Codex: implementation engineer; inspect, propose, wait, implement approved scope, report; never commit or push.

## Completed loop

The prototype already lets the player:

1. view and orbit an escape pod;
2. track an asteroid on a visible path;
3. select and destroy it with five shots;
4. collect three drifting Rock pickups worth two each;
5. manufacture one Storage Module for four Rock over three seconds;
6. reach `Storage Module complete — Pending placement`.

All completed behaviour is manually verified and committed.

## Immediate objective

Design the smallest convincing Milestone 5 interaction that:

- shows a valid attachment location;
- lets the player place exactly one pending Storage Module;
- visibly expands the pod;
- consumes the pending state once;
- resets cleanly;
- does not create a general construction system.

Read `CONTROL_SUITE.md`, then follow its required document order before advising.
