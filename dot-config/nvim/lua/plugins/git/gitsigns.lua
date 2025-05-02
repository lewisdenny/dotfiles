-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      numhl = true,
      word_diff = true,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        function ToggleGitSignsBlame()
          local all_windows = vim.api.nvim_list_wins() -- Get a list of all window IDs
          local closedGitBlame = false

          for _, win_id in ipairs(all_windows) do
            if vim.api.nvim_win_is_valid(win_id) then -- Check if the window is still valid
              local buf_nr = vim.api.nvim_win_get_buf(win_id) -- Get the buffer handle for the window
              if vim.api.nvim_buf_is_valid(buf_nr) then
                local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf_nr }) -- Get the filetype of the buffer
                if filetype == "gitsigns-blame" then
                  vim.api.nvim_win_close(win_id, false) -- Close the window, don't close the buffer
                  closedGitBlame = true
                end
              end
            end
          end
          if not closedGitBlame then
            gitsigns.blame()
          end
        end

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- These two functions allow the next and prev operations to be dot repeatable
        _G._next_hunk_func = function()
          gitsigns.nav_hunk "next"
        end

        _G.previous_hunk_func = function()
          gitsigns.nav_hunk "prev"
        end

        -- stylua: ignore start

        --g@ operator needs a textobject, l selects the character under the cursor but arn't using the selected textobject
        map("n", "<leader>hn", function() vim.o.operatorfunc = "v:lua._next_hunk_func" vim.cmd.normal "g@l" end, {desc = "git [n]ext hunk"})
        map("n", "<leader>hN", function() vim.o.operatorfunc = "v:lua.previous_hunk_func" vim.cmd.normal "g@l" end, {desc = "git previous hunk"})

        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
        map("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
        map("n", "<leader>hB", gitsigns.blame, { desc = "git [B]lame" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
        map("n", "<leader>hD", function() gitsigns.diffthis "@" end, { desc = "git [D]iff against last commit" })
        map("v", "<leader>hs", function() gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end, { desc = "git [s]tage selected lines" })
        map("v", "<leader>hr", function() gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, { desc = "git [r]eset selected lines" })

        -- Toggles
        map("n", "<leader>ub", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })

        -- We don't use map() here so the keymap is global
        vim.keymap.set("n", "<leader>uB", ToggleGitSignsBlame, { desc = "[T]oggle git [B]lame window" })
        -- stylua: ignore end
      end,
    },
  },
}
