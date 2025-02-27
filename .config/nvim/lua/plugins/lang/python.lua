return {
  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          plugins = {
            jedi_completion = {
              enabled = true,
            },
            pydocstyle = {
              enabled = false,
            },
            flake8 = {
              enabled = false,
            },
            mccabe = {
              enabled = false,
            },
            pycodestyle = {
              enabled = false,
            },
          },
        },
      },
    },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },

  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { python = { "ruff_fix", "ruff_format" } } },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
      config = function()
        require("dap-python").setup "python3"
      end,
    },
  },

  -- Language plugins
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp",
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
}
