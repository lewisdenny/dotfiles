-- Set shell settings
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sh" },
  callback = function()
    local o = vim.o

    o.expandtab = true
    o.smartindent = true
    o.tabstop = 2
    o.shiftwidth = 2
  end,
})

return {
  -- Configure Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "bash" } },
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          settings = {
            bashIde = {
              shfmt = {
                path = "", --NOTE: Disable and let Conform format
              },
            },
          },
        },
      },
    },
  },

  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { sh = { "shfmt" } },
      formatters = { shfmt = { prepend_args = { "-i", "2" } } },
    },
  },
}
