vim.pack.add {
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-tree/nvim-web-devicons",
}

--test

local fzf = require("fzf-lua")

fzf.setup {
  "hide",
  -- fzf_opts = { ["--cycle"] = true },
  -- files = {
  --   git_icons = false,
  -- },
  -- winopts = {
  --   row = 0.5,
  --   width = 0.8,
  --   height = 0.8,
  --   title_flags = false,
  --   preview = {
  --     horizontal = "right:50%",
  --     scrollbar = false,
  --   },
  --   backdrop = 100,
  -- },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
    builtin = {
      true,
      ["<esc>"] = "hide",
      ["<C-d>"] = "preview-page-down",
      ["<C-u>"] = "preview-page-up",
    }
  }
}
fzf.register_ui_select()

vim.keymap.set("n", "<leader>sf", function() require'fzf-lua'.files({ cmd = 'fd --type f --exclude test_repos' }) end, { desc = "Find files" })
vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "Resume last find" })
vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>.", fzf.oldfiles, { desc = "Find old files" })
vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Find string (livegrep)" })
-- vim.keymap.set("n", "<leader>sc", fzf.git_status, { desc = "Find changed" })
vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>z", fzf.zoxide, { desc = "Find zoxide" })

-- <leader>s namespace
vim.keymap.set("n", "<leader>sc", fzf.git_bcommits, { desc = "Find buffer commits" })
-- vim.keymap.set("n", "<leader>sb", fzf.git_branches, { desc = "Find git branches" })
vim.keymap.set("n", "<leader>sC", fzf.git_commits, { desc = "Find commits" })
