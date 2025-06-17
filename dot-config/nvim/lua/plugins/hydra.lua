return {
  "nvimtools/hydra.nvim",
  keys = { { "<leader>db" } },
  config = function()
    local Hydra = require "hydra"
    local dap = require "dap"

    Hydra {
      name = "DEBUG",
      mode = "n",
      body = "<leader>db",
      config = {
        color = "pink",
        hint = {
          type = "window",
        },
        invoke_on_body = true,
      },

      -- stylua: ignore
      heads = {
        { "c", function() require("dap").continue() end, { desc = "Continue" } },
        { "J", function () dap.step_over() end, { desc = "Step Over" } },
        { "H", function () dap.step_out() end, { desc = "Step Out" }},
        { "L", function () dap.step_into() end, { desc = "Step Into" }},
        { "b", function () dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" } },
        { "G", function () dap.run_to_cursor() end, { desc = "Run to Cursor" } },
        { "r", function () dap.run_last() end, { desc = "Run last target" } },
        { "R", function () dap.restart() end, { desc = "Restart" } },
        { "S", function () dap.terminate() end, { desc = "Terminate DAP" } },

        { "x", nil, { exit = true, desc = "Exit" } },
      },
    }
  end,
}
