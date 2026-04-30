return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-mini/mini.icons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		local MiniIcons = require("mini.icons")
		MiniIcons.setup()
		MiniIcons.mock_nvim_web_devicons()

		require("barbar").setup({
			separator = { left = "", right = "" },
			auto_hide = true,
			separator_at_end = false,
		})

		vim.keymap.set("n", "<A-c>", "<CMD>BufferClose<CR>", { desc = "Close buffer" })
		vim.keymap.set("n", "<C-p>f", "<CMD>BufferPick<CR>", { desc = "Buffer picker" })
		vim.keymap.set("n", "<C-p>d", "<CMD>BufferPickDelete<CR>", { desc = "Buffer delete picker" })
	end,
}
