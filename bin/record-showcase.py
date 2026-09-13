#!/usr/bin/env python3
"""
==============================================================================
  OMARCHY MOTION PRESETS - DYNAMIC SHOWCASE RECORDER
==============================================================================
Choreographed ~11-12s recording per animation preset:
  1. Workspace 1: open terminal (showcases windowsIn)
  2. Workspace 2: switch & open terminal (showcases workspaces & windowsIn)
  3. Workspace 3: switch & open 3 terminals (showcases multi-window tiling/windowsMove)
  4. Workspace tour: 2 -> 1 -> 3 (showcases rapid workspace switching)
  5. Close 2 windows in Workspace 3 (showcases windowsOut & retiling)
  6. Summon & dismiss Omarchy menu (showcases layersIn/layersOut)
  7. Finalize video, restore clean desktop & initial preset.

Features:
  - 100% Dynamic Discovery: Automatically finds all presets in animations/*.lua.
  - SIGHUP & SIGPIPE Immune: Continues running even if terminal is closed.
  - Isolated Window Tags: Uses --app-id=omarchy-showcase-terminal so user windows are untouched.
  - Hardware-Accelerated VAAPI: Zero dropped frames at 60 FPS via gpu-screen-recorder.
==============================================================================
"""

import os
import sys
import time
import glob
import json
import signal
import argparse
import subprocess
from pathlib import Path

# Paths
BIN_DIR = Path(__file__).resolve().parent
REPO_ROOT = BIN_DIR.parent
ANIM_DIR = REPO_ROOT / "animations"
CONFIG_ANIM_DIR = Path.home() / ".config" / "hypr" / "animations"
OUTPUT_DIR = REPO_ROOT / "assets" / "showcase"
LOG_PATH = OUTPUT_DIR / "execution.log"

# Ignore SIGHUP and SIGPIPE so terminal closure never interrupts execution
signal.signal(signal.SIGHUP, signal.SIG_IGN)
try:
    signal.signal(signal.SIGPIPE, signal.SIG_IGN)
except Exception:
    pass

class Colors:
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BOLD = '\033[1m'
    DIM = '\033[2m'
    RESET = '\033[0m'

active_procs = []
initial_preset = None
initial_workspace = 1

def log(msg, level="INFO"):
    colors = {
        "INFO": Colors.CYAN,
        "STEP": Colors.GREEN + Colors.BOLD,
        "WARN": Colors.YELLOW,
        "ERR": Colors.RED + Colors.BOLD
    }
    col = colors.get(level, Colors.CYAN)
    log_line = f"[{level}] {msg}"
    
    try:
        print(f"{col}{log_line}{Colors.RESET}", flush=True)
    except (BrokenPipeError, OSError):
        pass

    try:
        OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
        with open(LOG_PATH, "a", encoding="utf-8") as f:
            f.write(f"{time.strftime('%Y-%m-%d %H:%M:%S')} {log_line}\n")
            f.flush()
    except Exception:
        pass

def notify(title, msg, urgency="normal"):
    """Send a desktop notification."""
    for tool in ["omarchy-notification-send", "notify-send"]:
        try:
            if tool == "omarchy-notification-send":
                subprocess.run([tool, "-g", "󱄄", "-t", "3000", title, msg], capture_output=True, check=False)
                return
            else:
                subprocess.run([tool, "-a", "Omarchy Motion Showcase", "-t", "3000", title, msg], capture_output=True, check=False)
                return
        except Exception:
            continue

def run_cmd(cmd_list, check=False):
    try:
        return subprocess.run(cmd_list, check=check, capture_output=True, text=True)
    except Exception as e:
        log(f"Command failed {cmd_list}: {e}", "WARN")
        return None

def get_primary_monitor():
    """Dynamically get the currently active or primary monitor name."""
    try:
        res = run_cmd(["hyprctl", "monitors", "-j"])
        if res and res.stdout:
            monitors = json.loads(res.stdout)
            for m in monitors:
                if m.get("focused"):
                    return m.get("name", "eDP-1")
            if monitors:
                return monitors[0].get("name", "eDP-1")
    except Exception:
        pass
    return "eDP-1"

