return {
  "tamton-aquib/duck.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>dh", function() require("duck").hatch() end, desc = "Duck Hatch"},
    },
  config = function()
    vim.keymap.set("n", "<leader>dc", function()
      require("duck").cook()
    end, { desc = "Duck Cook" })

    vim.keymap.set("n", "<leader>dC", function()
      require("duck").cook_all()
    end, { desc = "Duck Cook All" })
  end,
}
