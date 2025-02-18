-- See `:help nvim-treesitter`
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts_extend = {
      "ensure_installed",
    },
    opts = {
      ensure_installed = {
        "diff",
        "query",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
  },
}
