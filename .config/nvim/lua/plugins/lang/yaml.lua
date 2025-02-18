return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "yamllint" } },
  },

  -- Configure linter
  {
    "mfussenegger/nvim-lint",
    opts = { linters_by_ft = { yaml = { "yamllint" } } },
  },

  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { yaml = { "prettier" } } },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "yaml" } },
  },
}
