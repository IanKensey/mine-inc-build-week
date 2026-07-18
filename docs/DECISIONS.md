# Mine Inc. Decision Record

**Status:** Active  
**Last updated:** 2026-07-18

This file records accepted decisions that should not be casually reopened.

A decision may be reconsidered when:

- manual testing reveals a defect;
- the repository contradicts the recorded assumption;
- an official Build Week requirement changes;
- the deadline makes the decision impractical;
- the Product Owner explicitly reopens it.

## D-001 — Build Week proves the core loop

**Status:** Accepted  
**Decision:** Build only the path from escape pod observation through mining, Rock collection, manufacture of one Storage Module, and attachment of that module.  
**Reason:** A complete vertical slice is more valuable than fragments of the wider game.  
**Consequences:** Pirates, research, power, trading, campaign, repair, shields, and advanced automation are excluded.

## D-002 — Godot target environment

**Status:** Accepted  
**Decision:** Use Godot Engine v4.6.2.stable.official on Windows 11 with the Compatibility renderer.  
**Reason:** This is the confirmed target and tested environment.  
**Consequences:** Renderer-specific techniques must be checked against Compatibility support.

## D-003 — Codex is the implementation engineer

**Status:** Accepted  
**Decision:** Core gameplay changes are proposed and implemented by Codex in the primary build thread. The Product Owner approves and manually tests; the Technical Lead reviews architecture and scope.  
**Reason:** This preserves the Build Week purpose and creates clear collaboration evidence.  
**Consequences:** Codex never commits or pushes. Governance does not replace Codex’s coding contribution.

## D-004 — Scene-local, milestone-sized architecture

**Status:** Accepted  
**Decision:** Prefer focused scenes and typed scripts with scene-local state.  
**Reason:** The prototype has one loop and does not justify global infrastructure.  
**Consequences:** No autoload, event bus, generic manager, or broad data framework without demonstrated need.

## D-005 — Built-in visual assets

**Status:** Accepted  
**Decision:** Use built-in Godot geometry, materials, lighting, and effects.  
**Reason:** Fast, licence-safe, consistent, and sufficient for a readable prototype.  
**Consequences:** No third-party art, music, plugin, or dependency without explicit approval.

## D-006 — Authored asteroid fly-by

**Status:** Accepted  
**Decision:** Use one authored path, visible trajectory, and repeatable reset rather than spawning or orbital simulation.  
**Reason:** Predictable timing supports playtesting and demonstration.  
**Consequences:** No continuous asteroid system or sophisticated physics in Build Week.

## D-007 — Discrete mining interaction

**Status:** Accepted  
**Decision:** Left-click selects the asteroid; one `Space` press fires one shot; five hits destroy it.  
**Reason:** The interaction is easy to understand, test, and show.  
**Consequences:** No weapon framework or projectile system.

## D-008 — Manual Rock collection

**Status:** Accepted  
**Decision:** Destroying the asteroid releases three predictable pickups worth two Rock each. Left-click collects one pickup immediately.  
**Reason:** Manual collection clearly proves the resource step.  
**Consequences:** One integer Rock count; no slots, capacity, persistence, or collector automation.

## D-009 — Rock lifetime and fade

**Status:** Accepted  
**Decision:** Pickups last 14 seconds and fade over the final three seconds while remaining collectible.  
**Reason:** The player can see that uncollected resources are being lost.  
**Consequences:** Expiration adds no inventory.

## D-010 — Compatibility-renderer fade implementation

**Status:** Accepted  
**Decision:** Deep-duplicate each pickup’s `StandardMaterial3D`, assign it per instance, enable alpha transparency, and alter albedo alpha.  
**Reason:** `GeometryInstance3D.transparency` is ignored by the Compatibility renderer.  
**Consequences:** Each pickup owns three small runtime material duplicates; no shader or renderer change.

## D-011 — Reset means restart the prototype run

**Status:** Accepted  
**Decision:** Reset returns the current demonstration to a clean initial state.  
**Reason:** A judge or tester must be able to repeat the loop reliably.  
**Consequences:** Reset clears asteroid state, pickups, Rock, active manufacturing, pending module, and later placement state.

## D-012 — Manufacture before placement

**Status:** Accepted  
**Decision:** Separate manufacturing and attachment into different milestones.  
**Reason:** Each step must be independently testable and must not smuggle in a general construction system.  
**Consequences:** M4 ends with one HUD-only pending Storage Module. M5 creates the placement interaction.

## D-013 — Storage Module manufacturing tuning

**Status:** Accepted  
**Decision:** The Storage Module costs 4 Rock and takes 3 seconds to manufacture.  
**Reason:** Two of three pickups are sufficient, while collecting all six visibly leaves two Rock after spending. Three seconds is readable without slowing the demo.  
**Consequences:** Rock is spent at start; additional Rock may be collected during production; only one module may be pending.

## D-014 — Derive affordability

**Status:** Accepted  
**Decision:** Manufacturing process state is `IDLE`, `MANUFACTURING`, or `MODULE_PENDING`. Affordability is derived from Rock count rather than stored as a state.  
**Reason:** Avoid a second source of truth.  
**Consequences:** The controller revalidates Rock and process state on every manufacture request.

## D-015 — Human QA before commit

**Status:** Accepted  
**Decision:** Codex implementation is not committed until the Product Owner manually verifies it.  
**Reason:** Visual and interactive defects can survive automated checks.  
**Consequences:** Defects are diagnosed and corrected before the milestone commit.

## D-016 — Pre-existing concept, Build Week implementation

**Status:** Accepted  
**Decision:** State clearly that the wider Mine Inc. concept predates Build Week, while the playable prototype implementation and meaningful extension are produced during the submission period with Codex and GPT-5.6.  
**Reason:** Accurate provenance and compliance with existing-project rules.  
**Consequences:** Preserve dated commits, collaboration logs, screenshots, video, and the primary Codex session.
