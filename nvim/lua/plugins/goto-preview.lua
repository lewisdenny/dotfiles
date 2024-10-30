return {
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    keys = {
      { "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "goto preview" },
    },
  },
}
