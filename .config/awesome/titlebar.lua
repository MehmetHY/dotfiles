local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local binding = require 'binding'

local m = {}

function m.setup(w, titlebar_size)
    local buttons = binding.titlebar.get_buttons(w)

    awful.titlebar(w, { size = titlebar_size }):setup {
        layout = wibox.layout.align.horizontal,

        {
            layout  = wibox.layout.fixed.horizontal,
            wibox.widget.separator {
                forced_width = 4,
                shape = gears.shape.rectangle,
                opacity = 0
            },
            awful.titlebar.widget.closebutton(w),
            awful.titlebar.widget.maximizedbutton(w),
            awful.titlebar.widget.minimizebutton(w)
        },

        {
            layout  = wibox.layout.flex.horizontal,

            {
                align = "center",
                widget = awful.titlebar.widget.titlewidget(w)
            },

            buttons = buttons
        }
    }
end

return m