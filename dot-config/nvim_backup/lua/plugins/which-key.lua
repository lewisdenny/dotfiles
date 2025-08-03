return {
  {
    "folke/which-key.nvim",
    version = "*",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "helix",
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>c", group = "[C]ode" },
          { "<leader>r", group = "[R]ename" },
          { "<leader>s", group = "[S]earch" },
          { "<leader>u", group = "ui" },
          { "<leader>h", group = "Git [H]unk" },
          { "g", group = "goto" },
        },
      },
    },
  },
}
