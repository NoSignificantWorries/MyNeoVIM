return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"bash",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"javascript",
				"typescript",
				"tsx",
				"vim",
				"vimdoc",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"lua",
				"regex",
				"toml",
				"dockerfile",
				"gitignore",
				"ninja",
				"rst",
				"c",
				"rust",
				"hyprlang",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevelstart = 99
	end,
}
