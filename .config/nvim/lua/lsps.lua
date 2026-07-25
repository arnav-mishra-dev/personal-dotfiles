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

vim.lsp.config('ruff', {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
})
vim.lsp.enable('ruff')

vim.lsp.config('basedpyright', {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyrightconfig.json', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },

    settings = {
	basedpyright = {
	    analysis = {
		autoSearchPaths = true,
		diagnosticMode = 'openFilesOnly',
	    },
	    disableTaggedHints = true,
	},
    },
})
vim.lsp.enable('basedpyright')

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls/workspaces/' .. project_name
vim.lsp.config('jdtls', {
    cmd = {
	'jdtls',
	'-data', workspace_dir,
    },
})
vim.lsp.enable('jdtls')
