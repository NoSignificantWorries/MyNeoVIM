return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons",
    'nvim-mini/mini.icons',
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
              -- use_image_nvim = true,
              -- use_snacks_image = true,
              -- title = 'Neo-tree Preview',
            },
          },
        }
      },

			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "╰─",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					follow_current_file = {
						enabled = true,
					},
					use_libuv_file_watcher = true,
				},
			},
		})
	end,
}
