-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      styles = {
        comments = { italic = true },
        functions = {},
        variables = {},
      },
    },
    init = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
}
