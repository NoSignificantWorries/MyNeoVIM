return {
	"NoSignificantWorries/bongocat.nvim",
	config = function()
		require("bongo-cat").setup({
			animation_delay = 80,
		})
	end,
}
