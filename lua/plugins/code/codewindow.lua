return {
	"gorbit99/codewindow.nvim",
	config = function()
		local codewindow = require("codewindow")
		codewindow.setup({
			-- screen_bounds = "background",
			window_border = "rounded",
		})
		codewindow.apply_default_keybinds()
	end,
}
