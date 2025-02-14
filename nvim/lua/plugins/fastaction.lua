-- Efficiency plugin designed to optimize code actions in Neovim
-- https://github.com/Chaitanyabsprip/fastaction.nvim
return {
  {
    "Chaitanyabsprip/fastaction.nvim",
    version = "*",
    keys = {
      { "<leader>a", "<cmd>lua require('fastaction').code_action()<CR>", desc = "FastAction" },
    },
    ---@type FastActionConfig
    opts = {},
  },
}
