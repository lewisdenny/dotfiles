vim.pack.add {
  "https://github.com/rmagatti/auto-session",
}

require("auto-session").setup {
  enabled = true,
  auto_save = true,
  auto_restore = true,
  session_lens = { load_on_setup = false },
  auto_create = function()
    local cmd = 'git rev-parse --is-inside-work-tree'
    return vim.fn.system(cmd) == 'true\n'
  end,
  suppressed_dirs = { "/", "~", "/tmp/" }, -- Suppress session restore/create in certain directories
  auto_restore_last_session = false,
  lazy_support = false,
  log_level = "info",
  bypass_save_filetypes = {
    "checkhealth",
    "help",
    "netrw",
    "lazy",
    "mason",
    "oil",
    "netrw",
    "NvimTree",
    "lspinfo",
    "git",
    "notify",
    "query",
  },
}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- require('lualine').setup{
--   options = {
--     theme = 'tokyonight',
--   },
--   sections = {
--     lualine_c = {
--       function()
--         return require('auto-session.lib').current_session_name(true)
--       end
--     }
--   }
-- }
