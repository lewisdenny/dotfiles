return {
  {
    "philosofonusus/ecolog.nvim",
    dependencies = {},
    keys = {
      { "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
      { "<leader>ep", "<cmd>EcologPeek<cr>", desc = "Ecolog peek variable" },
      { "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
    },
    lazy = false, -- Lazy loading is done internally
    opts = {
      vim_env = "true",
      integrations = {
        blink_cmp = true,
      },
      -- Enables shelter mode for sensitive values
      shelter = {
        configuration = {
          partial_mode = false, -- false by default, disables partial mode, for more control check out shelter partial mode
          mask_char = "*", -- Character used for masking
        },
        modules = {
          cmp = true, -- Mask values in completion
          peek = false, -- Mask values in peek view
          files = false, -- Mask values in files
          telescope = false, -- Mask values in telescope
          telescope_previewer = false, -- Mask values in telescope preview buffers
          fzf = false, -- Mask values in fzf picker
          fzf_previewer = false, -- Mask values in fzf preview buffers
        },
      },
      -- true by default, enables built-in types (database_url, url, etc.)
      types = true,
      preferred_environment = "development", -- Optional: prioritize specific env files
      -- Controls how environment variables are extracted from code and how cmp works
      provider_patterns = true, -- true by default, when false will not check provider patterns
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "buffer" },
        providers = {
          ecolog = { name = "ecolog", module = "ecolog.integrations.cmp.blink_cmp" },
        },
      },
    },
  },
}
