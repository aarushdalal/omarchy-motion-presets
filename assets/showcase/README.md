# Omarchy Motion Presets - Showcase Assets Directory

This directory stores automated visual assets and showcase recordings demonstrating all Hyprland animation presets.

## Automated Recording

Videos in this directory are generated using the automated showcase suite:

```bash
# Record all discovered presets (auto-adapts to new presets)
omarchy-record-animation-showcase --all

# Record detached in background (safe to close terminal)
omarchy-record-animation-showcase --all --detach

# Record a specific preset
omarchy-record-animation-showcase --only tokyo
```

Each showcase video is recorded at **60 FPS in 1080p WebM/VP9** with a choreographed sequence (~10-12s):
1. **Workspace 1**: Terminal opening (`windowsIn` animation)
2. **Workspace 2**: Slide transition (`workspaces`) + auxiliary terminal opening
3. **Workspace 3**: Multi-window tiling launch (demonstrates dynamic split & `windowsMove`)
4. **Workspace Tour**: Rapid switching (`workspaces` leaf across WS 2 -> WS 1 -> WS 3)
5. **Window Exit**: Sequential closing of 2 windows (`windowsOut` and retiling re-balance)
6. **Omarchy Menu**: Menu summon and dismissal (`layersIn` / `layersOut` popup animation)

---

## File Naming Convention

All animation preset showcase videos follow the standardized naming format:

```text
showcase_animation_<preset>.webm
```

### Preset Video Inventory

| Preset | Showcase Video | Characteristics |
|---|---|---|
| `bloom` | [`showcase_animation_bloom.webm`](showcase_animation_bloom.webm) | Organic blooming growth & soft layer reveal |
| `comic` | [`showcase_animation_comic.webm`](showcase_animation_comic.webm) | High-rebound cartoon spring & overshoot |
| `cosmic` | [`showcase_animation_cosmic.webm`](showcase_animation_cosmic.webm) | Deep space zero-gravity glide |
| `cyberpunk` | [`showcase_animation_cyberpunk.webm`](showcase_animation_cyberpunk.webm) | High-contrast kinetic deceleration |
| `default` | [`showcase_animation_default.webm`](showcase_animation_default.webm) | Balanced reference baseline |
| `fluid` | [`showcase_animation_fluid.webm`](showcase_animation_fluid.webm) | Ultra-smooth fluid inertia |
| `ghost` | [`showcase_animation_ghost.webm`](showcase_animation_ghost.webm) | Hyperspeed hologram fade |
| `ignition` | [`showcase_animation_ignition.webm`](showcase_animation_ignition.webm) | Explosive velocity with aerodynamic settle |
| `jelly` | [`showcase_animation_jelly.webm`](showcase_animation_jelly.webm) | Playful dual-axis bounce tension |
| `liquid` | [`showcase_animation_liquid.webm`](showcase_animation_liquid.webm) | Viscous liquid flow & slow settling |
| `matrix` | [`showcase_animation_matrix.webm`](showcase_animation_matrix.webm) | Digital scanning velocity & geometric snap |
| `morph` | [`showcase_animation_morph.webm`](showcase_animation_morph.webm) | Cinematic morphing transform |
| `orbit` | [`showcase_animation_orbit.webm`](showcase_animation_orbit.webm) | Gravitational orbital curvature |
| `parallax` | [`showcase_animation_parallax.webm`](showcase_animation_parallax.webm) | Multi-depth perspective layer shifts |
| `quantum` | [`showcase_animation_quantum.webm`](showcase_animation_quantum.webm) | Near-instantaneous magnetic snap |
| `snap` | [`showcase_animation_snap.webm`](showcase_animation_snap.webm) | Ultra-fast directional anchor |
| `snappy` | [`showcase_animation_snappy.webm`](showcase_animation_snappy.webm) | High-refresh 144Hz responsive snap |
| `tokyo` | [`showcase_animation_tokyo.webm`](showcase_animation_tokyo.webm) | High-octane kinetic drift velocity |
| `unfold` | [`showcase_animation_unfold.webm`](showcase_animation_unfold.webm) | Material origami sequential fold |
