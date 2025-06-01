-- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
-- https://github.com/mfussenegger/nvim-lint
return {
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = "VeryLazy",
    opts = {
      linters_by_ft = {
        yaml = { "yamllint" },
        markdown = { "markdownlint-cli2" },
        go = { "golangcilint" },
        python = { "ruff" },
      },
    },
    keys = {
      {
        "<leader>l",
        function()
          local lint = require "lint"
          local linters = lint.linters_by_ft[vim.bo.filetype]

          if linters then
            require("fidget").notify("nvim-lint: Running Linter", nil, { name = "ncim-lint", key = "lintid" })
            lint.try_lint()
          end
        end,
        desc = "[L]int file",
      },
    },
    config = function(_, opts)
      -- vim.print(opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft

      -- Create autocommand which carries out the actual linting
      -- on the specified events if a linter is configured for the filetype.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        group = lint_augroup,
        callback = function()
          local linters = lint.linters_by_ft[vim.bo.filetype]

          if linters then
            require("fidget").notify("nvim-lint: Running Linter", nil, { name = "ncim-lint", key = "lintid" })
            lint.try_lint()
          end
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
