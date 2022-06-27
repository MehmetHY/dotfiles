local naughty = require 'naughty'
local awful = require 'awful'
local config = require 'config'

local m = {}

local function show_startup_errors()
    if awesome.startup_errors then
        naughty.notify{ 
            preset = naughty.config.presets.critical,
            title = "Oops, there were errors during startup!",
            text = awesome.startup_errors
        }
    end
end 

local function show_runtime_errors()
    awesome.has_unhandled_errors = false

    awesome.connect_signal(
        "debug::error",

        function (err)
            if awesome.has_unhandled_errors then
                return
            end

            awesome.has_unhandled_errors = true

            naughty.notify {
                preset = naughty.config.presets.critical,
                title = "Oops, an error happened!",
                text = tostring(err)
            }

            awesome.has_unhandled_errors = false
        end
    )
end

function m.show_volume()
    naughty.destroy_all_notifications()
    awful.spawn.easy_async(config.volume_get_cmd, function (stdout)
        naughty.notify(
            {
                title="volume",
                text=stdout,
                timeout=1
            }
        )
    end)
end

function m.show_brightness()
    naughty.destroy_all_notifications()
    awful.spawn.easy_async(config.brightness_get_cmd, function (stdout)
        naughty.notify(
            {
                title="brightness",
                text=tostring(math.floor(tonumber(stdout))),
                timeout=1
            }
        )
    end)
end

function m.setup(show_error_popups)
    if show_error_popups then
        show_startup_errors()
        show_runtime_errors()
    end
end

return m