-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		require("markview").setup({
			preview = {
				icon_provider = "mini",
			},
		})
	end,
}
