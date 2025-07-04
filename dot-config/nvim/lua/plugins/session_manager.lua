-- A simple wrapper around :mksession
-- https://github.com/Shatur/neovim-session-manager
return {
  "Shatur/neovim-session-manager",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local config = require "session_manager.config"
    vim.keymap.set("n", "<leader>sl", "<cmd>SessionManager load_session<CR>", { desc = "[S]earch Session manager [L]oad" })
    require("session_manager").setup {
      autoload_mode = { config.AutoloadMode.GitSession, config.AutoloadMode.CurrentDir, config.AutoloadMode.Disabled },
      autosave_ignore_dirs = { "/", "~", "/tmp/" },
      autosave_ignore_filetypes = {
        "checkhealth",
        "help",
        "netrw",
        "lazy",
        "mason",
        "oil",
        "NvimTree",
        "lspinfo",
        "git",
        "notify",
        "query",
      },
      autosave_ignore_buftypes = {
        "checkhealth",
        "help",
        "netrw",
        "lazy",
        "mason",
        "oil",
        "NvimTree",
        "lspinfo",
        "git",
        "notify",
        "query",
        "gitcommit",
        "gitrebase",
      },
    }
    -- Auto save session
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          -- Don't save while there's any 'nofile' buffer open.
          if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
            return
          end
        end
        require("session_manager").save_current_session()
      end,
    })
  end,
}
