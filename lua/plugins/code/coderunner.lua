return {
	"CRAG666/code_runner.nvim",
	dependencies = {
		"CRAG666/betterTerm.nvim",
		"preservim/vimux",
	},
	config = function()
		require("code_runner").setup({
			mode = "vimux",
			filetype = {
				python = "python3 -u",
			},
		})
	end,
}
