return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "markdownlint-cli2", "marksman", "prettier" } },
  },

  -- Configure linter
  {
    "mfussenegger/nvim-lint",
    opts = { linters_by_ft = { markdown = { "markdownlint-cli2" } } },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "markdown", "markdown_inline" } },
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { marksman = {} } },
  },

  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { markdown = { "prettier" } } },
  },

  -- https://github.com/bullets-vim/bullets.vim
  {
    "bullets-vim/bullets.vim",
  },

  -- https://github.com/MeanderingProgrammer/render-markdown.nvim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- commit = "c85d682dce1ef3453868b91672bb2e65d0d95c68",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "markdown" },
        providers = {
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },
    },
  },
}
