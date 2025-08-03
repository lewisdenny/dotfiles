return {
  {
    "jeangiraldoo/codedocs.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>rh",
        function()
          require("codedocs").insert_docs()
        end,
        desc = "Insert a docstring",
      },
    },
  },
}
