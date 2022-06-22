local awful = require 'awful'
local gears = require 'gears'
local specialkeys = require 'binding.specialkeys'
local mod = specialkeys.mod

local m = {}

-- workspace
m.workspace = {}

m.workspace.buttons = gears.table.join(

    -- switch to workspace
    awful.button(
        {},
        1,
        function (w)
            w:view_only()
        end
    ),

    -- move to workspace
    awful.button(
        { mod },
        1,
        function (w)
            if client.focus then
                client.focus:move_to_tag()
            end
        end
    )

)


-- tasklist
m.tasklist = {}

m.tasklist.buttons = gears.table.join(

    awful.button(
        {},
        1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    { raise = true }
                )
            end
        end
    ),

    awful.button(
        {},
        3,
        function (c)
            awful.menu.client_list({ theme = { width = 256 }})
        end
    )

)


-- layout
m.layout = {}

m.layout.buttons = gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
)


return m