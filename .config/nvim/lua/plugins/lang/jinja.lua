-- Add Jinja filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.jinja", "*.jinja2", "" },
  command = "set filetype=jinja",
})

return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "jinja-lsp" } },
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { jinjalsp = {} } },
  },
}
