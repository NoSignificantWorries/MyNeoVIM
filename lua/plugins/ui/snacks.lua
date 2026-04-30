return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	-- event = "VimEnter",
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		picker = {
			enabled = true,
			layout = {
				preset = "vscode",
			},
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					auto_close = true,
					layout = { preset = "sidebar", preview = true },
				},
			},
		},
		dashboard = {
			enabled = true,
			preset = {

        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          -- { icon = "󰈭 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          -- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "p", desc = "Open Project", action = ":NeovimProjectHistory" },
          { icon = " ", key = "d", desc = "Open Projects Discoverer", action = ":NeovimProjectDiscover" },
          { icon = "󰖬 ", key = "w", desc = "Open Wiki main page", action = ":WikiIndex" },
          -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          -- { icon = " ", key = "k", desc = "Keymaps", action = ":lua Snacks.picker.keymaps()" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },

				header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			},
			sections = {
				-- { section = "header" },
				{
					section = "terminal",
					-- cmd = "jp2a --colors --color-depth=24 --size=60x30 ~/.config/nvim/assets/vim-logo.png; sleep .1",
					cmd = "~/.config/nvim/logo.sh; sleep .1",
					height = 3,
					padding = 2,
					gap = 1,
					indent = 25,
				},
				{ section = "keys", gap = 1, padding = 3 },
				-- { pane = 2, section = "keys", gap = 1, padding = 1 },
				{ section = "startup", icon = "" },
			},
		},
		explorer = {
			enabled = true,
		},
		image = { enabled = true },
		indent = { enabled = false },
		quickfile = { enabled = true },
		input = { enabled = false },
		notifier = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = false, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
		},
		words = { enabled = true },
		lazygit = { enabled = true },
	},
	config = function(_, opt)
		require("snacks").setup(opt)
		vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#89dceb", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#45475a", italic = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#6c7086" })
		vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = "#b4befe", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#585b70", bold = false })
	end,
	keys = {
		{
			"<leader>e",
			function()
				Snacks.picker.explorer({
					auto_close = true,
					layout = {
						preset = "select",
						layout = {
							width = 0.25,
							height = 0.7,
						},
					},
				})
			end,
			desc = "Toggle explorer",
		},
		{
			"<leader>u",
			function()
				Snacks.picker.explorer()
			end,
			desc = "Toggle explorer",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit()
			end,
			desc = "Open lazygit",
		},
		-- Find
		{
			"<leader><leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader><leader>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{ "<leader>fp", "<CMD>NeovimProjectHistory<CR>", desc = "Projects history" },
		{ "<leader>fP", "<CMD>NeovimProjectDiscover<CR>", desc = "Projects" },
		-- Search
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		-- Grep
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
}
