-- Animation Preset: Matrix Digital Elevator
-- Cyber elevator vertical slides with digital snap popins

hl.curve("matrixDecel", { type = "bezier", points = { { 0.1, 0.9 }, { 0.2, 1.0 } } })
hl.curve("matrixDrop",  { type = "bezier", points = { { 0.45, 0.0 }, { 0.55, 1.0 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.0, bezier = "matrixDecel" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.0, bezier = "matrixDecel", style = "slide top" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.2, bezier = "matrixDrop",  style = "slide bottom" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 2.8, bezier = "matrixDecel" })
hl.animation({ leaf = "layers",           enabled = true, speed = 2.5, bezier = "matrixDecel" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.5, bezier = "matrixDecel", style = "slide top" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.8, bezier = "matrixDrop",  style = "slide bottom" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.2, bezier = "matrixDecel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "matrixDrop" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.2, bezier = "matrixDecel" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "matrixDrop" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.4, bezier = "matrixDecel" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.4, bezier = "matrixDecel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.0, bezier = "matrixDecel", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.8, bezier = "matrixDecel", style = "slidevert" })
