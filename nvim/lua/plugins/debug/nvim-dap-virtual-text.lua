return {
  "theHamsta/nvim-dap-virtual-text",
  lazy = true,
  config = function()
    local ok, dapvt = pcall(require, "nvim-dap-virtual-text")
    if ok and dapvt then
      ---@diagnostic disable-next-line: missing-fields
      dapvt.setup {
        virt_text_pos = "eol",
        commented = true,
      }
    end
  end,
}
