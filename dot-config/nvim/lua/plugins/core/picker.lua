return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true, -- Replace netrw with the snacks explorer
      },
      picker = {
        hidden = true,
        sources = {
          explorer = {
            jump = { close = true },
            auto_close = true,
            hidden = false,
            include = {
              "*", -- NOTE: Same as hidden = true just without the annoying h in the heading
            },
          },
        },
      },
    },
     -- stylua: ignore
    keys = {
       -- Top Pickers & Explorer
       { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
       { "<leader>sB", function() Snacks.picker.buffers() end, desc = "Buffers" },
       { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
       { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
       { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
       -- find
       { "<leader>sf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
       { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
       { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
       -- { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files" },
       { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
       { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
       { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
       -- git
       { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
       -- { "<leader>st", function() Snacks.picker.git_worktrees() end, desc = "Git Worktrees" },
       { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
       { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
       -- Grep
       { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
       { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
       { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
       -- search
       { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
       { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
       { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
       { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
       { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
       { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
       { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
       { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
       { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
       { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
       { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
       { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
       { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
       { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
       { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
       { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
       { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
       { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
       { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
       -- LSP
       { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
       { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
       { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
       { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
       { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
       { "<leader>cS", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
       { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
       { "<leader>ss", function() Snacks.picker.spelling() end, desc = "Spelling" },
    },
  },
}
