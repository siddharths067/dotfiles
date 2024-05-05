local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities();

local project_root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]);
local project_name = vim.fn.fnamemodify(project_root_dir, ':p:h:t');
local workspace_dir = vim.fn.getenv('HOME') .. '/.local/share/eclipse/' .. project_name;


local config = {
	capabilities = lsp_capabilities,
	cmd = {
	    'jdtls',
	    '-data', workspace_dir
	},
	root_dir = project_root_dir,
}
require('jdtls').start_or_attach(config)

