return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      servers = {
        ansiblels = {},
      },
    },
  },
  { "mfussenegger/nvim-ansible", event = "VeryLazy" },
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
