local M = {}

local function load_file(path)
  local co = coroutine.running()
  vim.defer_fn(function()
    loadfile(path)()
    coroutine.resume(co)
  end, 2)
  coroutine.yield()
end

function M.start(groups)
  coroutine.wrap(function()
    for _, files in ipairs(groups) do
      for _, path in ipairs(files) do
        load_file(path)
      end
    end

    -- Create callback autocommand for any defined vim.ftplugin.<lang>
    -- for setting things per filetype. async version of after/ftplugin
    local cur_ft = vim.bo.filetype
    for ft, callback in pairs(vim.ftplugin) do
      if ft == cur_ft then
        callback()
      end
      vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        callback = callback
      })
    end
  end)()
end

return M
