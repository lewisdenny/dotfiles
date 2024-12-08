-- https://github.com/diegoulloao/neofusion.nvim?tab=readme-ov-filehttps://github.com/olimorris/onedarkpro.nvim
return {
  {
    "diegoulloao/neofusion.nvim",
    enabled = false,
    priority = 1000,
    opts = {
      inverse = false,
      italic = {
        tags = true,
        keywords = true,
        comments = true,
        parameters = true,
        conditionals = true,
        virtual_text = true,
        NvimDapVirtualText = true,
      },
      bold = true,
      -- bold = {
      --   methods = true,
      --   functions = true,
      -- },
      -- colors = {
      --   onedark = {
      --     cursorline = "#ffffff",
      --     color_column = "#ffffff",
      --   },
      -- },
      overrides = {
        --Override highlight options for plugins
        -- NvimTreeFolderName = { fg = "${blue}" },
        -- NvimTreeOpenedFolderName = { fg = "#ffee72" },
        -- NvimTreeFolderIcon = { fg = "#abb2c0" },
        -- NvimTreeRootFolder = { fg = "#ffee72" },
        -- NvimTreeGitDirtyIcon = { fg = "#ffee72" },
        -- NvimTreeFolderName = { fg = "#abb2c0" },
        -- NvimTreeFileIcon = { fg = "#abb2c0" },
        -- NvimDapVirtualText overrides
        -- NvimDapVirtualText = { italic = true },
      },
    },
    config = function(_, opts)
      require("neofusion").setup(opts)
      vim.cmd "colorscheme neofusion"

      -- Set lueline
      require("lualine").setup {
        options = {
          theme = require "neofusion.lualine",
          -- rest,
        },
      }
    end,
  },
}
