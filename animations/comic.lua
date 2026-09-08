-- Animation Preset: Comic Flip & Gravity Drop
-- Punchy cartoon easing with top slide drop-in and gravity fall drop-out

hl.curve("punchOut",    { type = "bezier", points = { { 0.2, 1.3 }, { 0.4, 1.0 } } })
hl.curve("gravityDrop", { type = "bezier", points = { { 0.55, 0.055 }, { 0.675, 0.19 } } })
hl.curve("stageSlide",  { type = "bezier", points = { { 0.1, 1.0 }, { 0.2, 1.0 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.0, bezier = "stageSlide" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.4, bezier = "punchOut",    style = "slide top" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.5, bezier = "gravityDrop", style = "slide bottom" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.2, bezier = "punchOut" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3.0, bezier = "punchOut" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.0, bezier = "punchOut",    style = "slide top" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.2, bezier = "gravityDrop", style = "slide bottom" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.0, bezier = "stageSlide" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "gravityDrop" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.0, bezier = "stageSlide" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "gravityDrop" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.5, bezier = "stageSlide" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.5, bezier = "stageSlide" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.8, bezier = "punchOut",    style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.2, bezier = "punchOut",    style = "slidevert" })
