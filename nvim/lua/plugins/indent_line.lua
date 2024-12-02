-- `:help ibl`
return {
  {
    "lukas-reineke/indent-blankline.nvim",
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
