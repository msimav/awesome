local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.date, "%d %b, %H:%M:%S", 60)

return M
