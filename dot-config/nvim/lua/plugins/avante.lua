return {
  {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"!
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- Note: removed as too distracting while output is scrolling
      -- {
      --   "MeanderingProgrammer/render-markdown.nvim",
      --   opts = {
      --     file_types = { "markdown", "Avante" },
      --   },
      --   ft = { "markdown", "Avante" },
      -- },
    },
    opts = {
      mode = "legacy",
      provider = "openrouter_gemini",
      vendors = {
        openrouter_gpt = {
          __inherited_from = "openai",
          -- disable_tools = true,
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "openai/gpt-4o-mini",
        },
        openrouter_gemini = {
          __inherited_from = "openai",
          -- disable_tools = true,
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "google/gemini-2.5-flash-preview-05-20",
        },
      },
    },

    config = function(_, opts)
      require("avante").setup(opts)

      -- prefill edit window with common scenarios to avoid repeating query and submit immediately
      local prefill_edit_window = function(request)
        require("avante.api").edit()
        local code_bufnr = vim.api.nvim_get_current_buf()
        local code_winid = vim.api.nvim_get_current_win()
        if code_bufnr == nil or code_winid == nil then
          return
        end
        vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
        -- Optionally set the cursor position to the end of the input
        vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
        -- Simulate Ctrl+S keypress to submit
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
      end

      local avante_optimize_code = "Optimize the following code"
      local avante_code_review = [[
      Review the following code for:
      - Correctness: Does the code meet its requirements and produce the expected output?
      - Readability and maintainability: Are variable and function names clear and descriptive? Is the code easy to understand and modify?
      - Documentation: Are there sufficient comments and documentation? Are any comments redundant or unnecessary?
      - Potential bugs or edge cases: Are there any logical errors, unhandled edge cases, or potential failure scenarios?
      - Performance and scalability: Are there any performance bottlenecks or scalability issues?
      - Security: Are there any security vulnerabilities or unsafe practices?
      - Code duplication and modularity: Is there any unnecessary repetition? Could the code be made more modular or reusable?
      - Error handling and logging: Is error handling robust and are important events logged?
      - Impact on existing codebase: How do the changes affect the rest of the system?

      Provide concise, actionable suggestions for improvement and explain your reasoning for each recommendation
      Provide only high-confidence recommendations, avoid speculation or uncertain suggestions, do not guess, do not respond to a topic if you have no high-confidence recommendations.
      Use examples where useful.
      Do not attempt to write modifications to the file.
      ]]

      require("which-key").add {
        { "<leader>a", group = "Avante" },
        {
          mode = { "n", "v" },
          {
            "<leader>ar",
            function()
              require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")

              -- Yank the selected text to default register
              vim.cmd "normal! y"

              -- Get the yanked text from register
              local selected_text = vim.fn.getreg '"'

              require("avante.api").ask {
                question = avante_code_review .. "\n~~~\n" .. selected_text .. "\n~~~",
                new_chat = true,
              }
            end,
            desc = "Code Review",
          },
        },
      }
      require("which-key").add {
        { "<leader>a", group = "Avante" },
        {
          mode = { "v" },
          {
            "<leader>aO",
            function()
              prefill_edit_window(avante_optimize_code)
            end,
            desc = "Optimize Code(edit)",
          },
        },
      }
    end,
  },
}
