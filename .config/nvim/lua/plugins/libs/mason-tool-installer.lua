-- Install and upgrade third party tools automatically
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts_extend = {
    "opts.ensure_installed",
  },
  config = function(_, opts)
    require("mason-tool-installer").setup(opts)
  end,
}
