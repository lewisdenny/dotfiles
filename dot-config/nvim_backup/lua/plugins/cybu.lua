-- Cycle buffers with a customizable notification window
return {
  {
    "ghillb/cybu.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    -- stylua: ignore
    keys = {
      { "<TAB>", "<cmd>CybuLastusedNext<cr>", desc = "Cycle to last used buffer" },
      { "<S-Tab>", "<cmd>CybuLastusedPrev<cr>)", desc = "Reverse cycle to last used buffer" },
    },
    opts = {
      behavior = { -- set behavior for different modes
        mode = {
          last_used = {
            switch = "on_close", -- immediate, on_close
            view = "paging", -- paging, rolling
          },
        },
      },
      display_time = 1000, -- time the cybu window is displayed
      exclude = { -- filetypes, cybu will not be active
        "lazy",
      },
      style = {
        path = "tail_dir",
        border = "rounded",
        padding = 5,
        hide_buffer_id = true,
        highlights = { -- see highlights via :highlight
          current_buffer = "CustomCybuFocus", -- current / selected buffer
          background = "CustomCybuBackground", -- window background
          border = "CustomCybuBorder", -- border of the window
        },
      },
    },
  },
}
