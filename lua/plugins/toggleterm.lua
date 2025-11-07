return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({})

    local map = vim.keymap.set

    map({ "n", "t" }, "<leader>/", "<CMD>ToggleTermToggleAll<CR>", { desc = "Toggle all terminals view" })
    map({ "n", "t" }, "<leader>t", "<CMD>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

  end,
}
