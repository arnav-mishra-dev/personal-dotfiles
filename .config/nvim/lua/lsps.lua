vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer');
vim.lsp.enable('ruff')
vim.lsp.enable('basedpyright')
vim.lsp.enable('jdtls')
vim.lsp.enable('gopls')
vim.lsp.enable('markdown_oxide')

require('nvim-treesitter').install { 'lua', 'c', 'cpp', 'rust', 'python', 'java', 'go', 'markdown', 'markdown_inline' }
