-- Add Jinja filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.jinja", "*.jinja2", "" },
  command = "set filetype=jinja",
})

return {
  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { jinjalsp = {} } },
  },
}
