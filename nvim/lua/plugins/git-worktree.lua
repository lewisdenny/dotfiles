return {
  "polarmutex/git-worktree.nvim",
  config = function()
    local hooks = require "git-worktree.hooks"
    hooks.register(hooks.type.SWITCH, hooks.builtins.update_current_buffer_on_switch)
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>st",
      "<cmd> lua require('telescope').extensions.git_worktree.git_worktree()<CR>",
      desc = "Telescope Open worktree list",
    },
    {
      "<leader>sT",
      "<cmd> lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
      desc = "Telescope Create worktree",
    },
  },
}
