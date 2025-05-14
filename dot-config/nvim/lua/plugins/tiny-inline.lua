return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    priority = 1000, -- Needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup {
        options = {
          -- Show the source of the diagnostic.
          show_source = true,
          multilines = {
            enabled = true,
            always_show = true,
          },
          -- Use icons defined in the diagnostic configuration
          use_icons_from_diagnostic = true,
        },
      }
    end,
  },
}
