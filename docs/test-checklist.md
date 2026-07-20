# Mine Inc. Prototype Test Checklist

Use this checklist when the relevant feature exists. Record defects and retest affected groups after a change. Milestone 1–5 sections preserve historical milestone and regression criteria; use the Milestone 6 section for the current frozen-build version and final validation.

## Milestone 1 - Project launch and presentation

- [X] Open `game/project.godot` in Godot Engine v4.6.2.stable.official [71f334935].
- [X] Confirm the project imports without parse or resource-loading errors.
- [X] Press F5 and confirm the prototype main scene launches directly.
- [X] Confirm the default window is readable at 1280 by 720.
- [X] Confirm a recognizable escape pod is visible at launch.
- [X] Confirm the pod uses only built-in geometry and embedded materials.
- [X] Confirm the background is dark and space-like.
- [X] Confirm cool key lighting and warm rim lighting make the pod silhouette readable.
- [X] Confirm distant light markers provide visible depth cues while orbiting.
- [X] Confirm the HUD displays `Mine Inc.`.
- [X] Historical Milestone 1 evidence records the milestone version; use the Milestone 6 section to verify the current HUD version.
- [X] Confirm the HUD displays `OpenAI Build Week 2026`.
- [X] Confirm the HUD lists the orbit, zoom, and reset controls.
- [X] Confirm no unexpected errors appear in the Godot debugger during launch.

## Milestone 1 - Camera

- [X] Hold the right mouse button and move the mouse horizontally to orbit around the pod.
- [X] Hold the right mouse button and move the mouse vertically to change camera pitch.
- [X] Confirm mouse movement without the right button held does not orbit the camera.
- [X] Confirm vertical orbit stops at the configured bounds and never flips the camera.
- [X] Scroll up and confirm the camera zooms toward the pod.
- [X] Scroll down and confirm the camera zooms away from the pod.
- [X] Confirm repeated scrolling cannot pass the minimum or maximum distance.
- [X] Orbit and zoom through several combinations and confirm the pod remains the focus.
- [X] Press `R` and confirm the original yaw, pitch, and distance are restored.
- [X] Repeat orbit, zoom, and reset actions and confirm no debugger errors occur.

## Milestone 2 - Asteroid and fly-by

- [X] Confirm one recognizably irregular asteroid appears outside the initial central view.
- [X] Confirm the asteroid uses only built-in geometry and materials.
- [X] Confirm the asteroid follows the authored path at a predictable pace.
- [X] Time an uninterrupted fly-by and confirm it lasts approximately 25–30 seconds.
- [X] Confirm the asteroid passes clearly within visible operating range of the pod.
- [X] Confirm it remains far enough from the escape pod to avoid a collision.
- [X] Confirm it leaves the play area and stops cleanly at the path end.
- [X] Confirm the HUD reports `Fly-by complete` at the path end.
- [X] Confirm movement remains stable at different frame rates.

## Milestone 2 - Visible trajectory

- [X] Confirm the trajectory appears as readable emissive dotted markers.
- [X] Confirm the dots represent the asteroid's actual authored path accurately.
- [X] Confirm the trajectory remains readable against the dark background from useful camera angles.
- [X] Confirm only one trajectory is present at startup.
- [X] Reset repeatedly and confirm trajectory dots are not duplicated.

## Milestone 2 - Target selection and HUD

- [X] Left-click the asteroid and confirm it becomes selected.
- [X] Confirm the selected state has obvious visual feedback.
- [X] Confirm the HUD displays `Asteroid selected`.
- [X] Confirm the HUD displays integer health as `HP: 5 / 5` initially.
- [X] Click empty world space and confirm selection clears.
- [X] Click the HUD panel and controls and confirm world selection does not change.
- [X] Right-drag the camera and confirm it does not select or clear the asteroid.
- [X] Confirm the asteroid cannot be selected after destruction or path completion.

## Milestone 2 - Mining and health

