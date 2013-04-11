local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.downicon = wibox.widget.imagebox()
M.downicon:set_image(beautiful.widget_netdown)

M.upicon = wibox.widget.imagebox()
M.upicon:set_image(beautiful.widget_netup)

M.downwidget = wibox.widget.textbox()
vicious.register(M.downwidget, function(format, warg)
    local args = vicious.widgets.net(format, warg)
    -- Wireless
    if type(args['{wlp1s0 down_kb}']) ~= nil then
        args['{down}'] = args['{wlp1s0 down_kb}']
    -- Lenovo eth adapter
    elseif type(args['{enp3s0 down_kb}']) ~= nil then
        args['{down}'] = args['{enp3s0 down_kb}']
    -- Unknown
    else
        args['{down}'] = '-.-'
    end
    return args
end, "<span>${down}</span>", 1)

M.upwidget = wibox.widget.textbox()
vicious.register(M.upwidget, function(format, warg)
    local args = vicious.widgets.net(format, warg)
    -- Wireless
    if type(args['{wlp1s0 up_kb}']) ~= nil then
        args['{up}'] = args['{wlp1s0 up_kb}']
    -- Lenovo eth adapter
    elseif type(args['{enp3s0 down_kb}']) ~= nil then
        args['{up}'] = args['{enp3s0 up_kb}']
    -- Unknown
    else
        args['{up}'] = '-.-'
    end
    return args
end, "<span>${up}</span>", 1)

return M
