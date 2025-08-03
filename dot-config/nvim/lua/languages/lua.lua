vim.pack.add({
	"https://github.com/folke/lazydev.nvim",
})

if vim.g.lazydev_enabled then
  local lazydev = require("lazydev")

  lazydev.setup({
    -- library = {
    -- 	-- Only load luvit types when the `vim.uv` word is found
    -- 	{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
    -- },
  })
end

vim.lsp.enable("lua_ls")

vim.ftplugin.lua = function()
	vim.keymap.set("v", "r", ":'<,'>lua<CR>", { buffer = 0, silent = true })
	-- vim.keymap.set("n", "R", ":source %<CR>", { buffer = 0, silent = true })
end
