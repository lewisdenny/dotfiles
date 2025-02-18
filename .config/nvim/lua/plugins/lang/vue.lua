return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "vue-language-server" } },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue", "javascript", "typescript" } },
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },
      },
    },
  },
}
