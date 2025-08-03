return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    priority = 1000, -- Needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup {
        disabled_ft = {}, -- List of filetypes to disable the plugin
        options = {
          -- Show the source of the diagnostic.
          show_source = true,
          multilines = {
            enabled = true,
            always_show = true,
          },
          -- Use icons defined in the diagnostic configuration
          use_icons_from_diagnostic = true,
          -- Set the arrow icon to the same color as the first diagnostic severity
          set_arrow_to_diag_color = true,
          -- Add messages to diagnostics when multiline diagnostics are enabled
          -- If set to false, only signs will be displayed
          add_messages = false,
          -- Display all diagnostic messages on the cursor line
          show_all_diags_on_cursorline = true,
        },
      }
    end,
  },
}
