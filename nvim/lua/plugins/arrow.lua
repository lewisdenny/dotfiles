-- https://github.com/otavioschwanck/arrow.nvim
return {
  "otavioschwanck/arrow.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    show_icons = true,
    leader_key = "<leader>m",
    index_keys = "afjkl;hg",
    save_key = "git_root", -- `git_root_bare` is another option if `git_root` doesn't work.
  },
  -- stylua: ignore
  keys = {
    { "<leader>m", function() require("arrow.ui").openMenu() end, desc = "Marks" },
  },
  config = function(_, opts)
    require("arrow").setup(opts)
    vim.keymap.set("n", "<S-Tab>", require("arrow.persist").previous)
    vim.keymap.set("n", "<TAB>", require("arrow.persist").next)
    vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
  end,
}
