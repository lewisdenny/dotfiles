return {
  "tamton-aquib/duck.nvim",
  cmd = { "Duckhatch", "Duckcook" },
  config = function()
    vim.api.nvim_create_user_command("Duckhatch", function()
      require("duck").hatch("🦆", 2)
    end, {
      desc = "Hatch a duck",
    })
    vim.api.nvim_create_user_command("Duckcook", function()
      require("duck").cook_all()
    end, {
      desc = "Cook all the ducks",
    })
  end,
}
