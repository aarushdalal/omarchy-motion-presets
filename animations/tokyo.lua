-- Animation Preset: Tokyo Drift
-- High-octane kinetic drift velocity: explosive acceleration with an aerodynamic drift settle

hl.curve("driftVelocity", { type = "bezier", points = { { 0.08, 0.85 }, { 0.16, 1.03 } } })
hl.curve("driftDecel",    { type = "bezier", points = { { 0.22, 1.0 },  { 0.42, 1.0 } } })
hl.curve("driftSlide",    { type = "bezier", points = { { 0.12, 0.95 }, { 0.25, 1.02 } } })
hl.curve("driftExit",     { type = "bezier", points = { { 0.38, 0.0 },  { 0.9, 0.12 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.0, bezier = "driftVelocity" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.2, bezier = "driftVelocity", style = "slide left" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.2, bezier = "driftExit",     style = "slide right" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 2.8, bezier = "driftSlide" })
hl.animation({ leaf = "layers",           enabled = true, speed = 2.6, bezier = "driftDecel" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2.4, bezier = "driftVelocity", style = "slide left" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.8, bezier = "driftExit",     style = "slide right" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.0, bezier = "driftDecel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.6, bezier = "driftExit" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.0, bezier = "driftDecel" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.6, bezier = "driftExit" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.4, bezier = "driftDecel" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 2.4, bezier = "driftDecel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3.4, bezier = "driftSlide",    style = "slidefade 65%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.0, bezier = "driftSlide",    style = "slidevert" })
