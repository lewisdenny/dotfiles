vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit"
}

local neogit = require("neogit")

neogit.setup {
  -- Hides the hints at the top of the status buffer
  disable_hint = true,
  -- Change the default way of opening Neogit
  kind = "split", --NOTE: "Floating" is kinda buggy
  commit_editor = {
    kind = "floating",
  },
  -- Show message with spinning animation when a git command is running.
  -- process_spinner = true,
  log_view = {
    kind = "replace",
  },
  -- Add custom gitlab server
  git_services = {
    ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
    ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
    ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
    ["azure.com"] = "https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
  },
}

vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open Neogit", silent = true })

-- local group = vim.api.nvim_create_augroup("MyCustomNeogitEvents", { clear = true })
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "NeogitPushComplete",
--   group = group,
--   callback = require("neogit").close,
-- })

