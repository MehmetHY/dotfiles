local awful = require 'awful'
local m = {}

m.theme = "minipiva"
m.modkey = "Mod4"
m.terminal = "kitty"

m.editor = os.getenv("EDITOR") or "nvim"
m.editor_cmd = m.terminal .. " -e " .. m.editor

m.home = os.getenv("HOME")
m.theme_dir = awful.util.getdir("config") .. "/themes/" .. m.theme .. "/"
m.theme_file = m.theme_dir .. "theme.lua"

m.show_error_popups = true

-- works best with Hack Nerd Font
-- m.workspaces = { "  ", "  ", "  ", "  ", " ﲵ ", "  ", "  ", "  ", "  " }
m.workspaces = { "", "", "", "", "", "", "", "", "" }
m.workspace_apps = { 'code', 'joplin', 'okular', 'flatpak run org.mozilla.firefox', nil, 'inkscape', 'blender', 'ranger', 'steam' }
-- icons/<your icon>.svg
m.tag_icons = { 'dev', 'note', 'book', 'web', "console", '2d', '3d', 'explorer', 'game' }

m.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

m.volume_up_cmd = 'sh -c "pamixer -i 5"'
m.volume_down_cmd = 'sh -c "pamixer -d 5"'
m.volume_get_cmd = 'sh -c "pamixer --get-volume-human"'

-- m.brightness_up_cmd = "xbacklight -inc 1"
-- m.brightness_down_cmd = "xbacklight -dec 1"
-- m.brightness_get_cmd = "xbacklight -get"
m.brightness_get_cmd = 'sh -c "xbacklight -get"'
m.brightness_up_cmd = 'sh -c "xbacklight -inc 1"'
m.brightness_down_cmd = 'sh -c "xbacklight -dec 1"'

return m