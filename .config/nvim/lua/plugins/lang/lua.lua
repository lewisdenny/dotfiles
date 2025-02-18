return {
  -- Install tools
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = { ensure_installed = { "lua-language-server", "stylua" } },
  },

  -- Configure lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              codeLens = {
                enable = true,
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = true,
                paramType = true,
                paramName = "Enable",
                semicolon = "Enable",
                arrayIndex = "Enable",
              },
              diagnostics = {
                globals = {
                  "vim",
                  "Snacks",
                  "it",
                  "describe",
                  "before_each",
                  "after_each",
                },
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
    opts = { formatters_by_ft = { lua = { "stylua" } } },
  },

  -- Configure treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "lua", "luadoc" } },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },

  { "Bilal2453/luvit-meta", lazy = true },
}
