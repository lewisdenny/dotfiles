vim.pack.add({
  "https://github.com/jakobkhansen/journal.nvim",
})

local j = require("journal")

j.setup({
  root = "~/Documents/journal",
})

vim.keymap.set("n", "<leader>j", ":Journal week<CR>", { desc = "Open this weeks [J]ournal", silent = true })
