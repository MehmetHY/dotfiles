local gears = require 'gears'
local awful = require 'awful'
local notification = require 'notification'
local menubar = require 'menubar'
local hotkeys_popup = require("awful.hotkeys_popup").widget
local categories = require 'binding.category'
local specialkeys = require 'binding.specialkeys'
local mod = specialkeys.mod
local terminal = require('config').terminal
local config = require 'config'

local m = {}

function m.set_global_bindings()
    root.keys(m.keys)
    root.buttons(m.buttons)
end

function m.setup(menu, workspace_count, workspace_apps)
    awful.spawn('numlockx on')

    m.keys = gears.table.join(
        -- general      -----------------------------------------------------
        -- show help
        awful.key(
            { mod },
            "F1",
            hotkeys_popup.show_help,
            {
                description="show help",
                group=categories.general
            }
        ),

        -- show main menu
        awful.key(
            { mod },
            "w",
            function ()
                menu:show()
            end,
            {
                description = "show main menu",
                group = categories.general
            }
        ),

        -- reload
        awful.key(
            { mod, specialkeys.control },
            "r",
            awesome.restart,
            {
                description = "reload awesome",
                group = categories.general
            }
        ),

        -- quit
        awful.key(
            { mod, specialkeys.shift },
            "q",
            awesome.quit,
            {
                description = "quit awesome",
                group = categories.general
            }
        ),

        -- rofi
        awful.key(
            { mod }, 
            "r",
            function ()
                awful.spawn('rofi -show run')
            end,
            {
                description = "run rofi",
                group = categories.general
            }
        ),

        -- execute lua
        awful.key(
            { mod },
            "x",
            function ()
                awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().custom_prompt.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
                }
            end,
            {
                description = "lua execute prompt",
                group = categories.general
            }
        ),

        -- menubar
        awful.key(
            { mod },
            "p",
            function()
                menubar.show()
            end,
            {
                description = "show the menubar",
                group = categories.general
            }
        ),

        -- statusbar
        awful.key(
            { mod },
            "s",
            function()
                local sb = awful.screen.focused().custom_statusbar
                sb.visible = not sb.visible
            end,
            {
                description = "toggle statusbar",
                group = categories.general
            }
        ),


        -- Media        -----------------------------------------------------
        -- raise volume
        awful.key(
            {},
            specialkeys.volumeup,
            function()
                -- awful.spawn('amixer -q -D pulse sset Master 10%+')
                awful.spawn(config.volume_up_cmd)
                notification.show_volume()
            end,
            {
                description = "raise volume",
                group = categories.media
            }
        ),

        awful.key(
            {},
            specialkeys.volumedown,
            function()
                -- awful.spawn('amixer -q -D pulse sset Master 10%-')
                awful.spawn(config.volume_down_cmd)
                notification.show_volume()
            end,
            {
                description = "lower volume",
                group = categories.media
            }
        ),
        
        -- raise brightness custom
        awful.key(
            { mod },
            "F3",
            function()
                -- custom script. use 'xbacklight -inc 1' instead
                -- awful.spawn("bash -c 'backlight -a 1'")
                awful.spawn(config.brightness_up_cmd)
                notification.show_brightness()
            end,
            {
                description = "raise brightness custom script",
                group = categories.media
            }
        ),
        
        -- lower brightness custom
        awful.key(
            { mod },
            "F2",
            function()
                -- custom script. use 'xbacklight -dec 1' instead
                -- awful.spawn("bash -c 'backlight -a -1'")
                awful.spawn(config.brightness_down_cmd)
                notification.show_brightness()
            end,
            {
                description = "lower brightness custom script",
                group = categories.media
            }
        ),

        -- raise brightness intel
        awful.key(
            {},
            specialkeys.brightnessup,
            function()
                awful.spawn(config.brightness_up_cmd)
                notification.show_brightness()
            end,
            {
                description = "raise brightness",
                group = categories.media
            }
        ),
        
        -- lower brightness intel
        awful.key(
            {},
            specialkeys.brightnessdown,
            function()
                awful.spawn(config.brightness_down_cmd)
                notification.show_brightness()
            end,
            {
                description = "lower brightness",
                group = categories.media
            }
        ),


        -- workspace    -----------------------------------------------------
        -- switch left
        awful.key(
            { mod },
            specialkeys.left,
            awful.tag.viewprev,
            {
                description = "switch left",
                group = categories.workspace
            }
        ),
        
        -- switch right
        awful.key(
            { mod },
            specialkeys.right,
            awful.tag.viewnext,
            {
                description = "switch right",
                group = categories.workspace
            }
        ),

        -- switch previous
        awful.key(
            { mod },
            specialkeys.tab,
            awful.tag.history.restore,
            {
                description = "switch previous",
                group = categories.workspace
            }
        ),

        -- Window       -----------------------------------------------------
        -- focus down
        awful.key(
            { mod },
            "j",
            function ()
                awful.client.focus.bydirection('down')
            end,
            {
                description = "focus down",
                group = categories.window
            }
        ),

        -- focus up
        awful.key(
            { mod },
            "k",
            function ()
                awful.client.focus.bydirection('up')
            end,
            {
                description = "focus up",
                group = categories.window
            }
        ),

        -- focus left
        awful.key(
            { mod },
            "h",
            function ()
                awful.client.focus.bydirection('left')
            end,
            {
                description = "focus left",
                group = categories.window
            }
        ),

        -- focus right
        awful.key(
            { mod },
            "l",
            function ()
                awful.client.focus.bydirection('right')
            end,
            {
                description = "focus right",
                group = categories.window
            }
        ),

        -- swap with up
        awful.key(
            { mod, specialkeys.shift },
            "k",
            function ()
                awful.client.swap.bydirection('up')
            end,
            {
                description = "swap with up",
                group = categories.window
            }
        ),

        -- swap with down
        awful.key(
            { mod, specialkeys.shift },
            "j",
            function ()
                awful.client.swap.bydirection('down')
            end,
            {
                description = "swap with down",
                group = categories.window
            }
        ),

        -- swap with left
        awful.key(
            { mod, specialkeys.shift },
            "h",
            function ()
                awful.client.swap.bydirection('left')
            end,
            {
                description = "swap with left",
                group = categories.window
            }
        ),

        -- swap with right
        awful.key(
            { mod, specialkeys.shift },
            "l",
            function ()
                awful.client.swap.bydirection('right')
            end,
            {
                description = "swap with right",
                group = categories.window
            }
        ),

        -- switch to urgent
        awful.key(
            { mod },
            "u",
            awful.client.urgent.jumpto,
            {
                description = "jump to urgent client",
                group = categories.window
            }
        ),

        -- focus history
        awful.key(
            { specialkeys.alt },
            "Tab",
            function ()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            {
                description = "go back",
                group = categories.window
            }
        ),

        -- restore unminimized
        awful.key(
            { mod, specialkeys.control },
            "n",
            function ()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
                end
            end,
            {
                description = "restore minimized",
                group = categories.window
            }
        ),

        -- show desktop
        awful.key(
            { mod },
            "d",
            function ()
                local ws = awful.screen.focused().selected_tag

                if (ws.hidden_windows) and not (#ws.hidden_windows == 0) then
                    for _, w in pairs(ws.hidden_windows) do
                        w.minimized = false
                    end

                    ws.hidden_windows = nil
                else
                    ws.hidden_windows = {}

                    for i, w in pairs(ws:clients()) do
                        if not w.minimized then
                            w.minimized = true
                            ws.hidden_windows[i] = w
                        end
                    end
                end
            end,
            {
                description = "show desktop",
                group = categories.window
            }
        ),


        -- app          -----------------------------------------------------
        -- open terminal
        awful.key(
            { mod },
            specialkeys.enter,
            function ()
                awful.spawn(terminal)
            end,
            {
                description = "open a terminal",
                group = categories.app
            }
        ),

        -- open workspace specific app
        awful.key(
            { mod },
            'a',
            function ()
                local selected_workspace = awful.screen.focused().selected_tag

                for i, ws in pairs(awful.screen.focused().tags) do
                    if ws == selected_workspace then
                        local app = workspace_apps[i]

                        if app then
                            awful.spawn(app)
                        else
                            awful.spawn(terminal)
                        end
                    end
                end
            end,
            {
                description = "open workspace specific app",
                group = categories.app
            }
        ),

        awful.key(
            { mod },
            'c',
            function ()
                awful.spawn('codium')
            end,
            {
                description = "open VSCodium",
                group = categories.app
            }
        ),

        awful.key(
            { mod },
            'b',
            function ()
                awful.spawn('firefox')
            end,
            {
                description = "open browser",
                group = categories.app
            }
        ),

        awful.key(
            { mod },
            'e',
            function ()
                awful.spawn('krusader')
            end,
            {
                description = "open file explorer",
                group = categories.app
            }
        ),

        -- layout       -----------------------------------------------------
        -- increase master width
        awful.key(
            { mod, specialkeys.control },
            "l",
            function ()
                awful.tag.incmwfact( 0.05)
            end,
            {
                description = "increase master width factor",
                group = categories.layout
            }
        ),

        -- decrease master width
        awful.key(
            { mod, specialkeys.control },
            "h",
            function ()
                awful.tag.incmwfact(-0.05)
            end,
            {
                description = "decrease master width factor",
                group = categories.layout
            }
        )

    )

    for i = 1, workspace_count do
        local k = '#' .. i + 9

        m.keys = gears.table.join(
            m.keys,

            -- switch workspace
            awful.key(
                { mod },
                k,
                function ()
                    local s = awful.screen.focused()
                    local t = s.tags[i]

                    if t then
                        t:view_only()
                    end
                end,
                {
                    description = "switch to workspace " .. i,
                    group = categories.layout
                }
            ),

            -- move window to workspace
            awful.key(
                { mod, specialkeys.shift },
                k,
                function ()
                    local w = client.focus

                    if w then
                        local t = w.screen.tags[i]

                        if t then
                            w:move_to_tag(t)
                        end
                    end
                end,
                {
                    description = "move window to workspace " .. i,
                    group = categories.layout
                }
            )

        )
    end

    m.buttons = {}
end

return m