#!/usr/bin/env bash
# ==============================================================================
# Installer for omarchy-motion-presets
# Safely installs the 19 animation presets WITHOUT activating any preset.
# Does NOT overwrite the user's active animations.lua.
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/animations"
BIN_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"
BACKUP_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/omarchy/backups/motion-presets/$(date +%Y%m%d_%H%M%S)"
DRY_RUN=0

for arg in "$@"; do
  [[ "$arg" == "--dry-run" ]] && DRY_RUN=1
done

run_cmd() {
  if (( DRY_RUN )); then echo "[DRY-RUN] $*"; else "$@"; fi
}

check_deps() {
  echo "Checking requirements for omarchy-motion-presets..."
  local ok=1
  if command -v hyprland >/dev/null 2>&1; then
    echo "  [OK] Hyprland is installed ($(hyprland --version | head -n 1))"
  else
    echo "  [WARN] Hyprland was not found in PATH."
    ok=0
  fi
  if command -v hyprctl >/dev/null 2>&1; then
    echo "  [OK] hyprctl is available"
  else
    echo "  [WARN] hyprctl was not found."
  fi
  return 0
}

do_install() {
  check_deps
  echo "Installing 19 animation presets to $TARGET_DIR..."
  run_cmd mkdir -p "$TARGET_DIR"

  if [[ -d "$TARGET_DIR" && "$(ls -A "$TARGET_DIR" 2>/dev/null)" ]]; then
    echo "Creating backup of existing presets in $BACKUP_DIR..."
    run_cmd mkdir -p "$BACKUP_DIR"
    run_cmd cp -r "$TARGET_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
  fi

  for p in "$SCRIPT_DIR/animations"/*.lua; do
    if [[ -f "$p" ]]; then
      run_cmd cp "$p" "$TARGET_DIR/"
    fi
  done

  if [[ -f "$SCRIPT_DIR/bin/omarchy-animation-style" ]]; then
    run_cmd mkdir -p "$BIN_DIR"
    run_cmd cp "$SCRIPT_DIR/bin/omarchy-animation-style" "$BIN_DIR/"
    run_cmd chmod +x "$BIN_DIR/omarchy-animation-style"
    echo "Installed selector utility to $BIN_DIR/omarchy-animation-style"
  fi

  echo ""
  echo "✅ 19 presets installed successfully!"
  echo "NOTE: No preset was activated automatically. Your active animations.lua was untouched."
  echo "To activate a preset manually:"
  echo "  omarchy-animation-style set tokyo"
  echo "Or list available presets:"
  echo "  omarchy-animation-style list"
}

do_status() {
  echo "=== Omarchy Motion Presets Status ==="
  if [[ -d "$TARGET_DIR" ]]; then
    local count
    count=$(find "$TARGET_DIR" -maxdepth 1 -name "*.lua" | wc -l)
    echo "  Presets installed in $TARGET_DIR: $count / 19"
  else
    echo "  Presets directory not present."
  fi
  if command -v omarchy-animation-style >/dev/null 2>&1; then
    echo -n "  Active preset: "
    omarchy-animation-style current 2>/dev/null || echo "custom/unknown"
  fi
}

do_uninstall() {
  echo "Uninstalling presets from $TARGET_DIR..."
  if [[ -d "$TARGET_DIR" ]]; then
    run_cmd mkdir -p "$BACKUP_DIR"
    run_cmd cp -r "$TARGET_DIR" "$BACKUP_DIR/"
    for p in "$SCRIPT_DIR/animations"/*.lua; do
      local b="$(basename "$p")"
      if [[ -f "$TARGET_DIR/$b" ]]; then
        run_cmd rm -f "$TARGET_DIR/$b"
      fi
    done
  fi
  if [[ -f "$BIN_DIR/omarchy-animation-style" ]]; then
    run_cmd rm -f "$BIN_DIR/omarchy-animation-style"
  fi
  echo "Presets removed. Backups preserved in $BACKUP_DIR."
}

case "${1:-check}" in
  check) check_deps ;;
  install) do_install ;;
  update) do_install ;;
  status) do_status ;;
  uninstall) do_uninstall ;;
  *)
    echo "Usage: $0 {check|install|update|status|uninstall} [--dry-run]"
    exit 1
    ;;
esac
