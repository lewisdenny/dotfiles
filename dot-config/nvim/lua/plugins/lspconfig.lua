-- LSP Plugins
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "nvim-telescope/telescope.nvim",
      "williamboman/mason.nvim",
      "j-hui/fidget.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      -- Note: See `:help lspconfig-all` for a list of all the pre-configured LSPs
      servers = {
        ts_ls = {},
      },
    },
    config = function(_, opts)
      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          -- map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          -- map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          -- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
          -- map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          -- map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
              end,
            })
          end
        end,
      })

      -- Add nvim-cmp, luasnip capabilities to Neovim
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      -- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))

      -- Enable the following language servers
      require("mason").setup()
      ---@diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup {
        handlers = {
          function(server_name)
            local server = opts.servers[server_name] or {}
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
