return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lazy_status = require "lazy.status"
      local hydra_statusline = require "hydra.statusline"

      require("lualine").setup {
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
              fmt = function(res)
                local hydra_active = hydra_statusline.is_active()
                return hydra_active and " " .. hydra_statusline.get_name() or " " .. res
              end,
              color = function(_)
                if hydra_statusline.is_active() then
                  if hydra_statusline.get_name() == "DEBUG" then
                    return { bg = "#e06c75", gui = "bold" }
                  end
                else
                  return { gui = "bold" }
                end
              end,
            },
          },
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
