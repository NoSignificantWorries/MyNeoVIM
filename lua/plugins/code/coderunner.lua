return {
	"CRAG666/code_runner.nvim",
	ft = { "python", "go", "lua" },
	dependencies = {
		"preservim/vimux",
		"akinsho/toggleterm.nvim",
	},
	config = function()
		local in_tmux = os.getenv("TMUX") ~= nil

		if in_tmux then
			my_mode = "vimux"
		else
			my_mode = "toggleterm"
		end

		require("code_runner").setup({
			mode = my_mode,
			filetype = {
				python = "python3 -u",
				go = "go run",
				lua = "lua",
			},
		})
	end,
	keys = {
		{ "<leader>rc", "<CMD>RunCode<CR>", desc = "Run code", mode = { "n" } },
	},
}
