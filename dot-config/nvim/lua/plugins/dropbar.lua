return {
  "Bekaboo/dropbar.nvim",
  lazy = false, -- lazy loading is done in this plugin
  dependencies = {
    -- "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    local dropbar_api = require "dropbar.api"
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
    vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
    vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  end,
}
