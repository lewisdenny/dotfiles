local custom_attach = require("config.lsp_utils").on_attach

return {
  on_attach = function(client, bufnr)
    custom_attach(client, bufnr)
  end,
  settings = {
    pylsp = {
      plugins = {
        jedi_completion = {
          enabled = true,
        },
        pydocstyle = {
          enabled = false,
        },
        flake8 = {
          enabled = false,
        },
        mccabe = {
          enabled = false,
        },
        pycodestyle = {
          enabled = false,
        },
      },
    },
  },
}
