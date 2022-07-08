local awful = require "awful"
local beautiful = require "beautiful"
local menubar = require "menubar"
local hotkeys_popup = require("awful.hotkeys_popup").widget

local m = {}

function m.setup(terminal)
    local favorite = {
        { "Firefox", "flatpak run org.mozilla.firefox" },
        { "VS Code", "code" },
        { "QtCreator", "qtcreator" },
        { "Arduino", "arduino" },
        { "Joplin", "joplin" },
        { "Inkscape", "inkscape" },
        { "Drawio", "drawio" },
        { "Blender", "blender" },
        { "Gimp", "gimp" },
        { "Krita", "krita" },
        { "LibreOffice", "libreoffice" },
        { "Okular", "okular" },
        { "KDE Connect", "kdeconnect-app" },
        { "Steam", "steam" }
    }
    
    local web = {
        { "Firefox", "flatpak run org.mozilla.firefox" },
        { "KDE Connect", "kdeconnect-app" }
    }

    local graphics = {
        { "Inkscape", "inkscape" },
        { "Drawio", "drawio" },
        { "Blender", "blender" },
        { "Gimp", "gimp" },
        { "Krita", "krita" }
    }

    local dev = {
        { "VS Code", "code" },
        { "QtCreator", "qtcreator" },
        { "Arduino", "arduino" }
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
            { "Favorite", favorite, beautiful.menu_icons.favorite },
            { "Development", dev, beautiful.menu_icons.development },
            { "Web", web, beautiful.menu_icons.web },
            { "Graphics", graphics, beautiful.menu_icons.graphics },
            { "Office", office, beautiful.menu_icons.office },
            { "Session", session, beautiful.menu_icons.session }
        }
    }

    menubar.utils.terminal = terminal
end

return m