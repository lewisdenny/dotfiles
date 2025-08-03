--  Display a line as the colorcolumn
return {
  "xiyaowong/virtcolumn.nvim",
  event = { "CursorMoved", "CursorMovedI" },
  opts = {
    char = "▕",
    higlight = "LineNr",
  },
  config = function()
    vim.g.virtcolumn_priority = 20 -- priority of extmark
  end,
}
