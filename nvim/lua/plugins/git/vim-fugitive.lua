return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    dependencies = {
      {
        "tpope/vim-rhubarb", -- Open in Github plugin for vim-fugitive :GBrowse
        event = "VeryLazy",
      },
    },
  },
}
