-- https://github.com/catgoose/nvim-colorizer.lua
-- The fastest Neovim colorizer
-- #FF414141
-- #ffee72
-- hsl(53deg 100% 72%)
-- rgb(255 238 114)
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        mode = "virtualtext",
        names = false, -- "Name" codes like Blue or red.
        RRGGBBAA = true,
        AARRGGBB = true,
        css = true,
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
      },
    },
  },
}
