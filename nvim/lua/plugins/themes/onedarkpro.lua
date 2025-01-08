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
      --Override highlight options for plugins
      highlights = {
        RenderMarkdownChecked = { bg = "#282c34", fg = "#98c379" },
        CustomCybuFocus = { fg = "#ffee72" },
        CustomCybuBackground = { bg = "#282c34" },
        CustomCybuBorder = { bg = "#282c34" },
        NvimTreeOpenedFolderName = { fg = "#ffee72" },
        NvimTreeFolderIcon = { fg = "#abb2c0" },
        NvimTreeRootFolder = { fg = "#ffee72" },
        NvimTreeGitDirtyIcon = { fg = "#ffee72" },
        NvimTreeFolderName = { fg = "#abb2c0" },
        RainbowWhite = { fg = "${white}" },
        RainbowViolet = { fg = "${purple}" },
        RainbowBlue = { fg = "${blue}" },
        RainbowGreen = { fg = "${green}" },
        RainbowYellow = { fg = "${yellow}" },
        RainbowOrange = { fg = "${orange}" },
        RainbowRed = { fg = "${red}" },
        RainbowCyan = { fg = "${cyan}" },
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
