return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      ensure_installed = {
        "diff",
        "query",
        "vim",
        "vimdoc",
        "yaml",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "ron",
        "bash",
        "vue",
        "css",
        "javascript",
        "typescript",
        "html",
        "yaml",
        "javascript",
        "typescript",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
