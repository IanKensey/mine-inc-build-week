# Mine Inc. Milestone Status

**Status:** Live control document  
**Last updated:** 2026-07-18

## Current summary

- **Stable committed version:** `0.4.0-buildweek`
- **Active milestone:** Milestone 5 — attach the pending Storage Module
- **Milestone 5 target:** `0.5.0-buildweek`
- **Current gate:** Technical Lead and Product Owner design review
- **Next gate:** Codex planning proposal and approval
- **Remaining gameplay milestone:** Milestone 5
- **Submission closeout:** Milestone 6

## Status table

| Milestone | Player outcome | Version | Implementation | Manual QA | Committed/pushed | Evidence | Status |
|---|---|---:|---|---|---|---|---|
| M0 Baseline | Repository and Build Week controls established | n/a | Complete | Reviewed | Yes | Git/docs | Closed |
| M1 Foundation | View pod; orbit, zoom, reset | 0.1.0 | Complete | Passed | Yes | Screenshots | Closed |
| M2 Mining | Track, select, shoot, destroy, reset | 0.2.0 | Complete | Passed after defect fix | Yes | Screenshots/video/log | Closed |
| M3 Resources | Release, drift, collect, fade, expire | 0.3.0 | Complete | Passed after fade correction | Yes | Screenshots/video/log | Closed |
| M4 Manufacturing | Spend Rock; show progress; create one pending module | 0.4.0 | Complete | Passed | Yes | Short video/log | Closed |
| M5 Attachment | Attach pending module to pod | 0.5.0 target | Not started | Not started | No | Pending | Active planning |
| M6 Closeout | Harden, document, package, film, submit | Final | Not started | Not started | No | Pending | Planned |

## Active milestone: M5 Attachment

Established starting state:

- the player can manufacture exactly one Storage Module;
- completion produces a HUD-only `Pending placement` state;
- the module cannot be manufactured twice;
- reset clears the pending module;
- no module geometry or placement system exists yet.

Required player outcome:

- the player recognises that the completed module is ready to place;
- the player selects or initiates placement;
- the player sees a clear valid attachment location on the pod;
- the player confirms one attachment;
- the pending module is consumed exactly once;
- the pod visibly changes;
- reset restores the pre-placement state for another complete run.

Scope boundary:

- one Storage Module;
- one small attachment surface or deliberately limited 3D grid;
- one confirmation path;
- no general construction framework;
- no multiple modules;
- no rotation, moving, deletion, storage simulation, or persistence unless a minimal element is essential for comprehensibility.

Current action:

The Product Owner and Technical Lead must agree the smallest player-facing placement experience. Codex should then inspect the repository and produce a planning-only proposal before any implementation.

## Next actions

1. Review the attachment experience from the player’s perspective.
2. Decide whether placement should be direct-click, preview-and-confirm, or a minimal grid interaction.
3. Define valid-position feedback and completion feedback.
4. Send Codex a planning-only Milestone 5 request.
5. Review and constrain the proposal.
6. Approve implementation only after the milestone boundary is clear.
7. Run focused M5 manual QA and full-loop regression.
8. Capture the complete loop on video.
9. Commit and push M5.
10. Move immediately into M6 submission closeout.

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
