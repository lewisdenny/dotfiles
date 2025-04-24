local dap, dv = require "dap", require "dap-view"
-- auto toggle dap-view when debugging
dap.listeners.before.attach["dap-view-config"] = function()
  dv.open()
end
dap.listeners.before.launch["dap-view-config"] = function()
  dv.open()
end
dap.listeners.before.event_terminated["dap-view-config"] = function()
  dv.close()
end
dap.listeners.before.event_exited["dap-view-config"] = function()
  dv.close()
end

return {
  {
    "igorlfs/nvim-dap-view",
    -- event -- Not needed as this plugin is a dependency
    keys = {
      {
        "<leader>dv",
        function()
          require("dap-view").toggle()
        end,
        desc = "Toggle nvim-dap-view",
      },
    },
    opts = {
      winbar = {
        default_section = "scopes",
        sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
        headers = {
          breakpoints = " Breakpoints",
          scopes = " Scopes",
          exceptions = " Exceptions",
          watches = "  Watches",
          threads = " Threads",
          repl = " REPL",
          console = " Console",
        },
      },
      windows = {
        height = 12,
        terminal = {
          position = "right",
          hide = { "delve" }, -- Hide the terminal for Delve as they don't implement it
          start_hidden = true,
        },
      },
    },
  },
}
