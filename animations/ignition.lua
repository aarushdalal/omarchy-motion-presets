-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 05: Command Ignition (Bottom Launch Thruster & Vertical Elevator)
-- ==============================================================================

-- 1. Rocket Booster Ignition Curves
hl.curve("igniteThrust", { type = "bezier", points = { { 0.05, 0.90 }, { 0.14, 1.08 } } })
hl.curve("igniteBrake",  { type = "bezier", points = { { 0.15, 1.00 }, { 0.28, 1.00 } } })
hl.curve("igniteCutoff", { type = "bezier", points = { { 0.38, 0.00 }, { 0.92, 0.10 } } })

-- 2. Window Motion Channels (Launches UPWARD from the bottom of the screen like a rocket!)
hl.animation({ leaf = "windows",          enabled = true, speed = 3.6, bezier = "igniteBrake" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.6, bezier = "igniteThrust", style = "slide bottom" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.6, bezier = "igniteCutoff", style = "slide bottom" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.2, bezier = "igniteBrake" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 3.0, bezier = "igniteBrake" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.0, bezier = "igniteThrust", style = "slide bottom" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.2, bezier = "igniteCutoff", style = "slide bottom" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.6, bezier = "igniteBrake" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "igniteCutoff" })

-- 4. Fade Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.6, bezier = "igniteBrake" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "igniteCutoff" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.8, bezier = "igniteBrake" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.8, bezier = "igniteBrake" })

-- 5. Workspace Channels (VERTICAL Rocket Booster climb)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.8, bezier = "igniteThrust", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.2, bezier = "igniteThrust", style = "slidevert" })
