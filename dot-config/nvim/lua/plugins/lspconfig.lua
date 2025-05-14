-- LSP Plugins
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "j-hui/fidget.nvim",
    },
    event = "BufReadPost",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ansiblels",
        "jinja_lsp",
        "marksman",
      },
      automatic_installation = true,
    },
    -- config = function()
    --   -- Exclude big directories from being watched
    --   vim.lsp._watchfiles._poll_exclude_pattern = vim.lsp._watchfiles._poll_exclude_pattern
    --     -- Standard cache dirs
    --     + vim.glob.to_lpeg "**/.*_cache/**"
    --     + vim.glob.to_lpeg "**/.venv/**"
    --     -- JS/TS
    --     + vim.glob.to_lpeg "**/.yarn/**"
    --     + vim.glob.to_lpeg "**/node_modules/**"
    --     -- rust build assets
    --     + vim.glob.to_lpeg "**/target/**"
    --
    --   -- Add nvim-cmp, luasnip capabilities to Neovim
    --   local capabilities = vim.lsp.protocol.make_client_capabilities()
    --   -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    --   -- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))
    --
    --   -- Enable the following language servers
    --   require("mason").setup()
    --   ---@diagnostic disable-next-line: missing-fields
    --   require("mason-lspconfig").setup {
    --     handlers = {
    --       function(server_name)
    --         local server = opts.servers[server_name] or {}
    --         -- certain features of an LSP (for example, turning off formatting for ts_ls)
    --         server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
    --         require("lspconfig")[server_name].setup(server)
    --       end,
    --     },
    --   }
    -- end,
  },
}
