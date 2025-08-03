local custom_attach = require("config.lsp_utils").on_attach

return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
    -- client.server_capabilities.hoverProvider = false
  end,
  settings = {
    -- Whether to register the server as capable of handling source.fixAll code actions.
    fixAll = true,
    -- Whether to register the server as capable of handling source.organizeImports code actions.
    organizeImports = true,
    -- Ruff in Conform is handling linting
    lint = {
      enable = false,
    },
  },
}
