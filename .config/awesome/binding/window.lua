local awful = require 'awful'
local gears = require 'gears'
local categories = require 'binding.category'
local specialkeys = require 'binding.specialkeys'
local mod = specialkeys.mod

local m = {}

m.keys = gears.table.join(
    -- close window
    awful.key(
        { mod },
        'q',
        function (w)
            w:kill()
        end,
        {
            description = "close window",
            group = categories.window
        }
    ),

    -- toggle fullscreen
    awful.key(
        { mod },
        'f',
        function (w)
            w.fullscreen = not w.fullscreen
        end,
        {
            description = "toggle fullscreen",
            group = categories.window
        }
    ),
    
    -- toggle maximize window
    awful.key(
        { mod },
        'm',
        function (w)
            w.maximized = not w.maximized
        end,
        {
            description = "toggle maximize window",
            group = categories.window
        }
    ),

    -- minimize window
    awful.key(
        { mod },
        'n',
        function (w)
            w.minimized = not w.minimized
        end,
        {
            description = "minimize window",
            group = categories.window
        }
    ),

    -- toggle floating
    awful.key(
        { mod },
        "space",
        function (w)
            w.floating = not w.floating
        end,
        {
            description = "toggle floating",
            group = categories.window
        }
    ),

    -- keep on top
    awful.key(
        { mod },
        't',
        function (w)
            w.ontop = not w.ontop
        end,
        {
            description = "toggle keep on top",
            group = categories.window
        }
    ),

    -- toggle titlebar
    awful.key(
        { mod, specialkeys.shift },
        't',
        function (w)
            awful.titlebar.toggle(w)
        end,
        {
            description = "toggle titlebar",
            group = categories.window
        }
    )
)

m.buttons = gears.table.join(
    -- raise
    awful.button(
        {},
        1,
        function (w)
            w:emit_signal("request::activate", "mouse_click", { raise = true })
        end
    ),

    -- move
    awful.button(
        { mod },
        1,
        function (w)
            w:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(w)
        end
    ),

    -- resize
    awful.button(
        { mod },
        3,
        function (w)
            w:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(w)
        end
    )
)


return m