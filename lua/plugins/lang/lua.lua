local function setup_lsp()
  -- Настройка LSP сервера для Lua с использованием встроенного LSP Neovim
  local lua_lsp_config = {
    name = "lua_ls",
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git", ".luarc.json", ".luarc.jsonc", ".luacheckrc" },

    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = {
            '?.lua',
            '?/init.lua',
            '?/?.lua',
            vim.fn.expand('~/.local/share/lunarvim/site/pack/packer/opt/?/init.lua')
          }
        },
        diagnostics = {
          globals = { 'vim', 'use' }
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            [vim.fn.stdpath('config') .. '/lua'] = true
          },
          maxPreload = 10000,
          checkThirdParty = false
        },
        telemetry = { enable = false },
        hint = {
          enable = true
        }
      }
    },

    single_file_support = true,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }

  vim.lsp.start(lua_lsp_config)
end

local function setup_cmp()
  local cmp = require('cmp')
  cmp.setup.buffer({
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' }
    },
  })
end

local function setup_treesitter()
  require('nvim-treesitter.config').setup({
    ensure_installed = { "lua" },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

local function setup_lang()
  setup_lsp()
  setup_cmp()
  setup_treesitter()

  vim.bo.tabstop = 2
  vim.bo.shiftwidth = 2
end

setup_lang()

