-- Animation Preset: Fast & Snappy 144Hz
-- Ultra-responsive, minimal delay, instant feedback for gaming and high-speed workflow

hl.curve("snappy",    { type = "bezier", points = { { 0.05, 0.95 }, { 0.15, 1.0 } } })
hl.curve("snappyOut", { type = "bezier", points = { { 0.3, 0.0 }, { 0.9, 0.2 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 2.2, bezier = "snappy" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 2.0, bezier = "snappy",    style = "popin 85%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.5, bezier = "snappyOut", style = "popin 85%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 2.0, bezier = "snappy" })
hl.animation({ leaf = "layers",           enabled = true, speed = 2.2, bezier = "snappy" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.0, bezier = "snappy",    style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.5, bezier = "snappyOut", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 1.8, bezier = "snappy" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.4, bezier = "snappyOut" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 1.8, bezier = "snappy" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.4, bezier = "snappyOut" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.0, bezier = "snappy" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.0, bezier = "snappy" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 2.4, bezier = "snappy",    style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.2, bezier = "snappy",    style = "slidevert" })
