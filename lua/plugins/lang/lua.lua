return {
  treesitter_parsers = { "lua" },

  lsp_servers = {
    {
      "lua_ls",
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      }
    }
  },

  formatters = { "stylua" },
  linters = {},

  extra = function()
  end
}

