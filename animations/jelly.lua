-- Animation Preset: Bouncy Jelly & Arcade
-- Playful, springy overshoots, tactile popins and rubber-band workspace slides

hl.curve("jellyOvershoot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.15 } } })
hl.curve("bounceBack",     { type = "bezier", points = { { 0.34, 1.4 }, { 0.64, 1.0 } } })
hl.curve("quickDecel",     { type = "bezier", points = { { 0.1, 1.0 }, { 0.2, 1.0 } } })
hl.curve("squashOut",      { type = "bezier", points = { { 0.7, 0.0 }, { 1.0, 0.5 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.6, bezier = "jellyOvershoot" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.8, bezier = "bounceBack",     style = "popin 45%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 2.4, bezier = "squashOut",      style = "popin 55%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.8, bezier = "jellyOvershoot" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3.2, bezier = "bounceBack" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3.2, bezier = "bounceBack",     style = "popin 55%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 2.0, bezier = "squashOut",      style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2.5, bezier = "quickDecel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.8, bezier = "squashOut" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 2.5, bezier = "quickDecel" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.8, bezier = "squashOut" })
hl.animation({ leaf = "fade",             enabled = true, speed = 2.8, bezier = "jellyOvershoot" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 3.0, bezier = "quickDecel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4.0, bezier = "bounceBack",     style = "slidefade 50%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.5, bezier = "bounceBack",     style = "slidevert" })
