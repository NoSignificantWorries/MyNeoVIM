local M = {}

M.specs = {
  { import = "plugins.lang.lua" },
  -- { import = "plugins.lang.typescript" },
  -- { import = "plugins.lang.python" },
}

function M.setup_all()
  local all_parsers = {}
  local all_servers = {}
  local all_formatters = {}

  for _, lang_spec in ipairs(M.specs) do
    local lang = require(lang_spec.import:gsub("^plugins%.lang%.", ""))

    if lang.treesitter_parsers then
      vim.list_extend(all_parsers, lang.treesitter_parsers)
    end

    if lang.lsp_servers then
      for _, server in ipairs(lang.lsp_servers) do
        table.insert(all_servers, server)
      end
    end

    if lang.formatters then
      vim.list_extend(all_formatters, lang.formatters)
    end

    if lang.extra then
      lang.extra()
    end
  end

  require("nvim-treesitter.configs").setup({ ensure_installed = all_parsers })
end

return M
