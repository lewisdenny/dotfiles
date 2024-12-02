return {
  "theHamsta/nvim-dap-virtual-text",
  lazy = true,
  config = function()
    -- configure nvim-dap-virtual-text
    local ok, dapvt = pcall(require, "nvim-dap-virtual-text")
    if ok and dapvt then
      dapvt.setup {
        virt_text_pos = "eol",
        commented = true,
      }
    end
  end,
}
