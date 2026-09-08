-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 01: Material Unfold (Top Slide Drop & Blueprint Horizontal Glide)
-- ==============================================================================

-- 1. Precision Material Unfold Curves
hl.curve("unfoldSurface", { type = "bezier", points = { { 0.16, 0.95 }, { 0.24, 1.01 } } })
hl.curve("unfoldSettle",  { type = "bezier", points = { { 0.18, 1.00 }, { 0.32, 1.00 } } })
hl.curve("unfoldExit",    { type = "bezier", points = { { 0.35, 0.00 }, { 0.85, 0.10 } } })

-- 2. Window Motion Channels (Surfaces slide down from the ceiling)
hl.animation({ leaf = "windows",          enabled = true, speed = 3.8, bezier = "unfoldSettle" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.8, bezier = "unfoldSurface", style = "slide top" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.6, bezier = "unfoldExit",    style = "slide top" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.2, bezier = "unfoldSettle" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 3.2, bezier = "unfoldSettle" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.4, bezier = "unfoldSurface", style = "slide top" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.2, bezier = "unfoldExit",    style = "slide top" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.6, bezier = "unfoldSettle" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "unfoldExit" })

-- 4. Fade & Dim Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.6, bezier = "unfoldSettle" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "unfoldExit" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.8, bezier = "unfoldSettle" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.8, bezier = "unfoldSettle" })

-- 5. Workspace Channels (Blueprint slide with 35% fade)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.6, bezier = "unfoldSurface", style = "slidefade 35%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.0, bezier = "unfoldSurface", style = "slidevert" })
