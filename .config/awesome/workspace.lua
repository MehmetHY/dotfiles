local awful = require 'awful'
local config = require 'config'
local tag_icons = config.tag_icons

local m = {}

local function update_tag_names()
    -- trick to avoid checking global namespace
    local next = next

    for _, w in pairs(awful.screen.focused().tags) do
        local n = ""

        if next(w:clients()) ~= nil then
            n = ""
        end

        if w.selected then
            n = ""
        end

        w.name = n
    end
end

local function update_launcher_icon()
    local s = awful.screen.focused()
    local w = s.selected_tag
    s.custom_launcher.image = config.theme_dir .. "icons/" .. tag_icons[w.index] .. ".svg"
end

function m.setup(workspaces)
    m.workspaces = workspaces
end

function m.set_workspaces(s)
    awful.tag(m.workspaces, s, awful.layout.layouts[1])

    screen.connect_signal(
        "tag::history::update",
        function ()
            update_tag_names()
            update_launcher_icon()
        end
    )

    tag.connect_signal("tagged", function () update_tag_names() end)
    tag.connect_signal("untagged", function () update_tag_names() end)
end

return m