local wk = require('which-key')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities();

local project_root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]);
local project_name = vim.fn.fnamemodify(project_root_dir, ':p:h:t');
local workspace_dir = vim.fn.getenv('HOME') .. '/.local/share/eclipse/' .. project_name;
local mason_data_folder = vim.fn.stdpath("data") .. '/mason/packages/'
local bundles = {};

for _, folder in pairs({
	mason_data_folder .. "java-test/extension/server/*.jar",
	mason_data_folder .. "java-debug-adapter/extension/server/*.jar"
}) do
	vim.list_extend(
		bundles,
		vim.split(vim.fn.glob(folder), "\n")
	)
end

local config = {
	capabilities = lsp_capabilities,
	cmd = {
	    'jdtls',
	    '-data', workspace_dir
	},
	root_dir = project_root_dir,
	init_options = {
		bundles = bundles
	}
}
require('jdtls').start_or_attach(config)




-- Binding JDTLS key mappings

wk.register(
	{
		c = {
			name = "Code",
			o = {
				"<cmd>lua require('jdtls').organize_imports()<cr>", "Organise Imports"
			},
			e = {
				name = 'Extract',
				v = {"<cmd>lua require('jdtls').extract_variable()<cr>", 'Variable'},
				c = {"<cmd>lua require('jdtls').extract_constant()<cr>", 'Constant'},
			},
			r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"}
		},
	},
	{
		prefix = "<leader>",
		mode = "n"
	}
);



wk.register(
	{
		c = {
			name = "Code",
			e = {
				name = 'Extract',
				v = {"<esc><cmd>lua require('jdtls').extract_variable_all(true)<cr>", 'Variable (All Instances)'},
				c = {"<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", 'Constant'},
				m = {"<esc><cmd>lua require('jdtls').extract_method(true)<cr>", 'Method'},
			}
		},
	},
	{
		prefix = "<leader>",
		mode = "v"
	}
);
