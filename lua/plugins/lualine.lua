local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  hide_lsp_diagnostics = function()
    return vim.o.columns > 140
  end,
  hide_diff = function()
    return vim.o.columns > 120
  end,
  hide_line_col = function()
    return vim.o.columns > 140
  end,
  hide_cwd = function()
    return vim.o.columns > 80
  end,
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'mode',
            icon = "",
          },
          {
            "filetype",
            icon_only = true,
            colored = false,
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            cond = conditions.buffer_not_empty,
            padding = { left = 1, right = 1 },
          },
          {
            "branch",
            icon = "",
            padding = { left = 1, right = 1 },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
            cond = conditions.hide_lsp_diagnostics,
            colored = true,
            always_visible = true,
          },
        },
        lualine_x = {
          {
            function()
              return " %l  %c"
            end,
            cond = conditions.hide_line_col,
            icon = "",
          },
          {
            function ()
              local msg = ""
              -- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                if client.name == "copilot" then
                  return ""
                end
              end
              return msg
            end
          },
          {
            function()
              local msg = "No Active Lsp"
              -- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                if client.name ~= "null-ls" and client.name ~= "copilot" then
                  return (vim.o.columns > 100 and client.name) or "LSP"
                end
              end
              return msg
            end,
            icon = "󰄭 ",
            -- color = { fg = colors.lsp },
          },
        },
        lualine_y = {},
        lualine_z = {
          {
            function()
              local filepath = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              return "󰉖 " .. filepath
            end,
            cond = conditions.hide_cwd,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
