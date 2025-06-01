-- Highlight todo, notes, etc in comments
return {
  {
    "folke/todo-comments.nvim",
    version = false, -- Note: Old release
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- stylua: ignore
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
      { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
    opts = {
      keywords = {
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "Note" } },
        HACK = { icon = " ", color = "warning", alt = { "Hack" } },
        TODO = { icon = " ", color = "info", alt = { "Todo" } },
      },
    },
  },
}
