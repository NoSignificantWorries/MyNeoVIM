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
    require("config.lualine.theme1")
  end,
}
