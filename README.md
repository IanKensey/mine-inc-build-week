# Mine Inc.

Mine Inc. is a space-based industrial strategy game about surviving, mining asteroids, collecting resources, manufacturing equipment, and expanding a small vessel into a capable operation.

## Build Week prototype

The OpenAI Build Week prototype proves the game's immediate core loop in a focused, playable 3D demonstration. The player begins with an escape pod, mines one passing asteroid, collects Rock, manufactures a Storage Module, and attaches it to visibly expand the pod.

The prototype environment is:

- Godot Engine v4.6.2.stable.official [71f334935]
- Compatibility renderer
- Typed GDScript
- Windows 11 target

The canonical prototype version is `0.6.0-buildweek`, stored in the root `VERSION` file. The HUD presents this as `Prototype v0.6.0`.

Repository: https://github.com/IanKensey/mine-inc-build-week

## Completed gameplay loop

1. Observe and orbit the escape pod.
2. Follow an asteroid's visible authored trajectory.
3. Select and mine the asteroid.
4. Destroy it and release Rock.
5. Collect the drifting Rock pickups.
6. Manufacture one Storage Module.
7. See the completed module appear in the fixed Cargo panel.
8. Select the Storage Module in Cargo.
9. Enter constrained placement and choose one of six authored attachment sockets.
10. Attach the module and visibly expand the pod.

## Repository structure

```text
mine-inc-build-week/
|-- AGENTS.md                  # Build Week instructions and engineering constraints
|-- LICENSE                    # MIT License
|-- README.md                  # Project introduction, setup, and collaboration summary
|-- VERSION                    # Canonical prototype version
|-- docs/                      # Scope, controls, testing, decisions, and collaboration records
|-- game/                      # Godot project, scenes, and typed GDScript
`-- media/                     # Milestone screenshots and gameplay evidence
```

## Open and run

1. Install Godot Engine v4.6.2.stable.official [71f334935].
2. In the Godot Project Manager, select **Import**.
3. Choose `game/project.godot` from this repository.
4. Open the imported project.
5. Press **F5** or select **Run Project** to launch the configured main scene.

## Controls

- Hold the right mouse button and move the mouse to orbit around the escape pod.
- Use the mouse wheel to zoom in and out.
- Press `R` to reset the camera to its default position.
- Left-click the asteroid to select it; click empty world space to clear asteroid selection.
- Press `Space` once to fire one mining shot at the selected asteroid.
- Left-click a Rock pickup to collect it immediately.
- Select **Manufacture Storage Module** after collecting at least four Rock.
- Select the completed Storage Module in the fixed Cargo panel.
- Select **Attach** to display the six valid attachment sockets.
- Left-click one valid socket to attach the Storage Module.
- Select **Cancel Placement** to leave placement without consuming the module.
- Select **Reset Prototype** to restore the complete prototype to a clean initial state.

## Currently implemented

- Runnable Godot project and direct main-scene launch
- Built-in-geometry escape pod, Storage Module, asteroid, pickups, and effects
- Dark space presentation with built-in lighting and depth markers
- Bounded orbit and zoom camera with camera reset
- One predictable asteroid fly-by on an authored path
- Emissive dotted trajectory generated once from the flight path
- Asteroid selection, visible feedback, integer health, and discrete mining shots
- Five-hit destruction with a built-in particle effect
- Three predictable drifting Rock pickups worth two Rock each
- Immediate click collection, scene-local Rock count, fade, and expiration
- One fixed Storage Module recipe costing four Rock
- Three-second manufacturing process with visible progress
- Fixed six-slot Cargo presentation with live Rock and one selectable Storage Module
- Six authored attachment sockets with constrained socket selection
- Attach and Cancel Placement interaction with camera controls preserved
- One attached Storage Module and a repeatable complete-loop reset

## Explicitly deferred

- Moving, rotating, detaching, or deleting an attached module
- Multiple modules, recipes, attachment cells, or free placement
- Storage-capacity effects or other storage simulation
- Pirates, power routing, trading, automation, research, and campaign systems
- Save/load and persistent inventory
- Collector drones and other post-Build Week features

## Human, ChatGPT, and Codex collaboration

The Product Owner defined the concept and player experience, made the final product decisions, manually tested every milestone, and retained control of every commit and push.

The Technical Lead, using ChatGPT with GPT-5.6, helped define milestone scope, reviewed Codex proposals, challenged unnecessary architecture, reviewed risks, helped diagnose failures, and protected the Build Week deadline and submission boundary.

Codex inspected the repository, proposed bounded implementations, waited for approval, implemented the approved gameplay code, ran automated validation, and produced completion reports. Codex did not commit or push. It accelerated development through a sequence of focused, independently tested milestones rather than generating the entire project from one prompt.

Human testing and runtime evidence materially shaped the implementation. In one case, the Reset Prototype button retained keyboard focus, causing `Space` to activate both mining and reset; the evidence allowed Codex to identify and correct the input-focus conflict. In another, the first Rock fade used `GeometryInstance3D` transparency, which the Compatibility renderer ignores. Manual testing exposed the visual failure, and Codex replaced it with per-instance `StandardMaterial3D` alpha fading.

The governance documents under `docs/` guided scope, approvals, risk review, and testing, but they did not replace Codex's implementation role.

## Project provenance

The wider Mine Inc. game concept predates OpenAI Build Week. The playable Godot prototype and its meaningful implementation—from the repository baseline through the complete mining, collection, manufacturing, Cargo, and attachment loop—were created during Build Week using Codex and GPT-5.6.
