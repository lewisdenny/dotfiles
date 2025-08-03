-- LSP Plugins
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "j-hui/fidget.nvim",
    },
    event = "BufReadPost",
    opts = {
      ensure_installed = {
        "ansiblels",
        "basedpyright",
        "bashls",
        "gopls",
        "harper_ls",
        "jinja_lsp",
        "lua_ls",
        "marksman",
        "ruff",
        "vue_ls",
        "yamlls",
      },
      automatic_installation = true,
      automatic_enable = {
        exclude = {
          -- "ruff",
        },
      },
    },
  },
}
