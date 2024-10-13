require('dapui').setup()
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
wk.add(
	{
		{ "<leader>d", group = "Debug" },
		{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
		{ "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
		{ "<leader>de", "<cmd>lua require'dap'.repl.open()<cr>", desc = "Eval Expression" },
		{ "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
	}
);


wk.add(
	{
		{ "<leader>c", group = "Code" },
		{ "<leader>ce", group = "Extract" },
		{ "<leader>cec", "<cmd>lua require('jdtls').extract_constant()<cr>", desc = "Constant" },
		{ "<leader>cev", "<cmd>lua require('jdtls').extract_variable()<cr>", desc = "Variable" },
		{ "<leader>co", "<cmd>lua require('jdtls').organize_imports()<cr>", desc = "Organise Imports" },
		{ "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },

		{ "<leader>t", group = "Test" },
		{ "<leader>tc", "<cmd>lua require('jdtls').test_class();vim.cmd('DapToggleRepl')<cr>", desc = "Class" },
		{ "<leader>tm", "<cmd>lua require('jdtls').test_nearest_method();vim.cmd('DapToggleRepl')<cr>", desc = "Method" },
	}
);


wk.add(
	{
		{
			mode = { "v" },
			{ "<leader>c", group = "Code" },
			{ "<leader>ce", group = "Extract" },
			{ "<leader>cec", "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", desc = "Constant" },
			{ "<leader>cem", "<esc><cmd>lua require('jdtls').extract_method(true)<cr>", desc = "Method" },
			{ "<leader>cev", "<esc><cmd>lua require('jdtls').extract_variable_all(true)<cr>", desc = "Variable (All Instances)" },
		},
	}
);
