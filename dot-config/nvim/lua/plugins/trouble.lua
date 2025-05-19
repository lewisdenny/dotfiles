return {
  {
    "folke/trouble.nvim",
    enable = false,
    version = "*",
    opts = {
      focus = true,
      modes = {
        symbols = {
          focus = true,
          win = { position = "bottom" },
        },
      },
    },
    cmd = "Trouble",
    -- stylua: ignore
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    },
  },
}
