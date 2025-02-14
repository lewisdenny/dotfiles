return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "ansible-language-server" } },
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { ansiblels = {} } },
  },

  -- Configure linter
  -- NOTE: Linting is handled by ansiblels

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "yaml" } },
  },

  { "mfussenegger/nvim-ansible", event = "VeryLazy" },

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
        command = "/Users/ldenny/test-python/bin/python3.11",
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
