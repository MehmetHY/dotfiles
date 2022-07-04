local config = require 'config'
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local theme_path = config.theme_dir
local color = require('themes.' .. config.theme .. '.color')

local theme = {}

-- general
theme.wallpaper = theme_path.."bg.png"
theme.awesome_icon = theme_path .. "icons/arch.svg"
theme.font          = "sans 10"

theme.bg_normal     = color.bg
theme.bg_focus      = color.bg
theme.bg_urgent     = color.bg
theme.bg_minimize   = color.bg
theme.bg_systray    = color.bg

theme.fg_normal     = color.fg
theme.fg_focus      = color.fg
theme.fg_urgent     = color.fg
theme.fg_minimize   = color.fg

theme.useless_gap   = dpi(4)

theme.border_radius  = dpi(16)
theme.border_width  = dpi(4)
theme.border_normal = color.bg
theme.border_focus  = color.bg
theme.border_marked = color.bg


-- statusbar
theme.wibar_height = dpi(40)
theme.wibar_bg = "#00000000"

-- workspace
theme.taglist_font = 'Hack NF 18'

-- tasklist
theme.tasklist_bg_focus = color.fg
theme.tasklist_font = "sans 10"

-- menu
theme.menu_submenu = "  "
theme.menu_height = dpi(32)
theme.menu_width  = dpi(160)
theme.menu_border_width = dpi(8)
theme.menu_border_color = color.bg
theme.menu_bg_focus = color.fg
theme.menu_fg_focus = color.bg
theme.menu_icons = {
    favorite = theme_path .. "menu/favorite.svg",
    development = theme_path .. "menu/development.svg",
    web = theme_path .. "menu/web.svg",
    graphics = theme_path .. "menu/graphics.svg",
    office = theme_path .. "menu/office.svg",
    session = theme_path .. "menu/session.svg"
}


-- titlebar
theme.titlebar_bg = color.bg
theme.titlebar_size = dpi(26)

theme.titlebar_close_button_normal = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_close_button_focus = theme_path.."icons/titlebar-button.svg"
theme.titlebar_close_button_normal_hover = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_close_button_focus_hover = theme_path.."icons/titlebar-close.svg"

theme.titlebar_maximized_button_normal_inactive = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_maximized_button_focus_inactive  = theme_path.."icons/titlebar-button.svg"
theme.titlebar_maximized_button_normal_inactive_hover = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = theme_path.."icons/titlebar-maximize.svg"

theme.titlebar_maximized_button_normal_active = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_maximized_button_focus_active  = theme_path.."icons/titlebar-button.svg"
theme.titlebar_maximized_button_normal_active_hover = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_maximized_button_focus_active_hover  = theme_path.."icons/titlebar-maximize.svg"

theme.titlebar_minimize_button_normal = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_minimize_button_focus  = theme_path.."icons/titlebar-button.svg"
theme.titlebar_minimize_button_normal_hover = theme_path.."icons/titlebar-unfocus.svg"
theme.titlebar_minimize_button_focus_hover  = theme_path.."icons/titlebar-minimize.svg"


return theme
