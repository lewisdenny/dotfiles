return {
  {
    "echasnovski/mini.trailspace",
    version = "*",
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
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      n_lines = 500,
    },
    config = function(opts)
      require("mini.ai").setup(opts)
    end,
  },

  {
    -- Examples:
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    "echasnovski/mini.surround",
    version = "*",
    event = { "BufReadPre", "BufNewFile " },
    opts = {
      n_lines = 500,
    },
    config = function(opts)
      require("mini.surround").setup(opts)
    end,
  },

  -- Neovim Lua plugin to move any selection in any direction. Part of 'mini.nvim' library.
  -- https://github.com/echasnovski/mini.move
  {
    "echasnovski/mini.move",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {
        -- Move visual selection in Visual mode.
        -- Move lines with shift + v then shift + k,j,h,l
        up = "K",
        down = "J",
        left = "H",
        right = "L",
      },
    },
  },

  -- Minimal and fast autopairs
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = true, -- NOTE: Doesn't work without.
  },
}
