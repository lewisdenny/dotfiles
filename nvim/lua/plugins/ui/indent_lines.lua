local indent_highlight = {
  "RainbowWhite",
  "RainbowViolet",
  "RainbowBlue",
  "RainbowGreen",
  "RainbowYellow",
  "RainbowOrange",
  "RainbowRed",
  "RainbowCyan",
}

return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = true,
        scope = {
          hl = indent_highlight,
        },
        chunk = {
          enabled = true,
          hl = indent_highlight,
        },
        blank = {
          hl = indent_highlight,
        },
        filter = function(buf)
          local b = vim.b[buf]
          local bo = vim.bo[buf]
          local excluded_filetypes = {
            markdown = true,
            text = true,
          }
          return vim.g.snacks_indent ~= false and b.snacks_indent ~= false and bo.buftype == "" and not excluded_filetypes[bo.filetype]
        end,
      },
    },
  },
}
