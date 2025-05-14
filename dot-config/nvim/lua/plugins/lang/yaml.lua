return {

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

  -- yaml schema support
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, --Note: Last release is way too old
  },
}
