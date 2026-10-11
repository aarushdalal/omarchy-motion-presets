pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

// ==============================================================================
// OMARCHY SIGNATURE MOTION SYSTEM (Universal Motion Engine Singleton)
// Orchestrates timing, kinetic physics, spring overshoots, liquid selection,
// spatial origins, and adaptive theme morphing across all Omarchy shell surfaces.
// ==============================================================================
QtObject {
  id: root

  readonly property string stateHome: (Quickshell.env("XDG_STATE_HOME") || Quickshell.env("HOME") + "/.local/state")

  // 1. Live State Trackers
  readonly property var presets: ["default", "unfold", "liquid", "snap", "bloom", "ignition", "morph", "orbit", "parallax", "quantum", "cosmic", "tokyo", "ghost", "snappy", "cyberpunk", "fluid", "comic", "jelly", "matrix"]
  property string activePreset: "tokyo"
  property string intensity: "balanced"
  property bool reducedMotion: false

  property FileView animStyleWatcher: FileView {
    path: root.stateHome + "/omarchy/animation-style"
    watchChanges: true
    printErrors: false
    onLoaded: {
      var s = String(text()).trim().toLowerCase()
      if (root.presets.indexOf(s) !== -1) root.activePreset = s
    }
    onFileChanged: reload()
  }

  property FileView intensityWatcher: FileView {
    path: root.stateHome + "/omarchy/animation-intensity"
    watchChanges: true
    printErrors: false
    onLoaded: {
      var s = String(text()).trim().toLowerCase()
      if (s === "subtle" || s === "balanced" || s === "expressive") root.intensity = s
    }
    onFileChanged: reload()
  }

  property FileView reducedMotionWatcher: FileView {
    path: root.stateHome + "/omarchy/reduced-motion"
    watchChanges: true
    printErrors: false
    onLoaded: {
      var s = String(text()).trim().toLowerCase()
      root.reducedMotion = (s === "true" || s === "1" || s === "yes")
    }
    onFileChanged: reload()
  }

  // 2. Intensity Multiplier
  readonly property real intensityScale: {
    if (reducedMotion) return 0.2
    switch (intensity) {
      case "subtle": return 0.8
      case "expressive": return 1.25
      case "balanced":
      default: return 1.0
    }
  }

  // 3. Preset Duration Base (ms)
  readonly property int baseMicro: {
    if (reducedMotion) return 1
    switch (activePreset) {
      case "quantum": return 55
      case "ghost": return 65
      case "snappy": return 70
      case "snap": return 75
      case "ignition": return 80
      case "tokyo": return 85
      case "cyberpunk": return 90
      case "matrix": return 90
      case "liquid": return 95
      case "unfold": return 105
      case "cosmic": return 110
      case "bloom": return 120
      case "fluid": return 120
      case "parallax": return 125
      case "morph": return 130
      case "comic": return 135
      case "jelly": return 140
      case "orbit": return 100
      default: return 100
    }
  }

  readonly property int baseStandard: {
    if (reducedMotion) return 40
    switch (activePreset) {
      case "quantum": return 110
      case "ghost": return 125
      case "snappy": return 140
      case "snap": return 150
      case "ignition": return 165
      case "tokyo": return 175
      case "cyberpunk": return 185
      case "matrix": return 190
      case "liquid": return 195
      case "orbit": return 205
      case "unfold": return 220
      case "cosmic": return 230
      case "bloom": return 240
      case "fluid": return 250
      case "parallax": return 255
      case "morph": return 270
      case "comic": return 260
      case "jelly": return 280
      default: return 200
    }
  }

  readonly property int baseExpressive: {
    if (reducedMotion) return 60
    switch (activePreset) {
      case "quantum": return 150
      case "ghost": return 170
      case "snappy": return 190
      case "snap": return 210
      case "ignition": return 230
      case "tokyo": return 240
      case "cyberpunk": return 250
      case "matrix": return 260
      case "orbit": return 265
      case "liquid": return 270
      case "unfold": return 300
      case "cosmic": return 310
      case "bloom": return 330
      case "fluid": return 330
      case "parallax": return 340
      case "comic": return 350
      case "jelly": return 370
      case "morph": return 380
      default: return 280
    }
  }

  // 4. Final Scaled Duration Tokens
  readonly property int micro: Math.max(1, Math.round(baseMicro * intensityScale))
  readonly property int standard: Math.max(1, Math.round(baseStandard * intensityScale))
  readonly property int expressive: Math.max(1, Math.round(baseExpressive * intensityScale))
  readonly property int morph: Math.max(1, Math.round((reducedMotion ? 80 : 340) * (intensity === "expressive" ? 1.25 : 1.0)))

  // 5. Kinetic Easing Curves
  readonly property int easeMicro: Easing.OutQuad

  readonly property int easeStandard: {
    if (reducedMotion) return Easing.Linear
    switch (activePreset) {
      case "quantum": return Easing.OutExpo
      case "ghost": return Easing.OutQuad
      case "snappy": return Easing.OutCubic
      case "snap": return Easing.OutCubic
      case "ignition": return Easing.OutExpo
      case "tokyo": return Easing.OutCubic
      case "cyberpunk": return Easing.OutExpo
      case "matrix": return Easing.OutCubic
      case "liquid": return Easing.OutCubic
      case "unfold": return Easing.OutCubic
      case "orbit": return Easing.OutCubic
      case "cosmic": return Easing.OutBack
      case "bloom": return Easing.OutQuad
      case "fluid": return Easing.OutCubic
      case "parallax": return Easing.OutCubic
      case "morph": return Easing.OutCubic
      case "comic": return Easing.OutBack
      case "jelly": return Easing.OutBack
      default: return Easing.OutCubic
    }
  }

  readonly property int easeExpressive: {
    if (reducedMotion) return Easing.Linear
    switch (activePreset) {
      case "quantum": return Easing.OutExpo
      case "ghost": return Easing.OutExpo
      case "snappy": return Easing.OutCubic
      case "snap": return Easing.OutBack
      case "ignition": return Easing.OutBack
      case "tokyo": return Easing.OutBack
      case "cyberpunk": return Easing.OutBack
      case "matrix": return Easing.OutCubic
      case "liquid": return Easing.OutBack
      case "unfold": return Easing.OutCubic
      case "orbit": return Easing.OutBack
      case "cosmic": return Easing.OutBack
      case "bloom": return Easing.OutCubic
      case "fluid": return Easing.OutCubic
      case "parallax": return Easing.OutCubic
      case "morph": return Easing.OutCubic
      case "comic": return Easing.OutBack
      case "jelly": return Easing.OutBack
      default: return Easing.OutBack
    }
  }

  // 6. Spring Overshoot Parameters
  readonly property real springOvershoot: {
    if (reducedMotion || intensity === "subtle") return 1.0
    var mult = (intensity === "expressive") ? 1.18 : 1.0
    switch (activePreset) {
      case "jelly": return 1.32 * mult
      case "comic": return 1.34 * mult
      case "liquid": return 1.22 * mult
      case "cyberpunk": return 1.20 * mult
      case "cosmic": return 1.18 * mult
      case "tokyo": return 1.15 * mult
      case "ignition": return 1.14 * mult
      case "orbit": return 1.12 * mult
      case "bloom": return 1.08 * mult
      case "parallax": return 1.08 * mult
      case "unfold": return 1.06 * mult
      case "quantum": return 1.02 * mult
      case "snappy": return 1.03 * mult
      case "ghost": return 1.02 * mult
      case "snap": return 1.04 * mult
      case "matrix": return 1.05 * mult
      case "fluid": return 1.06 * mult
      case "morph": return 1.04 * mult
      default: return 1.10 * mult
    }
  }

  // 7. Tactile Scaling Tokens
  readonly property real pressScale: reducedMotion ? 1.0 : (intensity === "subtle" ? 0.98 : (intensity === "expressive" ? 0.94 : 0.96))
  readonly property real hoverScale: reducedMotion ? 1.0 : (intensity === "subtle" ? 1.01 : (intensity === "expressive" ? 1.03 : 1.02))
  readonly property real idleScale: 1.0

  // 8. Distinct Signature Entrance Geometry & Timing (Unmistakable Visual Identity)
  readonly property real rawEntryScale: {
    if (reducedMotion) return 1.0
    switch (activePreset) {
      case "bloom": return 0.50       // Massive radial bloom expanding from 50%!
      case "cyberpunk": return 0.58   // 3D warp exploding from 58%!
      case "jelly": return 0.65       // Bouncy arcade ball expanding from 65%!
      case "comic": return 0.68       // Cartoon popin from 68%!
      case "liquid": return 0.70      // Viscous liquid drop expanding from 70%!
      case "parallax": return 0.72    // Multi-depth perspective from 72%!
      case "matrix": return 0.75      // Digital elevator from 75%!
      case "unfold": return 0.76      // Material unfold from 76%!
      case "cosmic": return 0.78      // iOS spring glide from 78%!
      case "orbit": return 0.80       // Radial orbit from 80%!
      case "ignition": return 0.82    // Rocket launch upward from 82%!
      case "fluid": return 0.82       // Silky glass from 82%!
      case "tokyo": return 0.85       // Kinetic drift from 85%!
      case "morph": return 0.86       // Cinematic velvet glide from 86%!
      case "snap": return 0.93        // Mechanical razor snap from 93%!
      case "snappy": return 0.94      // 144Hz snap from 94%!
      case "ghost": return 0.96       // Holographic teleport from 96%!
      case "quantum": return 0.97     // Instantaneous lock from 97%!
      default: return 0.84
    }
  }

  readonly property int rawEntryY: {
    if (reducedMotion) return 0
    switch (activePreset) {
      case "ignition": return 60      // Launches UPWARD from below (+60px to 0)!
      case "comic": return -75         // Dramatic cartoon drop from above (-75px to 0)!
      case "matrix": return -60        // Elevator drop from top (-60px to 0)!
      case "unfold": return -50        // Physical sheet unroll from top (-50px to 0)!
      case "cyberpunk": return -42     // 3D warp drop (-42px to 0)!
      case "jelly": return -38         // Bouncy drop (-38px to 0)!
      case "parallax": return -36      // Heavy desk drop (-36px to 0)!
      case "liquid": return -32        // Viscous fluid drop (-32px to 0)!
      case "cosmic": return -30        // Silky drop (-30px to 0)!
      case "tokyo": return -24         // High-speed lateral drift (-24px to 0)!
      case "fluid": return -22         // Silk descent (-22px to 0)!
      case "orbit": return -22         // Radial orbit drop (-22px to 0)!
      case "morph": return -18         // Velvety slow float (-18px to 0)!
      case "snap": return -14          // Crisp mechanical snap (-14px to 0)!
      case "snappy": return -10        // Fast snap (-10px to 0)!
      case "ghost": return -8          // Holographic micro-shift (-8px to 0)!
      case "quantum": return -5        // Quantum teleport (-5px to 0)!
      case "bloom": return 0           // PURE radial center aperture bloom, ZERO Y offset!
      default: return -25
    }
  }

  readonly property int entryDuration: {
    if (reducedMotion) return 40
    var scale = intensityScale
    switch (activePreset) {
      case "quantum": return Math.round(90 * scale)
      case "ghost": return Math.round(110 * scale)
      case "snappy": return Math.round(120 * scale)
      case "snap": return Math.round(135 * scale)
      case "cyberpunk": return Math.round(190 * scale)
      case "ignition": return Math.round(220 * scale)
      case "tokyo": return Math.round(230 * scale)
      case "matrix": return Math.round(250 * scale)
      case "orbit": return Math.round(270 * scale)
      case "unfold": return Math.round(290 * scale)
      case "cosmic": return Math.round(310 * scale)
      case "liquid": return Math.round(340 * scale)
      case "bloom": return Math.round(350 * scale)
      case "comic": return Math.round(360 * scale)
      case "fluid": return Math.round(370 * scale)
      case "parallax": return Math.round(380 * scale)
      case "jelly": return Math.round(400 * scale)
      case "morph": return Math.round(460 * scale)
      default: return Math.round(260 * scale)
    }
  }

  // 9. Distinct Liquid Selection Physics
  readonly property real liquidStretchMax: {
    if (reducedMotion) return 1.0
    switch (activePreset) {
      case "jelly": return 1.32        // 32% jelly stretch!
      case "liquid": return 1.26       // 26% liquid stretch!
      case "comic": return 1.22
      case "cyberpunk": return 1.18
      case "tokyo": return 1.15
      case "ignition": return 1.14
      case "orbit": return 1.12
      case "bloom": return 1.12
      case "morph": return 1.10
      case "cosmic": return 1.08
      case "fluid": return 1.08
      case "snap": return 1.02         // Crisp snap with minimal stretch
      case "snappy": return 1.02
      case "ghost": return 1.01
      case "quantum": return 1.0
      default: return 1.10
    }
  }

  readonly property int liquidMoveDuration: {
    if (reducedMotion) return 20
    switch (activePreset) {
      case "quantum": return Math.round(60 * intensityScale)
      case "ghost": return Math.round(75 * intensityScale)
      case "snappy": return Math.round(80 * intensityScale)
      case "snap": return Math.round(85 * intensityScale)
      case "tokyo": return Math.round(110 * intensityScale)
      case "ignition": return Math.round(125 * intensityScale)
      case "cyberpunk": return Math.round(135 * intensityScale)
      case "orbit": return Math.round(145 * intensityScale)
      case "unfold": return Math.round(155 * intensityScale)
      case "matrix": return Math.round(160 * intensityScale)
      case "cosmic": return Math.round(165 * intensityScale)
      case "liquid": return Math.round(180 * intensityScale)
      case "bloom": return Math.round(185 * intensityScale)
      case "jelly": return Math.round(200 * intensityScale)
      case "comic": return Math.round(205 * intensityScale)
      case "fluid": return Math.round(210 * intensityScale)
      case "morph": return Math.round(230 * intensityScale)
      default: return Math.round(135 * intensityScale)
    }
  }

  function presetHumanName(preset) {
    var p = String(preset || activePreset).toLowerCase()
    switch (p) {
      case "unfold": return "Material Unfold"
      case "liquid": return "Liquid Selection"
      case "snap": return "Spatial Snap"
      case "bloom": return "Context Bloom"
      case "ignition": return "Command Ignition"
      case "morph": return "Theme Morph"
      case "orbit": return "Orbit Reveal"
      case "parallax": return "Workspace Parallax"
      case "quantum": return "Quantum Snap"
      case "cosmic": return "Cosmic Glide"
      case "tokyo": return "Tokyo Drift"
      case "ghost": return "Velocity Ghost"
      case "snappy": return "Fast & Snappy"
      case "cyberpunk": return "Cyberpunk Warp"
      case "fluid": return "Fluid Glass & Silk"
      case "comic": return "Comic & Gravity"
      case "jelly": return "Bouncy Jelly"
      case "matrix": return "Matrix Elevator"
      case "default": return "Classic Default"
      default: return p.charAt(0).toUpperCase() + p.slice(1)
    }
  }

  // 10. Spatial Anchor Projection (Signature 03: Spatial Snap)
  function calculateOrigin(anchorItem, popupRect, barPosition) {
    if (!anchorItem || !popupRect) return { originX: 0.5, originY: 0.5, directionY: 1 }

    var anchorWindow = anchorItem.QsWindow ? anchorItem.QsWindow.window : null
    if (!anchorWindow) return { originX: 0.5, originY: 0.5, directionY: 1 }

    var localCenter = anchorWindow.contentItem.mapFromItem(anchorItem, anchorItem.width / 2, anchorItem.height / 2)
    var popupX = popupRect.x || 0
    var popupY = popupRect.y || 0
    var popupW = popupRect.width || 1
    var popupH = popupRect.height || 1

    var relX = Math.max(0.0, Math.min(1.0, (localCenter.x - popupX) / popupW))
    var relY = (barPosition === "bottom") ? 1.0 : 0.0
    var dirY = (barPosition === "bottom") ? -1 : 1

    return {
      originX: relX,
      originY: relY,
      directionY: dirY
    }
  }


  readonly property real amplitude: reducedMotion ? 0 : (intensity === "subtle" ? 0.45 : intensity === "expressive" ? 1.1 : 0.8)
  readonly property real entryScaleStart: reducedMotion ? 1 : Math.max(0.65, 1 - (1 - rawEntryScale) * amplitude)
  readonly property real entryYOffset: activePreset === "tokyo" ? 0 : Math.max(-60, Math.min(60, rawEntryY * amplitude))
  readonly property real entryXOffset: reducedMotion ? 0 : (activePreset === "tokyo" ? -22 * amplitude : activePreset === "parallax" ? -8 * amplitude : 0)
  readonly property int exitDuration: Math.max(40, Math.round(entryDuration * 0.65))

  // 9. Semantic Lifecycle Actions
  function enter() { return { duration: standard, easing: easeStandard, overshoot: springOvershoot } }
  function exit() { return { duration: micro, easing: Easing.InQuad, overshoot: 1.0 } }
  function select() { return { duration: micro, easing: easeStandard } }
  function focus() { return { duration: standard, easing: easeExpressive, overshoot: springOvershoot } }
  function stateChange() { return { duration: standard, easing: easeStandard } }
  function themeChange() { return { duration: morph, easing: Easing.OutCubic } }
}
