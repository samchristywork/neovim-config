require("mason").setup()
require("mason-lspconfig").setup { ensure_installed = { "lua_ls", "clangd", "vimls", "bashls", "rust_analyzer", "hls" } }
require("nvim-treesitter.configs").setup { ensure_installed = { "c", "cpp", "lua", "vim", "rust", "bash", "haskell", "scheme" } }
require("overlength").setup()
require("scrollbar").setup()
