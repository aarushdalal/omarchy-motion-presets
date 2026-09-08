-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 06: Theme Morph (Cinematic 560ms Silk Pan & 80% Workspace Sweep)
-- ==============================================================================

-- 1. Ultra-Luxurious Cinematic Spline Curves
hl.curve("morphSilk",    { type = "bezier", points = { { 0.20, 1.00 }, { 0.35, 1.00 } } })
hl.curve("morphEase",    { type = "bezier", points = { { 0.16, 0.98 }, { 0.28, 1.00 } } })
hl.curve("morphFadeOut", { type = "bezier", points = { { 0.30, 0.00 }, { 0.80, 0.15 } } })

-- 2. Window Motion Channels (Velvety 520ms glide)
hl.animation({ leaf = "windows",          enabled = true, speed = 5.2, bezier = "morphSilk" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 5.2, bezier = "morphSilk",    style = "slidefade 35%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3.6, bezier = "morphFadeOut", style = "slidefade 35%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 4.6, bezier = "morphSilk" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 4.4, bezier = "morphSilk" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 4.6, bezier = "morphSilk",    style = "slidefade 30%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.8, bezier = "morphFadeOut", style = "slidefade 30%" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 3.4, bezier = "morphEase" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 2.4, bezier = "morphFadeOut" })

-- 4. Fade Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 3.4, bezier = "morphEase" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 2.4, bezier = "morphFadeOut" })
hl.animation({ leaf = "fade",             enabled = true, speed = 4.0, bezier = "morphSilk" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 4.0, bezier = "morphSilk" })

-- 5. Workspace Channels (Deep 560ms 80% slidefade - Grand Cinema Pan)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5.6, bezier = "morphSilk",    style = "slidefade 80%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.8, bezier = "morphSilk",    style = "slidevert" })
