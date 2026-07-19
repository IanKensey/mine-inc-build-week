# Mine Inc. Prototype Test Checklist

Use this checklist when the relevant feature exists. Record defects and retest affected groups after a change. Milestone 1–5 sections preserve historical milestone and regression criteria; use the Milestone 6 section for the current frozen-build version and final validation.

## Milestone 1 - Project launch and presentation

- [ ] Open `game/project.godot` in Godot Engine v4.6.2.stable.official [71f334935].
- [ ] Confirm the project imports without parse or resource-loading errors.
- [ ] Press F5 and confirm the prototype main scene launches directly.
- [ ] Confirm the default window is readable at 1280 by 720.
- [ ] Confirm a recognizable escape pod is visible at launch.
- [ ] Confirm the pod uses only built-in geometry and embedded materials.
- [ ] Confirm the background is dark and space-like.
- [ ] Confirm cool key lighting and warm rim lighting make the pod silhouette readable.
- [ ] Confirm distant light markers provide visible depth cues while orbiting.
- [ ] Confirm the HUD displays `Mine Inc.`.
- [ ] Historical Milestone 1 evidence records the milestone version; use the Milestone 6 section to verify the current HUD version.
- [ ] Confirm the HUD displays `OpenAI Build Week 2026`.
- [ ] Confirm the HUD lists the orbit, zoom, and reset controls.
- [ ] Confirm no unexpected errors appear in the Godot debugger during launch.

## Milestone 1 - Camera

- [ ] Hold the right mouse button and move the mouse horizontally to orbit around the pod.
- [ ] Hold the right mouse button and move the mouse vertically to change camera pitch.
- [ ] Confirm mouse movement without the right button held does not orbit the camera.
- [ ] Confirm vertical orbit stops at the configured bounds and never flips the camera.
- [ ] Scroll up and confirm the camera zooms toward the pod.
- [ ] Scroll down and confirm the camera zooms away from the pod.
- [ ] Confirm repeated scrolling cannot pass the minimum or maximum distance.
- [ ] Orbit and zoom through several combinations and confirm the pod remains the focus.
- [ ] Press `R` and confirm the original yaw, pitch, and distance are restored.
- [ ] Repeat orbit, zoom, and reset actions and confirm no debugger errors occur.

## Milestone 2 - Asteroid and fly-by

- [ ] Confirm one recognizably irregular asteroid appears outside the initial central view.
- [ ] Confirm the asteroid uses only built-in geometry and materials.
- [ ] Confirm the asteroid follows the authored path at a predictable pace.
- [ ] Time an uninterrupted fly-by and confirm it lasts approximately 25–30 seconds.
- [ ] Confirm the asteroid passes clearly within visible operating range of the pod.
- [ ] Confirm it remains far enough from the escape pod to avoid a collision.
- [ ] Confirm it leaves the play area and stops cleanly at the path end.
- [ ] Confirm the HUD reports `Fly-by complete` at the path end.
- [ ] Confirm movement remains stable at different frame rates.

## Milestone 2 - Visible trajectory

- [ ] Confirm the trajectory appears as readable emissive dotted markers.
- [ ] Confirm the dots represent the asteroid's actual authored path accurately.
- [ ] Confirm the trajectory remains readable against the dark background from useful camera angles.
- [ ] Confirm only one trajectory is present at startup.
- [ ] Reset repeatedly and confirm trajectory dots are not duplicated.

## Milestone 2 - Target selection and HUD

- [ ] Left-click the asteroid and confirm it becomes selected.
- [ ] Confirm the selected state has obvious visual feedback.
- [ ] Confirm the HUD displays `Asteroid selected`.
- [ ] Confirm the HUD displays integer health as `HP: 5 / 5` initially.
- [ ] Click empty world space and confirm selection clears.
- [ ] Click the HUD panel and controls and confirm world selection does not change.
- [ ] Right-drag the camera and confirm it does not select or clear the asteroid.
- [ ] Confirm the asteroid cannot be selected after destruction or path completion.

## Milestone 2 - Mining and health

