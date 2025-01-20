return {
  {
    "rasulomaroff/reactive.nvim",
    event = "VeryLazy",
    enabled = false, -- Might be cool, need better colors
    config = function()
      -- require("reactive").load_preset "catppuccin-latte-cursorline"
      require("reactive").setup {
        builtin = {
          cursorline = true,
          cursor = true,
          modemsg = true,
        },
      }
    end,
  },
}
