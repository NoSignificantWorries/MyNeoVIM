-- Specofic Cursorline Number
local use_spec_number_color = true
local spec_number_color = "#ffae00"

if use_spec_number_color then
	vim.opt.cursorline = true

	vim.api.nvim_set_hl(0, "CursorLineNr", {
		fg = spec_number_color,
		bold = true,
	})
end

-- Borderline styles
-- ┌ ─ ┐ └ ─ ┘
-- ┏ ━ ┓ ┗ ━ ┛

local border_styles = {
	slim = {
		horiz = "─",
		horizup = "┴",
		horizdown = "┬",
		vert = "│",
		vertleft = "┤",
		vertright = "├",
		verthoriz = "┼",
	},
	bold = {
		horiz = "━",
		horizup = "┻",
		horizdown = "┳",
		vert = "┃",
		vertleft = "┫",
		vertright = "┣",
		verthoriz = "╋",
	},
	double = {
		horiz = "═",
		horizup = "╩",
		horizdown = "╦",
		vert = "║",
		vertleft = "╣",
		vertright = "╠",
		verthoriz = "╬",
	},
}

vim.opt.fillchars = border_styles.double

local use_spec_border_color = false
local spec_border_color = "#5de4c7"
if use_spec_border_color then
	vim.api.nvim_set_hl(0, "WinSeparator", {
		fg = spec_border_color,
		bg = "NONE",
	})
end

local signs = { Error = " ", Warn = " ", Hint = "󰛩 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = "●",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})

vim.o.winborder = "rounded"
