return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
  },

  -- Install and upgrade third party tools automatically
  -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Ansible
        "ansible-language-server",
        -- Golang
        "golangci-lint",
        "goimports",
        "gofumpt",
        --- Jinja
        "jinja-lsp",
        -- Lua
        "lua-language-server",
        "stylua",
        -- Markdown
        "markdownlint-cli2",
        "marksman",
        "prettier",
        -- Python
        "ruff",
        "python-lsp-server",
        -- Bash
        "bash-language-server",
        "shfmt",
        -- Vue
        "vue-language-server",
        -- Common Web
        "prettierd",
        -- Yaml
        "yamllint",
      },
    },
    config = function(_, Mti)
      require("mason-tool-installer").setup(Mti)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
}
