return {
  "Wansmer/langmapper.nvim",
  lazy = false,
  priority = 1,
  config = function()
    require("langmapper").setup({
      hack_keymap = true,
      map_all_ctrl = true,
    })
  end,
}
