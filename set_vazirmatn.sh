#!/bin/bash

# install vazirmatn font
yay -S vazirmatn-fonts
fc-cache -fv

# Define Font Name
F_NAME="Vazirmatn"

# Define Specific Sizes
SZ_REG="10"   # General/Menus
SZ_SML="8"    # Smallest
SZ_TLB="9"    # Toolbars
SZ_TTL="11"   # Window Titles (Bold)

# KDE Font String Helper: Name,Size,-1,5,Weight,Italic,0,0,0,0
# Weight: 50=Regular, 75=Bold
STR_REG="$F_NAME,$SZ_REG,-1,5,50,0,0,0,0,0"
STR_SML="$F_NAME,$SZ_SML,-1,5,50,0,0,0,0,0"
STR_TLB="$F_NAME,$SZ_TLB,-1,5,50,0,0,0,0,0"
STR_TTL="$F_NAME,$SZ_TTL,-1,5,75,0,0,0,0,0" # 75 for Bold

# Detect Tool
KWC=$(command -v kwriteconfig6 || command -v kwriteconfig5)
[ -z "$KWC" ] && { echo "Error: kwriteconfig not found."; exit 1; }

# Apply Hierarchical Sizes
$KWC --file ~/.config/kdeglobals --group "General" --key "font" "$STR_REG"
$KWC --file ~/.config/kdeglobals --group "General" --key "fixed" "$STR_REG"
$KWC --file ~/.config/kdeglobals --group "General" --key "menuFont" "$STR_REG"
$KWC --file ~/.config/kdeglobals --group "General" --key "toolBarFont" "$STR_TLB"
$KWC --file ~/.config/kdeglobals --group "General" --key "smallestReadableFont" "$STR_SML"
$KWC --file ~/.config/kdeglobals --group "WM" --key "activeFont" "$STR_TTL"

# Refresh UI
dbus-send --type=signal /KDEPlatformTheme org.kde.KDEPlatformTheme.refreshConfig
echo "Vazirmatn applied with visual hierarchy!"
