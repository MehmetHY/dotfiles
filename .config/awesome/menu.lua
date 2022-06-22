local awful = require "awful"
local menubar = require "menubar"
local hotkeys_popup = require("awful.hotkeys_popup").widget

local m = {}

function m.setup(terminal)
    local favorite = {
        { "Firefox", "firefox" },
        { "VS Codium", "codium" },
        { "Joplin", "joplin" },
        { "Inkscape", "inkscape" },
        { "QtCreator", "qtcreator" },
        { "Blender", "blender" },
        { "Gimp", "flatpak run org.gimp.GIMP" },
        { "Krita", "krita" },
        { "Xtreme DM", "xdman"},
        { "LibreOffice", "libreoffice" },
        { "Okular", "okular" }
    }
    
    local web = {
        { "Firefox", "firefox" },
        { "Xtreme DM", "xdman"}
    }

    local graphics = {
        { "Inkscape", "inkscape" },
        { "Blender", "blender" },
        { "Gimp", "flatpak run org.gimp.GIMP" },
        { "Krita", "krita" }
    }

    local dev = {
        { "VS Codium", "codium" },
        { "QtCreator", "qtcreator" }
    }

    local office = {
        { "Joplin", "joplin" },
        { "LibreOffice", "libreoffice" },
        { "Okular", "okular" }
    }

    local session = {
        {
            "Hotkeys",
            function ()
                hotkeys_popup.show_help(nil, awful.screen.focused())
            end
        },
        { "Restart", awesome.restart },
        { 
            "Quit",
            function ()
                awesome.quit()
            end
        }
    }

    m.instance = awful.menu {
        items = {
            { "Favorite", favorite},
            { "Development", dev},
            { "Web", web },
            { "Graphics", graphics },
            { "Office", office },
            { "Session", session }
        }
    }

    menubar.utils.terminal = terminal
end

return m