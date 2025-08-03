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
  rocks = { enabled = false },
}
