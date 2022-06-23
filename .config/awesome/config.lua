local awful = require 'awful'
local m = {}

m.theme = "mint-dracula"
m.modkey = "Mod4"
m.terminal = "kitty"

m.editor = os.getenv("EDITOR") or "nvim"
m.editor_cmd = m.terminal .. " -e " .. m.editor

m.home = os.getenv("HOME")
m.theme_dir = awful.util.getdir("config") .. "/themes/" .. m.theme .. "/"
m.theme_file = m.theme_dir .. "theme.lua"

m.show_error_popups = true

-- Hack Nerd Font works best
m.workspaces = { "  ", "  ", "  ", "  ", "  ", "  ", "  ", " ﲵ ", "  " }
m.workspace_apps = { 'codium', 'joplin', 'okular', 'firefox', 'blender', 'inkscape', 'krusader', nil, nil }

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

return m