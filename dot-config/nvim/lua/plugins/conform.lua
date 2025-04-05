---NOTE: :help conform-formatters for a list of available formatters
return {
  {
    "https://github.com/stevearc/conform.nvim",
    version = "*",
    event = "VeryLazy",
    cmd = { "ConformInfo" },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = function(bufnr)
        -- NOTE: Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = "never"
        else
          lsp_format_opt = "fallback"
        end
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = lsp_format_opt }
      end,
    },
    init = function()
      -- The following two autocommands listen for the two events published by
      -- Conform pre and post formatting and sends a Figlet notification accordingly.
      -- >>>
      vim.api.nvim_create_autocmd("User", {
        pattern = "ConformFormatPre",
        callback = function()
          require("fidget").notify("Conform: Running Formatter", nil, { name = "conform", key = "conformid" })
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "ConformFormatPost",
        callback = function()
          require("fidget").notify("Conform: File Formatted", nil, { name = "conform", key = "conformid" })
        end,
      })
      -- <<<

      -- The following two user commands enable and disable formatting,
      -- this can be per buffer by using `FormatDisable!`
      -- >>>
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Enable autoformat-on-save",
      })
      -- <<<

      -- User command to manually format the buffer
      vim.api.nvim_create_user_command("Format", function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end, {
        desc = "Format buffer using Conform",
      })
    end,
  },
}
