return {

  -- Configure linter
  {
    "mfussenegger/nvim-lint",
    opts = { linters_by_ft = { yaml = { "yamllint" } } },
  },

  -- yaml schema support
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, --Note: Last release is way too old
  },
}
