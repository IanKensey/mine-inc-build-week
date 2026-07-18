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
- [ ] Confirm the HUD displays `Prototype v0.1.0`.
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

## Future milestone - Asteroid movement and trajectory (not yet implemented)

- [ ] The asteroid follows its intended path.
- [ ] The trajectory is visible and readable against the scene.
- [ ] The trajectory corresponds to the asteroid's movement.
- [ ] Movement remains stable across different frame rates.

## Future milestone - Targeting and mining (not yet implemented)

- [ ] The asteroid can be selected with the documented input.
- [ ] Selection provides clear visual feedback.
- [ ] Firing affects only a valid selected target.
- [ ] Mining damage is applied consistently until the asteroid is destroyed.
- [ ] Destroying the asteroid removes or disables it cleanly.

## Future milestone - Resource collection (not yet implemented)

- [ ] Destroying the asteroid releases the expected resources.
- [ ] Released resources are visible and distinguishable.
- [ ] Resources can be collected through the intended click interaction.
- [ ] The stored resource amount updates exactly once per collected resource.
- [ ] Collected resource objects are removed cleanly.

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
