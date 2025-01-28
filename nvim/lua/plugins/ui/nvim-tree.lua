-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false, -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation#lazy-loading
    init = function()
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree | Explorer", silent = true })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    opts = {
      sync_root_with_cwd = false,
      update_focused_file = {
        enable = true,
        update_root = false, -- Update the root directory of the tree if the file is not under current root directory
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      git = {
        timeout = 5000,
      },
      filters = {
        git_ignored = false, -- Show ignored files
      },
      view = {
        adaptive_size = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            default = "󰈚",
            folder = {
              empty_open = "",
              open = "",
            },
            git = {
              unstaged = "",
              untracked = "U",
            },
          },
        },
      },
    },
  },
}
