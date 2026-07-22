vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
    desc = 'Open diagnostic message'
})

vim.keymap.set('n', '<leader>t', function() os.execute('foot & disown') end, {
    desc = 'Open diagnostic message'
})

vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, {
    desc = 'Open file picker'
})

vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, {
    desc = 'Open buffer picker'
})
