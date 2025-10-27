return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "", lang = "vim" },
      input = {}, -- для input() prompt
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
      kind_icons = {},
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  keys = {
    { "<leader>n", mode = { "n" }, "<CMD>NoiceSnacks<CR>", desc = "Open notification history" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
