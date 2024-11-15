-- Highlight todo, notes, etc in comments
-- https://github.com/folke/todo-comments.nvim
-- TODO: Test
-- HACK: Test
-- NOTE: test
-- WARN: test
-- PERF: test
-- TEST: test
-- FIX: test
-- BUG: test
-- ISSUE: test
return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
  },
}