- [ ] Press `Space` without a selected asteroid and confirm nothing is damaged.
- [ ] Select the asteroid and press `Space` once.
- [ ] Confirm a brief visible beam originates from the escape pod and reaches the asteroid.
- [ ] Confirm one press removes exactly one HP.
- [ ] Confirm the HUD immediately updates to `HP: 4 / 5` after the first hit.
- [ ] Hold `Space` and confirm key-repeat does not produce unintended rapid fire.
- [ ] Confirm five deliberate shots are required to destroy a full-health asteroid.
- [ ] Confirm further Space presses cannot damage a destroyed asteroid.

## Milestone 2 - Destruction

- [ ] Confirm reaching zero HP emits one visible destruction event.
- [ ] Confirm asteroid geometry and selection feedback disappear cleanly.
- [ ] Confirm a brief built-in particle burst is visible.
- [ ] Confirm the burst ends cleanly without persistent debris.
- [ ] Confirm the HUD displays `Asteroid destroyed` and `HP: 0 / 5`.
- [ ] Confirm destruction itself still occurs exactly once before Milestone 3 resource release is handled.
- [ ] Confirm destruction occurs exactly once even with repeated input.

## Milestone 2 - Reset Prototype

- [ ] Select **Reset Prototype** during an active fly-by.
- [ ] Confirm the asteroid returns to the exact path start at full health.
- [ ] Confirm selection is cleared and the HUD returns to active fly-by state.
- [ ] Destroy the asteroid, then reset and confirm its visuals, collision, health, and movement are restored.
- [ ] Let the fly-by complete, then reset and confirm it restarts normally.
- [ ] Reset during the destruction effect and confirm the effect clears immediately.
- [ ] Reset repeatedly and confirm no duplicated asteroid, signals, effects, beams, or trajectory dots.

## Milestone 2 - Milestone 1 regression

- [ ] Confirm the project still launches directly without errors.
- [ ] Confirm the escape pod, lighting, depth cues, and HUD remain readable.
- [ ] Confirm right-drag orbit, bounded pitch, and bounded wheel zoom still work.
- [ ] Confirm `R` still restores the default camera view.
- [ ] Confirm the project exits and relaunches cleanly.
- [ ] Confirm no unexpected debugger errors occur during the full Milestone 2 loop.

## Milestone 2 - Focused defect regression

- [ ] Click **Reset Prototype** and confirm the fly-by restarts normally.
- [ ] Select the reset asteroid and confirm the HUD displays `HP: 5 / 5`.
- [ ] Press `Space` once and confirm Reset Prototype is not activated.
- [ ] Confirm the asteroid remains at its current fly-by position rather than jumping to the path start.
- [ ] Confirm exactly one mining beam appears and the HUD changes to `HP: 4 / 5`.
- [ ] Press `Space` three more deliberate times and confirm HP changes to `3 / 5`, `2 / 5`, then `1 / 5`.
- [ ] Confirm the asteroid remains visible and targetable after the fourth total hit.
- [ ] Press `Space` a fifth time and confirm HP reaches `0 / 5` and destruction occurs exactly once.
- [ ] Confirm one clearly visible particle burst appears at the asteroid's destruction position.
- [ ] Confirm the burst remains perceptible at normal camera distance and clears after approximately one second.
- [ ] Confirm the burst does not create debris or resources.
- [ ] Click **Reset Prototype** after destruction and confirm the asteroid, health, collision, and fly-by are restored cleanly.
- [ ] Repeat the focused sequence and confirm no duplicated damage, resets, effects, or signals.
- [ ] Confirm the uninterrupted fly-by still lasts approximately 27–28 seconds.
- [ ] Confirm camera, selection, trajectory, HUD, reset, fly-by completion, exit, and relaunch behaviour remain unchanged.

## Milestone 3 - Resource release

- [ ] Launch or reset the prototype and confirm the HUD displays `Rock: 0`.
- [ ] Allow a fly-by to complete without destruction and confirm no Rock pickups are released.
- [ ] Destroy the asteroid and confirm exactly three Rock pickups appear.
- [ ] Confirm all three spawn around the destruction position with visible initial separation.
- [ ] Confirm their collision areas do not completely overlap.
- [ ] Confirm all pickups use built-in geometry and remain readable against the background.
- [ ] Confirm the pickups drift broadly in the asteroid's travel direction.
- [ ] Confirm the three fixed drift variations are predictable across repeated resets.
- [ ] Confirm repeated Space presses after destruction do not release another group.
- [ ] Confirm each destroyed asteroid run represents exactly six collectible Rock.

