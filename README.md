# Omarchy Motion Presets (`omarchy-motion-presets`)

> **Unofficial / Community Collection**: A curated library of 19 Hyprland animation preset Lua files with an interactive CLI selector for Omarchy.

A set of handcrafted Hyprland animation configuration presets — each a self-contained Lua file defining bezier curves and animation rules — plus a CLI tool for browsing, previewing, and applying them live.

This project was developed through an AI-assisted workflow. The concept, customization, configuration, testing, integration, and final iteration were directed and carried out by me.

---

## My Contribution

I did not write Omarchy, Quickshell, or Hyprland from scratch. What I contributed:

- **Preset Design**: Authored all 19 animation preset Lua files in `animations/`, each defining distinct bezier easing curves and Hyprland animation rule sets tuned for aesthetic and performance targets on AMD Radeon Vega integrated graphics.
- **CLI Selector**: Designed and implemented the `bin/omarchy-animation-style` CLI tool for listing presets, applying them live via `hyprctl reload`, previewing before committing, and managing the active selection.
- **Performance Optimization**: Tuned each preset for smooth playback on integrated AMD Vega graphics, covering workspace transitions, window open/close, fade, and border animations.
- **Integration**: Wired presets into the Omarchy `looknfeel.lua` include path so they apply seamlessly on `hyprctl reload`.
- **Installer**: Authored `./install.sh` for safe user-scope deployment.
- **Documentation**: Wrote all preset descriptions and usage guides.
- **Testing**: Tested all 19 presets on Omarchy 4.0.2 / Hyprland 0.56.2.

---

## Based On / Credits

- **[Omarchy](https://github.com/basecamp/omarchy)** — The open-source Arch Linux desktop environment by Basecamp. Presets are designed as drop-in complements to Omarchy's `animations.lua` / `looknfeel.lua` configuration system.
- **[Hyprland](https://hyprland.org)** — The Wayland tiling compositor whose animation engine (bezier curves + animation rules) these presets configure. Hyprland itself is not modified.
- **[Quickshell](https://quickshell.outfoxxed.me)** — The Qt6 QML shell used alongside this environment.

**Related Repos**:
- [omarchy-theme-transitions](https://github.com/aarushdalal/omarchy-theme-transitions) — GPU GLSL theme transition shaders
- [omarchy-shell-polish](https://github.com/aarushdalal/omarchy-shell-polish) — Frosted glass, floating bar, keybinding polish
- [omarchy-aesthetic-themes](https://github.com/aarushdalal/omarchy-aesthetic-themes) — 15 anime color themes and live wallpapers

---

## Preset Catalog

| Preset | Description | Showcase |
|---|---|---|
| `bloom.lua` | Gentle organic bloom with soft bounce | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_bloom.webm" type="video/webm">Bloom showcase</video> |
| `comic.lua` | Playful comic-book spring with overshoot | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_comic.webm" type="video/webm">Comic showcase</video> |
| `cosmic.lua` | Deep-space floaty glide | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_cosmic.webm" type="video/webm">Cosmic showcase</video> |
| `cyberpunk.lua` | Sharp neon snap with aggressive deceleration | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_cyberpunk.webm" type="video/webm">Cyberpunk showcase</video> |
| `default.lua` | Balanced Omarchy-style reference baseline | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_default.webm" type="video/webm">Default showcase</video> |
| `fluid.lua` | Smooth fluid motion with light inertia | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_fluid.webm" type="video/webm">Fluid showcase</video> |
| `ghost.lua` | Ultra-light near-invisible fade and drift | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_ghost.webm" type="video/webm">Ghost showcase</video> |
| `ignition.lua` | Fast launch burst with afterburn settle | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_ignition.webm" type="video/webm">Ignition showcase</video> |
| `jelly.lua` | Bouncy jelly spring with extended oscillation | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_jelly.webm" type="video/webm">Jelly showcase</video> |
| `liquid.lua` | Heavy liquid pour with slow sink | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_liquid.webm" type="video/webm">Liquid showcase</video> |
| `matrix.lua` | Digital cascade with precise scanline timing | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_matrix.webm" type="video/webm">Matrix showcase</video> |
| `morph.lua` | Organic shape morph with soft warp | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_morph.webm" type="video/webm">Morph showcase</video> |
| `orbit.lua` | Planetary arc swing with gravitational pull | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_orbit.webm" type="video/webm">Orbit showcase</video> |
| `parallax.lua` | Layered depth parallax with offset curves | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_parallax.webm" type="video/webm">Parallax showcase</video> |
| `quantum.lua` | Ultra-fast quantum blink | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_quantum.webm" type="video/webm">Quantum showcase</video> |
| `snap.lua` | Instant hard snap — minimal animation | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_snap.webm" type="video/webm">Snap showcase</video> |
| `snappy.lua` | Quick and clean bounce snap | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_snappy.webm" type="video/webm">Snappy showcase</video> |
| `tokyo.lua` | Tokyo drift — signature smooth lateral glide | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_tokyo.webm" type="video/webm">Tokyo showcase</video> |
| `unfold.lua` | Origami unfold with sequential reveal | <video controls preload="metadata" width="320"><source src="https://raw.githubusercontent.com/aarushdalal/omarchy-motion-presets/main/assets/showcase/showcase_animation_unfold.webm" type="video/webm">Unfold showcase</video> |

---

## Repository Structure

```
omarchy-motion-presets/
├── animations/              # 19 Lua preset files
│   ├── tokyo.lua
│   ├── cosmic.lua
│   ├── bloom.lua
│   └── ... (19 total)
├── bin/
│   └── omarchy-animation-style   # CLI selector tool
├── assets/showcase/
├── docs/
└── install.sh
```

---

## Requirements

- **Omarchy** `dev (13f18b2c) / 4.0.2`
- **Hyprland** `0.56.2`
- **Quickshell** `0.3.1` (for shell integration)
- **Bash** ≥ 5.0

---

## Installation

```bash
git clone https://github.com/aarushdalal/omarchy-motion-presets.git
cd omarchy-motion-presets

./install.sh check
./install.sh install --dry-run
./install.sh install
```

---

## Commands

```bash
omarchy-animation-style list               # List all 19 available presets
omarchy-animation-style get                # Show currently active preset
omarchy-animation-style set tokyo          # Apply the 'tokyo' preset and reload Hyprland
omarchy-animation-style preview cosmic     # Preview a preset temporarily
omarchy-animation-style reduced-motion get # Check reduced-motion accessibility setting
omarchy-animation-style reduced-motion set false  # Re-enable animations
```

---

## Troubleshooting

- **Animations look disabled**: Check if reduced motion is enabled:
  ```bash
  omarchy-animation-style reduced-motion get
  ```
  If it returns `true`, toggle it off with `omarchy-animation-style reduced-motion set false`.
- **Validation errors on reload**: Check `hyprctl reload` output in terminal.

---

## Contributing

Suggestions for new physics curves are welcome!

---

## License

[MIT License](LICENSE).
