-- Animation Preset: Cyberpunk Warp 3D
-- High-speed 3D depth zoom popins, snappy exit, and vertical deck shifts

hl.curve("warpIn",    { type = "bezier", points = { { 0.1, 1.0 }, { 0.15, 1.08 } } })
hl.curve("hyperOut",  { type = "bezier", points = { { 0.4, 0.0 }, { 1.0, 0.1 } } })
hl.curve("deckShift", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.2, bezier = "deckShift" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 2.8, bezier = "warpIn",    style = "popin 15%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.8, bezier = "hyperOut",  style = "popin 15%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.0, bezier = "deckShift" })
hl.animation({ leaf = "layers",           enabled = true, speed = 2.8, bezier = "deckShift" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.5, bezier = "warpIn",    style = "popin 30%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.8, bezier = "hyperOut",  style = "popin 30%" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.0, bezier = "deckShift" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.6, bezier = "hyperOut" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.0, bezier = "deckShift" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.6, bezier = "hyperOut" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.5, bezier = "deckShift" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.5, bezier = "deckShift" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.2, bezier = "deckShift", style = "slidefadevert 35%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.8, bezier = "deckShift", style = "slidefadevert 40%" })
