# Mine Inc.

Mine Inc. is a space-based industrial strategy game about surviving, mining asteroids, collecting resources, manufacturing equipment, and expanding a small vessel into a capable operation.

## Build Week prototype

The OpenAI Build Week prototype will prove the game's immediate core loop in a small, playable 3D demonstration. It is intentionally not a complete version of the wider game.

The prototype is planned for:

- Godot 4
- Typed GDScript
- Windows 11

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

Setup, controls, and run instructions will be added when implementation begins.

## Project provenance

The wider Mine Inc. game concept predates OpenAI Build Week. The playable implementation is being created during Build Week using Codex with GPT-5.6.
