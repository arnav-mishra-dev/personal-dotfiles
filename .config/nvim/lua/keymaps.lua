vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
    desc = 'Open diagnostic message'
})

vim.keymap.set('n', '<leader>t',
    function()
	vim.fn.jobstart('foot', { cwd = vim.fn.expand('%:p:h') })
    end, {
    desc = 'Open diagnostic message'
})

MiniPick.registry.files_fd = function()
  local command = { 'fd', '--type=f', '--no-follow', '--color=never', '--hidden' }
  local show_with_icons = function(buf_id, items, query)
    return MiniPick.default_show(buf_id, items, query, { show_icons = true })
  end
  local source = { name = 'Files fd', show = show_with_icons }
  return MiniPick.builtin.cli({ command = command }, { source = source })
end

vim.keymap.set('n', '<leader>ff', function() vim.cmd('Pick files_fd') end, {
    desc = 'Open file picker'
})

vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, {
    desc = 'Open buffer picker'
})

vim.keymap.set('n', '<leader>-', function() vim.cmd('10split +Oil') end, {
    desc = 'Open file explorer'
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