- [X] Press `Space` without a selected asteroid and confirm nothing is damaged.
- [X] Select the asteroid and press `Space` once.
- [X] Confirm a brief visible beam originates from the escape pod and reaches the asteroid.
- [X] Confirm one press removes exactly one HP.
- [X] Confirm the HUD immediately updates to `HP: 4 / 5` after the first hit.
- [X] Hold `Space` and confirm key-repeat does not produce unintended rapid fire.
- [X] Confirm five deliberate shots are required to destroy a full-health asteroid.
- [X] Confirm further Space presses cannot damage a destroyed asteroid.

## Milestone 2 - Destruction

- [X] Confirm reaching zero HP emits one visible destruction event.
- [X] Confirm asteroid geometry and selection feedback disappear cleanly.
- [X] Confirm a brief built-in particle burst is visible.
- [X] Confirm the burst ends cleanly without persistent debris.
- [X] Confirm the HUD displays `Asteroid destroyed` and `HP: 0 / 5`.
- [X] Confirm destruction itself still occurs exactly once before Milestone 3 resource release is handled.
- [X] Confirm destruction occurs exactly once even with repeated input.

## Milestone 2 - Reset Prototype

- [X] Select **Reset Prototype** during an active fly-by.
- [X] Confirm the asteroid returns to the exact path start at full health.
- [X] Confirm selection is cleared and the HUD returns to active fly-by state.
- [X] Destroy the asteroid, then reset and confirm its visuals, collision, health, and movement are restored.
- [X] Let the fly-by complete, then reset and confirm it restarts normally.
- [X] Reset during the destruction effect and confirm the effect clears immediately.
- [X] Reset repeatedly and confirm no duplicated asteroid, signals, effects, beams, or trajectory dots.

## Milestone 2 - Milestone 1 regression

- [X] Confirm the project still launches directly without errors.
- [X] Confirm the escape pod, lighting, depth cues, and HUD remain readable.
- [X] Confirm right-drag orbit, bounded pitch, and bounded wheel zoom still work.
- [X] Confirm `R` still restores the default camera view.
- [X] Confirm the project exits and relaunches cleanly.
- [X] Confirm no unexpected debugger errors occur during the full Milestone 2 loop.

## Milestone 2 - Focused defect regression

- [X] Click **Reset Prototype** and confirm the fly-by restarts normally.
- [X] Select the reset asteroid and confirm the HUD displays `HP: 5 / 5`.
- [X] Press `Space` once and confirm Reset Prototype is not activated.
- [X] Confirm the asteroid remains at its current fly-by position rather than jumping to the path start.
- [X] Confirm exactly one mining beam appears and the HUD changes to `HP: 4 / 5`.
- [X] Press `Space` three more deliberate times and confirm HP changes to `3 / 5`, `2 / 5`, then `1 / 5`.
- [X] Confirm the asteroid remains visible and targetable after the fourth total hit.
- [X] Press `Space` a fifth time and confirm HP reaches `0 / 5` and destruction occurs exactly once.
- [X] Confirm one clearly visible particle burst appears at the asteroid's destruction position.
- [X] Confirm the burst remains perceptible at normal camera distance and clears after approximately one second.
- [X] Confirm the burst does not create debris or resources.
- [X] Click **Reset Prototype** after destruction and confirm the asteroid, health, collision, and fly-by are restored cleanly.
- [X] Repeat the focused sequence and confirm no duplicated damage, resets, effects, or signals.
- [X] Confirm the uninterrupted fly-by still lasts approximately 27–28 seconds.
- [X] Confirm camera, selection, trajectory, HUD, reset, fly-by completion, exit, and relaunch behaviour remain unchanged.

## Milestone 3 - Resource release

- [X] Launch or reset the prototype and confirm the HUD displays `Rock: 0`.
- [X] Allow a fly-by to complete without destruction and confirm no Rock pickups are released.
- [X] Destroy the asteroid and confirm exactly three Rock pickups appear.
- [X] Confirm all three spawn around the destruction position with visible initial separation.
- [X] Confirm their collision areas do not completely overlap.
- [X] Confirm all pickups use built-in geometry and remain readable against the background.
- [X] Confirm the pickups drift broadly in the asteroid's travel direction.
- [X] Confirm the three fixed drift variations are predictable across repeated resets.
- [X] Confirm repeated Space presses after destruction do not release another group.
- [X] Confirm each destroyed asteroid run represents exactly six collectible Rock.

