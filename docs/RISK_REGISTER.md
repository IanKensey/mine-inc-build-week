# Mine Inc. Risk Register

**Status:** Active  
**Last updated:** 2026-07-18

Scales:

- **Likelihood:** Low / Medium / High
- **Impact:** Low / Medium / High / Critical
- **State:** Open / Watching / Mitigated / Resolved

## Active risks

| ID | Risk | Likelihood | Impact | State | Mitigation / next action |
|---|---|---|---|---|---|
| R-001 | Submission deadline leaves too little time after core implementation | Medium | Critical | Open | Finish M4 and M5 with strict boundaries; reserve M6 for hardening, evidence, video, README, and Devpost submission. Cut stretch work first. |
| R-002 | M5 expands into a general building system | High | High | Open | One module, one attachment surface, one confirmation path. No rotation, removal, inventory, multiple modules, capacity, or reusable construction framework unless essential. |
| R-003 | Governance work displaces Codex implementation or weakens the Build Week story | Low | High | Mitigated | Codex continues core coding in the primary session while controls are authored separately. README and video explicitly distinguish roles and Codex acceleration. |
| R-004 | Primary Codex session is lost or `/feedback` ID is not captured | Medium | High | Open | Continue using the primary build thread; capture the `/feedback` Session ID before submission; store it safely outside the chat as well. |
| R-005 | Final build does not match the demo video or README | Medium | High | Open | Freeze gameplay before final capture; record from the final tagged build; perform a final document/build cross-check. |
| R-006 | Judge cannot run the Windows/Godot project easily | Medium | High | Open | Clear README instructions, exact Godot version, tested F5 path, public repository or correctly shared private repository, and a final clean-clone check where time permits. |
| R-008 | Existing M1–M3 behaviour regresses as controller/HUD grow | Medium | High | Open | Run focused regression after each milestone and a complete loop before commit. Keep changes local and avoid unrelated cleanup. |
| R-009 | UI becomes crowded or the player cannot understand the next action | Medium | Medium | Open | Use compact panels, clear status text, disabled-state explanations, and normal-camera-distance testing. Polish only after behaviour is correct. |
| R-010 | Compatibility renderer breaks a visual technique | Medium | Medium | Watching | Check Godot Compatibility support before approval; test visually in target renderer; prefer StandardMaterial3D and built-in supported features. |
| R-011 | Evidence does not clearly prove Codex and GPT-5.6 use | Medium | Critical | Open | Preserve proposal/approval/report screenshots, dated Git history, collaboration log, primary session, README narrative, and narrated video explanation. |
| R-012 | Pre-existing concept and Build Week implementation are not clearly distinguished | Low | High | Mitigated | Keep provenance statement, dated baseline commit, milestone commits, collaboration log, and explicit description of what was implemented during the event. |
| R-013 | Track selection for a game is unclear | Medium | Medium | Open | Treat `Apps for Your Life` as the provisional closest consumer category; confirm before final submission and document the rationale. |
| R-014 | Third-party or copyrighted material enters the submission | Low | High | Mitigated | Continue using original text and built-in Godot assets; verify final video audio and images are owned, licensed, or generated for the project. |
| R-015 | Untracked media or generated files contaminate milestone commits | Medium | Low | Watching | Review `git status`, `git diff --stat`, `.godot/`, temporary captures, and `.gd.uid` files before every commit. |

## Resolved risks

| ID | Risk | Resolution |
|---|---|---|
| R-X01 | `Space` activated Reset Prototype after mouse use | Reset button keyboard focus disabled with `FOCUS_NONE`; manually verified. |
| R-X02 | Asteroid destruction particles were not visible | Existing particle size, count, lifetime, and cleanup timing were increased; manually verified. |
| R-X03 | Rock fade calculated correctly but remained invisible under Compatibility renderer | Replaced `GeometryInstance3D.transparency` with instance-local `StandardMaterial3D` alpha; manually verified. |
| R-X04 | Resource collection could duplicate or race reset/expiration | Pickup interaction shuts down before signal/removal; controller guards release and reset; manually verified. |
| R-X05 | M4 timer, repeated input, or reset race could duplicate spending or pending state | Controller-authoritative state, one timer, request revalidation, timeout guard, and reset sequencing were implemented and manually verified. |

## Escalation rule

Escalate a risk to the Product Owner immediately when:

- it threatens the submission deadline;
- it requires changing the approved core loop;
- it may violate official rules;
- it introduces a new dependency or licence;
- it requires abandoning the primary Codex thread;
- it makes the final build difficult for judges to run;
- it would consume the time reserved for M6.

## Review cadence

Review this register:

- before approving each milestone;
- after a material defect;
- after official rule changes;
- before final feature freeze;
- before recording the demo;
- before submission.
