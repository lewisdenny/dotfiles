vim.pack.add({
  "https://github.com/Chaitanyabsprip/fastaction.nvim",
})

-- FastAction is lazy loaded upon lsp attach so 
-- disable keymap until loaded.
vim.keymap.set('n', '<leader>a', '<Nop>', { silent = true })
