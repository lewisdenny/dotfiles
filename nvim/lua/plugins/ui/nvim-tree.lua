local width = 120
local height = 40
local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height

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
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true, -- Update the root directory of the tree if the file is not under current root directory
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      git = {
        timeout = 5000,
      },
      view = {
        float = {
          enable = false, -- Can't get it to look nice :/
          quit_on_focus_loss = true,
          open_win_config = {
            width = width,
            height = height,
            row = (gheight - height) * 0.4,
            col = (gwidth - width) * 0.5,
          },
        },
      },
      renderer = {
        -- root_folder_label = false,
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
