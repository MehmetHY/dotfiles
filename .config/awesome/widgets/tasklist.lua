local awful = require 'awful'
local wibox = require 'wibox'

local m = {}

function m.create(screen, mouse_bindings)
    local w = awful.widget.tasklist {
        screen = screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = mouse_bindings,
        layout = {
            spacing = 24,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            layout = wibox.layout.align.vertical,
            expand = "none",

            {
                widget = wibox.container.margin
            },

            {
                id = "text_role",
                widget = wibox.widget.textbox,
            },
            {
                layout = wibox.layout.fixed.vertical,
                {
                    wibox.widget.base.make_widget(),
                    forced_height = 2,
                    id            = 'background_role',
                    widget        = wibox.container.background
                },
                {
                    widget = wibox.container.margin,
                    top = 8
                }
            }
        }
    }

    return w
end

return m