-- `:help ibl`
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl",
    opts = {
      indent = {
        char = "▎",
        tab_char = "▎",
      },
      exclude = {
        filetypes = {
          "markdown",
        },
      },
    },
  },
}
