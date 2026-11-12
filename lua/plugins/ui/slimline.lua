return {
	"sschleemilch/slimline.nvim",
	event = "VeryLazy",
	config = function()
		local has_opencode, opencode = pcall(require, "opencode")
		local has_bongo, bongo_cat = pcall(require, "bongo-cat")

		require("slimline").setup({
			style = "fg",
			bold = true,
			components = {
				left = {
					"mode",
					"path",
					"git",
					has_opencode and function()
					  return require("opencode").statusline()
					end or nil,
				},
				center = {},
				right = {
					"recording",
					"diagnostics",
					"filetype_lsp",
					"progress",
					has_bongo and function()
						return require("bongo-cat").get_icon() .. " "
					end or nil,
				},
			},
			components_inactive = { left = { "path" }, center = {}, right = {} },
			configs = {
				path = {
					directory = false,
					hl = {
						primary = "Label",
					},
				},
				git = {
					hl = {
						primary = "Function",
					},
				},
				filetype_lsp = {
					hl = {
						primary = "String",
					},
				},
			},
		})
	end,
}

