return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
  },
  event = "BufReadPre",
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
    -- dap.listeners.after.event_initialized["dap-view-close-console"] = function(session)
    --   session.on_close["custom.terminal-autoclose"] = function()
    --     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    --       local bufname = vim.api.nvim_buf_get_name(buf)
    --       if bufname:find "%[dap%-terminal%]" then
    --         vim.api.nvim_buf_delete(buf, { force = true })
    --       end
    --     end
    --   end
    -- end

    -- Restore session breakpoints
    -- vim.api.nvim_create_autocmd("SessionLoadPost", {
    --   callback = function()
    --     require("lib.dap").load_breakpoints()
    --   end,
    -- })
  end,
}
