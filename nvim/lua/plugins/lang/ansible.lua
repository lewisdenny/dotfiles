return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ansible-language-server" })
    end,
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
      },
    },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml" })
      end
    end,
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
