-- https://github.com/okuuva/auto-save.nvim
return {
  {
    "okuuva/auto-save.nvim",
    -- version = "*", -- Note: Not currently making new releases
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    keys = {
      { "<leader>ts", "<cmd>ASToggle<cr>", desc = "Toggle auto-[s]ave" },
    },
    opts = {
      debounce_delay = 750,
    },
  },
}
