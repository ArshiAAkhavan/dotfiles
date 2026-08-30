-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Ported from the old custom/rules.conf, which is no longer loaded
-- (nothing sources .conf files anymore).
-- `workspace = special:special, gapsout:30` is omitted here: hyprland/rules.lua
-- already has hl.workspace_rule({ workspace = "special:special", gaps_out = 30 }).

-- ######## Window rules ########
hl.window_rule({ match = { class = "^(floatterm)$" }, float = true })
hl.window_rule({ match = { class = "^(floatterm)$" }, center = true })
hl.window_rule({ match = { class = "^(aichat)$" },    float = true })
hl.window_rule({ match = { class = "^(aichat)$" },    center = true })

-- ######## Workspace rules ########
hl.workspace_rule({
    workspace = "special:floatterm",
    on_created_empty = "[floating] alacritty --class floatterm"
})
-- on_created_empty = "[floating] zen-browser --new-window 'https://gemini.google.com/u/1'"
hl.workspace_rule({
    workspace = "special:aichat",
    on_created_empty = "[floating] zen-browser --new-window 'https://chatgpt.com/'"
})