def discover_presets():
    """Dynamically discover all animation presets from repo and ~/.config/hypr/animations."""
    presets = set()
    for search_dir in [ANIM_DIR, CONFIG_ANIM_DIR]:
        if search_dir.exists():
            for f in search_dir.glob("*.lua"):
                name = f.stem
                if name and not name.startswith("."):
                    presets.add(name)
    return sorted(list(presets))

def get_current_preset():
    """Get the currently active animation preset."""
    try:
        res = run_cmd(["omarchy-animation-style", "current"])
        if res and res.stdout.strip():
            return res.stdout.strip()
    except Exception:
        pass
    state_file = Path.home() / ".local" / "state" / "omarchy" / "animation-style"
    if state_file.exists():
        return state_file.read_text().strip()
    return "tokyo"

def set_preset(name):
    """Set the active animation preset and reload Hyprland."""
    # First try omarchy-animation-style if present
    res = run_cmd(["omarchy-animation-style", "set", name])
    if res and res.returncode == 0:
        return True
    
    # Fallback direct copy and reload
    target = Path.home() / ".config" / "hypr" / "animations.lua"
    src = ANIM_DIR / f"{name}.lua"
    if not src.exists():
        src = CONFIG_ANIM_DIR / f"{name}.lua"
    if src.exists():
        target.write_text(src.read_text())
        run_cmd(["hyprctl", "reload"])
        return True
    return False

def hypr_dispatch(action):
    run_cmd(["hyprctl", "dispatch", action])

def focus_workspace(num):
    """Switch workspace using Hyprland Lua dispatcher."""
    run_cmd(["hyprctl", "dispatch", f'hl.dsp.focus({{ workspace = "{num}" }})'])

def close_one_showcase_window():
    """Safely close ONLY a window created specifically for showcase testing."""
    try:
        res = run_cmd(["hyprctl", "clients", "-j"])
        if res and res.stdout:
            clients = json.loads(res.stdout)
            for c in clients:
                cls = c.get("class", "")
                init_cls = c.get("initialClass", "")
                # NEVER touch the agent or user terminal
                if "org.omarchy.agent" in cls or "org.omarchy.agent" in init_cls:
                    continue
                if "omarchy-showcase-terminal" in cls or "omarchy-showcase-terminal" in init_cls:
                    addr = c.get("address")
                    if addr:
                        run_cmd(["hyprctl", "dispatch", f'hl.dsp.window.close({{ address = "{addr}" }})'])
                        return True
    except Exception:
        pass
    return False

def close_showcase_windows():
    """Close only windows spawned with app-id omarchy-showcase-terminal."""
    run_cmd(["pkill", "-f", "omarchy-showcase-terminal"])
    # Also verify via hyprctl clients to make sure none linger
    try:
        res = run_cmd(["hyprctl", "clients", "-j"])
        if res and res.stdout:
            clients = json.loads(res.stdout)
            for c in clients:
                cls = c.get("class", "")
                init_cls = c.get("initialClass", "")
                title = c.get("title", "")
                # NEVER touch the agent or user terminal
                if "org.omarchy.agent" in cls or "org.omarchy.agent" in init_cls:
                    continue
                if "omarchy-showcase-terminal" in init_cls or "omarchy-showcase-terminal" in cls or "Showcase - WS" in title:
                    addr = c.get("address")
                    if addr:
                        run_cmd(["hyprctl", "dispatch", f'hl.dsp.window.close({{ address = "{addr}" }})'])
    except Exception:
        pass

