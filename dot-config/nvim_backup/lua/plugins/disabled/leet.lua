-- A Neovim plugin enabling you to solve LeetCode problems.
-- https://github.com/kawre/leetcode.nvim
return {
  {
    "kawre/leetcode.nvim",
    version = "*",
    cmd = "Leet",
    dependencies = {
      -- "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "golang",
      injector = {
        ["golang"] = {
          before = "package main",
        },
      },
    },
  },
}
