return {
	"hedyhli/outline.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		local MiniIcons = require("mini.icons")
		MiniIcons.setup()
		MiniIcons.mock_nvim_web_devicons()

		require("outline").setup({
			preview_window = {
				winhl = "NormalFloat:",
				auto_preview = true,
				border = "rounded",
			},
			outline_items = {
				show_symbol_lineno = true,
			},
		})
	end,
	keys = { -- Example mapping to toggle outline
		{ "<leader>a", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
}
