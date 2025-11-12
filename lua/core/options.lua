local o = vim.o
o.cursorlineopt = "both"

--vim settings
vim.cmd("set expandtab")
vim.cmd("set smarttab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set smartindent")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("syntax on")
vim.cmd("set termguicolors")

vim.cmd("set so=8")

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
