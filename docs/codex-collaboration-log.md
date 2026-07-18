# Codex Collaboration Log

## 2026-07-17 - Initial repository inspection

### Codex contributions

- Read `AGENTS.md` and `README.md`.
- Inspected the repository structure and existing documentation.
- Identified the empty documentation placeholders and the absence of a Godot project.
- Made no changes during the inspection.

### Human decisions

- Confirmed that the existing project skeleton is the committed Git baseline.
- Required approval before any files were changed.
- Chose to prepare project documentation before beginning implementation.

### Verification still required

- None for the read-only inspection.

## 2026-07-17 - Documentation baseline

### Codex contributions

- Drafted the project README and concept overview.
- Reformatted the agreed Build Week scope without expanding it.
- Created the grouped prototype test checklist.
- Added the Godot 4 `.gitignore` and standard MIT License text.
- Updated this collaboration log.

### Human decisions

- Defined the required documentation sections and wording for project provenance.
- Confirmed Godot 4 and Windows 11 as the planned environment.
- Required that no Godot project, gameplay implementation, commit, or push be created as part of this task.

### Verification still required

- Human review of documentation wording and scope alignment.
- Confirmation that the `.gitignore` matches the Godot project layout once implementation begins.
- Execution of the test checklist after the corresponding features are implemented.

## 2026-07-17 - Milestone 1 implementation

### Approved architecture decisions

- Use a small scene-based Godot architecture with focused typed scripts and no autoloads or global event bus.
- Use click-to-collect resources in a future milestone.
- Use discrete Space-key mining shots against the selected asteroid in a future milestone.
- Use one asteroid and a future Reset Prototype action rather than continuous spawning.
- Manufacture a Storage Module in a future milestone.
- Defer save/load outside the Build Week prototype scope.
- Use one flat attachment-grid face for future module placement.
- Treat a collector drone as a stretch goal only after the required loop works.
- Add no third-party assets, plugins, or dependencies.

### Target environment

- Godot Engine v4.6.2.stable.official [71f334935]
- Windows 11
- Compatibility renderer
- Prototype version `0.1.0-buildweek`

### Codex contributions

- Initialized the minimal Godot project under `game/`.
- Created the directly runnable prototype scene.
- Built a placeholder escape pod from built-in meshes and embedded materials.
- Added a dark environment, two-direction lighting, and built-in depth markers.
- Implemented typed orbit, zoom, bounded pitch, bounded distance, continuous focus, and camera reset behaviour.
- Added the static Milestone 1 HUD and configured named input actions.
- Updated README setup, controls, feature status, and version information.
- Updated the test checklist for Milestone 1 and clearly marked future work.

### Human decisions

- Approved the technical architecture and ordered milestone plan.
- Selected Godot Engine v4.6.2.stable.official [71f334935].
- Approved the interaction, scope, and deferral decisions listed above.
- Limited this implementation to Milestone 1 and prohibited commits or pushes.

### Files created

- `VERSION`
- `game/project.godot`
- `game/scenes/main/prototype.tscn`
- `game/scenes/pod/escape_pod.tscn`
- `game/scenes/ui/prototype_hud.tscn`
- `game/scripts/camera/orbit_camera.gd`

### Files modified

- `README.md`
- `docs/codex-collaboration-log.md`
- `docs/test-checklist.md`

### Implementation trade-offs

- The HUD displays `Prototype v0.1.0` directly. Reading the root `VERSION` file at runtime would add infrastructure with no Milestone 1 gameplay value.
- The escape pod and HUD have no scripts because their current behaviour is entirely static.
- Distant emissive primitive meshes provide lightweight depth cues without external art or a speculative starfield system.
- Scene resources and materials are embedded because Milestone 1 does not require reusable content data.

### Manual verification still required

- Open and import the project in the target Godot editor on Windows 11.
- Confirm the pod and HUD are visually readable at the default window size.
- Exercise right-drag orbit, wheel zoom, pitch and distance limits, and `R` reset.
- Confirm repeated camera input produces no debugger errors.
- Confirm clean window exit and restart.

### Human verification

- I opened the project in Godot Engine v4.6.2.stable.official.
- I can confirmed the project launched directly into the prototype scene.
- The escape pod rendered correctly, and looks really good.
- Holding the right-mouse button and dragging orbitted the camera.
- I zoomed and out using the mouse wheel which was bounded.
- Moving the mouse far down or far up prevented camera flipping.
- Pressing `R` restored the default view.
- I was able to cleanly exit and relaunch without issues.
- I can confirmed no debugger errors.

## 2026-07-18 - Milestone 2 implementation

### Codex contributions

- Created one reusable irregular asteroid from built-in meshes and embedded materials.
- Added typed asteroid health, selection, targeting, damage, reset, and exactly-once destruction behaviour.
- Added an authored approximately 49.6-unit fly-by path and a typed `PathFollow3D` controller.
- Tuned the exported asteroid speed to 1.8 world units per second for an approximate 27.6-second fly-by.
- Generated 63 emissive trajectory dots once from the actual path curve using a `MultiMesh`.
- Added collision-layer-specific left-click selection and reliable empty-space deselection.
- Added one guarded Space-key mining shot with an escape-pod origin and short visible beam.
- Added a built-in one-shot particle destruction effect without debris or resource drops.
- Added repeatable Reset Prototype behaviour without respawning or reconnecting nodes.
- Updated the HUD, version, controls, README, checklist, and collaboration record.
- Preserved all Milestone 1 camera and presentation behaviour.

### Human decisions

