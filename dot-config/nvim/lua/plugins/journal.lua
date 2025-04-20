return {
  {
    "https://github.com/jakobkhansen/journal.nvim",
    cmd = "Journal",
    keys = {
      { "<leader>j", "<cmd>Journal<CR>", desc = "Open Todays [J]ournal" },
    },

    config = function()
      require("journal").setup { root = "~/Documents/journal" }
    end,
  },
}
