return {
  -- LSP
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

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go", "gomod", "gosum", "gotmpl", "gowork" } },
  },

  -- FIX: golangcilint isn't working and throwing error codes :/
  -- Linter
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = { linters_by_ft = { go = { "golangcilint" } } },
  -- },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { go = { "goimports", "gofumpt" } } },
  },

  -- DAP
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },

  -- Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        dependencies = { "leoluz/nvim-dap-go" },
      },
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },

  -- Configure language plugins

  -- {
  --   "ray-x/go.nvim",
  --   enabled = true,
  --   dependencies = {
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup {}
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()',
  -- },

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
