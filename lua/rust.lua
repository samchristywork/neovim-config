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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require('lsp').on_attach(client, bufnr)
  end,
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
}

require('dap').configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

require('dap').configurations.rust = {
  {
    type = 'rust',
    request = 'launch',
    name = 'Debug',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    args = {},
  },
}

require('dap').adapters.rust = {
  type = 'executable',
  command = 'rust-analyzer',
  args = { '--experimental', '--lsp' },
}

vim.keymap.set('n', '<leader>ha', function()
  require('rust-tools.hover_actions').hover_actions()
end)
