vim.ftplugin.help = function()
  vim.keymap.set("n", "q", ":q<CR>", { buffer = true, desc = "Close help window" })
end
