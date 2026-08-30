-- Ported from monitors.conf. hyprland.lua only looks for monitors.lua now, so
-- the .conf was no longer being read.
-- NOTE: nwg-displays still writes monitors.conf, NOT this file. If you use its
-- GUI you will need to hand-copy the result over here.
-- nwg-displays is a graphical tool for managing monitors.
-- - Installation for Arch Linux: sudo pacman -S nwg-displays
-- - Repo: https://github.com/nwg-piotr/nwg-displays

-- HDMI port: mirror display. To see device name, use `hyprctl monitors`
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1, mirror = "eDP-1" })

-- MONITOR CONFIG
hl.monitor({ output = "",      mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })

---------- BDONY SDSU lab ----------
--- long oled
-- -- SDSU-lab long OLED
-- hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto-up", scale = 1 })

--- samsung oled left
-- -- SDSU-lab short OLED Acer
-- hl.monitor({ output = "DP-6", mode = "2560x1440@60", position = "0x0", scale = 1 })
--
-- -- SDSU-lab rotated samsung
-- hl.monitor({ output = "DP-7", mode = "2560x1440@60", position = "-1440x-1280", scale = 1, transform = 1 })
--
-- -- Laptop (below DP-6)
-- hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "-1920x1280", scale = 1 })

--- samsung oled right
-- SDSU-lab short OLED Acer
--  ___________0_______________
-- |             +-------+
-- |             |       |
-- | +----------+|       |
-- | |          ||       |
-- | | Acer-OLD ||  SAM  |
-- | |          || SUNG  |
-- 0 +----------+|       |
-- |     +------+|       |
-- |     | eDP-1|+-------+
-- |     +------+
-- seen both descs don't know why!
-- hl.monitor({ output = "desc:Acer Technologies XZ322QU V3 2513228553W01", mode = "2560x1440@60", position = "-2560x-1440", scale = 1 })
-- hl.monitor({ output = "desc:Navatek Engineering Corporation NOVATEK", mode = "2560x1440@60", position = "-2560x-1440", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@60", position = "-2560x-1440", scale = 1 })

-- SDSU-lab rotated samsung
-- hl.monitor({ output = "desc:Samsung Electric Company LS27A800U HCRY300603", mode = "2560x1440@60", position = "0x-1965", scale = 1, transform = 3 })
-- manualy disable the duplicate samsung monitor
--- might need to change after each plug/unplug since the number changes
-- hl.monitor({ output = "DP-9", disabled = true })
-- hl.monitor({ output = "DP-6", disabled = true })

hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "-1920x0", scale = 1 })

-- hl.workspace_rule({ workspace = "1", monitor = "DP-5", default = true })
-- hl.workspace_rule({ workspace = "2", monitor = "DP-5" })
-- hl.workspace_rule({ workspace = "3", monitor = "DP-5" })
-- hl.workspace_rule({ workspace = "4", monitor = "DP-5" })
-- hl.workspace_rule({ workspace = "5", monitor = "DP-5" })
-- hl.workspace_rule({ workspace = "6", monitor = "DP-5" })
-- hl.workspace_rule({ workspace = "7", monitor = "DP-5" })
-- hl.workspace_rule({ workspace = "8", monitor = "DP-7" })
-- hl.workspace_rule({ workspace = "9", monitor = "eDP-1" })
-- hl.workspace_rule({ workspace = "0", monitor = "eDP-1" })
