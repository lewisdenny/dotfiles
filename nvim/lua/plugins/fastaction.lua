return {
  {
    "Chaitanyabsprip/fastaction.nvim",
    keys = {
      { "<leader>a", "<cmd>lua require('fastaction').code_action()<CR>", desc = "FastAction" },
    },
    ---@type FastActionConfig
    opts = {},
  },
}
