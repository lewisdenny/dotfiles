-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- https://github.com/olimorris/onedarkpro.nvim
return {
  {
    "olimorris/onedarkpro.nvim",
    -- enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      styles = {
        tags = "italic",
        methods = "bold",
        functions = "bold",
        keywords = "italic",
        comments = "italic",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "italic",
        NvimDapVirtualText = "italic",
      },
      colors = {
        onedark = {
          cursorline = "#ffffff",
          color_column = "#ffffff",
        },
      },
      highlights = {
        --Override highlight options for plugins
        -- NvimTreeFolderName = { fg = "${blue}" },
        NvimTreeOpenedFolderName = { fg = "#ffee72" },
        NvimTreeFolderIcon = { fg = "#abb2c0" },
        NvimTreeRootFolder = { fg = "#ffee72" },
        NvimTreeGitDirtyIcon = { fg = "#ffee72" },
        NvimTreeFolderName = { fg = "#abb2c0" },
        -- NvimTreeFileIcon = { fg = "#abb2c0" },
        -- NvimDapVirtualText overrides
        NvimDapVirtualText = { italic = true },
      },
    },
    config = function(_, opts)
      require("onedarkpro").setup(opts)
      vim.cmd "colorscheme onedark"

      -- Set lueline
      local custom_onedark = require "lualine.themes.onedark"
      custom_onedark.normal.a.bg = "#ffee72"
      require("lualine").setup {
        options = { theme = custom_onedark },
      }
    end,
  },
}
