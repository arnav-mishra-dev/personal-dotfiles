vim.api.nvim_create_autocmd('PackChanged', {
  pattern = 'nvim-treesitter',
  desc = 'Run :TSUpdate after pack changed',
  group = vim.api.nvim_create_augroup('treesitter_update', { clear = true }),
  callback = function(e)
    local kind, name = e.data.kind, e.data.spec.name
    if kind == 'install' or kind == 'update' then
      vim.cmd.packadd({ args = { name }, bang = false })
      vim.cmd('TSUpdate')
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.g.loaded_netrwPlugin = 1
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim' },
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
  { src = 'https://github.com/nvim-mini/mini.pick' },
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-mini/mini.diff' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
}

require("oil").setup({
  columns = {
    "icon",
    "permissions",
    -- "size",
    -- "mtime",
  },
  float = {
	  padding = 5,
  },
})

require('mini.icons').setup()
require('mini.pick').setup()
require('mini.diff').setup()
require('mini.statusline').setup()

vim.cmd("colorscheme oxocarbon")
