return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "yavorski/lualine-macro-recording.nvim" },
	event = "VeryLazy",
	config = function()
		require("config.lualine.custom")
	end,
}
