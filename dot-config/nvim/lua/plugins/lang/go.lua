return {
  -- DAP
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },

  -- Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        dependencies = { "leoluz/nvim-dap-go" },
      },
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },

  -- Configure language plugins

  { -- show golang implements
    "maxandron/goplements.nvim",
    ft = "go",
    opts = {
      prefix = {
        interface = "implemented by: ",
        struct = "implements: ",
      },
      display_package = true,
      highlight = "Goplements",
    },
  },

  -- {
  --   "ray-x/go.nvim",
  --   enabled = true,
  --   dependencies = {
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup {}
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()',
  -- },
}
