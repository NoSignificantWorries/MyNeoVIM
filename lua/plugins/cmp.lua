return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function(_, opts)
    -- Load and setup cmp inside the config function
    local cmp = require("cmp")

    -- Start with default options if any are provided, or create a new table
    local options = opts or {}

    -- Set up window styling with borders
    options.window = {
      completion = cmp.config.window.bordered({
        -- Optional: you can add specific border characters here
        -- border = "single"
      }),
      documentation = cmp.config.window.bordered({
        -- border = "single"
      }),
    }

    -- Configure the completion view
    options.view = {
      entries = {
        follow_cursor = true,
      },
    }

    -- Configure snippet expansion
    options.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }

    -- Set up key mappings
    options.mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    })

    -- Configure completion sources
    options.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "orgmode" }, -- Add the orgmode source here
    }, {
        { name = "buffer" },
      })

    -- Apply the main setup
    cmp.setup(options)

    -- Command-line configurations (remain the same)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
          { name = "cmdline" }
        })
    })
  end,
}

--[[ return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  opts = function(_, opts)
    table.insert(opts.sources, {
    })
    local cmp = require("cmp")
    opts.window = {
      completion = cmp.config.window.bordered({}),
      documentation = cmp.config.window.bordered({}),
    }
    opts.view = {
      entries = {
        follow_cursor = true,
      },
    }
  end,

  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "orgmode" },
      }, {
          { name = "buffer" },
        }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
          { name = "cmdline" }
        })
    })
  end,
} ]]
