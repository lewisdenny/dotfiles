local custom_attach = require("config.lsp_utils").on_attach

return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
  end,
  --NOTE: Have to add this for yamlls to understand that we support line folding
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
  --NOTE: lazy-load schemastore when needed
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas =
      vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
  end,
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        --NOTE: Must disable built-in schemaStore support to use
        -- schemas from SchemaStore.nvim plugin
        enable = false,
        --NOTE: Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
    },
  },
}
