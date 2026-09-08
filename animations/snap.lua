-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 03: Spatial Snap (Instant 200ms Shutter & Crisp Workspace Lock)
-- ==============================================================================

-- 1. High-Velocity Mechanical Lock Curves
hl.curve("snapLock",  { type = "bezier", points = { { 0.04, 0.98 }, { 0.10, 1.00 } } })
hl.curve("snapDecel", { type = "bezier", points = { { 0.10, 1.00 }, { 0.20, 1.00 } } })
hl.curve("snapVanish",{ type = "bezier", points = { { 0.35, 0.00 }, { 0.90, 0.15 } } })

-- 2. Window Motion Channels (Ultra-crisp 200ms snap)
hl.animation({ leaf = "windows",          enabled = true, speed = 2.0, bezier = "snapLock" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 2.0, bezier = "snapLock",   style = "popin 82%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.4, bezier = "snapVanish", style = "popin 82%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 1.8, bezier = "snapLock" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 1.8, bezier = "snapLock" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 1.8, bezier = "snapLock",   style = "popin 85%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.3, bezier = "snapVanish", style = "popin 85%" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 1.6, bezier = "snapDecel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.2, bezier = "snapVanish" })

-- 4. Fade Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 1.6, bezier = "snapDecel" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.2, bezier = "snapVanish" })
hl.animation({ leaf = "fade",             enabled = true, speed = 1.8, bezier = "snapDecel" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 1.8, bezier = "snapDecel" })

-- 5. Workspace Channels (Tight 200ms 15% slidefade)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 2.0, bezier = "snapLock",   style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.8, bezier = "snapLock",   style = "slidevert" })
