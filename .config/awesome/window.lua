local awful = require 'awful'
local gears = require 'gears'
local titlebar = require 'titlebar'
local beautiful = require 'beautiful'

local m = {}

local function setup_rules(window_bindings)
    awful.rules.rules = {
        {
            rule = {},
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = window_bindings.keys,
                buttons = window_bindings.buttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                titlebars_enabled = true
            }
        }
    }
end

local function prevent_offscreen(w)
    if awesome.startup
      and not w.size_hints.user_position
      and not w.size_hints.program_position then
        -- prevent from being placed out of boundaries
        awful.placement.no_offscreen(w)
    end
end


local function setup_signals(titlebar_size)
    client.connect_signal(
        "manage",
        function (w)
            prevent_offscreen(w)
            awful.titlebar.hide(w)

            w.shape = function (cario, width, height)
                gears.shape.rounded_rect(cario, width, height, m.border_radius)
            end
        end
    )

    client.connect_signal(
        "request::titlebars",
        function(w)
            titlebar.setup(w, titlebar_size)
        end
    )

    -- Enable sloppy focus, so that focus follows mouse.
    client.connect_signal("mouse::enter", function(w)
        w:emit_signal("request::activate", "mouse_enter", {raise = false})
    end)

    client.connect_signal("focus", function(w) w.border_color = beautiful.border_focus end)
    client.connect_signal("unfocus", function(w) w.border_color = beautiful.border_normal end)
end


function m.setup(window_bindings, border_radius, titlebar_size)
    m.border_radius = border_radius
    setup_rules(window_bindings)
    setup_signals(titlebar_size)
end

return m