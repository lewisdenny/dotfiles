return {
  {
    "otavioschwanck/arrow.nvim",
    lazy = true,
    opts = {
      show_icons = true,
      leader_key = "<leader>m",
      index_keys = "afjkl;hg",
    },
    -- stylua: ignore start
    keys = {
      { "<leader>m", function() require("arrow.ui").openMenu() end, desc = "Marks" },
    },
    init = function()
      vim.keymap.set("n", "<S-Tab>", require("arrow.persist").previous)
      vim.keymap.set("n", "<TAB>", require("arrow.persist").next)
      vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
    end,
    -- stylua: ignore end
  },
}
