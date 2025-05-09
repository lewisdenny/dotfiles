-- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
-- https://github.com/mfussenegger/nvim-lint
return {
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = "VeryLazy",
    opts = {
      linters_by_ft = {},
    },
    -- stylua: ignore
    keys = {
      { "<leader>l", function() require("lint").try_lint() end, desc = "[L]int file" },
    },
    config = function(_, opts)
      -- vim.print(opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      -- Show linters for the current buffer's filetype
      vim.api.nvim_create_user_command("LintInfo", function()
        local filetype = vim.bo.filetype
        local linters = require("lint").linters_by_ft[filetype]

        if linters then
          print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
        else
          print("No linters configured for filetype: " .. filetype)
        end
      end, {})
    end,
  },
}
