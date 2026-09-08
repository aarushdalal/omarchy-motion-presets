-- Animation Preset: Velocity Ghost
-- Minimal latency holographic snap: lightning teleport popins with futuristic stealth fade

hl.curve("ghostSnap",   { type = "bezier", points = { { 0.06, 0.96 }, { 0.14, 1.02 } } })
hl.curve("ghostVanish", { type = "bezier", points = { { 0.35, 0.0 },  { 0.88, 0.15 } } })
hl.curve("ghostShift",  { type = "bezier", points = { { 0.1, 0.95 },  { 0.22, 1.0 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 1.8, bezier = "ghostShift" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 1.6, bezier = "ghostSnap",   style = "fade" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.2, bezier = "ghostVanish", style = "fade" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 1.8, bezier = "ghostShift" })
hl.animation({ leaf = "layers",           enabled = true, speed = 1.8, bezier = "ghostShift" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 1.6, bezier = "ghostSnap",   style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.2, bezier = "ghostVanish", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 1.5, bezier = "ghostSnap" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.2, bezier = "ghostVanish" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 1.5, bezier = "ghostSnap" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.2, bezier = "ghostVanish" })
hl.animation({ leaf = "fade",             enabled = true, speed = 1.6, bezier = "ghostShift" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 1.6, bezier = "ghostShift" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 1.8, bezier = "ghostSnap",   style = "fade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.6, bezier = "ghostSnap",   style = "fade" })
