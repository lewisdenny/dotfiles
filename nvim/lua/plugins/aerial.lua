-- https://github.com/stevearc/aerial.nvim
return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = {
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
    keys = {
      { "<leader>ta", "<cmd>AerialNavToggle<CR>", desc = "Toggle [A]erial" },
    },
  },
}
