-- Install and upgrade third party tools automatically
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function(_, opts)
    require("mason-tool-installer").setup(opts)
  end,
}
