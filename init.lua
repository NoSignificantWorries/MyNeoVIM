if vim.g.vscode then
	require("vscode-init").setup()
else
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	require("core.options")
	require("core.keymaps")
	require("config.lazy")
  require("config.colorscheme")
	--vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/.nvim-venv/bin/python3")
end
