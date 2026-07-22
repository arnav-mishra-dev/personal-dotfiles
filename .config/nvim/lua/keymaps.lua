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

vim.keymap.set('n', '<leader>ff', function() vim.cmd('Pick files_fd') end, {
    desc = 'Open file picker'
})

vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, {
    desc = 'Open buffer picker'
})

vim.keymap.set('n', '<leader>-', require('yazi').yazi, {
    desc = 'Toggle yazi at current file'
})
