local awful = require 'awful'

local m = {}

function m.setup(workspaces)
    m.workspaces = workspaces
end

function m.set_workspaces(s)
    awful.tag(m.workspaces, s, awful.layout.layouts[1])
end

return m