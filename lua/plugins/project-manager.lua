return {
	"coffebar/neovim-project",
	opts = {
		projects = {
			"~/Projects/*",
			"~/projects/*",
			"~/*",
			"~/QDotfiles/*",
			"~/Hyprdots/*",
			"~/Hyprdots/config/*",
			"~/Hyprdots_main/*",
			"~/Hyprdots_main/config/*",
			"~/.config/*",
		},
		last_session_on_startup = false,
		dashboard_mode = true,
		picker = {
			type = "snacks",
		},
	},
	init = function()
		vim.opt.sessionoptions:append("globals")
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "folke/snacks.nvim" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
