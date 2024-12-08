-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- [[ Setting options ]]
require "options"

-- [[ Basic Keymaps ]]
require "keymaps"

-- [[ Install `lazy.nvim` plugin manager ]]
require "lazy-bootstrap"
