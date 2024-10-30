return {
  {
    "isak102/telescope-git-file-history.nvim",
    dependencies = {
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
