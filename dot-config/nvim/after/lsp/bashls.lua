local custom_attach = require("config.lsp_utils").on_attach

return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
  end,
  settings = {
    bashIde = {
      shfmt = {
        path = "", --NOTE: Disable and let Conform format
      },
    },
  },
}