## Milestone 3 - Manual collection and collision routing

- [ ] Left-click one Rock pickup and confirm it is collected immediately without another input.
- [ ] Confirm only the clicked pickup disappears.
- [ ] Confirm the other two pickups remain collectible.
- [ ] Confirm the HUD immediately changes from `Rock: 0` to `Rock: 2`.
- [ ] Click the former pickup position again and confirm Rock does not increase twice.
- [ ] Collect the second pickup and confirm `Rock: 4`.
- [ ] Collect the third pickup and confirm `Rock: 6`.
- [ ] Confirm Rock cannot exceed six during one fly-by.
- [ ] Confirm clicking a Rock pickup does not select it as an asteroid or alter stale asteroid selection unexpectedly.
- [ ] Confirm asteroid selection still uses physics layer 2 and works normally before destruction.
- [ ] Confirm Rock collection uses physics layer 3 with mask value `4`.
- [ ] Confirm HUD clicks do not select the asteroid or collect Rock behind the HUD.
- [ ] Confirm right-mouse camera orbit does not collect Rock.

## Milestone 3 - Drift and expiration

- [ ] Destroy the asteroid and leave all pickups uncollected.
- [ ] Confirm pickups move continuously and remain clickable while drifting.
- [ ] Confirm they disappear cleanly after approximately 14 seconds.
- [ ] Confirm expiration does not increase the Rock count.
- [ ] Collect one pickup and allow two to expire; confirm the final count remains `Rock: 2`.
- [ ] Confirm expiration produces no debugger errors or persistent collision targets.

## Milestone 3 - Reset and same-frame safeguards

- [ ] Reset while all three pickups are drifting and confirm all are removed.
- [ ] Confirm Reset Prototype restores `Rock: 0`.
- [ ] Collect one pickup, reset immediately, and confirm the final count is `Rock: 0`.
- [ ] Reset close to pickup expiration and confirm no Rock is added and no error occurs.
- [ ] Reset after collecting some pickups while others remain and confirm all state clears.
- [ ] Confirm reset restores the asteroid, full HP, selection state, fly-by, and one trajectory only.
- [ ] Repeat destruction and reset cycles and confirm no duplicate signals, pickups, inventory additions, or trajectory dots.

## Milestone 3 - Milestone 1 and 2 regression

- [ ] Confirm the uninterrupted asteroid fly-by still lasts approximately 27–28 seconds.
- [ ] Confirm asteroid selection, empty-space deselection, HP, mining beam, and five-hit destruction remain correct.
- [ ] Confirm the destruction burst remains clearly visible.
- [ ] Confirm camera orbit, bounded pitch, bounded zoom, and `R` reset remain correct.
- [ ] Confirm fly-by completion, Reset Prototype, exit, and relaunch remain correct.
- [ ] Confirm no unexpected debugger errors occur during the complete Milestone 3 loop.

## Milestone 3 - Pickup fade polish

- [ ] Destroy the asteroid and leave all three Rock pickups uncollected.
- [ ] Confirm the pickups remain fully visible for approximately 11 seconds.
- [ ] Confirm each pickup begins fading smoothly over its final approximately three seconds.
- [ ] Confirm the Rock core, Rock lobe, and blue halo fade together.
- [ ] Confirm the halo retains its existing size and brightness before the fade begins.
- [ ] Confirm pickups continue drifting normally throughout the fade.
- [ ] Confirm fading one pickup does not change the opacity of another pickup.
- [ ] Click a partially faded pickup and confirm it is collected immediately.
- [ ] Confirm collection during the fade adds exactly two Rock and cannot occur twice.
- [ ] Confirm an uncollected pickup is removed at approximately 14 seconds.
- [ ] Confirm expiration adds no Rock and produces no debugger error.
- [ ] Reset while pickups are fading and confirm they disappear immediately.
- [ ] Confirm reset during fading restores `Rock: 0` and produces no delayed collection or expiration effects.
- [ ] Repeat the fade, collection, expiration, and reset cases and confirm no duplicated signals or inventory changes.

## Milestone 3 - Compatibility fade correction

