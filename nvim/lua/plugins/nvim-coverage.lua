-- https://github.com/andythigpen/nvim-coverage
-- Nice, need and autocommand to run :Coverage if a coverage file is found
return {
  {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup {
        auto_reload = true,
      }
    end,
  },
}
