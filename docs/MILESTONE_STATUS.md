# Mine Inc. Milestone Status

**Status:** Live control document  
**Last updated:** 2026-07-18

## Current summary

- **Stable committed version:** `0.5.0-buildweek`
- **Active milestone:** Milestone 6 — integration and submission closeout
- **Current gate:** Read-only integration and submission-readiness audit
- **Next gate:** Product Owner approval of essential fixes only
- **Gameplay feature state:** Complete and frozen
- **Submission deadline:** 2026-07-21 at 5:00 PM Pacific Time
- **Required final outputs:** tested repository, README, public narrated YouTube demo, Devpost entry, and primary Codex `/feedback` Session ID

## Status table

| Milestone | Player outcome | Version | Implementation | Manual QA | Committed/pushed | Evidence | Status |
|---|---|---:|---|---|---|---|---|
| M0 Baseline | Repository and Build Week controls established | n/a | Complete | Reviewed | Yes | Git/docs | Closed |
| M1 Foundation | View pod; orbit, zoom, reset | 0.1.0 | Complete | Passed | Yes | Screenshots | Closed |
| M2 Mining | Track, select, shoot, destroy, reset | 0.2.0 | Complete | Passed after defect fix | Yes | Screenshots/video/log | Closed |
| M3 Resources | Release, drift, collect, fade, expire | 0.3.0 | Complete | Passed after fade correction | Yes | Screenshots/video/log | Closed |
| M4 Manufacturing | Spend Rock; show progress; create one pending module | 0.4.0 | Complete | Passed | Yes | Short video/log | Closed |
| M5 Attachment | Attach pending module to pod | 0.5.0 | Complete | Passed on all six sockets | Yes | Video/screenshots/log | Closed |
| M6 Closeout | Audit, harden, document, package, film, submit | Final | In progress | In progress | No | In progress | Active |

## Active milestone: M6 Integration and Submission Closeout

Established starting state:

- versions `0.1.0` through `0.5.0` are committed and pushed;
- the complete observe → mine → collect → manufacture → attach loop works;
- all six authored attachment sockets have passed manual testing;
- milestone screenshots and videos exist;
- governance documents are committed;
- no required gameplay feature remains.

Feature freeze:

- no new gameplay systems;
- no stretch work by default;
- fixes require an observed defect, material submission risk, or clear judge-comprehension benefit;
- final media and documentation must match the frozen build.

M6 gates:

1. read-only technical and submission-readiness audit;
2. approve and implement only essential fixes;
3. full regression and clean-run verification;
4. documentation and repository closeout;
5. final capture and video production;
6. Devpost entry, `/feedback` ID, final tag, and submission.

Current action:

Ask Codex to inspect the committed repository and produce a read-only Milestone 6 audit. It must separate blockers, recommended fixes, optional polish, and rejected scope. It must not modify files during the audit.

## Next actions

1. Request the read-only Codex M6 audit.
2. Review findings against the feature-freeze rule.
3. Approve blockers and essential fixes only.
4. Complete full-loop regression from clean launch through reset and replay.
5. Verify README, VERSION, HUD, controls, screenshots, and video all agree.
6. Capture the primary Codex `/feedback` Session ID.
7. Freeze and tag the final build.
8. Record and publish the narrated YouTube demo.
9. Complete the Devpost text and track selection.
10. Test repository and video links while signed out.
11. Submit before the deadline and preserve confirmation evidence.

## Closure checklist

A milestone may move to `Closed` only when:

- [ ] approved scope implemented;
- [ ] Codex completion report reviewed;
- [ ] target Godot launch passes;
- [ ] happy path manually passes;
- [ ] invalid/repeated actions pass;
- [ ] reset edge cases pass;
- [ ] earlier milestone regressions pass;
- [ ] no unexpected debugger errors;
- [ ] documentation matches build;
- [ ] evidence captured;
- [ ] Git diff reviewed;
- [ ] Product Owner committed and pushed;
- [ ] stable version updated;
- [ ] accepted decisions and risks updated.

## Change rule

This file describes current truth, not history.

When a milestone closes:

- change its row;
- update stable version;
- update current gate;
- replace the active-milestone section;
- move historical detail to the collaboration log rather than expanding this file indefinitely.
