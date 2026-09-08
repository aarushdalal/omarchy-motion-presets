-- ==============================================================================
-- Omarchy Signature Motion Engine
-- Signature 04: Context Bloom (30% Center Aperture Bloom & Pure Workspace Crossfade)
-- ==============================================================================

-- 1. Organic Petal & Lens Aperture Growth Curves
hl.curve("bloomGrowth", { type = "bezier", points = { { 0.12, 0.85 }, { 0.22, 1.00 } } })
hl.curve("bloomSettle", { type = "bezier", points = { { 0.18, 1.00 }, { 0.32, 1.00 } } })
hl.curve("bloomRecede", { type = "bezier", points = { { 0.35, 0.00 }, { 0.80, 0.15 } } })

-- 2. Window Motion Channels (Bloom outward from 30% focal center)
hl.animation({ leaf = "windows",          enabled = true, speed = 4.2, bezier = "bloomGrowth" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 4.2, bezier = "bloomGrowth", style = "popin 30%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.8, bezier = "bloomRecede", style = "popin 30%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.4, bezier = "bloomSettle" })

-- 3. Layer & Surface Channels
hl.animation({ leaf = "layers",           enabled = true, speed = 3.4, bezier = "bloomGrowth" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.6, bezier = "bloomGrowth", style = "popin 45%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.2, bezier = "bloomRecede", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.8, bezier = "bloomSettle" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "bloomRecede" })

-- 4. Fade Channels
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.8, bezier = "bloomSettle" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "bloomRecede" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3.2, bezier = "bloomSettle" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 3.2, bezier = "bloomSettle" })

-- 5. Workspace Channels (PURE Cinematic Crossfade Dissolve - Zero horizontal sliding)
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4.0, bezier = "bloomGrowth", style = "fade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.4, bezier = "bloomGrowth", style = "fade" })
