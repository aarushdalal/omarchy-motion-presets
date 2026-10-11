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
| `bloom.lua` | Gentle organic bloom with soft bounce | [Sample preview](assets/showcase/preview.svg) |
| `comic.lua` | Playful comic-book spring with overshoot | [Sample preview](assets/showcase/preview.svg) |
| `cosmic.lua` | Deep-space floaty glide | [Sample preview](assets/showcase/preview.svg) |
| `cyberpunk.lua` | Sharp neon snap with aggressive deceleration | [Sample preview](assets/showcase/preview.svg) |
| `default.lua` | Balanced Omarchy-style reference baseline | [Sample preview](assets/showcase/preview.svg) |
| `fluid.lua` | Smooth fluid motion with light inertia | [Sample preview](assets/showcase/preview.svg) |
| `ghost.lua` | Ultra-light near-invisible fade and drift | [Sample preview](assets/showcase/preview.svg) |
| `ignition.lua` | Fast launch burst with afterburn settle | [Sample preview](assets/showcase/preview.svg) |
| `jelly.lua` | Bouncy jelly spring with extended oscillation | [Sample preview](assets/showcase/preview.svg) |
| `liquid.lua` | Heavy liquid pour with slow sink | [Sample preview](assets/showcase/preview.svg) |
| `matrix.lua` | Digital cascade with precise scanline timing | [Sample preview](assets/showcase/preview.svg) |
| `morph.lua` | Organic shape morph with soft warp | [Sample preview](assets/showcase/preview.svg) |
| `orbit.lua` | Planetary arc swing with gravitational pull | [Sample preview](assets/showcase/preview.svg) |
| `parallax.lua` | Layered depth parallax with offset curves | [Sample preview](assets/showcase/preview.svg) |
| `quantum.lua` | Ultra-fast quantum blink | [Sample preview](assets/showcase/preview.svg) |
| `snap.lua` | Instant hard snap — minimal animation | [Sample preview](assets/showcase/preview.svg) |
| `snappy.lua` | Quick and clean bounce snap | [Sample preview](assets/showcase/preview.svg) |
| `tokyo.lua` | Tokyo drift — signature smooth lateral glide | [Sample preview](assets/showcase/preview.svg) |
| `unfold.lua` | Origami unfold with sequential reveal | [Sample preview](assets/showcase/preview.svg) |

---

## Showcase Gallery

GitHub does not render repository-hosted WebM files as inline README players. These animated previews render directly on GitHub; click any preview to open its full WebM recording.

| Preset | Preview |
|---|---|
| `bloom` | [Sample preview](assets/showcase/preview.svg) |
| `comic` | [Sample preview](assets/showcase/preview.svg) |
| `cosmic` | [Sample preview](assets/showcase/preview.svg) |
| `cyberpunk` | [Sample preview](assets/showcase/preview.svg) |
| `default` | [Sample preview](assets/showcase/preview.svg) |
| `fluid` | [Sample preview](assets/showcase/preview.svg) |
| `ghost` | [Sample preview](assets/showcase/preview.svg) |
| `ignition` | [Sample preview](assets/showcase/preview.svg) |
| `jelly` | [Sample preview](assets/showcase/preview.svg) |
| `liquid` | [Sample preview](assets/showcase/preview.svg) |
| `matrix` | [Sample preview](assets/showcase/preview.svg) |
| `morph` | [Sample preview](assets/showcase/preview.svg) |
| `orbit` | [Sample preview](assets/showcase/preview.svg) |
| `parallax` | [Sample preview](assets/showcase/preview.svg) |
| `quantum` | [Sample preview](assets/showcase/preview.svg) |
| `snap` | [Sample preview](assets/showcase/preview.svg) |
| `snappy` | [Sample preview](assets/showcase/preview.svg) |
| `tokyo` | [Sample preview](assets/showcase/preview.svg) |
| `unfold` | [Sample preview](assets/showcase/preview.svg) |

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

19 presets · three intensities · reduced motion. Current showcases use sample data; see [release privacy](docs/RELEASE-PRIVACY.md). Existing Git history is preserved.
