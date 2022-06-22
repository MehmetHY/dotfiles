local awful = require 'awful'
local gears = require 'gears'

local m = {}

function m.get_buttons(c)

    local buttons = gears.table.join(
        awful.button(
            {},
            1,

            function()
                c:emit_signal("request::activate", "titlebar", {raise = true})
                awful.mouse.client.move(c)
            end
        ),

        awful.button(
            {},
            3,

            function()
                c:emit_signal("request::activate", "titlebar", {raise = true})
                awful.mouse.client.resize(c)
            end
        )
    )

    return buttons
end

return m