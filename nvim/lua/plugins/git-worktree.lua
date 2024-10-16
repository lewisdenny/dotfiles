return {
  "polarmutex/git-worktree.nvim",
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
