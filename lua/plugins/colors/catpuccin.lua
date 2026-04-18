return {
	{
		"catppuccin/nvim",
		lazy = false, -- ← Меняем на false, чтобы тема загрузилась сразу
		name = "catppuccin",
		priority = 1000, -- ← Добавляем приоритет для загрузки до других плагинов
		opts = {
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
				solid = false,
			},
			show_end_of_buffer = false,
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = true,
			styles = {
				functions = { "bold" },
			},
			color_overrides = {
				mocha = {
					base = "#16161e",
					mantle = "#13131a",
				},
			},
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			integrations = {
				cmp = false,
				gitsigns = false,
				lsp_trouble = false,
				mason = false,
				lualine = false,
				navic = { enabled = false, custom_bg = "lualine" },
				telescope = false,
				snacks = false,
				which_key = false,
				neotree = false,
				noice = false,
				flash = false,
				treesitter_context = false,
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
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
