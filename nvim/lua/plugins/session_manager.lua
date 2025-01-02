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
  end,
}
