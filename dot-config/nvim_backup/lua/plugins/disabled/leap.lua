-- Neovim's answer to the mouse
return {
  "https://github.com/ggandor/leap.nvim",

  dependencies = {
    { "ggandor/flit.nvim", config = true },
  },

  config = function()
    require("leap").add_default_mappings()
  end,
}
