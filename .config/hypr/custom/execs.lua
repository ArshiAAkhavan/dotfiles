-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Ported from the old custom/execs.conf, which is no longer loaded
-- (nothing sources .conf files anymore). Neither is in hyprland/execs.lua.
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("playerctld daemon")
end)
