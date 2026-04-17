if vim.g.vscode then
	require("vscode-init").setup()
else
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	require("config.options")
	require("config.keymaps")
	require("config.lazy")
	-- require("plugins.lang.lua")
	require("config.style")

	vim.cmd.colorscheme("catppuccin-nvim")

	require("config.autocmds")
	require("lsp")

	require("neovide").setup()
end
