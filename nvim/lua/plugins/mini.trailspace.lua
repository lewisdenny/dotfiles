return {
  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<Leader>cw", "<cmd>lua MiniTrailspace.trim()<CR>", desc = "Erase Whitespace" },
    },
    opts = {},
  },
}
