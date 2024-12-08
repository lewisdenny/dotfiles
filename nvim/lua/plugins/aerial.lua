-- Neovim plugin for a code outline window
-- https://github.com/stevearc/aerial.nvim
return {
  "stevearc/aerial.nvim",
  enabled = false, -- NOTE: Trying trouble's <leader>cs
  lazy = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    modes = {
      symbols = {
        desc = "document symbols",
        mode = "lsp_document_symbols",
        focus = false,
        win = { position = "bottom" },
      },
    },
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
}