- [ ] Run the prototype with the Compatibility renderer unchanged.
- [ ] Destroy the asteroid and confirm all three Rock pickups begin fully opaque.
- [ ] Confirm no pickup changes opacity during approximately its first 11 seconds.
- [ ] Confirm Rock geometry visibly fades over the final approximately three seconds.
- [ ] Confirm the emissive blue halo visibly fades with the Rock geometry.
- [ ] Confirm each pickup's fade is independent and does not alter either other pickup.
- [ ] Confirm shared source material colours remain correct after reset and another destruction cycle.
- [ ] Click a partially faded pickup and confirm it remains collectible exactly once.
- [ ] Confirm collection during fading immediately adds two Rock and removes only that pickup.
- [ ] Reset while one or more pickups are fading and confirm immediate safe cleanup with `Rock: 0`.
- [ ] Confirm uncollected fading pickups still expire at approximately 14 seconds without adding Rock.
- [ ] Confirm drift direction, speed, collision, yield, inventory, HUD, asteroid, camera, and reset behaviour remain unchanged.
- [ ] Confirm no unexpected debugger warnings or errors occur during repeated fade cycles.

## Milestone 4 - Manufacturing availability

- [ ] Launch or reset and confirm the HUD displays `Prototype v0.4.0`.
- [ ] Confirm the Manufacturing panel is readable in the upper-right without obscuring the existing HUD.
- [ ] Confirm it identifies the `Storage Module` and `Cost: 4 Rock`.
- [ ] At `Rock: 0`, confirm the status says `Need 4 more Rock` and the button is disabled.
- [ ] Collect one pickup and confirm `Rock: 2`, `Need 2 more Rock`, and a disabled button.
- [ ] Collect a second pickup and confirm `Rock: 4`, `Ready to manufacture`, and an enabled button.
- [ ] Collect all three and confirm `Rock: 6` while manufacturing remains affordable.
- [ ] Press Space after clicking the manufacturing button area and confirm it cannot activate the button through keyboard focus.

## Milestone 4 - Manufacturing process

- [ ] With fewer than four Rock, attempt to trigger manufacturing and confirm no Rock is spent and no timer starts.
- [ ] With four or more Rock, click **Manufacture Storage Module** once.
- [ ] Confirm exactly four Rock are spent immediately.
- [ ] Confirm Rock never becomes negative.
- [ ] Confirm the button disables immediately.
- [ ] Confirm status displays `Manufacturing Storage Module…`.
- [ ] Confirm progress advances visibly from 0% to 100% over approximately three seconds.
- [ ] Click rapidly during manufacturing and confirm no additional Rock is spent and no second timer starts.
- [ ] Collect a remaining Rock pickup during manufacturing and confirm Rock updates normally without changing production state.

## Milestone 4 - Completion and pending module

- [ ] Confirm timer completion displays `Storage Module complete`.
- [ ] Confirm the same status clearly displays `Pending placement`.
- [ ] Confirm progress remains at 100% and the button remains disabled.
- [ ] Confirm repeated clicks cannot manufacture a second module.
- [ ] Confirm collecting additional Rock does not enable manufacturing while a module is pending.
- [ ] Confirm no module geometry, placement preview, grid, attachment, or world construction effect appears.

## Milestone 4 - Reset and timer-race safety

- [ ] Reset while manufacturing is unavailable and confirm the unavailable presentation remains correct.
- [ ] Reset while affordable and confirm Rock becomes zero and the button disables.
- [ ] Reset immediately after manufacturing begins and confirm the timer stops and progress clears.
- [ ] Reset halfway through manufacturing and confirm no late completion occurs.
- [ ] Reset immediately before expected timer completion and confirm no module becomes pending afterward.
- [ ] Reset after completion and confirm pending-module state clears.
- [ ] In every reset case, confirm Rock is zero, progress is 0%, state is idle, and status says `Need 4 more Rock`.
- [ ] Repeat manufacturing and reset cycles and confirm no duplicate timeout signals, spending, or modules.

## Milestone 4 - Milestone 1–3 regression

