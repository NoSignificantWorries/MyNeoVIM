return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_installation = false,
    })

    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    end

  end,
}
