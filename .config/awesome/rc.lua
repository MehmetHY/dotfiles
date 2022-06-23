-- config
local c = require 'config'

-- enable auto focus
require "awful.autofocus"

-- Enable hotkeys help widget for VIM and other apps
require("awful.hotkeys_popup.keys")

-- notification
local n = require 'notification'
n.setup(c.show_error_popups)

-- theme
local t = require 'theme'
t.init(c.theme_file)

-- layout
local l = require 'layout'
l.setup(c.layouts)

-- menu
local m = require 'menu'
m.setup(c.terminal)

-- keybinding
local b = require 'binding'
b.setup(m.instance, #c.workspaces, c.workspace_apps)

-- workspace
local ws = require 'workspace'
ws.setup(c.workspaces)

-- statusbar
local sb = require 'statusbar'
sb.setup(b.statusbar.workspace, b.statusbar.tasklist, b.statusbar.layout, m.instance)

-- screen elements
local s = require 'screen'
s.setup(t.set_wallpaper, ws.set_workspaces, sb.set_statusbar)

-- window
local w = require 'window'
w.setup(b.window, t.border_radius, t.titlebar_size)

-- global bindings
b.global.set_global_bindings()