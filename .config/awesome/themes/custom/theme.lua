local gears = require 'gears'
local config = require 'config'
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local theme_path = config.theme_dir
local color = require 'themes.custom.color'

local theme = {}

-- general
theme.wallpaper = theme_path.."bg.png"
theme.awesome_icon = theme_path .. "os.svg"
theme.font          = "JetBrainsMono Nerd Font 8"

theme.bg_normal     = color.bg_normal
theme.bg_focus      = color.bg_focus
theme.bg_urgent     = color.bg_urgent
theme.bg_minimize   = color.bg_minimize
theme.bg_systray    = color.bg_normal

theme.fg_normal     = color.fg_normal
theme.fg_focus      = color.fg_focus
theme.fg_urgent     = color.fg_urgent
theme.fg_minimize   = color.fg_minimize

theme.useless_gap   = dpi(8)

theme.border_width  = dpi(2)
theme.border_normal = color.border_normal
theme.border_focus  = color.border_focus
theme.border_marked = color.highlight



-- statusbar
theme.wibar_height = dpi(24)



-- workspace
theme.taglist_font = 'JetBrainsMono Nerd Font 14'
theme.taglist_fg_focus = color.highlight
theme.taglist_fg_occupied = color.fg_focus
theme.taglist_fg_empty = color.tag_empty
theme.taglist_shape = gears.shape.rounded_rect
theme.taglist_shape_border_width_focus = dpi(2)
theme.taglist_shape_border_color_focus = color.alternative
theme.taglist_shape_border_width_urgent = dpi(2)
theme.taglist_shape_border_color_urgent = color.border_urgent
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )



-- tasklist
theme.tasklist_fg_focus = color.fg_focus
-- theme.tasklist_disable_task_name = true
theme.tasklist_shape = gears.shape.rounded_rect
-- theme.tasklist_align = 'center'
theme.tasklist_shape_border_width = dpi(2)
theme.tasklist_shape_border_color = color.border_normal
theme.tasklist_shape_border_color_focus = color.border_focus
theme.tasklist_shape_border_color_urgent = color.border_urgent



-- menu
-- theme.menu_submenu_icon = theme_path.."submenu.png"
theme.menu_submenu = "  "
theme.menu_height = dpi(32)
theme.menu_width  = dpi(160)
theme.menu_border_width = dpi(2)
theme.menu_border_color = color.fg_active



-- titlebar
theme.titlebar_bg = color.bg_normal
theme.titlebar_close_button_normal = theme_path.."titlebar/unfocus.svg"
theme.titlebar_close_button_focus = theme_path.."titlebar/close.svg"
theme.titlebar_close_button_normal_hover = theme_path.."titlebar/unfocus.svg"
theme.titlebar_close_button_focus_hover = theme_path.."titlebar/close_hover.svg"

theme.titlebar_maximized_button_normal_inactive = theme_path.."titlebar/unfocus.svg"
theme.titlebar_maximized_button_focus_inactive  = theme_path.."titlebar/maximize.svg"
theme.titlebar_maximized_button_normal_inactive_hover = theme_path.."titlebar/unfocus.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = theme_path.."titlebar/maximize_hover.svg"

theme.titlebar_maximized_button_normal_active = theme_path.."titlebar/unfocus.svg"
theme.titlebar_maximized_button_focus_active  = theme_path.."titlebar/maximize.svg"
theme.titlebar_maximized_button_normal_active_hover = theme_path.."titlebar/unfocus.svg"
theme.titlebar_maximized_button_focus_active_hover  = theme_path.."titlebar/unmaximize_hover.svg"


theme.titlebar_minimize_button_normal = theme_path.."titlebar/unfocus.svg"
theme.titlebar_minimize_button_focus  = theme_path.."titlebar/minimize.svg"
theme.titlebar_minimize_button_normal_hover = theme_path.."titlebar/unfocus.svg"
theme.titlebar_minimize_button_focus_hover  = theme_path.."titlebar/minimize_hover.svg"

-- theme.titlebar_ontop_button_normal_inactive = theme_path.."titlebar/ontop_normal_inactive.png"
-- theme.titlebar_ontop_button_focus_inactive  = theme_path.."titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_active = theme_path.."titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_active  = theme_path.."titlebar/ontop_focus_active.png"

-- theme.titlebar_sticky_button_normal_inactive = theme_path.."titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive  = theme_path.."titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active = theme_path.."titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active  = theme_path.."titlebar/sticky_focus_active.png"

-- theme.titlebar_floating_button_normal_inactive = theme_path.."titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive  = theme_path.."titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active = theme_path.."titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active  = theme_path.."titlebar/floating_focus_active.png"

-- theme.titlebar_maximized_button_normal_inactive = theme_path.."titlebar/maximized_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_inactive  = theme_path.."titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_active = theme_path.."titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_active  = theme_path.."titlebar/maximized_focus_active.png"


-- layout
theme.layout_floating  = theme_path.."layouts/floating.svg"
theme.layout_tile = theme_path.."layouts/tileright.svg"
-- theme.layout_tileleft   = theme_path.."layouts/tileleftw.svg"

-- theme.layout_fairh = theme_path.."layouts/fairhw.png"
-- theme.layout_fairv = theme_path.."layouts/fairvw.png"
-- theme.layout_floating  = theme_path.."layouts/floatingw.png"
-- theme.layout_magnifier = theme_path.."layouts/magnifierw.png"
-- theme.layout_max = theme_path.."layouts/maxw.png"
-- theme.layout_fullscreen = theme_path.."layouts/fullscreenw.png"
-- theme.layout_tilebottom = theme_path.."layouts/tilebottomw.png"
-- theme.layout_tileleft   = theme_path.."layouts/tileleftw.png"
-- theme.layout_tiletop = theme_path.."layouts/tiletopw.png"
-- theme.layout_spiral  = theme_path.."layouts/spiralw.png"
-- theme.layout_dwindle = theme_path.."layouts/dwindlew.png"
-- theme.layout_cornernw = theme_path.."layouts/cornernww.png"
-- theme.layout_cornerne = theme_path.."layouts/cornernew.png"
-- theme.layout_cornersw = theme_path.."layouts/cornersww.png"
-- theme.layout_cornerse = theme_path.."layouts/cornersew.png"


-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, theme.bg_focus, theme.fg_focus
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
