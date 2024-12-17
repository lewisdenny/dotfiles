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
      },
    },
  },
}
