vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/sindrets/diffview.nvim",
})

require("diffview").setup({
  default_args = {
    DiffviewOpen = { "--imply-local" }, -- https://github.com/sindrets/diffview.nvim/blob/main/USAGE.md#review-a-pr
  },
  view = {
    merge_tool = {
      layout = "diff4_mixed",
    },
  },
  -- stylua: ignore
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    view = {
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      { "n", "s", function() require("gitsigns").stage_hunk() end, { desc = "git [s]tage hunk" } },
      { "v", "s", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "git [s]tage selected lines" } },
    },
  },
})

-- Keymaps
vim.keymap.set("n", "<leader>gd", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end, { desc = "Diffview Toggle" })

-- Commands
vim.api.nvim_create_user_command("DiffViewHEAD", function()
  vim.cmd("DiffviewOpen upstream/HEAD...HEAD --imply-local")
end, { desc = "compare the changes on the current feature branch against its merge-base" })

-- Options
vim.opt.fillchars:append({ diff = "╱" })
