local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gears = require 'gears'

local m = {}

function m.setup(workspace_bindings, tasklist_bindings, layout_bindings, menu)
    m.workspace_bindings = workspace_bindings
    m.tasklist_bindings = tasklist_bindings
    m.layout_bindings = layout_bindings
    m.keyboardlayout = awful.widget.keyboardlayout()
    m.clock = awful.widget.textclock()
    m.systray = wibox.widget.systray()
    m.menu = menu
end

function m.set_statusbar(s)
    -- launcher
    s.custom_launcher = awful.widget.launcher {
        image = beautiful.awesome_icon,
        menu = m.menu
    }

    -- prompt
    s.custom_prompt = awful.widget.prompt()

    -- workspacelist
    s.custom_workspacelist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = m.workspace_bindings.buttons
    }

    -- tasklist
    s.custom_tasklist = awful.widget.tasklist {
        screen = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = m.tasklist_bindings.buttons
    }

    -- layoutbox
    s.custom_layoutbox = awful.widget.layoutbox(s)
    s.custom_layoutbox:buttons(m.layout_bindings.buttons)

    -- wibox
    s.custom_statusbar = awful.wibar {
        screen = s,
        position = "top"
    }

    -- add widgets to wibox
    s.custom_statusbar:setup {
        layout =  wibox.layout.align.horizontal,

        -- left widgets
        {
            s.custom_launcher,

            wibox.widget.separator {
                forced_width = 36,
                shape = gears.shape.rectangle,
                opacity = 0
            },

            layout = wibox.layout.fixed.horizontal,
            s.custom_workspacelist,
            s.custom_prompt,

            wibox.widget.separator {
                forced_width = 36,
                shape = gears.shape.rectangle,
                opacity = 0
            },
        },

        
        -- middle widgets
        {
            layout = wibox.layout.flex.horizontal,
            s.custom_tasklist,
        },


        -- right widgets
        {
            layout = wibox.layout.fixed.horizontal,
            -- layout = wibox.layout.fixed.horizontal,
            wibox.widget.separator {
                forced_width = 36,
                shape = gears.shape.rectangle,
                opacity = 0
            },
            m.keyboardlayout,
            m.systray,
            m.clock,
            s.custom_layoutbox
        }
    }
end


return m
