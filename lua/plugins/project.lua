return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      -- Здесь находятся ваши настройки. Оставьте таблицу пустой для значений по умолчанию.
      -- manual_mode = false,
      -- detection_methods = { "lsp", "pattern" },
      -- patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    })
  end,
}
