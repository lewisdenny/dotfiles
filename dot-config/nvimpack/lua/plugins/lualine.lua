vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
})

-- local hydra_statusline = require "hydra.statusline"
local ll = require("lualine")

ll.setup({
  options = {
    disabled_filetypes = {
      -- https://github.com/igorlfs/nvim-dap-view/issues/36
      winbar = {
        "dap-view",
        "dap-repl",
        "dap-view-term",
      },
    },
    globalstatus = true,
  },
  extensions = {
    "lazy",
    "toggleterm",
    "mason",
  },
  sections = {
    lualine_a = {
      {
        "mode",
        " ",
        { gui = "bold" },
        -- "mode",
        -- fmt = function(res)
        --   local hydra_active = hydra_statusline.is_active()
        --   return hydra_active and " " .. hydra_statusline.get_name() or " " .. res
        -- end,
        -- color = function(_)
        --   if hydra_statusline.is_active() then
        --     if hydra_statusline.get_name() == "DEBUG" then
        --       return { bg = "#e06c75", gui = "bold" }
        --     end
        --   else
        --     return { gui = "bold" }
        --   end
        -- end,
      },
    },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "filetype", "lsp_status" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
