if vim.g.vscode then
	-- require("vscode-init").setup()
else
	vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	require("core.options")
	require("core.keymaps")
	require("core.lazy")
	-- require("plugins.lang.lua")
	require("core.style")

	require("core.autocmds")
	-- require("lsp")

	-- require("neovide").setup()
	-- vim.o.background = "light" -- or "light" for light mode
	-- vim.cmd([[colorscheme gruvbox]])
end

