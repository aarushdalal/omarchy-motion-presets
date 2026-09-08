# Hyprland Syntax & Configuration Validation

## Syntax Reference

These presets use Omarchy's modern Hyprland Lua binding syntax (`hl.curve` and `hl.animation`):

```lua
-- Define a cubic bezier curve:
hl.curve("myCurve", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })

-- Define window and layer animations:
hl.animation({ leaf = "windows", enabled = true, speed = 3.0, bezier = "myCurve" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.4, bezier = "myCurve", style = "slidefade 65%" })
```

## Validating Changes

Always validate your Hyprland configuration before and after applying changes:

```bash
# Test reloading Hyprland:
hyprctl reload

# Inspect current active animations:
hyprctl animations

# Check compositor logs for any syntax issues:
cat "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/hyprland.log" | tail -n 20
```
