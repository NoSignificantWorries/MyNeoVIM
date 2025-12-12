return {
	"praem90/db.nvim",
	config = function()
		require("db").setup({
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-telescope/telescope.nvim",
			},
			main = "db",
			opts = {
				connections = {
					{
						name = "QZ Local",
						host = "127.0.0.1",
						port = 3306,
						user = "root",
						password = "hunter2",
						database = "quartzy_development",
					},
				},
			},
			keys = {
				{
					"<leader>dbo",
					function()
						require("db").open()
					end,
					desc = "Open DB",
				},
				{
					"<leader>dbc",
					function()
						require("db").open_active_connections()
					end,
					desc = "Open Connections",
				},
				{
					"<leader>dbt",
					function()
						require("db").open_tables()
					end,
					desc = "Open Tables",
				},
				{
					"<leader>dbh",
					function()
						require("db").open_history()
					end,
					desc = "Open Tables",
				},
			},
		})
	end,
}