## Milestone 3 - Manual collection and collision routing

- [X] Left-click one Rock pickup and confirm it is collected immediately without another input.
- [X] Confirm only the clicked pickup disappears.
- [X] Confirm the other two pickups remain collectible.
- [X] Confirm the HUD immediately changes from `Rock: 0` to `Rock: 2`.
- [X] Click the former pickup position again and confirm Rock does not increase twice.
- [X] Collect the second pickup and confirm `Rock: 4`.
- [X] Collect the third pickup and confirm `Rock: 6`.
- [X] Confirm Rock cannot exceed six during one fly-by.
- [X] Confirm clicking a Rock pickup does not select it as an asteroid or alter stale asteroid selection unexpectedly.
- [X] Confirm asteroid selection still uses physics layer 2 and works normally before destruction.
- [X] Confirm Rock collection uses physics layer 3 with mask value `4`.
- [X] Confirm HUD clicks do not select the asteroid or collect Rock behind the HUD.
- [X] Confirm right-mouse camera orbit does not collect Rock.

## Milestone 3 - Drift and expiration

- [X] Destroy the asteroid and leave all pickups uncollected.
- [X] Confirm pickups move continuously and remain clickable while drifting.
- [X] Confirm they disappear cleanly after approximately 14 seconds.
- [X] Confirm expiration does not increase the Rock count.
- [X] Collect one pickup and allow two to expire; confirm the final count remains `Rock: 2`.
- [X] Confirm expiration produces no debugger errors or persistent collision targets.

## Milestone 3 - Reset and same-frame safeguards

- [X] Reset while all three pickups are drifting and confirm all are removed.
- [X] Confirm Reset Prototype restores `Rock: 0`.
- [X] Collect one pickup, reset immediately, and confirm the final count is `Rock: 0`.
- [X] Reset close to pickup expiration and confirm no Rock is added and no error occurs.
- [X] Reset after collecting some pickups while others remain and confirm all state clears.
- [X] Confirm reset restores the asteroid, full HP, selection state, fly-by, and one trajectory only.
- [X] Repeat destruction and reset cycles and confirm no duplicate signals, pickups, inventory additions, or trajectory dots.

## Milestone 3 - Milestone 1 and 2 regression

- [X] Confirm the uninterrupted asteroid fly-by still lasts approximately 27–28 seconds.
- [X] Confirm asteroid selection, empty-space deselection, HP, mining beam, and five-hit destruction remain correct.
- [X] Confirm the destruction burst remains clearly visible.
- [X] Confirm camera orbit, bounded pitch, bounded zoom, and `R` reset remain correct.
- [X] Confirm fly-by completion, Reset Prototype, exit, and relaunch remain correct.
- [X] Confirm no unexpected debugger errors occur during the complete Milestone 3 loop.

## Milestone 3 - Pickup fade polish

- [X] Destroy the asteroid and leave all three Rock pickups uncollected.
- [X] Confirm the pickups remain fully visible for approximately 11 seconds.
- [X] Confirm each pickup begins fading smoothly over its final approximately three seconds.
- [X] Confirm the Rock core, Rock lobe, and blue halo fade together.
- [X] Confirm the halo retains its existing size and brightness before the fade begins.
- [X] Confirm pickups continue drifting normally throughout the fade.
- [X] Confirm fading one pickup does not change the opacity of another pickup.
- [X] Click a partially faded pickup and confirm it is collected immediately.
- [X] Confirm collection during the fade adds exactly two Rock and cannot occur twice.
- [X] Confirm an uncollected pickup is removed at approximately 14 seconds.
- [X] Confirm expiration adds no Rock and produces no debugger error.
- [X] Reset while pickups are fading and confirm they disappear immediately.
- [X] Confirm reset during fading restores `Rock: 0` and produces no delayed collection or expiration effects.
- [X] Repeat the fade, collection, expiration, and reset cases and confirm no duplicated signals or inventory changes.

## Milestone 3 - Compatibility fade correction

