return {
  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { sh = { "shfmt" } },
      formatters = { shfmt = { prepend_args = { "-i", "2" } } },
    },
  },
}
