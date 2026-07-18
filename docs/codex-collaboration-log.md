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

## 2026-07-18 - Milestone 3 implementation

### Codex contributions

- Created one reusable Rock pickup scene from built-in low-poly meshes, embedded materials, an emissive visibility ring, and an `Area3D` collision shape.
- Added typed quantity, drift velocity, lifetime, exactly-once collection, immediate interaction shutdown, silent expiration, and reset-safe cleanup behaviour.
- Added three predictably separated Rock pickups at the asteroid destruction position, with two Rock each for a fixed total yield of six.
- Derived pickup drift from the asteroid's current authored-path travel direction and applied fixed lateral and speed variations without randomness.
- Moved pickups in `_physics_process(delta)` so rendered and physics-query positions remain synchronized.
- Added explicit asteroid and Rock collision masks to the controller's single interaction raycast.
- Added a scene-local Rock count, immediate HUD updates, and reset-to-zero behaviour.
- Updated version, HUD, README, collaboration log, and detailed manual test checklist.
- Preserved the existing asteroid speed, authored path, trajectory, camera, mining, destruction, reset, and completion behaviour.

### Human decisions

- Approved one resource type named Rock, with three pickups, two Rock per pickup, and six Rock total.
- Set pickup lifetime to 14 seconds and base drift speed to approximately 0.75 world units per second.
- Required fixed predictable drift variations with no random-number generation.
- Chose immediate one-click collection and silent expiration.
- Kept inventory scene-local with no capacity, slots, persistence, or general item framework.
- Required physics layer terminology and `_physics_process(delta)` pickup movement.
- Required immediate interaction shutdown and safe same-frame collection, expiration, and reset handling.
- Prohibited collector drones, automatic collection, manufacturing, and all other later or out-of-scope systems.

### Files created

- `game/scenes/resources/rock_pickup.tscn`
- `game/scripts/resources/rock_pickup.gd`

### Files modified

- `VERSION`
- `game/scenes/main/prototype.tscn`
- `game/scenes/ui/prototype_hud.tscn`
- `game/scripts/main/prototype_controller.gd`
- `game/scripts/space/asteroid_flyby.gd`
- `game/scripts/ui/prototype_hud.gd`
- `README.md`
- `docs/codex-collaboration-log.md`
- `docs/test-checklist.md`

### Collision layers and masks

- The asteroid remains on Godot physics layer 2, represented by mask value `2`.
- Rock pickups use Godot physics layer 3, represented by mask value `4`.
- The controller combines asteroid mask value `2` and Rock mask value `4` for an interaction query mask of `6`, then branches on the collider's typed scene class.
- Each Rock pickup disables monitoring, monitorability, physics movement, its lifetime timer, and its collision shape before emitting collection or queuing removal.

### Implementation trade-offs

- The single Rock count is owned by `prototype_controller.gd`; a separate inventory abstraction is unnecessary for one integer resource.
- Pickup count, quantity, lifetime, base speed, scene, and collision mask are typed exports rather than a generalized resource definition.
- Three pickups use formula-based fixed separation and drift offsets, allowing safe tuning without random generation or hard-coded per-node scenes.
- Expiration is intentionally silent and does not add temporary HUD-message state.
- Reset holds a same-frame guard, disables every pickup before queued removal, zeros inventory, and releases the guard deferred after the current frame.
- Resource release has a per-run guard and is called only by the asteroid's exactly-once destruction signal; normal fly-by completion does not release pickups.

### Automated verification

- Godot Engine v4.6.2.stable.official [71f334935] imported the project and registered the new typed `RockPickup` class.
- The configured main scene launched headlessly with exit code 0.
- Startup logs confirmed one trajectory generation, asteroid initialization, fly-by start, camera reset, and Milestone 3 controller readiness.
- Static inspection confirmed the unchanged asteroid movement speed of `1.8`, Rock physics layer 3/mask value `4`, three pickups, two Rock each, 14-second lifetime, and 0.75 base drift speed.

### Manual verification still required

- Confirm the three Rock pickups are visually separated, readable, and drift broadly with the asteroid's travel direction.
- Confirm one click collects only the clicked pickup and adds exactly two Rock.
- Confirm collecting all three yields exactly six Rock and no pickup can be collected twice.
- Confirm uncollected pickups disappear after approximately 14 seconds without changing inventory.
- Confirm normal fly-by completion releases no Rock.
- Confirm repeated destruction input cannot release a second group.
- Confirm reset during drift, immediately after collection, and near expiration removes all pickups and restores Rock to zero without errors.
- Re-run all Milestone 1 and Milestone 2 regression checks, including the approximately 27–28-second fly-by.

## 2026-07-18 - Milestone 3 pickup fade polish

