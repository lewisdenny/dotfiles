return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup {}
    vim.cmd "MasonToolsInstall"
  end,
}
