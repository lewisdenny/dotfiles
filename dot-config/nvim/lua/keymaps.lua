--  See `:help vim.keymap.set()`

-- Helper
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>y", "<cmd>%y+<CR>", { desc = "general yank whole file" })

-- Enter command mode with either ; or :
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Exit back to normal mode with jk chord
map("i", "jk", "<ESC>")
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Change the the annoy cut behavior but allow it via shift
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "D", "d", { noremap = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })
vim.keymap.set({ "n", "v" }, "X", "x", { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
vim.keymap.set("n", "DD", "dd", { noremap = true })

-- [[ Basic Autocommands ]]

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

vim.keymap.set("n", "<leader>cla", ":w <bar> %bd <bar> e# <bar> bd# <CR>", { desc = "Close all other buffers except current one" })
