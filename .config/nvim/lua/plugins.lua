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
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})

vim.pack.add{
  { src = 'https://github.com/sphamba/smear-cursor.nvim' },
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
  { src = 'https://github.com/nvim-mini/mini.pick' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/mikavilpas/yazi.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim' },
}

require('mini.pick').setup()
MiniPick.registry.files_fd = function()
  local command = { 'fd', '--type=f', '--no-follow', '--color=never', '--hidden' }
  return MiniPick.builtin.cli({ command = command })
end

vim.cmd("colorscheme oxocarbon")

require('nvim-treesitter').install { 'lua', 'c', 'java', 'python' }
