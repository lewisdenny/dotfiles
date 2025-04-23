return {
  {
    "yetone/avante.nvim",
    enabled = false,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- provider = "openai",
      -- openai = {
      --   model = "granite-3.2-8b-instruct-Q4_K_M",
      --   endpoint = "http://localhost:58981/v1/",
      --   timeout = 30000, -- Timeout in milliseconds
      -- },
      -- provider = "ollama",
      -- ollama = {
      --   model = "granite3.2",
      --   endpoint = "http://127.0.0.1:11434",
      --   timeout = 30000, -- Timeout in milliseconds
      --   options = {
      --     temperature = 0,
      --     num_ctx = 20480,
      --   },
      -- },
      -- provider = "ollama",
      -- ollama = {
      --   model = "gemma3",
      --   endpoint = "http://127.0.0.1:11434",
      --   timeout = 30000, -- Timeout in milliseconds
      --   options = {
      --     temperature = 0,
      --     num_ctx = 20480,
      --   },
      -- },
      -- provider = "ollama",
      -- ollama = {
      --   model = "deepseek-r1",
      --   endpoint = "http://127.0.0.1:11434",
      --   timeout = 30000, -- Timeout in milliseconds
      --   options = {
      --     temperature = 0,
      --     num_ctx = 20480,
      --   },
      -- },
      provider = "openai",
      openai = {
        model = "granite3.1-dense",
        endpoint = "http://127.0.0.1:8080",
        timeout = 30000, -- Timeout in milliseconds
        disable_tools = true,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
