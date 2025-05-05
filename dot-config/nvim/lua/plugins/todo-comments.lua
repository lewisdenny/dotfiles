-- Highlight todo, notes, etc in comments
return {
  {
    "folke/todo-comments.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "Note" } },
        HACK = { icon = " ", color = "warning", alt = { "Hack" } },
        TODO = { icon = " ", color = "info", alt = { "Todo" } },
      },
    },
  },
}
