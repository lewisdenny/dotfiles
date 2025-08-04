local api = vim.api
local fn = vim.fn

local function add_current_file_to_gitignore()
  -- Run git rev-parse --show-toplevel and check exit code
  local git_root = fn.systemlist('git rev-parse --show-toplevel 2> /dev/null')
  if vim.v.shell_error ~= 0 then
    -- Not in a git repository, fail with a message and abort
    print("Error: Not inside a Git repository")
    return
  end
  git_root = git_root[1]

  -- Find .gitignore path relative to git root
  local gitignore = fn.findfile('.gitignore', git_root .. ';')
  if gitignore == '' then
    gitignore = git_root .. '/.gitignore'
  end

  -- Get current file path relative to the git root
  local file_path = fn.fnamemodify(api.nvim_buf_get_name(0), ':.' .. git_root)

  -- Append the relative file path to .gitignore
  local f = io.open(gitignore, "a")
  if f then
    f:write(file_path .. "\n")
    f:close()
    print("Added " .. file_path .. " to " .. gitignore)
  else
    print("Error: Could not open " .. gitignore .. " for writing")
    return
  end

  -- Open the .gitignore file for editing
  vim.cmd('edit ' .. gitignore)
end

-- Map the function to <leader>gi in normal mode
vim.keymap.set('n', '<leader>gi', add_current_file_to_gitignore, { desc = "Add current file to .gitignore" })
