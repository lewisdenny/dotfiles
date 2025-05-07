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
          { "<leader>w", group = "[W]orkspace" },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>h", group = "Git [H]unk" },
          { "g", group = "goto" },
        },
      },
    },
  },
}
