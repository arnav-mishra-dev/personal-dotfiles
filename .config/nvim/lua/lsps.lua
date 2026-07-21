vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.git' },
    Lua = {
	settings = {
	    runtime = {
		version = 'LuaJIT'
	    },
	    telemetry = {
		enable = false,
	    }
	}
    }
})
vim.lsp.enable('lua_ls')

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls/workspaces/' .. project_name
vim.lsp.config('jdtls', {
    cmd = {
	'jdtls',
	'-data', workspace_dir,
    },
})
vim.lsp.enable('jdtls')
