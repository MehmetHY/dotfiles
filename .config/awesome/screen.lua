local awful = require 'awful'

local m = {}

function m.setup(set_wallpaper_callback, set_workspaces_callback, set_statusbar_callback)
    screen.connect_signal("property::geometry", set_wallpaper_callback)

    awful.screen.connect_for_each_screen(
        function (s)
            set_wallpaper_callback(s)
            set_workspaces_callback(s)
            set_statusbar_callback(s)
        end
    )
end

function m.set_dpi(dpi)
    local s = awful.screen.focused()
    s.dpi = dpi
end

return m