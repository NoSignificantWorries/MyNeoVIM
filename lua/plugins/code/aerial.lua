return {
	"stevearc/aerial.nvim",
	event = "BufRead",
	opts = {
		layout = { min_width = 28, default_direction = "float" },
		attach_mode = "global",
		show_guides = true,
		filter_kind = false,
		icons = {},
		keymaps = {
			["<CR>"] = "actions.jump",
			["<esc>"] = "actions.close",
			["p"] = "actions.scroll",
			["{"] = "actions.prev_up",
			["}"] = "actions.next_up",
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>a", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
		{ "<leader>A", "<cmd>AerialNavToggle<CR>", desc = "Toggle Navigation Aerial" },
	},
}
