return {
  {
    "patrickpichler/hovercraft.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = function()
      return {
        window = {
          border = "single",
        },
        -- stylua: ignore
        providers = {
          providers = {
            { "LSP", require("hovercraft.provider.lsp.hover").new() },
            { "Man", require("hovercraft.provider.man").new() },
            { "Dictionary", require("hovercraft.provider.dictionary").new() },
            { "GitHub Issue", require("hovercraft.provider.github.issue").new() },
            { "GitHub User", require("hovercraft.provider.github.user").new() },
            { "GitHub Repo", require("hovercraft.provider.github.repo").new() },
          },
        },
        -- stylua: ignore
        keys = {
          { '<C-u>',   function() require('hovercraft').scroll({ delta = -4 }) end },
          { '<C-d>',   function() require('hovercraft').scroll({ delta = 4 }) end },
          { '<TAB>',   function() require('hovercraft').hover_next() end },
          { '<S-TAB>', function() require('hovercraft').hover_next({ step = -1 }) end },
        },
      }
    end,
    -- stylua: ignore
    keys = {
      { "K", function()
          local hovercraft = require "hovercraft"
          if hovercraft.is_visible() then
            hovercraft.enter_popup()
          else
            hovercraft.hover()
          end
        end,
      },
    },
  },
}
