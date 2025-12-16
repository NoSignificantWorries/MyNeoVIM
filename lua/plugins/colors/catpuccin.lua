return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			config = function()
				require("catppuccin").setup({
					flavour = "mocha",
					transparent_background = true,
					float = {
						transparent = true,
						solid = false,
					},
					show_end_of_buffer = false,
					term_colors = true,
					dim_inactive = {
						enabled = true,
						shade = "dark",
						percentage = 0.15,
					},

					no_italic = true,
					styles = {
						functions = { "bold" },
					},
				})
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				lsp_trouble = true,
				mason = true,
				lualine = true,
				navic = { enabled = true, custom_bg = "lualine" },
				telescope = true,
				snacks = true,
				which_key = true,
				neotree = true,
				noice = true,
				flash = false,
				treesitter_context = true,
				--
				aerial = false,
				alpha = false,
				dashboard = false,
				fzf = false,
				grug_far = false,
				headlines = false,
				illuminate = false,
				indent_blankline = { enabled = false },
				leap = false,
				mini = false,
				neotest = false,
				notify = false,
			},
		},
	},
}
