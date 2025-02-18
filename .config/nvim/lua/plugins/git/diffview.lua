-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
-- https://github.com/sindrets/diffview.nvim

return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      default_args = {
        DiffviewOpen = { "--imply-local" }, -- https://github.com/sindrets/diffview.nvim/blob/main/USAGE.md#review-a-pr
      },
      view = {
        merge_tool = {
          layout = "diff4_mixed",
        },
      },
    },
    keys = {
      {
        "<leader>gd",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd "DiffviewOpen"
          else
            vim.cmd "DiffviewClose"
          end
        end,
        desc = "Diffview Toggle",
      },
    },
  },
}
