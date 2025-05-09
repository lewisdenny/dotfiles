-- A Neovim lua plugin to help easily manage multiple terminal windows
return {
  "https://github.com/akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<C-g>",
      function()
        vim.cmd.ToggleTerm()
      end,
      mode = { "n", "t" },
    },
  },
  opts = {
    direction = "float",
    on_open = function(term)
      local bufnr = vim.api.nvim_win_get_buf(term.window)
      local buf_line_count = vim.api.nvim_buf_line_count(bufnr)
      local last_visible_line = vim.fn.line("w$", term.window)
      if last_visible_line == buf_line_count then
        vim.schedule(function()
          vim.cmd.startinsert()
        end)
      end
    end,
  },
}
