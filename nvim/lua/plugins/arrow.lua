return {
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
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
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_c, require("arrow.statusline").text_for_statusline_with_icons())
  --   end,
  -- },
}
