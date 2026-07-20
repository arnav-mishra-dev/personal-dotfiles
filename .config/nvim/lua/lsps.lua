local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls/workspaces/' .. project_name
vim.lsp.config('jdtls', {
    cmd = {
	'jdtls',
	'-data', workspace_dir,
    },
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')
