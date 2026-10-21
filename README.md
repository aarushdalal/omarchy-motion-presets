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
| `bloom.lua` | Gentle organic bloom with soft bounce | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#bloom) |
| `comic.lua` | Playful comic-book spring with overshoot | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#comic) |
| `cosmic.lua` | Deep-space floaty glide | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#cosmic) |
| `cyberpunk.lua` | Sharp neon snap with aggressive deceleration | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#cyberpunk) |
| `default.lua` | Balanced Omarchy-style reference baseline | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#default) |
| `fluid.lua` | Smooth fluid motion with light inertia | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#fluid) |
| `ghost.lua` | Ultra-light near-invisible fade and drift | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#ghost) |
| `ignition.lua` | Fast launch burst with afterburn settle | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#ignition) |
| `jelly.lua` | Bouncy jelly spring with extended oscillation | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#jelly) |
| `liquid.lua` | Heavy liquid pour with slow sink | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#liquid) |
| `matrix.lua` | Digital cascade with precise scanline timing | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#matrix) |
| `morph.lua` | Organic shape morph with soft warp | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#morph) |
| `orbit.lua` | Planetary arc swing with gravitational pull | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#orbit) |
| `parallax.lua` | Layered depth parallax with offset curves | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#parallax) |
| `quantum.lua` | Ultra-fast quantum blink | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#quantum) |
| `snap.lua` | Instant hard snap — minimal animation | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#snap) |
| `snappy.lua` | Quick and clean bounce snap | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#snappy) |
| `tokyo.lua` | Tokyo drift — signature smooth lateral glide | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#tokyo) |
| `unfold.lua` | Origami unfold with sequential reveal | [Video](https://aarushdalal.github.io/omarchy-motion-presets/#unfold) |

---

## Showcase Gallery

19 recorded animation presets with animated previews. Click a preview or **Video** to open its browser video player.

| Preset | Animated preview |
|---|---|
| `bloom` | [![Bloom preview](assets/showcase/previews/bloom.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#bloom)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#bloom) |
| `comic` | [![Comic preview](assets/showcase/previews/comic.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#comic)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#comic) |
| `cosmic` | [![Cosmic preview](assets/showcase/previews/cosmic.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#cosmic)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#cosmic) |
| `cyberpunk` | [![Cyberpunk preview](assets/showcase/previews/cyberpunk.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#cyberpunk)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#cyberpunk) |
| `default` | [![Default preview](assets/showcase/previews/default.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#default)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#default) |
| `fluid` | [![Fluid preview](assets/showcase/previews/fluid.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#fluid)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#fluid) |
| `ghost` | [![Ghost preview](assets/showcase/previews/ghost.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#ghost)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#ghost) |
| `ignition` | [![Ignition preview](assets/showcase/previews/ignition.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#ignition)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#ignition) |
| `jelly` | [![Jelly preview](assets/showcase/previews/jelly.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#jelly)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#jelly) |
| `liquid` | [![Liquid preview](assets/showcase/previews/liquid.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#liquid)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#liquid) |
| `matrix` | [![Matrix preview](assets/showcase/previews/matrix.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#matrix)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#matrix) |
| `morph` | [![Morph preview](assets/showcase/previews/morph.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#morph)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#morph) |
| `orbit` | [![Orbit preview](assets/showcase/previews/orbit.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#orbit)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#orbit) |
| `parallax` | [![Parallax preview](assets/showcase/previews/parallax.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#parallax)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#parallax) |
| `quantum` | [![Quantum preview](assets/showcase/previews/quantum.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#quantum)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#quantum) |
| `snap` | [![Snap preview](assets/showcase/previews/snap.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#snap)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#snap) |
| `snappy` | [![Snappy preview](assets/showcase/previews/snappy.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#snappy)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#snappy) |
| `tokyo` | [![Tokyo preview](assets/showcase/previews/tokyo.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#tokyo)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#tokyo) |
| `unfold` | [![Unfold preview](assets/showcase/previews/unfold.gif)](https://aarushdalal.github.io/omarchy-motion-presets/#unfold)<br>[Video](https://aarushdalal.github.io/omarchy-motion-presets/#unfold) |

Recordings are historical demonstrations of the project. The desktop status bar is cropped from the motion recordings. Audio and source metadata are removed. See [showcase details](docs/SHOWCASE.md).

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

## Refinement and privacy update

19 presets · three intensities · reduced motion. The showcase gallery includes reviewed recordings; see [release privacy](docs/RELEASE-PRIVACY.md). Existing Git history is preserved.
