return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
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
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSP серверы
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
					"vtsls",

					-- Линтеры и форматеры
					"ruff",
					"stylua",
					"prettier",
					"goimports",
					-- "kdlfmt",
					"nixpkgs-fmt",
					"eugene",
					"luacheck",
					"gospel",

					-- DAP дебаггеры
					"debugpy",
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 3000,
				debounce_hours = 168,
			})
		end,
	},
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = true,
    },
  },
}

