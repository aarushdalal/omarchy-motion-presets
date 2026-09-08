# Omarchy Motion Presets (`omarchy-motion-presets`)

> **Unofficial / Community Project**: An independent motion preset suite for Omarchy Hyprland.

A collection of 19 physics-tuned cubic bezier animation presets for the Hyprland Wayland compositor on Omarchy and Arch Linux.

---

## Status / Experimental Warning

Hyprland animations directly dictate the feel, responsiveness, and timing of window management. **The installer installs presets into `~/.config/hypr/animations/` without activating any preset automatically**, leaving your live configuration intact.

---

## Features

- **19 Complete Presets**: Individual `.lua` configurations covering window pop-in, exit, movement, layer fades, and workspace slide curves.
- **Selector Utility**: Verified CLI tool `omarchy-animation-style` with subcommands `list`, `set <preset>`, `current`, `intensity`, and `reduced-motion`.
- **Accessibility Integration**: Instant `reduced-motion` toggle to disable all animations for accessibility or power conservation.
- **Strict Hyprland Lua Syntax**: Native `hl.curve` and `hl.animation` statements compatible with current Hyprland releases.

---

## Requirements

- **Compositor**: Hyprland (`0.56.2`)
- **Desktop Environment**: Omarchy (`dev (13f18b2c) / 4.0.2`) or standard Hyprland with Lua configuration support
- **Core Dependencies**: `bash`, `hyprctl`

---

## Compatibility

| Component | Tested Version | Compatibility Status |
|---|---|---|
| Hyprland | `0.56.2` | Fully compatible |
| Omarchy | `dev (13f18b2c) / 4.0.2` | Fully compatible |
| Hyprlang | 0.6.8 | Fully compatible |

---

## Installation

```bash
git clone https://github.com/YOUR-USERNAME/omarchy-motion-presets.git
cd omarchy-motion-presets

# 1. Verify dependencies
./install.sh check

# 2. Preview installation safely
./install.sh install --dry-run

# 3. Install preset files
./install.sh install
```

---

## System Setup Before Installation

1. Verify Hyprland version:
   ```bash
   hyprland --version
   ```
2. Verify that your `~/.config/hypr/looknfeel.lua` loads `~/.config/hypr/animations.lua` (standard in Omarchy).

---

## Usage

List installed presets:
```bash
omarchy-animation-style list
```

Activate a preset manually:
```bash
omarchy-animation-style set tokyo
omarchy-animation-style set cosmic
omarchy-animation-style set unfold
```

Adjust intensity:
```bash
omarchy-animation-style intensity set subtle
omarchy-animation-style intensity set balanced
omarchy-animation-style intensity set expressive
```

Toggle reduced motion:
```bash
omarchy-animation-style reduced-motion toggle
```

---

## Commands

```bash
omarchy-animation-style current           # Print active preset name
omarchy-animation-style list              # List all 19 presets with descriptions
omarchy-animation-style set <preset>      # Copy preset to animations.lua and reload compositor
omarchy-animation-style reduced-motion    # Get or set reduced motion mode
```

---

## Configuration & Rollback

- Installed preset files live in `~/.config/hypr/animations/`.
- Active animation file: `~/.config/hypr/animations.lua`.
- Rollback: To restore your previous configuration, copy any saved backup from `~/.local/state/omarchy/backups/motion-presets/` back to `~/.config/hypr/animations.lua` and run `hyprctl reload`.

---

## Update

```bash
./install.sh update
```

---

## Uninstall

```bash
./install.sh uninstall
```

---

## Security and Privacy

- Presets contain declarative Lua animation curves only; no network calls, credentials, or binaries.

---

## Troubleshooting

- **Animations look disabled**:
  Check if reduced motion is enabled:
  ```bash
  omarchy-animation-style reduced-motion get
  ```
  If it returns `true`, toggle it off with `omarchy-animation-style reduced-motion set false`.
- **Validation errors on reload**:
  Check `hyprctl reload` output in terminal.

---

## Showcase

> Visual previews, UI screenshots, and recordings for documentation and release verification.

### Main experience

<!-- Future image: assets/showcase/motion-hero.png -->
<!-- ![Main desktop experience](assets/showcase/motion-hero.png) -->

### Feature gallery

<!-- Future image: assets/showcase/animation-tokyo-drift.png -->
<!-- ![animation-tokyo-drift.png](assets/showcase/animation-tokyo-drift.png) -->

<!-- Future image: assets/showcase/animation-cosmic-glide.png -->
<!-- ![animation-cosmic-glide.png](assets/showcase/animation-cosmic-glide.png) -->

<!-- Future image: assets/showcase/animation-unfold.png -->
<!-- ![animation-unfold.png](assets/showcase/animation-unfold.png) -->

<!-- Future image: assets/showcase/animation-liquid.png -->
<!-- ![animation-liquid.png](assets/showcase/animation-liquid.png) -->

<!-- Future image: assets/showcase/animation-snap.png -->
<!-- ![animation-snap.png](assets/showcase/animation-snap.png) -->

<!-- Future image: assets/showcase/animation-bloom.png -->
<!-- ![animation-bloom.png](assets/showcase/animation-bloom.png) -->

<!-- Future image: assets/showcase/feature-07.png -->
<!-- ![Feature preview 7](assets/showcase/feature-07.png) -->

<!-- Future image: assets/showcase/feature-08.png -->
<!-- ![Feature preview 8](assets/showcase/feature-08.png) -->

<!-- Future image: assets/showcase/feature-09.png -->
<!-- ![Feature preview 9](assets/showcase/feature-09.png) -->

<!-- Future image: assets/showcase/feature-10.png -->
<!-- ![Feature preview 10](assets/showcase/feature-10.png) -->

### Motion and interaction

<!-- Future GIF: assets/showcase/interaction-01.gif -->
<!-- ![Interaction preview](assets/showcase/interaction-01.gif) -->

<!-- Future GIF: assets/showcase/interaction-02.gif -->
<!-- ![Transition preview](assets/showcase/interaction-02.gif) -->

### Video demonstrations

<!-- Future thumbnail: assets/showcase/video-01-thumbnail.png -->
<!-- [![Watch demo video](assets/showcase/video-01-thumbnail.png)](https://github.com/YOUR-USERNAME/PROJECT-NAME/releases) -->


---

## Contributing

Suggestions for new physics curves are welcome!

---

## License

[MIT License](LICENSE).
