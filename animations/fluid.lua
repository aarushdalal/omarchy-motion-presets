-- Animation Preset: Fluid Glass & Silk
-- Buttery-smooth, organic deceleration, soft dissolves, and silky slides

hl.curve("fluidSilk", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })
hl.curve("softDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1.0 } } })
hl.curve("softAccel", { type = "bezier", points = { { 0.3, 0.0 }, { 0.8, 0.15 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.2, bezier = "fluidSilk" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.4, bezier = "softDecel", style = "slidefade 25%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.2, bezier = "softAccel", style = "slidefade 25%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.2, bezier = "fluidSilk" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3.0, bezier = "fluidSilk" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.8, bezier = "softDecel", style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.0, bezier = "softAccel", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.5, bezier = "softDecel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 2.0, bezier = "softAccel" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.5, bezier = "softDecel" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 2.0, bezier = "softAccel" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.5, bezier = "fluidSilk" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.5, bezier = "fluidSilk" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.8, bezier = "fluidSilk", style = "slidefade 45%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.0, bezier = "fluidSilk", style = "slidefadevert 25%" })
