return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    keys = {
      { "<leader>ts", "ASToggle", desc = "Toggle auto-[s]ave" },
    },
    opts = {
      debounce_delay = 750,
    },
  },
}