- [ ] Confirm camera, trajectory, targeting, mining, five-hit destruction, and destruction particles remain correct.
- [ ] Confirm exactly three Rock pickups still spawn, drift, fade, expire, and collect correctly.
- [ ] Confirm Reset Prototype still clears pickups and inventory.
- [ ] Confirm normal fly-by completion still releases no Rock.
- [ ] Confirm exit and relaunch remain clean.
- [ ] Confirm no unexpected debugger errors occur through the complete mining, collection, and manufacturing sequence.

## Milestone 5 - Cargo presentation and lifecycle

- [ ] Launch or reset and confirm the HUD displays `Prototype v0.5.0`.
- [ ] Confirm Cargo appears below Manufacturing as a readable three-column, two-row grid.
- [ ] Confirm Cargo contains one Rock slot, one Storage Module slot, and four inert Empty slots.
- [ ] Confirm the Cargo Rock quantity always matches the existing left-side Rock summary.
- [ ] Confirm Rock and Empty slots cannot be selected or moved.
- [ ] Confirm Manufacturing completion produces exactly one selectable Storage Module in Cargo.
- [ ] Confirm clicking the module selects and visibly highlights it.
- [ ] Click the selected module again and confirm it remains selected.
- [ ] Confirm Attach enables only while the completed module is selected in Cargo.

## Milestone 5 - Placement interaction

- [ ] Press **Attach** and confirm exactly six socket markers appear: Top, Bottom, Left, Right, Front, and Rear.
- [ ] Confirm the button changes to **Cancel Placement**.
- [ ] Confirm right-drag orbit, wheel zoom, and `R` camera reset remain functional during placement.
- [ ] Press `Space` during placement and confirm it does not activate a HUD control or attach a module.
- [ ] Click empty world space and confirm placement remains active and nothing attaches.
- [ ] Confirm Rock and asteroid left-click interaction is unavailable only while placement is active.
- [ ] Confirm Rock pickups continue drifting and fading during placement.
- [ ] Press **Cancel Placement** and confirm all markers hide and become non-interactive.
- [ ] Confirm cancellation returns the module to Cargo still selected and consumes nothing.
- [ ] Press **Attach** again and confirm placement can be retried.

## Milestone 5 - Socket transforms and attachment

- [ ] Inspect each socket from useful camera angles and confirm association with its intended pod face.
- [ ] Confirm each socket is reachable without changing the existing orbit or zoom limits.
- [ ] Confirm each marker is readable against space and uses opaque Compatibility-safe presentation.
- [ ] Confirm each socket can be clicked reliably without another socket intercepting the ray.
- [ ] Attach separately to Top, Bottom, Left, Right, Front, and Rear across reset runs.
- [ ] Confirm the module clears the pod, antenna, window, fins, equipment panels, and thrusters at every socket.
- [ ] Confirm the module extends outward with the correct authored orientation at every socket.
- [ ] Confirm the attached module uses identity local position and rotation under the selected socket.
- [ ] Confirm a valid click creates exactly one attached Storage Module.
- [ ] Confirm all six markers hide immediately after attachment.
- [ ] Confirm the Storage Module disappears from Cargo and Attach disables.
- [ ] Confirm Cargo says `Storage Module attached — pod expanded.`.
- [ ] Confirm Manufacturing reports the module as attached or installed and does not say `Pending placement`.
- [ ] Confirm additional clicks and manufacture requests cannot create another module.

## Milestone 5 - Collision routing and reset safety

- [ ] Confirm asteroid selection still uses physics layer 2 and Rock collection still uses physics layer 3.
- [ ] Confirm normal interaction uses combined mask value `6`.
- [ ] Confirm placement interaction queries only socket physics layer 4 with mask value `8`.
- [ ] Confirm socket collision shapes are disabled outside placement mode.
- [ ] Reset during manufacturing and confirm no late completion appears.
- [ ] Reset with the module in Cargo and confirm its selection and inventory presence clear.
- [ ] Reset during placement and confirm every marker and socket collision disables safely.
- [ ] Reset immediately after attachment and confirm the attached module is removed.
- [ ] Confirm every reset restores Rock to zero, lifecycle to initial state, and both panels to unavailable/empty presentation.
- [ ] Repeat the complete mine, collect, manufacture, select, attach, and reset loop.
- [ ] Confirm no duplicate modules, sockets, signals, spending, or attachment occur across repeated runs.

