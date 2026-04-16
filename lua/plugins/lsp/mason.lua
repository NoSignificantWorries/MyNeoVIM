return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"gopls",
					"rust_analyzer",
					"lemminx",
					"clangd",
					"dockerls",
					"sqlls",
					"tinymist",
					"cssls",
					"biome",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"ruff",
					-- formatters
					"stylua",
					"prettier",
					"goimports",
					"rustfmt",
					"kdlfmt",
					"nixpkgs-fmt",
					"typstfmt",
					-- linters
					"eugene",
					"luacheck",
					"gospel",
				},
				auto_update = true,
				automatic_installation = true,
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			-- "jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"debugpy",
				},
				automatic_setup = true,
				automatic_installation = true,
			})
		end,
	},
}
