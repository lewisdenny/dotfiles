local custom_attach = require("config.lsp_utils").on_attach
return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
  end,
  settings = {
    basedpyright = {
      disableOrganizeImports = false, -- Handled by ruff in conform
      -- analysis = { typeCheckingMode = "off" },
      analysis = { typeCheckingMode = "recommended" },
    },
  },
}
