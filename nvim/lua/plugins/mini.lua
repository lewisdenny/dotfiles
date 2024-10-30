return {
  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.cmd [[hi MiniTrailspace guibg=#b58900]]
      require("mini.trailspace").setup()
      vim.api.nvim_create_autocmd({ "BufWrite" }, {
        callback = function()
          require("mini.trailspace").trim()
        end,
      })
    end,
  },
  {
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    "echasnovski/mini.ai",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.ai").setup { n_lines = 500 }
    end,
  },
  {
    -- Examples:
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.surround").setup { n_lines = 500 }
    end,
  },

  -- {
  --   "echasnovski/mini.nvim",
  --   config = function()
  --     local statusline = require "mini.statusline"
  --     statusline.setup { use_icons = vim.g.have_nerd_font }
  --
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     statusline.section_location = function()
  --       return "%2l:%-2v"
  --     end
  --   end,
  -- },
}
-- vim: ts=2 sts=2 sw=2 et
