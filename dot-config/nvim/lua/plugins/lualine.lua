return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lazy_status = require "lazy.status"
      require("lualine").setup {
        options = {
          globalstatus = true,
        },
        extensions = {
          "nvim-tree",
          "lazy",
          "trouble",
          "toggleterm",
          "mason",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
            },
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
