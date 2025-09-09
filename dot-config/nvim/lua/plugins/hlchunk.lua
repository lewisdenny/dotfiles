vim.pack.add({
  "https://github.com/shellRaining/hlchunk.nvim",
})

local hlchunk = require("hlchunk")

hlchunk.setup({
  indent = {
    enable = true,
  },
})
