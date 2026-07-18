# Mine Inc.

Mine Inc. is a space-based industrial strategy game about surviving, mining asteroids, collecting resources, manufacturing equipment, and expanding a small vessel into a capable operation.

## Build Week prototype

The OpenAI Build Week prototype will prove the game's immediate core loop in a small, playable 3D demonstration. It is intentionally not a complete version of the wider game.

The prototype environment is:

- Godot Engine v4.6.2.stable.official [71f334935]
- Typed GDScript
- Windows 11

The current documented prototype version is `0.1.0-buildweek`, stored in the root `VERSION` file. The Milestone 1 HUD presents this as `Prototype v0.1.0`.

## Core gameplay loop

The intended prototype loop is:

1. Observe an escape pod and its surrounding space.
2. Rotate and zoom the camera.
3. Track an asteroid along a visible trajectory.
4. Select and mine the asteroid.
5. Destroy it and release resources.
6. Collect the released resources.
7. Manufacture one module.
8. Attach the module to the escape pod on a 3D grid.

## Repository structure

```text
mine-inc-build-week/
|-- AGENTS.md                  # Build Week instructions and engineering constraints
|-- LICENSE                    # MIT License
|-- README.md                  # Project introduction and repository guide
|-- docs/                      # Concept, scope, testing, and collaboration notes
|-- game/                      # Reserved for the future Godot project
`-- media/                     # Reserved for project media
```

## Open and run

1. Install Godot Engine v4.6.2.stable.official [71f334935].
2. In the Godot Project Manager, select **Import**.
3. Choose `game/project.godot` from this repository.
4. Open the imported project.
5. Press **F6** is not required; press **F5** or select **Run Project** to launch the configured main scene.

## Controls

- Hold the right mouse button and move the mouse to orbit around the escape pod.
- Use the mouse wheel to zoom in and out.
- Press `R` to reset the camera to its default position.

## Currently implemented

- Runnable Godot project and direct main-scene launch
- Placeholder escape pod made from built-in Godot geometry and materials
- Dark space presentation with built-in lighting and depth markers
- Bounded orbit and zoom camera focused on the escape pod
- Camera reset action
- Minimal prototype and control HUD

## Explicitly deferred

- Asteroids, movement, and trajectories
- Targeting and mining
- Resource drops and click-to-collect interaction
- Manufacturing the Storage Module
- Module placement on the escape pod grid
- Reset Prototype action
- Save/load, which is out of scope for Build Week
- Collector drone stretch goal
- All wider-game systems excluded by the Build Week scope

## Project provenance

The wider Mine Inc. game concept predates OpenAI Build Week. The playable implementation is being created during Build Week using Codex with GPT-5.6.
