-- Animation Preset: Cosmic Glide
-- Apple Sonoma & iOS physics-based organic momentum curve: feather-light deceleration and buttery smooth spring

hl.curve("cosmicSpring", { type = "bezier", points = { { 0.18, 1.04 }, { 0.32, 1.0 } } })
hl.curve("cosmicFade",   { type = "bezier", points = { { 0.16, 1.0 },  { 0.3, 1.0 } } })
hl.curve("cosmicExit",   { type = "bezier", points = { { 0.35, 0.0 },  { 0.85, 0.15 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.0, bezier = "cosmicSpring" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.2, bezier = "cosmicSpring", style = "popin 65%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.0, bezier = "cosmicExit",   style = "popin 65%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 2.8, bezier = "cosmicSpring" })
hl.animation({ leaf = "layers",           enabled = true, speed = 2.6, bezier = "cosmicFade" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.5, bezier = "cosmicSpring", style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.8, bezier = "cosmicExit",   style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.2, bezier = "cosmicFade" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.6, bezier = "cosmicExit" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.2, bezier = "cosmicFade" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.6, bezier = "cosmicExit" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.4, bezier = "cosmicFade" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.4, bezier = "cosmicFade" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.2, bezier = "cosmicSpring", style = "slidefade 40%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.8, bezier = "cosmicSpring", style = "slidevert" })
