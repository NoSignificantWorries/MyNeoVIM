return {
	-- 1. Основной Mason — только для установки пакетов
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
		build = ":MasonUpdate", -- Автообновление реестра
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

	-- 2. Единый установщик для ВСЕГО (LSP, линтеры, форматеры, DAP)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				-- ВСЕ тулы в одном списке (LSP + линтеры + форматеры + DAP)
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
					"rustfmt",
					"kdlfmt",
					"nixpkgs-fmt",
					"typstfmt",
					"eugene",
					"luacheck",
					"gospel",

					-- DAP дебаггеры
					"debugpy",
				},
				auto_update = true,
				run_on_start = true, -- Установит всё при старте Neovim
				start_delay = 3000, -- Задержка чтобы не тормозить запуск
				debounce_hours = 168, -- Проверять обновления раз в неделю
			})
		end,
	},
}
