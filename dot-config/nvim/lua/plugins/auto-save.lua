vim.pack.add({ "https://github.com/okuuva/auto-save.nvim" })

local autosave = require("auto-save")

autosave.setup({
  -- start auto-save when the plugin is loaded
  enabled = true,

  -- delay after which a pending save is executed
  debounce_delay = 1000,

  -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
  debug = false,

  -- function that takes the buffer handle and determines whether to save the current buffer or not
  -- return true: if buffer is ok to be saved
  -- return false: if it's not ok to be saved
  -- if set to `nil` then no specific condition is applied
  -- Could be used to disable auto-save per project or filetype etc.
  condition = nil,
})
