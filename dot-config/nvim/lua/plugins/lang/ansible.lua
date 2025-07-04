return {
  -- Linter
  -- NOTE: Linting is handled by ansiblels

  -- NOTE: Ansibug is not supported by Mason yet
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mason-org/mason.nvim",
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
