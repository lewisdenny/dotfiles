--  Open/preview contents of the current file at a specific commit, without using git checkout
--  https://github.com/isak102/telescope-git-file-history.nvim

return {
  {
    "isak102/telescope-git-file-history.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "tpope/vim-fugitive",
    },
    keys = {
      {
        "<leader>gh",
        function()
          require("telescope").extensions.git_file_history.git_file_history()
        end,
        desc = "[g]it file [h]istory",
      },
    },
  },
}