## Milestone 5 - Milestone 1–4 regression

- [ ] Confirm the asteroid fly-by remains approximately 27–28 seconds.
- [ ] Confirm camera, trajectory, selection, mining, five-hit destruction, and particles remain correct.
- [ ] Confirm exactly three Rock pickups still spawn, drift, fade, expire, and collect for six total Rock.
- [ ] Confirm manufacturing still costs four Rock, lasts approximately three seconds, and permits Rock collection while active.
- [ ] Confirm normal fly-by completion releases no Rock.
- [ ] Confirm exit and relaunch remain clean.
- [ ] Confirm no unexpected debugger errors occur through the complete Build Week loop.

## Save/load - Deferred and out of scope

Save/load is not part of the Build Week prototype and has no acceptance tests for this project.

## Milestone 1 - Clean exit

- [ ] Closing the running prototype exits without hanging.
- [ ] Exiting produces no unexpected errors.
- [ ] Restarting after exit launches normally.

## Milestone 6 — Frozen-build regression

### Version and clean launch

- [ ] Confirm the root `VERSION` contains exactly `0.6.0-buildweek`.
- [ ] Confirm the HUD displays `Prototype v0.6.0`.
- [ ] Confirm `game/project.godot` uses `config/version="0.6.0-buildweek"`.
- [ ] Import a clean copy of `game/project.godot` in Godot Engine v4.6.2.stable.official [71f334935].
- [ ] Confirm the clean import succeeds without missing resources or parse errors.
- [ ] Press F5 and confirm the configured prototype scene launches directly.
- [ ] Confirm no unexpected errors appear in the Godot debugger.

### First regression run

- [ ] Confirm right-drag orbit, bounded mouse-wheel zoom, and `R` camera reset.
- [ ] Allow a normal asteroid fly-by to complete and confirm it releases no Rock.
- [ ] Select **Reset Prototype** and confirm a clean run starts.
- [ ] Select the asteroid and confirm five deliberate mining shots destroy it.
- [ ] Confirm exactly three Rock pickups appear.
- [ ] Collect Rock and confirm the left HUD and Cargo Rock displays remain synchronized.
- [ ] Confirm manufacturing becomes available after sufficient Rock is collected.
- [ ] Start manufacturing and confirm exactly four Rock are spent once.
- [ ] Collect remaining Rock during manufacturing and confirm production continues normally.
- [ ] Confirm one Storage Module appears in Cargo when manufacturing completes.
- [ ] Select the module and confirm **Attach** becomes enabled.
- [ ] Select **Attach** and confirm exactly six authored sockets appear.
- [ ] Confirm camera controls and mining input remain safe during placement.
- [ ] Select **Cancel Placement** and confirm the module remains selected.
- [ ] Re-enter placement and click one valid socket.
- [ ] Confirm exactly one Storage Module attaches.
- [ ] Confirm Cargo and Manufacturing show consistent attached/installed status.

### Race and reset checks

- [ ] Reset immediately before manufacturing completes and confirm no late module appears.
- [ ] Reset while the Storage Module is in Cargo and confirm it is removed.
- [ ] Reset during placement and confirm all socket markers hide and all socket interaction disables.
- [ ] Reset immediately after attachment and confirm the attached module is removed.
- [ ] Confirm no attachment socket remains clickable after reset.
- [ ] Wait after each reset and confirm no late timer or click changes the restored state.

### Input-focus checks

- [ ] Click **Reset Prototype**, press `Space`, and confirm no GUI action occurs.
- [ ] Click **Manufacture Storage Module**, press `Space`, and confirm no GUI action occurs.
- [ ] Click the Storage Module Cargo slot, press `Space`, and confirm no GUI action occurs.
- [ ] Click **Attach**, press `Space`, and confirm no GUI action occurs.
- [ ] Click **Cancel Placement**, press `Space`, and confirm no GUI action occurs.

### Replay and lifecycle

- [ ] Complete a second full loop after reset.
- [ ] Attach the Storage Module using a different socket.
- [ ] Confirm repeated clicks cannot manufacture or attach more than once.
- [ ] Exit the prototype cleanly.
- [ ] Relaunch the project and confirm it starts normally.
- [ ] Perform a final debugger inspection and confirm no unexpected errors.
