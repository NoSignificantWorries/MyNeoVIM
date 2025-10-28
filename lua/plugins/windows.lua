return {
  "yorickpeterse/nvim-window",
  keys = {
    { "<C-;>", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = function()
    require("nvim-window").setup({
      border = 'rounded',
    })
  end,
}
