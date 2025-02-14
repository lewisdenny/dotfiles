return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- event = "VeryLazy",
    priority = 1000, -- needs to be loaded in first
    config = function()
      -- Disable native virtual text
      vim.diagnostic.config { virtual_text = false }
      require("tiny-inline-diagnostic").setup {
        options = {
          -- Show the source of the diagnostic.
          show_source = true,
          -- Enable diagnostic message on all lines.
          multilines = true,
        },
      }
    end,
  },
  { -- Disable native virtual text
    "neovim/nvim-lspconfig",
    opts = { diagnostics = { virtual_text = false } },
  },
}
