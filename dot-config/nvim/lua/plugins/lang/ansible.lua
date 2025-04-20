return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "ansible-lint" } },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { ansiblels = {} } },
  },

  -- Linter
  -- NOTE: Linting is handled by ansiblels

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "yaml" } },
  },

  -- NOTE: Ansibug is not supported by Mason yet
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
    },
    event = "VeryLazy",
    config = function()
      local dap = require "dap"
      dap.adapters.ansible = {
        type = "executable",
        command = "~/test-python/bin/python3.11",
        args = { "-m", "ansibug", "dap" },
      }
      local ansibug_configurations = {
        {
          type = "ansible",
          request = "launch",
          name = "Debug playbook",
          playbook = "${file}",
        },
      }
      dap.configurations["yaml.ansible"] = ansibug_configurations
    end,
  },
}
