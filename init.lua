if vim.g.vscode then
	require("vscode-init").setup()
else
	vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	require("config.options")
	require("config.keymaps")
	require("config.lazy")
	-- require("plugins.lang.lua")
	require("config.style")

	require("config.autocmds")
	require("lsp")

	require("neovide").setup()
end
