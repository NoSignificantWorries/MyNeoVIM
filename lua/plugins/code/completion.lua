return {
	"saghen/blink.cmp",
	version = "*",
	build = "cargo build --release",
	config = function()
		require("blink.cmp").setup({
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = {},
				["<C-p>"] = {},
				["<Tab>"] = {},
				["<S-Tab>"] = {},
				["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-n>"] = { "select_and_accept" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_down", "fallback" },
				["<C-f>"] = { "scroll_documentation_up", "fallback" },
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
				-- ["<C-e>"] = { "hide" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},

			cmdline = {
				completion = {
					menu = {
						auto_show = true,
					},
				},
				keymap = {
					preset = "inherit",
					["<CR>"] = { "fallback" },
					["<Tab>"] = { "accept", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
				},
				default = { "cmdline", "path" },
			},

			sources = {
				providers = {
					lsp = { name = "lsp", module = "blink.cmp.sources.lsp" },
					buffer = { name = "buffer", module = "blink.cmp.sources.buffer" },
					path = {
						name = "path",
						module = "blink.cmp.sources.path",
						opts = {
							show_hidden_files_by_default = true,
						},
					},
					snippets = { name = "snippets", module = "blink.cmp.sources.snippets" },
				},
				default = { "lsp", "snippets", "path", "buffer" },
			},
		})
	end,
}
