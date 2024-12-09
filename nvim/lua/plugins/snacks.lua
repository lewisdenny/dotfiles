return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    -- stylua: ignore start
    keys = {
      { "<C-t>",function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Toggle Terminal" },
          { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    },
    -- stylua: ignore end
  },
}
