---@diagnostic disable: missing-fields
return {
  {
    "saghen/blink.cmp",
    -- enabled = false,
    version = "v0.*",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
    },
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = "super-tab" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      snippets = { preset = "luasnip" },
      -- snippets = {
      --   expand = function(snippet)
      --     require("luasnip").lsp_expand(snippet)
      --   end,
      --   active = function(filter)
      --     if filter and filter.direction then
      --       return require("luasnip").jumpable(filter.direction)
      --     end
      --     return require("luasnip").in_snippet()
      --   end,
      --   jump = function(direction)
      --     require("luasnip").jump(direction)
      --   end,
      -- },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },
}
