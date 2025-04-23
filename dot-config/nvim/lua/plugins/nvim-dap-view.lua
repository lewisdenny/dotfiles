return {
  {
    "igorlfs/nvim-dap-view",
    event = "VeryLazy",
    keys = {
      {
        "<leader>dv",
        function()
          require("dap-view").toggle()
        end,
        desc = "Toggle nvim-dap-view",
      },
    },
    opts = { winbar = { default_section = "repl" } },
  },
}
