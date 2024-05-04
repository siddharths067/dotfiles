local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t');

local workspace_dir = vim.fn.getenv('HOME') .. '/git_tree/' .. project_name;

local lspconfig = require('lspconfig');
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities();


local config = {
	capabilities = lsp_capabilities,
	cmd = {
	    'jdtls',
	    '-data', workspace_dir
	},
	root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

