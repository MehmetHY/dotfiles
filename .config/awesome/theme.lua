local beautiful = require 'beautiful'
local gears = require 'gears'

local m = {}

function m.init(theme_file)
    beautiful.init(theme_file)
end

function m.set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

return m