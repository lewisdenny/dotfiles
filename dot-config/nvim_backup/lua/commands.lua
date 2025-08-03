-- local lsp_utils = require "config/lsp_utils"

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(event)
--     local bufnr = event.buf
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--
--     if client then
--       lsp_utils.on_attach(client, bufnr)
--     end
--   end,
-- })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Custom Redir command to redirect command output to a buffer
-- `Redir lua= require 'lazy.core.config'`
vim.api.nvim_create_user_command("Redir", function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), "\n", { plain = true })
  vim.cmd "new"
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = "+", complete = "command" })
