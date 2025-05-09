-- https://github.com/folke/lazy.nvim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Open Lazy with keymap rather than typing :Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- Setup lazy.nvim
require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins/lang" },
    { import = "plugins/themes" },
    { import = "plugins/git" },
    { import = "plugins/core" },
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    notify = false, -- Disabled as count is shown in Lualine
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}
