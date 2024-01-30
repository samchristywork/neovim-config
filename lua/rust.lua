local opts = {
  tools = {
    inlay_hints = {
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
      highlight = "Comment",
    }
  }
}

require('rust-tools').setup(opts)

require('rust-tools').inlay_hints.set()
require('rust-tools').inlay_hints.enable()

vim.keymap.set('n', '<leader>ha', function()
  require('rust-tools.hover_actions').hover_actions()
end)
