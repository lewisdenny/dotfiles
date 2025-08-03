-- See `:help gitsigns` to understand what the configuration keys do
function SetGitSignsBlame(state)
  local foundBlameWindow, winid = GetGitSignsBlame()

  if state and not foundBlameWindow then
    vim.cmd "Gitsigns blame"
  end
  if not state and foundBlameWindow then
    vim.api.nvim_win_close(winid, false)
  end
end

function GetGitSignsBlame()
  local all_windows = vim.api.nvim_list_wins() -- Get a list of all window IDs
  local FoundGitBlame = false
  local winid

  for _, win_id in ipairs(all_windows) do
    if vim.api.nvim_win_is_valid(win_id) then -- Check if the window is still valid
      local buf_nr = vim.api.nvim_win_get_buf(win_id) -- Get the buffer handle for the window
      if vim.api.nvim_buf_is_valid(buf_nr) then
        local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf_nr }) -- Get the filetype of the buffer
        if filetype == "gitsigns-blame" then
          FoundGitBlame = true
          winid = win_id
        end
      end
    end
  end
  return FoundGitBlame, winid
end

return {
  {
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

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- These two functions allow the next and prev operations to be dot repeatable
        _G._next_hunk_func = function()
          gitsigns.nav_hunk("next", { preview = true, navigation_message = false })
        end

        _G.previous_hunk_func = function()
          gitsigns.nav_hunk("prev", { wrap = true, preview = true, navigation_message = false })
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
        map("n", "<leader>hB", gitsigns.blame, { desc = "git [B]lame" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
        map("n", "<leader>hq", gitsigns.setqflist, { desc = "send hunks to the quickfix list" })
        map("n", "<leader>hD", function() gitsigns.diffthis "@" end, { desc = "git [D]iff against last commit" })
        map("v", "<leader>hs", function() gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end, { desc = "git [s]tage selected lines" })
        map("v", "<leader>hr", function() gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, { desc = "git [r]eset selected lines" })

        -- Toggles
        Snacks.toggle.new({
          id = "gitblame",
          name = "Git Blame",
          get = function() local a, _ = GetGitSignsBlame() return a end,
          set = SetGitSignsBlame,
        }):map "<leader>uB"
        map("n", "<leader>ub", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
      end,
    },
  },
}