- [X] Run the prototype with the Compatibility renderer unchanged.
- [X] Destroy the asteroid and confirm all three Rock pickups begin fully opaque.
- [X] Confirm no pickup changes opacity during approximately its first 11 seconds.
- [X] Confirm Rock geometry visibly fades over the final approximately three seconds.
- [X] Confirm the emissive blue halo visibly fades with the Rock geometry.
- [X] Confirm each pickup's fade is independent and does not alter either other pickup.
- [X] Confirm shared source material colours remain correct after reset and another destruction cycle.
- [X] Click a partially faded pickup and confirm it remains collectible exactly once.
- [X] Confirm collection during fading immediately adds two Rock and removes only that pickup.
- [X] Reset while one or more pickups are fading and confirm immediate safe cleanup with `Rock: 0`.
- [X] Confirm uncollected fading pickups still expire at approximately 14 seconds without adding Rock.
- [X] Confirm drift direction, speed, collision, yield, inventory, HUD, asteroid, camera, and reset behaviour remain unchanged.
- [X] Confirm no unexpected debugger warnings or errors occur during repeated fade cycles.

## Milestone 4 - Manufacturing availability

- [X] Launch or reset and confirm the HUD displays `Prototype v0.4.0`.
- [X] Confirm the Manufacturing panel is readable in the upper-right without obscuring the exiXting HUD.
- [X] Confirm it identifies the `Storage Module` and `Cost: 4 Rock`.
- [X] At `Rock: 0`, confirm the status says `Need 4 more Rock` and the button is disabled.
- [X] Collect one pickup and confirm `Rock: 2`, `Need 2 more Rock`, and a disabled button.
- [X] Collect a second pickup and confirm `Rock: 4`, `Ready to manufacture`, and an enabled button.
- [X] Collect all three and confirm `Rock: 6` while manufacturing remains affordable.
- [X] Press Space after clicking the manufacturing button area and confirm it cannot activate the button through keyboard focus.

## Milestone 4 - Manufacturing process

- [X] With fewer than four Rock, attempt to trigger manufacturing and confirm no Rock is spent and no timer starts.
- [X] With four or more Rock, click **Manufacture Storage Module** once.
- [X] Confirm exactly four Rock are spent immediately.
- [X] Confirm Rock never becomes negative.
- [X] Confirm the button disables immediately.
- [X] Confirm status displays `Manufacturing Storage Module…`.
- [X] Confirm progress advances visibly from 0% to 100% over approximately three seconds.
- [X] Click rapidly during manufacturing and confirm no additional Rock is spent and no second timer starts.
- [X] Collect a remaining Rock pickup during manufacturing and confirm Rock updates normally without changing production state.

## Milestone 4 - Completion and pending module

- [X] Confirm timer completion displays `Storage Module complete`.
- [X] Confirm the same status clearly displays `Pending placement`.
- [X] Confirm progress remains at 100% and the button remains disabled.
- [X] Confirm repeated clicks cannot manufacture a second module.
- [X] Confirm collecting additional Rock does not enable manufacturing while a module is pending.
- [X] Confirm no module geometry, placement preview, grid, attachment, or world construction effect appears.

## Milestone 4 - Reset and timer-race safety

- [X] Reset while manufacturing is unavailable and confirm the unavailable presentation remains correct.
- [X] Reset while affordable and confirm Rock becomes zero and the button disables.
- [X] Reset immediately after manufacturing begins and confirm the timer stops and progress clears.
- [X] Reset halfway through manufacturing and confirm no late completion occurs.
- [X] Reset immediately before expected timer completion and confirm no module becomes pending afterward.
- [X] Reset after completion and confirm pending-module state clears.
- [X] In every reset case, confirm Rock is zero, progress is 0%, state is idle, and status says `Need 4 more Rock`.
- [X] Repeat manufacturing and reset cycles and confirm no duplicate timeout signals, spending, or modules.

## Milestone 4 - Milestone 1–3 regression

