-- A collection of QoL plugins for Neovim
-- https://github.com/folke/snacks.nvim
return {
  {
    "folke/snacks.nvim",
    -- version = "*",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      scroll = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      { "<C-t>",function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Toggle Terminal" },
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>hO", function() Snacks.gitbrowse() end, mode = { "n", "v" }, desc = "Open in browser" },
      { "<leader>hb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>cab", function() Snacks.bufdelete.other() end, desc = "Close all other buffers except current one" },

    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
          Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
          Snacks.toggle.diagnostics():map "<leader>ud"
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map "<leader>uc"
          Snacks.toggle.inlay_hints():map "<leader>uh"
          Snacks.toggle.dim():map "<leader>uD"
        end,
      })
    end,
  },
}
