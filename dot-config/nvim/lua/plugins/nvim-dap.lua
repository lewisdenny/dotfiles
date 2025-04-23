return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
  },
  event = "VeryLazy",
  -- stylua: ignore
  keys = function(_, keys)
    local dap = require "dap"
    return {
      { "<leader>db", dap.continue, desc = "Debug: Start/Continue" },
      { "<F1>", dap.step_into, desc = "Debug: Step Into" },
      { "<leader>dc", dap.step_over, desc = "Debug: Step Over" },
      { "<F3>", dap.step_out, desc = "Debug: Step Out" },
      { "<leader>b", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
      { "<leader>dd",
        function()
          local widgets = require "dap.ui.widgets"
          widgets.centered_float(widgets.scopes, { border = "rounded" })
        end,
        desc = "Show DAP Scopes",
      },
      unpack(keys),
    }
  end,
}
