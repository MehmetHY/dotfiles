local m = {}

function m.setup(menu, workspace_count, workspace_apps)
    m.global = require 'binding.global'
    m.global.setup(menu, workspace_count, workspace_apps)
    m.window = require 'binding.window'
    m.titlebar = require 'binding.titlebar'
    m.statusbar = require 'binding.statusbar'
end

return m