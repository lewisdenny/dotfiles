return {
  {
    "folke/snacks.nvim",
    -- stylua: ignore
    keys = {
          { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
          { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    },
    opts = {
      zen = {
        enabled = true,
      },
    },
  },
}
