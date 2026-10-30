if vim.g.vscode then
	-- require("vscode-init").setup()
else
	vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	require("core.options")
	-- require("config.keymaps")
	require("core.lazy")
	-- require("plugins.lang.lua")
	-- require("config.style")

	-- require("config.autocmds")
	-- require("lsp")

	-- require("neovide").setup()
	-- vim.o.background = "light" -- or "light" for light mode
	-- vim.cmd([[colorscheme gruvbox]])
end

