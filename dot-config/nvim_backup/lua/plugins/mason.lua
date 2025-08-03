local signs = require("utils").signs

return {
  {
    "mason-org/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = signs.PassCheck,
          package_pending = signs.Running,
          package_uninstalled = signs.GitRemoved,
        },
      },
    },
  },

  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   config = function()
  --     require("mason-tool-installer").setup {
  --       ensure_installed = {
  --         -- Ansible
  --         "ansible-language-server",
  --         -- Golang
  --         "golangci-lint",
  --         "goimports",
  --         "gofumpt",
  --         "delve",
  --         "gopls",
  --         --- Jinja
  --         "jinja-lsp",
  --         -- Lua
  --         "lua-language-server",
  --         "stylua",
  --         -- Markdown
  --         "markdownlint-cli2",
  --         "marksman",
  --         "prettier",
  --         -- Python
  --         "ruff",
  --         "python-lsp-server",
  --         -- Bash
  --         "bash-language-server",
  --         "shfmt",
  --         -- Vue
  --         "vue-language-server",
  --         -- Common Web
  --         "prettierd",
  --         -- Yaml
  --         "yamllint",
  --         "yaml-language-server",
  --         -- Rust
  --         "codelldb",
  --         -- Common
  --         "harper-ls",
  --       },
  --       auto_update = true,
  --     }
  --   end,
  -- },
}
