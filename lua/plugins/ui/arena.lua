return {
	"dzfrias/arena.nvim",
	event = "BufWinEnter",
	config = true,
	keys = {
		{ "<leader>i", "<CMD>ArenaToggle<CR>", desc = "Toggle buffers switcher", mode = { "n" } },
	},
}
