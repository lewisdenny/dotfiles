-- https://github.com/otavioschwanck/arrow.nvim
return {
  "otavioschwanck/arrow.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    always_show_path = true,
    show_icons = true,
    leader_key = "m",
    index_keys = "afjkl;hg",
    save_key = "git_root", -- NOTE: `git_root_bare` is another option if `git_root` doesn't work.
    window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
      width = "auto",
      height = "auto",
      row = "auto",
      col = "auto",
    },
  },
  config = function(_, opts)
    require("arrow").setup(opts)
  end,
}
