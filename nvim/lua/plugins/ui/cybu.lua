return {
  -- Cycle buffers with a customizable notification window
  {
    "ghillb/cybu.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<S-Tab>", "<Plug>(CybuLastusedPrev)" },
      { "<TAB>", "<Plug>(CybuLastusedNext)" },
    },
    opts = {
      behavior = { -- set behavior for different modes
        mode = {
          last_used = {
            switch = "on_close", -- immediate, on_close
            view = "rolling", -- paging, rolling
          },
        },
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
