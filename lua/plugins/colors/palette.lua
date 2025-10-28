return {
  "roobert/palette.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    custom_theme = require("config.palette.test")
    require("palette").setup(custom_theme)
  end,
}
