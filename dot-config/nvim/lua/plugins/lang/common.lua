return {
  -- Ensure tools are installed
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "harper-ls" } },
  },

  -- esting the hapar thing tho
  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          enabled = false,
          -- filetypes = { "markdown" },
          settings = {
            ["harper-ls"] = {
              linters = {
                ToDoHyphen = false,
                SentenceCapitalization = true,
                SpellCheck = true,
              },
              isolateEnglish = true,
            },
          },
        },
      },
    },
  },
}
