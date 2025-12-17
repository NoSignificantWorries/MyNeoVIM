return {
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" }, -- Ensure lspconfig is available
		init = function()
			vim.g.navic_silence = true -- Suppress error messages (optional)
		end,
		config = function()
			-- Attach nvim-navic to your LSP clients manually
			local navic = require("nvim-navic")

			-- This function should be called in your LSP on_attach function
			local function on_attach(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			-- Example for setting up an LSP server with this on_attach
			-- require("lspconfig").clangd.setup({
			--   on_attach = on_attach
			-- })

			-- Set up nvim-navic with your options
			require("nvim-navic").setup({
				separator = " ",
				highlight = true,
				depth_limit = 5,
				-- You will need to define your own icons here
				icons = {
					File = "󰈙 ",
					Module = " ",
					Namespace = "󰌗 ",
					-- ... define other icons as needed
				},
				lazy_update_context = true,
			})
		end,
	},

	-- lualine integration
	{
		"nvim-lualine/lualine.nvim",
		optional = true,
		opts = function(_, opts)
			-- Check if navic is available before adding it
			local navic_ok, navic = pcall(require, "nvim-navic")
			if navic_ok and navic.is_available() then
				if not vim.g.trouble_lualine then
					table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
				end
			end
		end,
	},
}
