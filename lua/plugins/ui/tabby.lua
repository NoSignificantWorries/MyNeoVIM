return {
  'nanozuki/tabby.nvim',
  config = function()
    require("tabby").setup({
      tabline = require("tabby.presets").tab_with_top_win,
    })
  end,
}

