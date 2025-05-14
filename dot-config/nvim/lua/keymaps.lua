--  See `:help map()`

-- Helper
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Yank the contents of the current buffer
map("n", "<leader>y", "<cmd>%y+<CR>", { desc = "Yank whole file" })

-- Enter command mode with either ; or :
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Change the annoying cut behaviour but allow it via shift
map({ "n", "v" }, "d", '"_d', { noremap = true })
map({ "n", "v" }, "D", "d", { noremap = true })
map({ "n", "v" }, "x", '"_x', { noremap = true })
map({ "n", "v" }, "X", "x", { noremap = true })
map("n", "dd", '"_dd', { noremap = true })
map("n", "DD", "dd", { noremap = true })

-- Clean up open buffers
map("n", "<leader>cla", ":w <bar> %bd <bar> e# <bar> bd# <CR>", { desc = "Close all other buffers except current one" })

-- Mouse menu options
vim.cmd.amenu [[PopUp.Code\ action <Cmd>lua vim.lsp.buf.code_action()<CR>]]
vim.cmd.amenu [[PopUp.LSP\ Hover <Cmd>lua vvim.lsp.buf.hoverim.lsp.buf.hover()<CR>]]
