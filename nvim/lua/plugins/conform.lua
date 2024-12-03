--- See :help conform-formatters for a list of available formatters
local skip_install = { gofmt = true }
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
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
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
    },
    config = function(_, opts)
      local install_formatters = {}

      for _, formatters in pairs(opts.formatters_by_ft) do
        if type(formatters) == "table" then
          for _, formatter in ipairs(formatters) do
            if type(formatter) == "string" then
              if not skip_install[formatter] then -- NOTE: Some formatters are installed externally
                table.insert(install_formatters, formatter)
              end
            end
          end
        end
      end

      -- vim.print(install_formatters)
      -- require("mason-tool-installer").setup { ensure_installed = install_formatters }
      -- vim.cmd "MasonToolsInstall"

      require("conform").setup(opts)
    end,
  },
}
