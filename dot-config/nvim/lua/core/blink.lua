vim.pack.add {
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
  "https://github.com/xzbdmw/colorful-menu.nvim",
}

local blink = require("blink.cmp")

blink.setup{
  keymap = { preset = "super-tab" },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  snippets = {
    preset = "default"
  },
  sources = {
    default = { "lsp", "path", "buffer" },
    providers = {
      buffer = { min_keyword_length = 3 },
    },
    transform_items = function(_, items)
      return vim.tbl_filter(function(item)
        return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
      end, items)
    end
  },
  signature = { enabled = true },
  completion = {
    -- Show documentation when selecting a completion item
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    menu = {
      draw = {
        columns = {
          { "kind_icon" },
          { "label", gap = 1 },
          { "source_name" },
        },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },
  cmdline = {
    enabled = false,
  },

}

