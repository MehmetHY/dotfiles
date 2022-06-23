local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local binding = require 'binding'

local m = {}

function m.setup(w, titlebar_size)
    local buttons = binding.titlebar.get_buttons(w)

    awful.titlebar(w, { size = titlebar_size }):setup {
        layout = wibox.layout.align.horizontal,

        -- left
        -- {
        --     layout  = wibox.layout.fixed.horizontal,
        --     awful.titlebar.widget.iconwidget(w),
        --     buttons = buttons
        -- },
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

        -- middle
        {
            layout  = wibox.layout.flex.horizontal,

            {
                align = "center",
                widget = awful.titlebar.widget.titlewidget(w)
            },

            buttons = buttons
        },

        -- right
        {
            spacing = 4,
            layout = wibox.layout.fixed.horizontal(),
            -- awful.titlebar.widget.floatingbutton(w),
            -- awful.titlebar.widget.stickybutton(w),
            -- awful.titlebar.widget.ontopbutton(w)
        }
    }
end

return m