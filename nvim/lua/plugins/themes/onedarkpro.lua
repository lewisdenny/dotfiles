-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd "colorscheme onedark"
    end,
    opts = {
      styles = {
        tags = "italic",
        methods = "bold",
        functions = "bold",
        keywords = "italic",
        comments = "italic",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "italic",
      },
    },
  },
}