- [X] Confirm camera, trajectory, targeting, mining, five-hit destruction, and destruction particles remain correct.
- [X] Confirm exactly three Rock pickups still spawn, drift, fade, expire, and collect correctly.
- [X] Confirm Reset Prototype still clears pickups and inventory.
- [X] Confirm normal fly-by completion still releases no Rock.
- [X] Confirm exit and relaunch remain clean.
- [X] Confirm no unexpected debugger errors occur through the complete mining, collection, and manufacturing sequence.

## Milestone 5 - Cargo presentation and lifecycle

- [X] Launch or reset and confirm the HUD displays `Prototype v0.5.0`.
- [X] Confirm Cargo appears below Manufacturing as a readable three-column, two-row grid.
- [X] Confirm Cargo contains one Rock slot, one Storage Module slot, and four inert Empty slots.
- [X] Confirm the Cargo Rock quantity always matches the existing left-side Rock summary.
- [X] Confirm Rock and Empty slots cannot be selected or moved.
- [X] Confirm Manufacturing completion produces exactly one selectable Storage Module in Cargo.
- [X] Confirm clicking the module selects and visibly highlights it.
- [X] Click the selected module again and confirm it remains selected.
- [X] Confirm Attach enables only while the completed module is selected in Cargo.

## Milestone 5 - Placement interaction

- [X] Press **Attach** and confirm exactly six socket markers appear: Top, Bottom, Left, Right, Front, and Rear.
- [X] Confirm the button changes to **Cancel Placement**.
- [X] Confirm right-drag orbit, wheel zoom, and `R` camera reset remain functional during placement.
- [X] Press `Space` during placement and confirm it does not activate a HUD control or attach a module.
- [X] Click empty world space and confirm placement remains active and nothing attaches.
- [X] Confirm Rock and asteroid left-click interaction is unavailable only while placement is active.
- [X] Confirm Rock pickups continue drifting and fading during placement.
- [X] Press **Cancel Placement** and confirm all markers hide and become non-interactive.
- [X] Confirm cancellation returns the module to Cargo still selected and consumes nothing.
- [X] Press **Attach** again and confirm placement can be retried.

## Milestone 5 - Socket transforms and attachment

- [X] Inspect each socket from useful camera angles and confirm association with its intended pod face.
- [X] Confirm each socket is reachable without changing the existing orbit or zoom limits.
- [X] Confirm each marker is readable against space and uses opaque Compatibility-safe presentation.
- [X] Confirm each socket can be clicked reliably without another socket intercepting the ray.
- [X] Attach separately to Top, Bottom, Left, Right, Front, and Rear across reset runs.
- [X] Confirm the module clears the pod, antenna, window, fins, equipment panels, and thrusters at every socket.
- [X] Confirm the module extends outward with the correct authored orientation at every socket.
- [X] Confirm the attached module uses identity local position and rotation under the selected socket.
- [X] Confirm a valid click creates exactly one attached Storage Module.
- [X] Confirm all six markers hide immediately after attachment.
- [X] Confirm the Storage Module disappears from Cargo and Attach disables.
- [X] Confirm Cargo says `Storage Module attached — pod expanded.`.
- [X] Confirm Manufacturing reports the module as attached or installed and does not say `Pending placement`.
- [X] Confirm additional clicks and manufacture requests cannot create another module.

## Milestone 5 - Collision routing and reset safety

- [X] Confirm asteroid selection still uses physics layer 2 and Rock collection still uses physics layer 3.
- [X] Confirm normal interaction uses combined mask value `6`.
- [X] Confirm placement interaction queries only socket physics layer 4 with mask value `8`.
- [X] Confirm socket collision shapes are disabled outside placement mode.
- [X] Reset during manufacturing and confirm no late completion appears.
- [X] Reset with the module in Cargo and confirm its selection and inventory presence clear.
- [X] Reset during placement and confirm every marker and socket collision disables safely.
- [X] Reset immediately after attachment and confirm the attached module is removed.
- [X] Confirm every reset restores Rock to zero, lifecycle to initial state, and both panels to unavailable/empty presentation.
- [X] Repeat the complete mine, collect, manufacture, select, attach, and reset loop.
- [X] Confirm no duplicate modules, sockets, signals, spending, or attachment occur across repeated runs.

