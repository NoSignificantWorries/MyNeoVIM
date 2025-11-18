return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,

	config = function()
		require("oil").setup({
			default_file_explorer = true,
		})
	end,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open Oil", mode = { "n" } },
	},
}
