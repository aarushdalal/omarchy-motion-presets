-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 02: Liquid Selection (Viscous 55% Popin & Elastic Workspace Bounce)
-- ==============================================================================

-- 1. Viscous Fluid Curves with Organic Spring Bounce (1.22x Overshoot)
hl.curve("liquidTension",  { type = "bezier", points = { { 0.10, 0.90 }, { 0.18, 1.22 } } })
hl.curve("liquidFlow",     { type = "bezier", points = { { 0.16, 1.00 }, { 0.28, 1.00 } } })
hl.curve("liquidDissolve", { type = "bezier", points = { { 0.35, 0.00 }, { 0.80, 0.15 } } })

-- 2. Window Motion Channels (Elastic liquid popin from 55% with visible bounce)
hl.animation({ leaf = "windows",          enabled = true, speed = 4.2, bezier = "liquidTension" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 4.2, bezier = "liquidTension",  style = "popin 55%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.6, bezier = "liquidDissolve", style = "popin 65%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 4.2, bezier = "liquidTension" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 3.6, bezier = "liquidTension" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.8, bezier = "liquidTension",  style = "popin 60%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.2, bezier = "liquidDissolve", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.8, bezier = "liquidFlow" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "liquidDissolve" })

-- 4. Fade & Dim Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.8, bezier = "liquidFlow" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "liquidDissolve" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3.2, bezier = "liquidFlow" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 3.2, bezier = "liquidFlow" })

-- 5. Workspace Channels (Elastic rubber-band bounce with 50% slidefade)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4.2, bezier = "liquidTension",  style = "slidefade 50%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.6, bezier = "liquidTension",  style = "slidevert" })
