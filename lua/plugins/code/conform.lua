return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				json = { "prettier" },
				jsonc = { "prettier" },
				-- go = { "gofumpt" },
				go = { "goimports" },
			},
			formatters = {
				ruff_format = {
					prepend_args = {
						"--fix",
					},
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
