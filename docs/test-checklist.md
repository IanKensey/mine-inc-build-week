# Mine Inc. Prototype Test Checklist

Use this checklist when the relevant feature exists. Record defects and retest affected groups after a change.

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
- [ ] Confirm the HUD displays the current version, `Prototype v0.3.0`.
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

## Future milestone - Manufacturing (not yet implemented)

- [ ] The Storage Module recipe and resource cost are displayed clearly.
- [ ] Manufacturing is unavailable when resources are insufficient.
- [ ] Manufacturing consumes the correct resource amount exactly once.
- [ ] Manufacturing produces one placeable Storage Module.

## Future milestone - Module placement (not yet implemented)

- [ ] Placement mode clearly shows the flat 3D attachment grid.
- [ ] The module preview snaps to valid grid positions.
- [ ] Invalid placement positions are rejected or clearly indicated.
- [ ] Confirming placement attaches exactly one module.
- [ ] The attached module remains aligned with the escape pod grid.

## Save/load - Deferred and out of scope

Save/load is not part of the Build Week prototype and has no acceptance tests for this project.

## Milestone 1 - Clean exit

- [ ] Closing the running prototype exits without hanging.
- [ ] Exiting produces no unexpected errors.
- [ ] Restarting after exit launches normally.
