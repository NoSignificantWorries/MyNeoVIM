return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = false,
			direction = "horizontal",
			float_opts = { border = "curved", winblend = 0 },
		})

		local Terminal = require("toggleterm.terminal").Terminal

		local float_term = Terminal:new({
			direction = "float",
			hidden = true,
		})

		local function create_horizontal_term()
			local new_term = Terminal:new({
				direction = "horizontal",
				hidden = false,
				on_open = function(term)
					vim.cmd("startinsert!")
				end,
			})
			new_term:toggle()
			return new_term
		end

		vim.keymap.set({ "n", "t" }, "<localleader>t", function()
			float_term:toggle()
		end, { desc = "Toggle floating terminal" })

		vim.keymap.set(
			{ "n", "t" },
			"<localleader>j",
			"<CMD>ToggleTerm direction=horizontal<CR>",
			{ desc = "Toggle bottom terminal" }
		)

		vim.keymap.set("n", "<localleader>n", function()
			create_horizontal_term()
		end, { desc = "Create new bottom terminal" })
	end,
}
