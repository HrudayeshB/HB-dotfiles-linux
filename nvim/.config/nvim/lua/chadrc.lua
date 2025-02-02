-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
    theme = "catppuccin", -- Your chosen theme
    nvdash = {
        load_on_startup = true, -- Enable the dashboard on startup
    },
    transparency = true, -- Set transparency to true to enable it
}


return M
