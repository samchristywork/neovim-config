require('rust-tools').setup()
require('rust-tools').inlay_hints.set()
require('rust-tools').inlay_hints.enable()

require 'lspconfig'.rust_analyzer.setup{
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    }
  }
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

