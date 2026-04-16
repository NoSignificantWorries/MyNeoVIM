return {
	"Bekaboo/dropbar.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-mini/mini.icons",
		build = "make",
	},
	config = function()
		local MiniIcons = require("mini.icons")
		MiniIcons.setup()
		MiniIcons.mock_nvim_web_devicons()

		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
	end,
}
