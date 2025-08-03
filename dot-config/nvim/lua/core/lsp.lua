local utils = require("core.utils")

local cmd = vim.api.nvim_create_user_command

local M = {}

local methods = vim.lsp.protocol.Methods
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local auclear = vim.api.nvim_clear_autocmds
local open_floating_preview = vim.lsp.util.open_floating_preview

-- Create autocmd to handle highlight on CursorHold
function M.lsp_highlight_document(client, bufnr)
  if not client:supports_method(methods.textDocument_documentHighlight, bufnr) then
    return
  end

  local group = augroup("LspDocumentHighlight", { clear = false })

  autocmd({ "CursorHold", "CursorHoldI" }, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })

  autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })

  autocmd({ "LspDetach" }, {
    group = augroup("UserLspDetach", { clear = true }),
    callback = function(event)
      vim.lsp.buf.clear_references()
      auclear({ group = group, buffer = event.buf })
    end,
  })
end

---@param client vim.lsp.Client
---@param bufnr number
function M.lsp_code_lens_refresh(client, bufnr)
  if not client:supports_method(methods.textDocument_codeLens, bufnr) then
    return
  end

  autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })
end

function M.set_lsp_buffer_keybindings(client, bufnr)
  local fzf = require("fzf-lua")
  local map = function(keys, func, desc, mode, nowait)
    mode = mode or "n"
    nowait = nowait or false
    desc = desc or ""
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  if client:supports_method(methods.textDocument_signatureHelp) then
    map("<leader>cs", vim.lsp.buf.signature_help, "sighelp")
  end

  if client:supports_method(methods.textDocument_declaration) then
    map("gD", vim.lsp.buf.declaration)
  end

  if client:supports_method(methods.textDocument_declaration) then
    map("gd", vim.lsp.buf.definition)
  end

  map("<leader>ss", fzf.lsp_document_symbols, "Find lsp symbols (jump)")
  map("<leader>sS", fzf.lsp_live_workspace_symbols, "Find lsp workspace symbols (Jump)")
  map("<leade>sd", fzf.lsp_document_diagnostics, "Find diagnostics")
  map("<leader>sD", fzf.lsp_workspace_diagnostics, "Find workspace diagnostics")
  map("gd", fzf.lsp_definitions)
  map("gr", fzf.lsp_references)
  map("go", fzf.lsp_code_actions)
  map("gi", fzf.lsp_implementations, "lsp implementations" )
  map("gy", fzf.lsp_typedefs, "lsp type definitions" )
end

function M.override_floating_preview()
  local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
  }

  ---@diagnostic disable-next-line: duplicate-set-field
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    local max_width = math.min(math.floor(vim.o.columns * 0.7), 100)
    local max_height = math.min(math.floor(vim.o.lines * 0.3), 30)

    local default_opts = {
      max_width = max_width,
      max_height = max_height,
      border = border,
    }

    local buf, win = open_floating_preview(contents, syntax, vim.tbl_extend("force", opts or {}, default_opts), ...)

    return buf, win
  end
end

function M.get_client_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

  capabilities = vim.tbl_deep_extend("force", capabilities, {
    textDocument = {
      completion = {
        completionItem = {
          resolveSupport = {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
            },
          },
        },
      },
    },
  })
end

function M.setup_lsp_kind()
  vim.lsp.protocol.CompletionItemKind = {
    "󰉿 (Text)",
    "󰆧 (Method)",
    "󰊕 (Function)",
    " (Constructor)",
    "󰜢 (Field)",
    "󰀫 (Variable)",
    "󰠱 (Class)",
    " (Interface)",
    " (Module)",
    "󰜢 (Property)",
    "󰑭 (Unit)",
    "󰎠 (Value)",
    " (Enum)",
    "󰌋 (Keyword)",
    " (Snippet)",
    "󰏘 (Color)",
    "󰈙 (File)",
    "󰈇 (Reference)",
    "󰉋 (Folder)",
    " (EnumMember)",
    "󰏿 (Constant)",
    "󰙅 (Struct)",
    " (Event)",
    "󰆕 (Operator)",
    "  (TypeParameter)",
  }
end

function M.setup(servers)
  M.override_floating_preview()
  M.setup_lsp_kind()

  for _, server_name in ipairs(servers) do
    vim.lsp.config(server_name, {
      capabilities = M.get_client_capabilities(),
    })
  end

  autocmd({ "LspAttach" }, {
    group = augroup("UserLspAttach", {}),
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)

      if not client or not event.buf then
        return
      end

      utils.applySpec({
        M.lsp_highlight_document,
        M.lsp_code_lens_refresh,
        M.set_lsp_buffer_keybindings,
      })(client, event.buf)

      if client:supports_method("textDocument/foldingRange") then
        local win = vim.api.nvim_get_current_win()
        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      end
    end,
  })

  vim.lsp.enable(servers)
end

-- Command to fully reload all LSPs
cmd("LspReload", function()
  vim.lsp.stop_client(vim.lsp.get_clients())
  vim.cmd([[edit!]])
end, {})

return M
