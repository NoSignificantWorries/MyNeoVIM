return {
	"hedyhli/outline.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>a", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		preview_window = {
			winhl = "NormalFloat:",
			auto_preview = true,
			border = "rounded",
		},
		outline_items = {
			show_symbol_lineno = true,
		},
	},
}