### Human test findings

- Milestone 3 passed functional testing: three pickups released, each added two Rock, duplicate collection was prevented, reset cleared inventory and pickups, and expiration occurred after approximately 14 seconds.
- Uncollected pickups disappeared abruptly at expiration, which did not communicate that they were drifting away and becoming lost.

### Codex contribution

- Added one typed exported fade-duration setting to the existing Rock pickup.
- Added elapsed-lifetime tracking to the existing `_physics_process(delta)` movement path.
- Applied synchronized per-instance transparency to the Rock geometry and blue halo over the final lifetime segment.
- Preserved the existing lifetime timer, physics movement, collision, collection, reset, and removal behaviour.
- Added focused fade, collection, material-isolation, and reset regression checks.

### Exact implementation

- `fade_duration_seconds` is exported with a default of `3.0` seconds.
- Total pickup lifetime remains `14.0` seconds, so the pickup remains fully visible for approximately 11 seconds.
- Elapsed lifetime advances alongside drift in `_physics_process(delta)`.
- Transparency is clamped from `0.0` to `1.0` across the final three seconds.
- The direct `MeshInstance3D` children of `VisualRoot` receive per-instance transparency, fading the Rock core, Rock lobe, and blue halo together.
- Embedded shared materials are neither modified nor duplicated.
- Collision and collection remain enabled during the fade; the existing timer remains authoritative for expiration.

### Blue halo purpose

- The halo distinguishes collectible Rock from the asteroid, dark background, and distant depth markers.
- Its existing size and emission intensity remain unchanged to preserve visibility and clickability.
- It fades only through the same per-instance transparency applied to the Rock geometry.

### Manual verification still required

- Confirm pickups remain fully visible for approximately 11 seconds and fade smoothly over the final approximately three seconds.
- Confirm Rock geometry and halo fade together while continuing to drift.
- Confirm each pickup fades independently without changing the opacity of the other pickups.
- Confirm a fading pickup remains collectible exactly once and adds two Rock.
- Confirm expiration still occurs at approximately 14 seconds and adds no inventory.
- Confirm Reset Prototype immediately removes fading pickups without errors or inventory changes.
- Confirm all previously passing Milestone 1, 2, and 3 behaviour remains unchanged.

## 2026-07-18 - Compatibility-renderer pickup fade correction

### Human test finding

- The elapsed lifetime and approximately 14-second removal timing remained correct, but Rock pickups stayed fully visible before disappearing abruptly.
- Manual testing detected no visible fade from the `MeshInstance3D.transparency` implementation.

### Confirmed root cause

- The project uses Godot's Compatibility rendering method.
- `MeshInstance3D` inherits `GeometryInstance3D.transparency`, which Godot ignores under the Compatibility and Mobile rendering methods and treats as `0.0`.
- The fade progress calculation was correct, but it was writing to a renderer-incompatible property.

### Codex contribution

- Removed all use of `GeometryInstance3D.transparency` from Rock pickups.
- Retrieved each direct visual mesh's active `StandardMaterial3D` during pickup initialization.
- Deep-duplicated each material and assigned the duplicate as that mesh node's `material_override`.
- Stored each instance-local material together with its original albedo colour.
- Enabled `BaseMaterial3D.TRANSPARENCY_ALPHA` on every duplicate.
- Applied fade opacity only to the duplicated material's albedo alpha while preserving its original RGB values.
- Added focused Compatibility-renderer, independent-instance, collection, and reset regression checks.

### Implementation trade-offs

- Each Rock pickup now creates three small instance-local material resources at runtime: core, lobe, and halo.
- Deep duplication prevents one pickup's fade from mutating the shared source materials or other pickup instances.
- Alpha blending is supported by `StandardMaterial3D` in the Compatibility renderer and avoids shaders or a renderer change.
- The bright emissive halo uses the same alpha fade as the Rock geometry; its unchanged emission may make perceived fading nonlinear and requires manual verification.

### Preserved behaviour

- Total lifetime remains 14 seconds, fade duration remains three seconds, and fade begins at approximately 11 seconds.
- Physics drift, collision, clickability, exactly-once collection, Rock yield, inventory, HUD, expiration, and reset paths are unchanged.
- The Compatibility renderer remains configured.

### Manual verification still required

- Confirm Rock geometry and the blue halo now fade visibly under the Compatibility renderer.
- Confirm all three pickups fade independently rather than sharing opacity.
- Confirm partially faded pickups remain collectible exactly once.
- Confirm reset immediately removes fading pickups without inventory changes or errors.
- Confirm expiration still occurs at approximately 14 seconds and adds no Rock.
- Confirm all previously passing Milestone 1, 2, and 3 behaviour remains unchanged.
