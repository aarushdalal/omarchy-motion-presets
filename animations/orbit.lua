-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 07: Orbit Reveal (Horizontal Orbital Slide Right/Left)
-- ==============================================================================

-- 1. Orbital Tangent Curves
hl.curve("orbitRadial", { type = "bezier", points = { { 0.15, 0.95 }, { 0.25, 1.02 } } })
hl.curve("orbitSettle", { type = "bezier", points = { { 0.20, 1.00 }, { 0.35, 1.00 } } })
hl.curve("orbitExit",   { type = "bezier", points = { { 0.35, 0.00 }, { 0.85, 0.12 } } })

-- 2. Window Motion Channels (Horizontal orbital slide: In from right, Out to left)
hl.animation({ leaf = "windows",          enabled = true, speed = 3.8, bezier = "orbitSettle" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.8, bezier = "orbitRadial", style = "slide right" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.6, bezier = "orbitExit",   style = "slide left" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.4, bezier = "orbitSettle" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 3.2, bezier = "orbitSettle" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.4, bezier = "orbitRadial", style = "slide right" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.2, bezier = "orbitExit",   style = "slide left" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.6, bezier = "orbitSettle" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "orbitExit" })

-- 4. Fade Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.6, bezier = "orbitSettle" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "orbitExit" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3.0, bezier = "orbitSettle" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 3.0, bezier = "orbitSettle" })

-- 5. Workspace Channels (Horizontal orbital slide)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.8, bezier = "orbitRadial", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.2, bezier = "orbitRadial", style = "slidevert" })
