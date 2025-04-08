return {
  {
    "https://github.com/jakobkhansen/journal.nvim",
    keys = {
      { "<leader>j", "<cmd>Journal<CR>", desc = "Open Todays [J]ournal" },
    },

    config = function()
      require("journal").setup { root = "~/Documents/journal" }
    end,
  },
}
