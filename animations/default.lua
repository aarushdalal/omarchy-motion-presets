-- Animation Preset: Classic Omarchy Default
-- Balanced modern animations

hl.curve("fluid",       { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeOutBack", { type = "bezier", points = { { 0.34, 1.3 }, { 0.64, 1 } } })
hl.curve("md3Decel",    { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3Accel",    { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.0, bezier = "fluid" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.2, bezier = "easeOutBack", style = "popin 75%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.2, bezier = "md3Accel",    style = "popin 75%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.0, bezier = "fluid" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3.0, bezier = "fluid" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.8, bezier = "md3Decel",    style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.0, bezier = "md3Accel",    style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 1.79, bezier = "md3Decel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.39, bezier = "md3Accel" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.5, bezier = "md3Decel" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 2.0, bezier = "md3Accel" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.5, bezier = "fluid" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.0, bezier = "fluid",       style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.0, bezier = "fluid",       style = "slidevert" })
