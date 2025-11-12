return {
	"uga-rosa/translate.nvim",
	lazy = false,
	config = function()
		require("translate").setup({})

		vim.api.nvim_set_keymap("v", "<leader>p", "<cmd>Translate ru<CR>", {})
		vim.api.nvim_set_keymap("v", "<leader>pa", "<cmd>Translate en -output=replace<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>pw", "viw<cmd>Translate en -output=replace<CR><ESC>", {})
	end,
}
