-- NOTE: For more options, you can see `:help option-list` and :help vim.opt`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"
if vim.env.SSH_TTY then
  vim.g.clipboard = "osc52"
end

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Make tabs take up the space of four spaces
vim.opt.tabstop = 4

-- Sets how Neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Program to use for the :grep command
vim.opt.grepprg = "rg --vimgrep"

-- Minimal number of columns for the line number
-- Default: 4
vim.opt.numberwidth = 2

-- Set spell opts
vim.opt.spell = false
vim.opt.spelllang = "en_au"

--  Folding settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.fillchars:append "fold: "
vim.opt.foldlevelstart = 99 -- Open all folds by default, zm is not available

-- Imporved diff opts
vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "indent-heuristic",
  "linematch:60",
  "algorithm:histogram",
}
vim.opt.fillchars = {
  diff = "╱",
}

-- Disable the swapfile
vim.opt.swapfile = false

-- Disable line wrap
vim.opt.wrap = false

-- Enable formatting by Default
vim.g.autoformat = true
