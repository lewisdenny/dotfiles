local helpers = require "onedarkpro.helpers"

-- local darken require('onedarkpro.helpers').darken
-- local lighten require('onedarkpro.helpers').lighten

local palette = helpers.get_colors() -- Without specifying a theme name, the helper will get the colors for the currently loaded theme. Alternatively, specify a theme name, such as get_colors("onelight").

-- local lighten = require("catppuccin.utils.colors").lighten
-- local palette = require("onedarkpro.themes.onedark").get_palette "latte"

return {
  name = "catppuccin-latte-cursorline",
  static = {
    winhl = {
      inactive = {
        CursorLine = { bg = "#FFFFFF" },
        CursorLineNr = { bg = "#FFFFFF" },
        -- CursorLine = { bg = helpers.lighten(palette.surface0, 0.5) },
        -- CursorLineNr = { bg = helpers.lighten(palette.surface0, 0.5) },
      },
    },
  },
  modes = {
    i = {
      winhl = {
        CursorLine = { bg = "#FFFFFF" },
        CursorLineNr = { bg = "#FFFFFF" },

        -- CursorLine = { bg = helpers.lighten(palette.teal, 0.4) },
        -- CursorLineNr = { bg = helpers.lighten(palette.teal, 0.4) },
      },
    },
    n = {
      winhl = {
        CursorLine = { bg = "#FFFFFF" },
        CursorLineNr = { bg = "#FFFFFF" },

        -- CursorLine = { bg = palette.surface0 },
        -- CursorLineNr = { bg = palette.surface0 },
      },
    },
    no = {
      operators = {
        [{ "gu", "gU", "g~", "~" }] = {
          winhl = {
            CursorLine = { bg = palette.surface2 },
            CursorLineNr = { bg = palette.surface2 },
          },
        },
        -- delete operator
        d = {
          winhl = {
            CursorLine = { bg = helpers.lighten(palette.red, 0.3) },
            CursorLineNr = { bg = helpers.lighten(palette.red, 0.3) },
          },
        },
        -- yank operator
        y = {
          winhl = {
            CursorLine = { bg = helpers.lighten(palette.peach, 0.3) },
            CursorLineNr = { bg = helpers.lighten(palette.peach, 0.3) },
          },
        },
        -- change operator
        c = {
          winhl = {
            CursorLine = { bg = helpers.lighten(palette.blue, 0.3) },
            CursorLineNr = { bg = helpers.lighten(palette.blue, 0.3) },
          },
        },
      },
    },
    -- visual
    [{ "v", "V", "\x16" }] = {
      winhl = {
        Visual = { bg = helpers.lighten(palette.mauve, 0.3) },
      },
    },
    -- select
    [{ "s", "S", "\x13" }] = {
      winhl = {
        Visual = { bg = helpers.lighten(palette.pink, 0.3) },
      },
    },
    R = {
      winhl = {

        CursorLine = { bg = helpers.lighten(palette.flamingo, 0.2) },
        CursorLineNr = { bg = helpers.lighten(palette.flamingo, 0.2) },
      },
    },
  },
}
