return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = true,
      },
      notify = {
        enabled = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
