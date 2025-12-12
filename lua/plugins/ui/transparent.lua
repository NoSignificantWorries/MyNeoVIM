return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"NormalFloat",
				"FloatBorder",
				-- остальные группы по вкусу
			},
		})
	end,
}
