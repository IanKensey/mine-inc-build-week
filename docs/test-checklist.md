# Mine Inc. Prototype Test Checklist

Use this checklist when the relevant feature exists. Record defects and retest affected groups after a change.

## Project launch

- [ ] The project opens in the agreed Godot 4 version without import or parse errors.
- [ ] Running the project reaches the main prototype scene without manual scene selection.
- [ ] The initial escape pod, asteroid, trajectory, and interface appear as expected.
- [ ] No unexpected errors are written to the Godot debugger on launch.

## Camera

- [ ] Camera rotation responds to the documented input.
- [ ] Zoom responds to the documented input.
- [ ] Rotation and zoom remain within usable limits.
- [ ] Camera input does not unintentionally trigger world interactions.

## Asteroid movement and trajectory

- [ ] The asteroid follows its intended path.
- [ ] The trajectory is visible and readable against the scene.
- [ ] The trajectory corresponds to the asteroid's movement.
- [ ] Movement remains stable across different frame rates.

## Targeting and mining

- [ ] The asteroid can be selected with the documented input.
- [ ] Selection provides clear visual feedback.
- [ ] Firing affects only a valid selected target.
- [ ] Mining damage is applied consistently until the asteroid is destroyed.
- [ ] Destroying the asteroid removes or disables it cleanly.

## Resource collection

- [ ] Destroying the asteroid releases the expected resources.
- [ ] Released resources are visible and distinguishable.
- [ ] Resources can be collected through the intended interaction.
- [ ] The stored resource amount updates exactly once per collected resource.
- [ ] Collected resource objects are removed cleanly.

## Manufacturing

- [ ] The module recipe and resource cost are displayed clearly.
- [ ] Manufacturing is unavailable when resources are insufficient.
- [ ] Manufacturing consumes the correct resource amount exactly once.
- [ ] Manufacturing produces one placeable module.

## Module placement

- [ ] Placement mode clearly shows the 3D attachment grid.
- [ ] The module preview snaps to valid grid positions.
- [ ] Invalid placement positions are rejected or clearly indicated.
- [ ] Confirming placement attaches exactly one module.
- [ ] The attached module remains aligned with the escape pod grid.

## Save/load

- [ ] Saving records all prototype state intended to persist.
- [ ] Loading restores collected resources and manufactured or placed module state.
- [ ] Loading does not duplicate asteroids, resources, or modules.
- [ ] Missing or invalid save data is handled without a crash.

## Clean exit

- [ ] Closing the running prototype exits without hanging.
- [ ] Exiting produces no unexpected errors.
- [ ] Restarting after exit launches normally.
