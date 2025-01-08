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
  end,
}
