return {
	"nvim-mini/mini.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.surround").setup({
			mappings = {
				highlight_duration = 1500,

				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})

		require("mini.pairs").setup({})
		require("mini.splitjoin").setup({})
		require("mini.bracketed").setup({})
		require("mini.move").setup({})
		require("mini.trailspace").setup({})
		require("mini.ai").setup({})
		require("mini.icons").setup({})
		require("mini.files").setup({
			windows = { preview = true },
		})
	end,
	keys = {
		{ "<leader>e", "<CMD>lua MiniFiles.open()<CR>", desc = "Open mini.files" },
	},
}
