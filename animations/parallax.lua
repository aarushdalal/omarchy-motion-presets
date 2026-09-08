-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 08: Workspace Parallax (500ms Full Desk Slide & Depth Zoom)
-- ==============================================================================

-- 1. Heavy Planar Desk Curves
hl.curve("parallaxGlide",  { type = "bezier", points = { { 0.10, 0.96 }, { 0.20, 1.01 } } })
hl.curve("parallaxSettle", { type = "bezier", points = { { 0.18, 1.00 }, { 0.32, 1.00 } } })
hl.curve("parallaxExit",   { type = "bezier", points = { { 0.32, 0.00 }, { 0.88, 0.12 } } })

-- 2. Window Motion Channels (Depth zoom popin from 45%)
hl.animation({ leaf = "windows",          enabled = true, speed = 3.2, bezier = "parallaxSettle" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.2, bezier = "parallaxGlide",  style = "popin 45%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.2, bezier = "parallaxExit",   style = "popin 45%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 2.8, bezier = "parallaxSettle" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 2.8, bezier = "parallaxSettle" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.0, bezier = "parallaxGlide",  style = "popin 55%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.8, bezier = "parallaxExit",   style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.4, bezier = "parallaxSettle" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.6, bezier = "parallaxExit" })

-- 4. Fade Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.4, bezier = "parallaxSettle" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.6, bezier = "parallaxExit" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.8, bezier = "parallaxSettle" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.8, bezier = "parallaxSettle" })

-- 5. Workspace Channels (Heavy 500ms physical desk slide)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5.0, bezier = "parallaxGlide",  style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.8, bezier = "parallaxGlide",  style = "slidevert" })
