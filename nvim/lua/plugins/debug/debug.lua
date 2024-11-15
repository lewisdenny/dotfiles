return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  event = "VeryLazy",
  keys = function(_, keys)
    local dap = require "dap"
    -- configure nvim-dap-virtual-text
    local ok, dapvt = pcall(require, "nvim-dap-virtual-text")
    if ok and dapvt then
      dapvt.setup {
        virt_text_pos = "eol",
      }
    end
    return {
      { "<leader>db", dap.continue, desc = "Debug: Start/Continue" },
      { "<F1>", dap.step_into, desc = "Debug: Step Into" },
      { "<leader>dc", dap.step_over, desc = "Debug: Step Over" },
      { "<F3>", dap.step_out, desc = "Debug: Step Out" },
      { "<leader>b", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
      {
        "<leader>B",
        function()
          dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end,
        desc = "Debug: Set Breakpoint",
      },
      unpack(keys),
    }
  end,
}
