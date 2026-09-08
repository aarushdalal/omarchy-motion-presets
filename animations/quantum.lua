-- Animation Preset: Quantum Snap
-- Ultra-fast response with razor-sharp magnetic lock, near-instant popins and high-FPS fluidity

hl.curve("quantumSnap",   { type = "bezier", points = { { 0.05, 0.98 }, { 0.12, 1.02 } } })
hl.curve("quantumVanish", { type = "bezier", points = { { 0.35, 0.0 }, { 0.9, 0.15 } } })
hl.curve("quantumMove",   { type = "bezier", points = { { 0.08, 0.95 }, { 0.18, 1.0 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 1.8, bezier = "quantumMove" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 1.7, bezier = "quantumSnap",   style = "popin 94%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.3, bezier = "quantumVanish", style = "popin 94%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 1.8, bezier = "quantumMove" })
hl.animation({ leaf = "layers",           enabled = true, speed = 1.8, bezier = "quantumMove" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 1.6, bezier = "quantumSnap",   style = "fade" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.2, bezier = "quantumVanish", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 1.5, bezier = "quantumSnap" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1.2, bezier = "quantumVanish" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 1.5, bezier = "quantumSnap" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.2, bezier = "quantumVanish" })
hl.animation({ leaf = "fade",             enabled = true, speed = 1.6, bezier = "quantumMove" })
hl.animation({ leaf = "fadeDim",          enabled = true, speed = 1.6, bezier = "quantumMove" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 1.9, bezier = "quantumSnap",   style = "slidefade 25%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.8, bezier = "quantumSnap",   style = "slidevert" })
