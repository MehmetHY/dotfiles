local awful = require("awful")

local m = {}

function m.setup(layouts)
    awful.layout.layouts = layouts
end

return m