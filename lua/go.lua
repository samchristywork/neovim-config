vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.go" },
  callback = function()
    vim.cmd([[setlocal tabstop=4]])
    vim.cmd([[setlocal shiftwidth=4]])
    vim.cmd([[setlocal expandtab]])
    --vim.opt.listchars = "tab:▸ ,trail:·,nbsp:␣"
    vim.opt.listchars = "tab:  ,trail:·,nbsp:␣"
    vim.cmd([[setlocal noexpandtab]])
  end,
})
