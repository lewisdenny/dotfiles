return {
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = {
      linters_by_ft = {},
    },
    config = function(_, opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "lint file" })

      -- install linters defined in linters_by_ft
      local linters = {}

      for _, value in pairs(opts.linters_by_ft) do
        table.insert(linters, value)
      end

      -- require("mason-tool-installer").setup { ensure_installed = linters }
      -- vim.cmd "MasonToolsInstall"

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
