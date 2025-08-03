local custom_attach = require("config.lsp_utils").on_attach

return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
  end,
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
}
