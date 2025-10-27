return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/Projects/*",
      "~/projects/*",
      "~/*",
      "~/.config/*",
    },
    last_session_on_startup = false,
    dashboard_mode = true,
    picker = {
      type = "snacks",
    }
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/snacks.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}

