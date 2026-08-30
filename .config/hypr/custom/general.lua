-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Ported from the old custom/general.conf, which is no longer loaded
-- (nothing sources .conf files anymore). Everything else in that file's
-- input block already matches the defaults in hyprland/general.lua.
hl.config({
    input = {
        kb_layout = "us,ir",
        kb_options = "caps:escape,grp:toggle",
        sensitivity = 0,
        special_fallthrough = true
    }
})
