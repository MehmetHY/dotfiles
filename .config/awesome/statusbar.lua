local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local gears = require 'gears'
local tasklistwidget = require 'widgets.tasklist'

local m = {}

function m.setup(workspace_bindings, tasklist_bindings, layout_bindings, menu)
    m.workspace_bindings = workspace_bindings
    m.tasklist_bindings = tasklist_bindings
    m.layout_bindings = layout_bindings
    m.keyboardlayout = awful.widget.keyboardlayout()
    m.clock = awful.widget.textclock("%H:%M")
    m.clock.font = "sans bold 12"
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

    s.custom_tasklist = tasklistwidget.create(s, m.tasklist_bindings.buttons)

    -- layoutbox
    s.custom_layoutbox = awful.widget.layoutbox(s)
    s.custom_layoutbox:buttons(m.layout_bindings.buttons)

    -- wibox
    s.custom_statusbar = awful.wibar {
        screen = s,
        position = "bottom"
    }

    -- add widgets to wibox
    s.custom_statusbar:setup {
        widget = wibox.container.margin,
        left = 8,
        right = 8,
        top = 0,
        bottom = 8,
        
        {
            widget = wibox.container.background,
            bg = "#333443",
            shape = function (cr, w, h) gears.shape.rounded_rect(cr, w, h, 16) end,

            {
                widget = wibox.container.margin,
                left = 12,
                right = 16,

                {
                    layout =  wibox.layout.align.horizontal,
            
                    {
                        layout = wibox.layout.fixed.horizontal,
                        spacing = 8,
                        {
                            widget = s.custom_launcher,
                            
                        },
                        {
                            widget = s.custom_workspacelist,
                        }
                    },
            
                    
                    {
                        layout = wibox.layout.fixed.horizontal,
                        {
                            widget = wibox.container.margin,
                            right = 24
                        },
                        {
                            widget = s.custom_tasklist
                        },
                    },
                    
            
                    {
                        layout = wibox.layout.fixed.horizontal,
                        spacing = 8,
                        {
                            widget = wibox.container.margin,
                            left = 24
                        },
                        {
                            widget = m.keyboardlayout,
                        },
                        {
                            widget = wibox.container.margin,
                            top = 4,
                            bottom = 4,
                            left = 8,
                            right = 8,
                            {
                                widget = m.systray,
                            }
                        },
                        {
                            widget = m.clock,
                        },
                    }
                }
            }

        }

    }
end


return m
