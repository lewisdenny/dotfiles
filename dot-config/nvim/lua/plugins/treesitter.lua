return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        -- stylua: ignore
        keys = {
          { "af", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects") end, mode = {"v"}, desc = "function" },
          { "if", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects") end, mode = {"v"}, desc = "function" },
          { "ac", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects") end, mode = {"v"}, desc = "class" },
          { "ic", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects") end, mode = {"v"}, desc = "class" },
        },
      },
    },
    branch = "main", -- Note: Can be removed once default branch changes to main from master
    version = false, -- Note: last release is way too old
    lazy = false, -- Note: This plugin does not support lazy-loading
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts = {
      ensure_installed = {
        "diff",
        "query",
        "vim",
        "vimdoc",
        "yaml",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "regex",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "ron",
        "bash",
        "vue",
        "css",
        "javascript",
        "typescript",
        "html",
        "yaml",
        "javascript",
        "typescript",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      require("nvim-treesitter").install(opts.ensure_installed)
      vim.api.nvim_create_autocmd("FileType", {
        group = init,
        callback = function(args)
          local filetype = args.match
          local lang = vim.treesitter.language.get_lang(filetype)
          if vim.treesitter.language.add(lang) then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
}
