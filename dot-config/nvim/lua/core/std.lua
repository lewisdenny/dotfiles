local mason_bin = vim.fs.joinpath(vim.fn.stdpath('data'), "mason/bin")

vim.get_mason_bin = function(name)
  return vim.fs.joinpath(mason_bin, name)
end

vim.dap = require("dap")
vim.dap.utils = require("dap.utils")
vim.dap.utils.query_args = function()
  return vim.split(vim.fn.input('Program arguments: '), " +")
end

vim.ftplugin = {}
