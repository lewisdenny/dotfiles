return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "jinja-lsp" })
    end,
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jinjalsp = {},
      },
    },
  },
}
