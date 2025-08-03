vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.jinja", "*.jinja2", "" },
  command = "set filetype=jinja",
})
