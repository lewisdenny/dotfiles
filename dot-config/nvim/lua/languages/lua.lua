vim.pack.add({
	"https://github.com/folke/lazydev.nvim",
})

if vim.g.lazydev_enabled then
  require("lazydev").setup()
end

vim.ftplugin.lua = function()
	vim.keymap.set("v", "r", ":'<,'>lua<CR>", { buffer = 0, silent = true })
end
