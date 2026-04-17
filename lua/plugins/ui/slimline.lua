return {
  -- Calls `require('slimline').setup({})`
  "sschleemilch/slimline.nvim",
  event = "VeryLazy",
  config = function()
    require("slimline").setup({
      style = 'fg',
      bold = true,
      components = {
        left = {
          "mode",
          "path",
          "git"
        },
        center = {
        },
        right = {
          "recording",
          'diagnostics',
          'filetype_lsp',
          'progress',
          function()
            return require("bongo-cat").get_icon() .. " "
          end,
        }
      },
      components_inactive = {left={"path"}, center={}, right={}},
      configs = {
        path = {
          directory = false,
          hl = {
            primary = 'Label',
          },
        },
        git = {
          hl = {
            primary = 'Function',
          },
        },
        filetype_lsp = {
          hl = {
            primary = 'String',
          },
        },
      }
    })
  end,
}

