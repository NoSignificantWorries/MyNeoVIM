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
        width = 30,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = true,
              use_snacks_image = true,
              title = 'Neo-tree Preview',
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
          last_indent_marker = "└─",
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander"
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "",
            renamed = "➜",
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        commands = {
        },
      },
    })
  end,
  keys = {
    { "<leader>e", "<CMD>Neotree left toggle focus<CR>", desc = "Toggle sidebar neo-tree", mode = { "n" } },
    { "<leader>o", "<CMD>Neotree float show<CR>", desc = "Open floating neo-tree", mode = { "n" } },
    { "<localleader>e", "<CMD>Neotree focus<CR>", desc = "Toggle sidebar neo-tree", mode = { "n" } },
  },
}
