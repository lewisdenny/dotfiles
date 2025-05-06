return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
  },
  event = "BufReadPre",
  keys = function(_, keys)
    local dap = require "dap"
    return {
      { "<leader>b", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
      { "<leader>B", dap.clear_breakpoints, desc = "Clear Breakpoint" },
      unpack(keys),
    }
  end,

  config = function()
    local dap, dv = require "dap", require "dap-view"

    -- Better gutter signs
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" }) --, bg='#31353f' })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" }) -- , bg='#31353f' })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" }) -- , bg='#31353f' })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapLogPoint" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

    --- Auto Toggle DAP View
    dap.listeners.before.attach["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.launch["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.event_terminated["dap-view-config"] = function()
      dv.close()
    end
    dap.listeners.before.event_exited["dap-view-config"] = function()
      dv.close()
    end
  end,
}
