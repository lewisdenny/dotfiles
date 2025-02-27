return {
  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = { settings = { gopls = {
          completeUnimported = true,
          usePlaceholders = true,
        } } },
      },
    },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go", "gomod", "gosum", "gotmpl", "gowork" } },
  },

  -- Configure linter
  {
    "mfussenegger/nvim-lint",
    opts = { linters_by_ft = { go = { "golangcilint" } } },
  },

  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { go = { "goimports", "gofmt" } } },
  },

  -- Configure language plugins
  {
    "ray-x/go.nvim",
    enabled = false,
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup {
        -- lsp_inlay_hints = { enable = false }, -- Handled by tiny-inline.nvim
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },

  { -- show golang implements
    "maxandron/goplements.nvim",
    ft = "go",
    opts = {
      prefix = {
        interface = "implemented by: ",
        struct = "implements: ",
      },
      display_package = true,
      highlight = "Goplements",
    },
  },
}
