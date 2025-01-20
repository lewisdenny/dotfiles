-- https://github.com/loctvl842/monokai-pro.nvim

local ikea_yellow = "#ffd800" -- Thanks Ikea

return {
  {
    "loctvl842/monokai-pro.nvim",
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      -- filetypes = {
      --   markdown = false,
      -- },

      styles = {
        tags = { italic = true },
        methods = { bold = true },
        functions = { bold = true },
        keywords = { italic = true },
        comments = { italic = true },
        parameters = { italic = true },
        conditionals = { italic = true },
        virtual_text = { italic = true },
        NvimDapVirtualText = { italic = true },
        DiagnosticHint = { italic = true },
      },
      filter = "octagon",

      -- colors = {
      --   onedark = {
      --     cursorline = "#ffffff",
      --     color_column = "#ffffff",
      --   },
      -- },

      --Override highlight options for plugins
      -- highlights = {
      --   RenderMarkdownChecked = { bg = "#282c34", fg = "#98c379" },
      --   CustomCybuFocus = { fg = ikea_yellow },
      --   CustomCybuBackground = { bg = "#282c34" },
      --   CustomCybuBorder = { bg = "#282c34" },
      --   NvimTreeOpenedFolderName = { fg = ikea_yellow },
      --   NvimTreeFolderIcon = { fg = "#abb2c0" },
      --   NvimTreeRootFolder = { fg = ikea_yellow },
      --   NvimTreeGitDirtyIcon = { fg = ikea_yellow },
      --   NvimTreeFolderName = { fg = "#abb2c0" },
      --   RainbowWhite = { fg = "${white}" },
      --   RainbowViolet = { fg = "${purple}" },
      --   RainbowBlue = { fg = "${blue}" },
      --   RainbowGreen = { fg = "${green}" },
      --   RainbowYellow = { fg = "${yellow}" },
      --   RainbowOrange = { fg = "${orange}" },
      --   RainbowRed = { fg = "${red}" },
      --   RainbowCyan = { fg = "${cyan}" },
      --   DiagnosticHint = { italic = true, bold = true },
      -- },
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd [[colorscheme monokai-pro]]

      -- Set lueline
      require("lualine").setup {
        options = { theme = "monokai-pro" },
      }
    end,
  },
}
