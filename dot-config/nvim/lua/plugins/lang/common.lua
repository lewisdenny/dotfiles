return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          enabled = true,
          filetypes = { "markdown" },
          settings = {
            ["harper-ls"] = {
              userDictPath = vim.fn.stdpath "config" .. "/dict.txt",
              linters = {
                SentenceCapitalization = false,
                SpellCheck = false,
                ToDoHyphen = false,
              },
              isolateEnglish = true,
            },
          },
        },
      },
    },
  },
}
