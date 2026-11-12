return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	event = "VeryLazy",
	config = function()
		local MiniIcons = require("mini.icons")
		MiniIcons.setup()
		MiniIcons.mock_nvim_web_devicons()

		require("which-key").setup({
			preset = "helix",
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