## Milestone 5 - Milestone 1–4 regression

- [X] Confirm the asteroid fly-by remains approximately 27–28 seconds.
- [X] Confirm camera, trajectory, selection, mining, five-hit destruction, and particles remain correct.
- [X] Confirm exactly three Rock pickups still spawn, drift, fade, expire, and collect for six total Rock.
- [X] Confirm manufacturing still costs four Rock, lasts approximately three seconds, and permits Rock collection while active.
- [X] Confirm normal fly-by completion releases no Rock.
- [X] Confirm exit and relaunch remain clean.
- [X] Confirm no unexpected debugger errors occur through the complete Build Week loop.

## Save/load - Deferred and out of scope

Save/load is not part of the Build Week prototype and has no acceptance tests for this project.

## Milestone 1 - Clean exit

- [X] Closing the running prototype exits without hanging.
- [X] Exiting produces no unexpected errors.
- [X] Restarting after exit launches normally.

## Milestone 6 — Frozen-build regression

### Version and clean launch

- [X] Confirm the root `VERSION` contains exactly `0.6.0-buildweek`.
- [X] Confirm the HUD displays `Prototype v0.6.0`.
- [X] Confirm `game/project.godot` uses `config/version="0.6.0-buildweek"`.
- [X] Import a clean copy of `game/project.godot` in Godot Engine v4.6.2.stable.official [71f334935].
- [X] Confirm the clean import succeeds without missing resources or parse errors.
- [X] Press F5 and confirm the configured prototype scene launches directly.
- [X] Confirm no unexpected errors appear in the Godot debugger.

### First regression run

- [X] Confirm right-drag orbit, bounded mouse-wheel zoom, and `R` camera reset.
- [X] Allow a normal asteroid fly-by to complete and confirm it releases no Rock.
- [X] Select **Reset Prototype** and confirm a clean run starts.
- [X] Select the asteroid and confirm five deliberate mining shots destroy it.
- [X] Confirm exactly three Rock pickups appear.
- [X] Collect Rock and confirm the left HUD and Cargo Rock displays remain synchronized.
- [X] Confirm manufacturing becomes available after sufficient Rock is collected.
- [X] Start manufacturing and confirm exactly four Rock are spent once.
- [X] Collect remaining Rock during manufacturing and confirm production continues normally.
- [X] Confirm one Storage Module appears in Cargo when manufacturing completes.
- [X] Select the module and confirm **Attach** becomes enabled.
- [X] Select **Attach** and confirm exactly six authored sockets appear.
- [X] Confirm camera controls and mining input remain safe during placement.
- [X] Select **Cancel Placement** and confirm the module remains selected.
- [X] Re-enter placement and click one valid socket.
- [X] Confirm exactly one Storage Module attaches.
- [X] Confirm Cargo and Manufacturing show consistent attached/installed status.

### Race and reset checks

- [X] Reset immediately before manufacturing completes and confirm no late module appears.
- [X] Reset while the Storage Module is in Cargo and confirm it is removed.
- [X] Reset during placement and confirm all socket markers hide and all socket interaction disables.
- [X] Reset immediately after attachment and confirm the attached module is removed.
- [X] Confirm no attachment socket remains clickable after reset.
- [X] Wait after each reset and confirm no late timer or click changes the restored state.

### Input-focus checks

- [X] Click **Reset Prototype**, press `Space`, and confirm no GUI action occurs.
- [X] Click **Manufacture Storage Module**, press `Space`, and confirm no GUI action occurs.
- [X] Click the Storage Module Cargo slot, press `Space`, and confirm no GUI action occurs.
- [X] Click **Attach**, press `Space`, and confirm no GUI action occurs.
- [X] Click **Cancel Placement**, press `Space`, and confirm no GUI action occurs.

### Replay and lifecycle

- [X] Complete a second full loop after reset.
- [X] Attach the Storage Module using a different socket.
- [X] Confirm repeated clicks cannot manufacture or attach more than once.
- [X] Exit the prototype cleanly.
- [X] Relaunch the project and confirm it starts normally.
- [X] Perform a final debugger inspection and confirm no unexpected errors.
