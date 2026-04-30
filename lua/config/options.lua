local o = vim.o

o.cursorlineopt = "both"

--vim settings
o.expandtab = true
o.smarttab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true

o.textwidth = 120
o.wrap = true
o.linebreak = true
o.breakindent = true
o.showbreak = "↳ "

o.number = true
o.relativenumber = true
-- o.scrolloff = 20
o.so = 8
vim.cmd("set formatoptions-=cro")

vim.cmd("syntax on")
o.termguicolors = true

o.hlsearch = false
o.swapfile = false

o.laststatus = 3

if vim.g.neovide then
	o.termguicolors = true
	o.background = "dark"
	o.pumblend = 20
	o.winblend = 40
	o.wildoptions = "pum"
end

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
