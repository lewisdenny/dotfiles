local M = {}

local disable_lspfallback = { "c", "cpp" }
local disable_rangeformat = {
  "lua",
  "python", -- Breaks import formatting
}
local default_format_on_save_opts = {
  timeout_ms = 3000,
  quiet = false, -- not recommended to change
  lsp_format = "fallback", -- not recommended to change
}

function M.format(bufnr)
  --Note: Return early if formatting disabled
  if vim.g.autoformat ~= true then
    return
  end

  vim.cmd "doautocmd User ConformFormatPre"
  local new_opts = {}

  --Note: Set lsp_format = never for disable_lspfallback filetypes
  if vim.tbl_contains(disable_lspfallback, vim.bo[bufnr].filetype) then
    new_opts["lsp_format"] = "never"
  end

  --Note: Return early if not formatting with Git range
  if vim.tbl_contains(disable_rangeformat, vim.bo[bufnr].filetype) then
    local format_opts = vim.tbl_deep_extend("force", default_format_on_save_opts, new_opts)
    return format_opts
  end

  --Note: Get Git hunks, if no changes, return without formatting
  local hunks = require("gitsigns").get_hunks(bufnr)
  if hunks == nil then
    return
  end

  local format = require("conform").format

  --Note: Iterate over hunks, formtting each hunk
  local function format_range()
    if next(hunks) == nil then
      vim.cmd "doautocmd User ConformFormatPost"
      return
    end
    local hunk = nil
    while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
      hunk = table.remove(hunks)
    end

    if hunk ~= nil and hunk.type ~= "delete" then
      local start = hunk.added.start
      local last = start + hunk.added.count
      -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
      new_opts["range"] = range
      local format_opts = vim.tbl_deep_extend("force", default_format_on_save_opts, new_opts)
      format(format_opts, function()
        vim.defer_fn(function()
          format_range()
        end, 1)
      end)
    end
  end

  format_range()
end

function M.setup()
  -- The following two autocommands listen for the two events published by
  -- Conform pre and post formatting and sends a Figlet notification accordingly.
  -- >>>
  vim.api.nvim_create_autocmd("User", {
    pattern = "ConformFormatPre",
    callback = function()
      require("fidget").notify("Conform: Running Formatter", nil, { name = "conform", key = "conformid" })
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "ConformFormatPost",
    callback = function()
      require("fidget").notify("Conform: File Formatted", nil, { name = "conform", key = "conformid" })
    end,
  })
  -- <<<

  -- Toggles
  -- >>>
  -- stylua: ignore
  require("snacks").toggle.new({
      id = "format",
      name = "Format",
      get = function()
        return vim.g.autoformat
      end,
      set = function()
        if vim.g.autoformat == true then
          vim.g.autoformat = false
        else
          vim.g.autoformat = true
        end
      end,
    }):map "<leader>uf"
  -- <<<
end

return M
