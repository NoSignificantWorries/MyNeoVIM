return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		-- "echasnovski/mini.snippets",
		-- "xzbdmw/cmp-mini-snippets",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function(_, opts)
		local cmp = require("cmp")

		local options = opts or {}

		options.window = {
			completion = cmp.config.window.bordered({}),
			documentation = cmp.config.window.bordered({}),
		}

		options.view = {
			entries = {
				follow_cursor = true,
			},
		}

		--[[ options.snippet = {
			expand = function(args)
				local insert = require("mini.snippets").config.expand.insert or require("mini.snippets").default_insert
				insert({ body = args.body })
			end,
		} ]]

		options.snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		}

		options.mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		})

		options.sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			-- { name = "luasnip" },
			{ name = "mini.snippets" },
			{ name = "path" },
			{ name = "orgmode" },
		}, {
			{ name = "buffer" },
		})

		cmp.setup(options)

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
