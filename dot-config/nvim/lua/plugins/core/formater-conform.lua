return {
  {
    "https://github.com/stevearc/conform.nvim",
    -- version = "*", --Note: Very slow releases
    dependencies = {
      "j-hui/fidget.nvim",
      "folke/snacks.nvim",
    },
    event = "VeryLazy",
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        yaml = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shfmt" },
        python = {
          -- To fix auto-fixable lint errors.
          "ruff_fix",
          -- To run the Ruff formatter.
          "ruff_format",
          -- To organize the imports.
          "ruff_organize_imports",
        },
        markdown = { "prettier" },
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
      },
      formatters = { shfmt = { prepend_args = { "-i", "2" } } },
      notify_on_error = true,
      format_on_save = function(bufnr)
        vim.print "here"
        return require("config.format_utils").format(bufnr)
      end,
    },
    init = function()
      require("config.format_utils").setup()
    end,
  },
}
