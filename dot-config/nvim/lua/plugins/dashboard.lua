return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          { pane = 1, section = "header" },
          { pane = 1, section = "terminal", cmd = "cbonsai -l -i -L 30", height = 20, indent = 2, padding = 1 },
          { pane = 1, section = "startup" },
          { pane = 2, section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = vim.fn.isdirectory ".git" == 1, --TODO: Add better git detection
            -- enabled = Snacks.git.get_root() ~= nil, -- not working but should
            cmd = "git status -s -b",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
        },
      },
    },
  },
}
