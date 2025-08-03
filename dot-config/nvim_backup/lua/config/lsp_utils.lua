local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

function M.on_attach(client, bufnr)
  M.set_keys(client, bufnr)
  M.set_highlight(client, bufnr)
end

function M.set_keys(client, buffer)
  local map = function(keys, func, desc, mode, nowait)
    mode = mode or "n"
    nowait = nowait or false
    vim.keymap.set(mode, keys, func, { buffer = buffer, desc = "LSP: " .. desc })
  end

  -- stylua: ignore start
  map("gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition" )
  map("gD", function() Snacks.picker.lsp_declarations() end, "Goto Declaration")
  map("gr", function() Snacks.picker.lsp_references() end, "References", nil, false)
  map("gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
  map("gy", function() Snacks.picker.lsp_type_definitions() end, "Goto T[y]pe Definition")
  map("<leader>cs", function() Snacks.picker.lsp_symbols() end, "LSP Symbols")
  map("<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, "LSP Workspace Symbols")
  map("<leader>rn", vim.lsp.buf.rename, "Renames all references to the symbol under the cursor")
  -- stylua: ignore end

  -- Note: Per Client keymaps can be made
  -- if client.name == "example" then
  -- end
end

function M.set_highlight(client, buffer)
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = buffer,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = buffer,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
      end,
    })
  end
end

return M
