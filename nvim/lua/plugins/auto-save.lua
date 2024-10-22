return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    keys = {
      { "<leader>ta", "ASToggle", desc = "Toggle auto-save" },
    },
    opts = {
      debounce_delay = 750,
    },
  },
}
