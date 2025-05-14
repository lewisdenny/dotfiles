local custom_attach = require("config.lsp_utils").on_attach

return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      codeLens = {
        enable = true,
      },
      doc = {
        privateName = { "^_" },
      },
      hint = {
        enable = true,
        setType = true,
        paramType = true,
        paramName = "Enable",
        semicolon = "Enable",
        arrayIndex = "Enable",
      },
      diagnostics = {
        globals = {
          "vim",
          "Snacks",
          "it",
          "describe",
          "before_each",
          "after_each",
        },
      },
    },
  },
}
