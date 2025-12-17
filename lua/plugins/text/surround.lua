return {
	"nvim-mini/mini.surround",
	event = "BufRead",
	version = false,
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",

				suffix_last = "l",
				suffix_next = "n",
			},
		})
	end,
}