- Approved Milestone 2 only and prohibited all later-loop features.
- Set asteroid maximum health to 5 and mining damage to 1 per shot.
- Requested a thoughtful 25–30-second fly-by rather than the initially proposed 15–20 seconds.
- Approved a HUD button labelled `Reset Prototype`.
- Approved empty-space deselection and emissive dotted `MultiMesh` trajectory markers.
- Approved a brief built-in particle burst with no debris or resources.
- Required all tuning values to remain exported for manual adjustment.
- Confirmed Milestone 1 passed manual verification and had been committed and pushed.

### Files created

- `game/scenes/space/asteroid.tscn`
- `game/scripts/space/asteroid.gd`
- `game/scripts/space/asteroid_flyby.gd`
- `game/scripts/space/trajectory_renderer.gd`
- `game/scripts/main/prototype_controller.gd`
- `game/scripts/ui/prototype_hud.gd`

### Files modified

- `VERSION`
- `game/project.godot`
- `game/scenes/main/prototype.tscn`
- `game/scenes/pod/escape_pod.tscn`
- `game/scenes/ui/prototype_hud.tscn`
- `README.md`
- `docs/codex-collaboration-log.md`
- `docs/test-checklist.md`

### Implementation trade-offs

- Maximum health, movement speed, mining damage, beam duration, and trajectory presentation use typed exports instead of a data resource because Milestone 2 has only one asteroid configuration.
- The authored path uses five predictable segments rather than orbital physics or a procedural curve.
- The trajectory renderer samples that exact path once at startup into a `MultiMesh`; reset reuses the existing dots.
- The mining beam uses a short-lived emissive `ImmediateMesh` line, avoiding a projectile or weapon framework.
- The asteroid hides its geometry and selection collision during a brief particle burst instead of creating persistent physics debris.
- Reset reuses the existing asteroid and fly-by nodes, preventing duplicated signals, objects, and trajectory renderers.

### Automated verification

- Godot Engine v4.6.2.stable.official [71f334935] imported the project and registered all typed global classes.
- The configured main scene launched headlessly with exit code 0.
- Startup logs confirmed one 63-dot trajectory generation, asteroid initialization, fly-by start, camera reset, and controller readiness.
- The authored path length and exported speed produce an approximate 27.6-second fly-by.

### Manual verification still required

- Confirm the asteroid is visually irregular, readable, and follows the visible trajectory at an appropriate pace.
- Confirm left-click selection, empty-space deselection, HUD blocking, and right-drag camera independence.
- Confirm each non-repeated Space press removes exactly one HP and shows a visible beam.
- Confirm destruction occurs once, clears targeting, shows the particle burst, and creates no resources.
- Confirm path completion and repeated Reset Prototype actions restore the correct clean state.
- Re-run the Milestone 1 camera, launch, exit, and relaunch checks.

## 2026-07-18 - Milestone 2 focused defect fixes

### Human test findings

- Most Milestone 2 behaviour passed manual testing, including the approximately 28-second fly-by, trajectory, selection, camera regression, mining beam, reset, path completion, and clean relaunch.
- The asteroid appeared to be destroyed by the first mining shot, preventing manual verification of five-hit depletion.
- The asteroid disappeared on destruction, but the particle burst was not perceptible at normal camera distance.

### Confirmed root causes

- The first mining shot correctly applied one damage and logged `HP: 4 / 5`. The focused `Reset Prototype` button also treated Space as GUI activation, immediately resetting the asteroid to its off-screen path start and making it appear destroyed.
- The destruction particle node remained alive and visible independently of the hidden asteroid geometry, but its radius `0.09` mesh was multiplied by a `0.08` to `0.2` particle scale. The resulting particles were too small to perceive during normal play.

### Codex contribution

- Inspected all health, damage, input, signal, scene-override, destruction, and particle paths.
- Used the existing runtime logs to distinguish a reset from actual destruction and rule out repeated damage.
- Disabled keyboard focus on the existing Reset Prototype button while preserving mouse activation.
- Increased only the existing built-in particle effect's size, count, lifetime, and cleanup timer.
- Added focused regression tests without changing scripts or gameplay scope.

### Exact corrective changes

- Set the Reset Prototype button `focus_mode` to `FOCUS_NONE` (`0`).
- Increased destruction particle process scale from `0.08–0.2` to `0.65–1.35`.
- Increased destruction particle mesh radius from `0.09` to `0.14` and height from `0.18` to `0.28`.
- Increased destruction particle amount from `28` to `44`.
- Increased destruction particle lifetime from `0.75` seconds to `1.05` seconds.
- Increased the associated cleanup timer from `0.8` seconds to `1.1` seconds.

### Manual verification still required

- Click Reset Prototype, then select the asteroid and press Space once; confirm reset is not activated and HP becomes `4 / 5`.
- Deliver four additional deliberate shots and confirm destruction occurs only on the fifth total hit.
- Confirm the enlarged particle burst is clearly visible at normal camera distance and ends cleanly after approximately one second.
- Confirm mouse activation of Reset Prototype still works before and after destruction.
- Confirm the fly-by timing and all previously passing Milestone 1 and Milestone 2 behaviours remain unchanged.


### Human verification — Milestone 2 defect fixes

- At the start of fly-by the asteroid has 5 / 5 HP.
- Each separate Space press fires one mining beam from pod to asteroid.
- Each beam/shot reduces asteroid HP by 1 HP.
- Holding Space does not cause repeated fire.
- The asteroid is destroyed only by the fifth hit (when HP=0).
- The beam/shot tracks the moving asteroid from the pod.
- The destruction particle burst is clearly visible.
- Selecting Reset Prototype no longer retains Space-key focus.
- All functions: reset, fly-by completion, camera controls, exit, and relaunch remain functional.
- I can confirmed there were no unexpected Godot debugger errors.