def spawn_showcase_terminal(ws_num, label=""):
    """Spawn an aesthetic foot terminal in the current workspace."""
    cmd = [
        "foot",
        "-a", "omarchy-showcase-terminal",
        "-T", f"Showcase - WS{ws_num} {label}",
        "bash", "-c",
        f"clear; echo -e '\\033[1;36mOmarchy Motion Engine\\033[0m \\033[90m|\\033[0m \\033[1;32mWorkspace {ws_num}\\033[0m'; "
        f"fastfetch 2>/dev/null || echo -e '\\033[90mActive Preset Showcase\\033[0m'; "
        f"exec bash"
    ]
    p = subprocess.Popen(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    active_procs.append(p)
    return p

def cleanup():
    """Restore state and clean up."""
    global initial_preset, initial_workspace
    log("Cleaning up showcase state...", "INFO")
    
    # Hide Omarchy menu if open
    run_cmd(["omarchy-menu", "close"])
    
    # Close all showcase test windows
    close_showcase_windows()
    
    # Restore original preset
    if initial_preset:
        log(f"Restoring initial animation preset: {initial_preset}", "INFO")
        set_preset(initial_preset)
        
    # Restore original workspace
    if initial_workspace:
        focus_workspace(initial_workspace)

def sig_handler(sig, frame):
    log("Interrupted! Cleaning up safely...", "WARN")
    cleanup()
    sys.exit(0)

signal.signal(signal.SIGINT, sig_handler)
signal.signal(signal.SIGTERM, sig_handler)

def record_preset_showcase(preset, monitor, duration=11.5, gen_gif=False, dry_run=False):
    """Execute the choreographed recording for a single preset."""
    output_video = OUTPUT_DIR / f"showcase_animation_{preset}.mp4"
    output_gif = OUTPUT_DIR / f"showcase_animation_{preset}.gif"
    
    log(f"▶ [{preset.upper()}] Starting animation showcase capture...", "STEP")
    
    # 1. Apply preset
    set_preset(preset)
    time.sleep(0.3)
    
    # 2. Clean any prior showcase windows & switch to workspace 1
    close_showcase_windows()
    focus_workspace(1)
    time.sleep(0.4)
    
    if dry_run:
        log(f"  [Dry Run] Would record to {output_video.name}", "INFO")
        return output_video

    # 3. Start GPU Screen Recorder
    rec_cmd = [
        "gpu-screen-recorder",
        "-w", monitor,
        "-f", "60",
        "-k", "h264",
        "-q", "very_high",
        "-fallback-cpu-encoding", "yes",
        "-o", str(output_video)
    ]
    recorder = subprocess.Popen(rec_cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(0.4) # Wait for buffer lock
    
    try:
        # CHOREOGRAPHED SHOWCASE SEQUENCE (~11.5s)
        # Step A: Workspace 1 terminal open (windowsIn animation)
        spawn_showcase_terminal(1, "Main")
        time.sleep(0.9)
        
        # Step B: Switch to Workspace 2 (workspaces animation)
        focus_workspace(2)
        time.sleep(0.5)
        
        # Step C: Workspace 2 terminal open (windowsIn animation)
        spawn_showcase_terminal(2, "Aux")
        time.sleep(0.9)
        
        # Step D: Switch to Workspace 3 (workspaces animation)
        focus_workspace(3)
        time.sleep(0.5)
        
        # Step E: Open multiple terminals in Workspace 3 (multi-tile & windowsMove)
        spawn_showcase_terminal(3, "Tile 1")
        time.sleep(0.5)
        spawn_showcase_terminal(3, "Tile 2")
        time.sleep(0.5)
        spawn_showcase_terminal(3, "Tile 3")
        time.sleep(0.7)
        
        # Step F: Rapid Workspace Tour (2 -> 1 -> 3)
        focus_workspace(2)
        time.sleep(0.6)
        focus_workspace(1)
        time.sleep(0.6)
        focus_workspace(3)
        time.sleep(0.7)
        
        # Step G: Close 2 windows in Workspace 3 (windowsOut animation & retiling)
        close_one_showcase_window()
        time.sleep(0.7)
        close_one_showcase_window()
        time.sleep(0.7)
        
        # Step H: Summon & dismiss Omarchy Menu (layersIn / layersOut animation)
        run_cmd(["omarchy-menu", "summon", "root"])
        time.sleep(1.2)
        run_cmd(["omarchy-menu", "close"])
        time.sleep(0.5)
        
    finally:
        # Stop recording gracefully via SIGINT
        recorder.send_signal(signal.SIGINT)
        try:
            recorder.wait(timeout=5.0)
        except subprocess.TimeoutExpired:
            recorder.kill()
            recorder.wait()
            
        # Clean up this preset's test windows
        close_showcase_windows()
        time.sleep(0.3)

    if output_video.exists() and output_video.stat().st_size > 0:
        log(f"  ✓ Saved: {output_video.name} ({output_video.stat().st_size // 1024} KB)", "STEP")
        if gen_gif:
            log(f"  Generating GIF: {output_gif.name}...", "INFO")
            gif_cmd = [
                "ffmpeg", "-y", "-i", str(output_video),
                "-vf", "fps=15,scale=960:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse",
                str(output_gif)
            ]
            run_cmd(gif_cmd)
            if output_gif.exists():
                log(f"  ✓ GIF Generated: {output_gif.name}", "STEP")
    else:
        log(f"  ✗ Failed to record {preset}", "ERR")
        
    return output_video

def main():
    global initial_preset, initial_workspace
    
    parser = argparse.ArgumentParser(description="Omarchy Motion Presets Automated Showcase Recorder")
    parser.add_argument("--all", action="store_true", help="Record showcase for all discovered presets")
    parser.add_argument("--only", nargs="+", help="Record showcase only for specified preset(s)")
    parser.add_argument("--duration", type=float, default=11.5, help="Target recording duration per preset (seconds)")
    parser.add_argument("--countdown", type=int, default=5, help="Grace period countdown before start (seconds)")
    parser.add_argument("--no-countdown", action="store_true", help="Skip countdown grace period")
    parser.add_argument("--gif", action="store_true", help="Also generate optimized GIF versions")
    parser.add_argument("--list", action="store_true", help="List all dynamically discovered presets and exit")
    parser.add_argument("--dry-run", action="store_true", help="Simulate sequence without recording")
    args = parser.parse_args()

    # Discover presets dynamically
    all_presets = discover_presets()
    
    if args.list:
        print(f"\n{Colors.BOLD}Dynamically Discovered Animation Presets ({len(all_presets)} total):{Colors.RESET}")
        for p in all_presets:
            print(f"  • {p}")
        sys.exit(0)

    # Determine target presets
    if args.only:
        targets = [p for p in args.only if p in all_presets]
        if not targets:
            log(f"None of specified presets {args.only} found. Available: {all_presets}", "ERR")
            sys.exit(1)
    else:
        targets = all_presets

    # Record initial state
    initial_preset = get_current_preset()
    try:
        res = run_cmd(["hyprctl", "monitors", "-j"])
        if res and res.stdout:
            initial_workspace = json.loads(res.stdout)[0].get("activeWorkspace", {}).get("id", 1)
    except Exception:
        initial_workspace = 1

    monitor = get_primary_monitor()
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    log("=" * 70, "INFO")
    log("  🎬 OMARCHY MOTION PRESETS SHOWCASE RECORDER (DYNAMIC)", "INFO")
    log(f"  Monitor: {monitor} | Total Presets to Record: {len(targets)}", "INFO")
    log(f"  Output Directory: {OUTPUT_DIR}", "INFO")
    log(f"  Initial Preset: {initial_preset} (Will be restored automatically)", "INFO")
    log("=" * 70, "INFO")

    # Countdown grace period
    countdown = 0 if args.no_countdown else args.countdown
    if countdown > 0:
        log(f"⏳ Grace period: {countdown}s to close or minimize terminal windows...", "WARN")
        notify("Omarchy Motion Showcase", f"Recording starts in {countdown}s. You can close your terminal now!")
        for c in range(countdown, 0, -1):
            try:
                print(f"\r  🕒 Starting in {c} seconds... (Close this terminal anytime)\r", end="", flush=True)
            except Exception:
                pass
            time.sleep(1.0)
        try:
            print("\n")
        except Exception:
            pass

    notify("Omarchy Motion Showcase", f"Recording started for {len(targets)} presets!")

    # Main recording loop
    successful = 0
    try:
        for idx, preset in enumerate(targets, 1):
            log(f"[{idx}/{len(targets)}] Processing preset: {preset}...", "INFO")
            out = record_preset_showcase(
                preset,
                monitor=monitor,
                duration=args.duration,
                gen_gif=args.gif,
                dry_run=args.dry_run
            )
            if out.exists() or args.dry_run:
                successful += 1
            time.sleep(0.5)
    finally:
        cleanup()

    log("=" * 70, "INFO")
    log(f"✨ Finished recording! {successful}/{len(targets)} presets successfully recorded.", "STEP")
    log(f"All files saved to: {OUTPUT_DIR}", "INFO")
    notify("Omarchy Motion Showcase", f"Completed! {successful}/{len(targets)} presets recorded.")

if __name__ == "__main__":
    main()
